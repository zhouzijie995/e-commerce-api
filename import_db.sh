#!/bin/bash

CONTAINER_NAME="nest-postgres"
DB_NAME="nest_demo"
DB_USER="nest_user"
DUMP_FILE="dump.sql"

echo "🔍 查找 PostgreSQL 容器: $CONTAINER_NAME ..."
CONTAINER_ID=$(docker ps --filter "name=$CONTAINER_NAME" --format "{{.ID}}")

if [ -z "$CONTAINER_ID" ]; then
  echo "❌ 未找到容器 $CONTAINER_NAME"
  exit 1
fi

if [ ! -f "$DUMP_FILE" ]; then
  echo "❌ 未找到 $DUMP_FILE，请确认和脚本在同一目录"
  exit 1
fi

echo "📤 复制 dump.sql 到容器..."
docker cp $DUMP_FILE $CONTAINER_ID:/dump.sql

echo "📥 开始导入数据库 $DB_NAME ..."
docker exec -t $CONTAINER_ID bash -c "psql -U $DB_USER -d $DB_NAME -f /dump.sql"

if [ $? -eq 0 ]; then
  echo "✅ 数据库导入成功！"
else
  echo "❌ 导入失败"
fi