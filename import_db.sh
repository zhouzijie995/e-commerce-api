#!/bin/bash
# import.sh

CONTAINER_NAME="nest-postgres"
HOST_DIR="/Users/zhouzijie/sql/postgres-data"
DB_USER="nest_user"
DB_PASS="123456"
DB_NAME="nest_demo"
DUMP_FILE="dump.sql"

# 停止并删除旧容器（如果存在）
docker rm -f $CONTAINER_NAME 2>/dev/null

# 清空 host 数据目录
rm -rf $HOST_DIR
mkdir -p $HOST_DIR

# 启动新容器，正确挂载 /var/lib/postgresql
docker run -d \
  --name $CONTAINER_NAME \
  -e POSTGRES_USER=$DB_USER \
  -e POSTGRES_PASSWORD=$DB_PASS \
  -e POSTGRES_DB=$DB_NAME \
  -v $HOST_DIR:/var/lib/postgresql/18/docker  \
  -p 5432:5432 \
  postgres:18

# 等待容器启动
sleep 5

# 复制 dump.sql 并导入
docker cp $DUMP_FILE $CONTAINER_NAME:/dump.sql
docker exec -t $CONTAINER_NAME bash -c "psql -U $DB_USER -d $DB_NAME -f /dump.sql"