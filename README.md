# SQL Basics
SQLで学習したことをメモしていく。DBはMySQLを使用しているので、他のDBで同じクエリが使えるかは都度調べる必要がある。

詳説が必要になった場合は[MySQL 8.0 リファレンスマニュアル](https://dev.mysql.com/doc/refman/8.0/ja/)を参照する。

### 環境構築
このリポジトリではdevcontainerで環境構築を行っている。コンテナ作成時に以下のコマンドが実行される。
```
sudo apt update -y && sudo apt install -y mysql-server-8.0 -f
```
コンテナが作成されたらmysqlを起動する。
```
sudo service mysql start
```
起動出来たらmysqlにログイン
```
sudo mysql -u root
```
