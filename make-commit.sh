#!/bin/bash

# 切换到 action-commit 分支
git checkout -B action-commit

# 配置 Git 用户信息
git config user.name "GitHub Actions"
git config user.email "actions@github.com"

# 创建空提交
git commit --allow-empty -m "🤖 Automatically generated commit on $(date +'%Y-%m-%d %H:%M:%S')"

# 尝试推送，最多重试 3 次
for i in {1..3}; do
  git pull origin action-commit --rebase
  if git push origin action-commit; then
    echo "Push successful!"
    exit 0
  fi
  echo "Push failed, retrying in 5 seconds..."
  sleep 5
done

echo "Push failed after 3 attempts."
exit 1
