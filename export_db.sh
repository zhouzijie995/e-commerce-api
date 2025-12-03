#!/bin/bash

CONTAINER_NAME="nest-postgres"
DB_NAME="nest_demo"
DB_USER="nest_user"
EXPORT_FILE="dump.sql"

echo "🔍 查找 PostgreSQL 容器: $CONTAINER_NAME ..."
CONTAINER_ID=$(docker ps --filter "name=$CONTAINER_NAME" --format "{{.ID}}")

if [ -z "$CONTAINER_ID" ]; then
  echo "❌ 未找到容器 $CONTAINER_NAME"
  exit 1
fi

echo "📦 开始导出数据库 $DB_NAME ..."
docker exec -t $CONTAINER_ID pg_dump -U $DB_USER $DB_NAME > $EXPORT_FILE

if [ $? -eq 0 ]; then
  echo "✅ 数据库导出成功 -> $EXPORT_FILE"
else
  echo "❌ 导出失败"
fi