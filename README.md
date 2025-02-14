# SQL Basics
SQLで学習したことをメモしていく。DBはMySQLを使用しているので、他のDBで同じコマンドが使えるかは都度調べる必要がある。

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
