#!/bin/bash
cd "$(dirname "$0")"

echo "================================================"
echo "   Steel Shop — Deploy to GitHub Pages"
echo "================================================"

# Check if token is saved
TOKEN_FILE="$HOME/.steelshop_gh_token"
if [ -f "$TOKEN_FILE" ]; then
  TOKEN=$(cat "$TOKEN_FILE")
  echo "✓ Using saved GitHub token"
else
  echo ""
  echo "Paste your GitHub token (ghp_xxx...) and press Enter:"
  read -s TOKEN
  echo "$TOKEN" > "$TOKEN_FILE"
  chmod 600 "$TOKEN_FILE"
  echo "✓ Token saved for next time"
fi

# Set remote with token
git remote set-url origin "https://Indian8898:${TOKEN}@github.com/Indian8898/Indian-Steel-Sale-Purchase.git"

# Stage, commit, push
git add -A
TIMESTAMP=$(date "+%d %b %Y %H:%M")
git commit -m "Update app — $TIMESTAMP" 2>/dev/null || echo "(no changes to commit)"
echo ""
echo "Pushing to GitHub..."
git push origin main 2>&1

echo ""
echo "================================================"
echo "✓ Done! App will update in ~60 seconds at:"
echo "  https://indian8898.github.io/Indian-Steel-Sale-Purchase/"
echo "================================================"
echo ""
echo "Press any key to close..."
read -n 1
