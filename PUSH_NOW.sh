#!/bin/bash
# Push to v7s7/menuAppFinal - Run this command

cd /home/user/menuApp
git checkout main
git push -u final main --force

echo ""
echo "✅ Push complete!"
echo "View your repository at: https://github.com/v7s7/menuAppFinal"
