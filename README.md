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

    - 执行以下命令来启动容器：

      ```bash
      docker-compose up -d
      ```

4. 配置主库：

    - 进入主服务器容器的终端或命令行界面：

      ```bash
      docker-compose exec mysql-master bash
      ```

    - 在主服务器容器中登录到 MySQL：

      ```bash
      mysql -u root -p
      ```

    - 配置一个主库账号：

      ```sql
      grant replication slave on *.* to 'repl_user'@'%' identified by 'repl_pass';
      ```
    - 重启服务
       ```bash
       reset slave;
       ```
    - 暂停服务
      ```bash
      stop slave;
      ```
5. 配置从库
    - 进入主服务器容器的终端或命令行界面：

       ```bash
       docker-compose exec mysql-slave bash
       ```

    - 配置同步账号
      ```bash
      change master to master_host='mysql_master', master_port=3306,master_user='repl_user',master_password='repl_pass', master_auto_position=1;
      ``` 
    - 开启服务
      ```bash
      start slave;
      ```
    - 查看状态
      ```bash
      show slave status\G;
      ```
    ~~~
     都是Yes才正常
     Slave_IO_Running: Yes
     Slave_SQL_Running: Yes
    ~~~

