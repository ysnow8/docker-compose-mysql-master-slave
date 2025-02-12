#!/bin/bash
set -e

echo ">>> Waiting for master ($MASTER_HOST) to be ready..."

# 使用 mysqladmin ping 来检测主库是否可连通
until mysqladmin ping -h"$MASTER_HOST" -uroot -p"$MYSQL_ROOT_PASSWORD" --silent; do
  echo "Master is unavailable - sleeping"
  sleep 3
done

echo ">>> Master is up. Configuring slave..."

# 配置并启动主从复制 (基于 GTID 模式)
mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" <<-EOSQL
  CHANGE MASTER TO
    MASTER_HOST='${MASTER_HOST}',
    MASTER_USER='${REPL_USER}',
    MASTER_PASSWORD='${REPL_PASSWORD}',
    MASTER_AUTO_POSITION=1;
  START SLAVE;
EOSQL

echo ">>> Slave replication configured successfully!"
