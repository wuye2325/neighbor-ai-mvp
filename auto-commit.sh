#!/bin/bash
# 自动提交脚本 - 每次原型修改后调用
# 用法: ./auto-commit.sh "修改说明"

cd /var/www/html/prototype

# 获取参数，如果没有则使用默认消息
MESSAGE="${1:-chore: 自动提交原型更新}"

# 检查是否有变更
if git diff --quiet && git diff --staged --quiet; then
    echo "没有变更需要提交"
    exit 0
fi

# 添加所有变更
git add -A

# 提交
git commit -m "$MESSAGE"

# 推送
git push origin main

echo "✅ 已提交并推送: $MESSAGE"
