#!/bin/bash
# 一键提交并推送
# 用法: ./更新.sh "这次改了什么"
# 不写说明的话，脚本会提示你输入

cd "$(dirname "$0")" || exit 1

msg="$1"
if [ -z "$msg" ]; then
  read -r -p "提交说明: " msg
fi
if [ -z "$msg" ]; then
  msg="更新 $(date '+%Y-%m-%d %H:%M')"
fi

git add -A

if git diff --cached --quiet; then
  echo "没有需要提交的改动"
  exit 0
fi

git commit -m "$msg" && git push

echo
echo "完成。"
