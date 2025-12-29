#!/bin/bash
# Quick push script - Run this after creating the GitHub repository

echo "Creating new repository v7s7/menuAppFinal..."
echo ""
echo "STEP 1: Create the repository on GitHub"
echo "  Go to: https://github.com/new"
echo "  Repository name: menuAppFinal"
echo "  Visibility: Public"
echo "  ❌ Do NOT initialize with README"
echo ""
echo "Press ENTER after you've created the repository..."
read

echo ""
echo "STEP 2: Pushing code to new repository..."
echo ""

cd /home/user/menuApp

# Create main branch from production-ready code
git checkout -b main 2>/dev/null || git checkout main
git reset --hard claude/production-readiness-review-xMB4i

# Add remote
git remote remove final 2>/dev/null || true
git remote add final https://github.com/v7s7/menuAppFinal.git

# Push
echo "Pushing to https://github.com/v7s7/menuAppFinal..."
git push -u final main --force

echo ""
echo "✅ Done! Your code is now at:"
echo "   https://github.com/v7s7/menuAppFinal"
echo ""
