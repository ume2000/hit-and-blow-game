#!/bin/bash
# ヒット&ブロー ゲーム - 完全版パッケージ作成スクリプト
# このスクリプトは git リポジトリから ZIP アーカイブを生成します

cd "$(dirname "$0")"
REPO_DIR=$(pwd)
PROJECT_NAME="hit-and-blow-game"
VERSION="1.0.0"
ZIP_NAME="${PROJECT_NAME}-${VERSION}.zip"

echo "Creating ${ZIP_NAME}..."

# 不要なファイルを除外して ZIP 作成
zip -r "${ZIP_NAME}" . \
  -x ".git/*" \
  ".gitignore" \
  "*.zip" \
  "create-release.sh" \
  ".github/*" \
  "node_modules/*" \
  ".DS_Store" \
  "*.swp" \
  "*~"

echo "✓ ${ZIP_NAME} created successfully!"
echo ""
echo "Contents:"
unzip -l "${ZIP_NAME}" | head -20
echo ""
echo "To deploy:"
echo "1. Extract: unzip ${ZIP_NAME}"
echo "2. Upload all files to GitHub Pages"
echo "3. OR open index.html in browser (HTTPS required for P2P)"
