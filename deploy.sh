#!/usr/bin/env bash
# 一键部署到 GitHub Pages（Git Bash / WSL / macOS / Linux）
# 使用：
#   1. 在 https://github.com/new 创建空仓库 li-bai-curtain（公开）
#   2. bash deploy.sh <你的 GitHub 用户名>
#   3. 在 GitHub 仓库页 → Settings → Pages → Source 选 "Deploy from a branch" → Branch 选 main / root → Save
#   4. 约 30 秒后公开网址： https://<用户名>.github.io/li-bai-curtain/

set -e

GITHUB_USER="${1:-}"
REPO_NAME="${2:-li-bai-curtain}"
BRANCH="main"

if [ -z "$GITHUB_USER" ]; then
  echo "用法： bash deploy.sh <GitHub用户名> [仓库名，默认 li-bai-curtain]"
  exit 1
fi

REMOTE_URL="https://github.com/${GITHUB_USER}/${REPO_NAME}.git"

echo "==> 远程仓库： ${REMOTE_URL}"
echo "==> 确认在 GitHub 已创建空仓库： ${REPO_NAME}"

# 配置 remote
if git remote get-url origin >/dev/null 2>&1; then
  echo "==> 检测到已有 remote origin，正在替换为 ${REMOTE_URL}"
  git remote set-url origin "${REMOTE_URL}"
else
  git remote add origin "${REMOTE_URL}"
fi

echo "==> 推送到 ${REMOTE_URL} (${BRANCH}) ..."
git push -u origin "${BRANCH}"

echo ""
echo "==> 推送成功 ✓"
echo ""
echo "==> 最后一步：启用 GitHub Pages"
echo "    1. 打开  https://github.com/${GITHUB_USER}/${REPO_NAME}/settings/pages"
echo "    2. Source 选 'Deploy from a branch'"
echo "    3. Branch 选 '${BRANCH}' / root  →  Save"
echo ""
echo "==> 约 30 秒后，公开网址："
echo "    https://${GITHUB_USER}.github.io/${REPO_NAME}/"