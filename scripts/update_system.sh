#!/bin/bash

# Web Design OS - System Update Script
# Updates framework, workflow, and template files from the remote repo
# Never touches personal folders (Core, Clients, Projects, System state)

set -e

# Navigate to vault root
VAULT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$VAULT_DIR"

# Check this is a git repo
if [ ! -d ".git" ]; then
    echo "Error: This vault is not connected to the update server."
    echo "If you set up the vault from a zip file, you may need to re-setup using the git clone method."
    exit 1
fi

# Check for remote
if ! git remote get-url origin &>/dev/null; then
    echo "Error: No remote repository configured."
    exit 1
fi

echo ""
echo "Checking for updates..."
echo ""

# Fetch latest from remote
git fetch origin 2>/dev/null

# Check if there are any changes
LOCAL=$(git rev-parse HEAD 2>/dev/null || echo "none")
REMOTE=$(git rev-parse origin/main 2>/dev/null || echo "none")

if [ "$LOCAL" = "$REMOTE" ]; then
    echo "You're already up to date."
    echo ""
    exit 0
fi

# Show what's changed
echo "Updates available. Here's what's new:"
echo ""
echo "---"
git log --oneline "$LOCAL..origin/main" 2>/dev/null | while read -r line; do
    echo "  $line"
done
echo "---"
echo ""

# Create backup directory
BACKUP_DIR="$VAULT_DIR/.update-backups/$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Backup current system files before updating
echo "Backing up current files..."
[ -d "02_Frameworks" ] && cp -r "02_Frameworks" "$BACKUP_DIR/"
[ -d "03_Workflows" ] && cp -r "03_Workflows" "$BACKUP_DIR/"
[ -d "06_Templates" ] && cp -r "06_Templates" "$BACKUP_DIR/"
[ -d "scripts" ] && cp -r "scripts" "$BACKUP_DIR/"
[ -d ".claude/skills" ] && mkdir -p "$BACKUP_DIR/.claude" && cp -r ".claude/skills" "$BACKUP_DIR/.claude/"
[ -d "docs" ] && cp -r "docs" "$BACKUP_DIR/"
[ -f "CLAUDE.md" ] && cp "CLAUDE.md" "$BACKUP_DIR/"
[ -f "CHANGELOG.md" ] && cp "CHANGELOG.md" "$BACKUP_DIR/"
[ -f "README.md" ] && cp "README.md" "$BACKUP_DIR/"

# List changed files (only in system folders)
echo ""
echo "Updating files:"
echo ""
git diff --name-only "$LOCAL" "origin/main" 2>/dev/null | while read -r file; do
    case "$file" in
        02_Frameworks/*|03_Workflows/*|06_Templates/*|scripts/*|.claude/skills/*|docs/*|CLAUDE.md|CHANGELOG.md|README.md|.gitignore)
            echo "  Updated: $file"
            ;;
    esac
done

# Show new files
git diff --name-status "$LOCAL" "origin/main" 2>/dev/null | grep "^A" | while read -r status file; do
    case "$file" in
        02_Frameworks/*|03_Workflows/*|06_Templates/*|scripts/*|.claude/skills/*|docs/*|CLAUDE.md|CHANGELOG.md|README.md)
            echo "  New: $file"
            ;;
    esac
done

# Pull the update - only checkout system files from remote
git checkout origin/main -- 02_Frameworks/ 2>/dev/null || true
git checkout origin/main -- 03_Workflows/ 2>/dev/null || true
git checkout origin/main -- 06_Templates/ 2>/dev/null || true
git checkout origin/main -- scripts/ 2>/dev/null || true
git checkout origin/main -- .claude/skills/ 2>/dev/null || true
git checkout origin/main -- docs/ 2>/dev/null || true
git checkout origin/main -- CLAUDE.md 2>/dev/null || true
git checkout origin/main -- CHANGELOG.md 2>/dev/null || true
git checkout origin/main -- README.md 2>/dev/null || true
git checkout origin/main -- .gitignore 2>/dev/null || true

# Update the local HEAD to match remote
git reset origin/main >/dev/null 2>&1

echo ""
echo "Update complete."
echo "Backup saved to: $BACKUP_DIR"
echo ""
echo "Your personal files (Core, Clients, Projects) were not touched."
echo ""

# Clean up old backups - keep last 5
cd "$VAULT_DIR/.update-backups" 2>/dev/null && ls -dt */ 2>/dev/null | tail -n +6 | xargs rm -rf 2>/dev/null || true
