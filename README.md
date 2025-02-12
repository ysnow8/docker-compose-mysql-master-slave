# MySQL 主从复制 Docker 项目

本项目演示了如何使用 Docker 和 Docker Compose 设置 MySQL 主从复制。

## 前提条件

在开始之前，请确保满足以下要求：

- 已安装 Docker 和 Docker Compose。
- 了解 Docker 和 Docker Compose 的基本使用方法。

## 配置主从服务器

1. 克隆项目到本地：

   ```bash
   git clone https://github.com/ysnow8/docker-compose-mysql-master-slave.git

2. 进入项目目录：

   ```bash
   cd mysql-master-slave-docker
   ```
3. 启动容器：

   执行以下命令来启动容器：

   ```bash
      docker-compose up -d
   ```