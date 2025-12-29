#!/bin/bash
# Script to push menuApp to new repository: v7s7/menuAppFinal
# Run this script after creating the repository on GitHub

set -e  # Exit on error

echo "=========================================="
echo "Pushing menuApp to v7s7/menuAppFinal"
echo "=========================================="
echo ""

# Step 1: Verify we're on the right branch
echo "✓ Checking current branch..."
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "$CURRENT_BRANCH" != "claude/production-readiness-review-xMB4i" ]; then
    echo "  Switching to production-ready branch..."
    git checkout claude/production-readiness-review-xMB4i
fi

# Step 2: Create a new main branch from current state
echo "✓ Creating fresh 'main' branch with production-ready code..."
git checkout -b main 2>/dev/null || git checkout main
git reset --hard claude/production-readiness-review-xMB4i

# Step 3: Remove old remote if it exists
echo "✓ Setting up remote..."
git remote remove final 2>/dev/null || true

# Step 4: Add new repository remote
echo "✓ Adding remote for v7s7/menuAppFinal..."
git remote add final https://github.com/v7s7/menuAppFinal.git

# Step 5: Push to new repository
echo "✓ Pushing code to new repository..."
echo ""
echo "NOTE: You may need to authenticate with GitHub."
echo "      Use a Personal Access Token (PAT) as password."
echo ""
git push -u final main --force

echo ""
echo "=========================================="
echo "✅ SUCCESS!"
echo "=========================================="
echo ""
echo "Your production-ready code is now at:"
echo "  https://github.com/v7s7/menuAppFinal"
echo ""
echo "Next steps:"
echo "  1. Visit: https://github.com/v7s7/menuAppFinal"
echo "  2. Update repository description and settings"
echo "  3. Deploy to Firebase Hosting"
echo ""
