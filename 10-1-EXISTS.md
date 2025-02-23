事前準備としてChatGPTに適当に生成してもらったテーブルとデータ(`10-0-generate.sql`)を作成する。特定のデータが存在するかどうかを条件としたいとき、`EXISTS`を使用することができる。サブクエリが1行以上のデータを返す場合はTRUE, データを返さない場合はFALSEを返す。以下のクエリでは、ordersテーブルにuser_idが含まれるユーザーを取得している、つまり、注文したことがあるユーザーを取得している。exists内のクエリの`SELECT`はデータが返ってくるか否かを見ているので1で問題ない。
```
mysql> select * from users as u
    -> where exists (
    ->     select 1 from orders as o
    ->     where o.user_id = u.user_id
    -> );
+---------+---------+---------------------+---------------------+
| user_id | name    | email               | registered_at       |
+---------+---------+---------------------+---------------------+
|       1 | Alice   | alice@example.com   | 2025-02-23 15:12:37 |
|       2 | Bob     | bob@example.com     | 2025-02-23 15:12:37 |
|       3 | Charlie | charlie@example.com | 2025-02-23 15:12:37 |
|       4 | David   | NULL                | 2025-02-23 15:12:37 |
|       6 | Frank   | NULL                | 2025-02-23 15:12:37 |
+---------+---------+---------------------+---------------------+

-- 以下のように分解できる。
-- user_idが1のレコードはordersテーブルに含まれるのでTRUE。
mysql> select 1 from orders as o
    -> where o.user_id = 1;
+---+
| 1 |
+---+
| 1 |
| 1 |
+---+

-- user_idが2のレコードはordersテーブルに含まれるのでTRUE。
mysql> select 1 from orders as o
    -> where o.user_id = 2;
+---+
| 1 |
+---+
| 1 |
+---+

-- user_idが2のレコードはordersテーブルに含まれないのでFALSE。
mysql> select 1 from orders as o
    -> where o.user_id = 5;
Empty set (0.00 sec)

-- user_idが3,4,6,7のものは省略。
-- サブクエリがTRUEになったものを集める。
mysql> select * from users as u
    -> where user_id in (1,2,3,4,6);
+---------+---------+---------------------+---------------------+
| user_id | name    | email               | registered_at       |
+---------+---------+---------------------+---------------------+
|       1 | Alice   | alice@example.com   | 2025-02-23 15:12:37 |
|       2 | Bob     | bob@example.com     | 2025-02-23 15:12:37 |
|       3 | Charlie | charlie@example.com | 2025-02-23 15:12:37 |
|       4 | David   | NULL                | 2025-02-23 15:12:37 |
|       6 | Frank   | NULL                | 2025-02-23 15:12:37 |
+---------+---------+---------------------+---------------------+
```
`IN`を用いても同じものを表すクエリが作れる。
```
mysql> select * from users as u
    -> where u.user_id in (
    ->     select o.user_id from orders as o
    ->     where o.user_id is not null
    -> );
+---------+---------+---------------------+---------------------+
| user_id | name    | email               | registered_at       |
+---------+---------+---------------------+---------------------+
|       1 | Alice   | alice@example.com   | 2025-02-23 15:12:37 |
|       2 | Bob     | bob@example.com     | 2025-02-23 15:12:37 |
|       3 | Charlie | charlie@example.com | 2025-02-23 15:12:37 |
|       4 | David   | NULL                | 2025-02-23 15:12:37 |
|       6 | Frank   | NULL                | 2025-02-23 15:12:37 |
+---------+---------+---------------------+---------------------+
```
`NOT`を付けると存在しないものを確認することができる。以下のクエリは注文していないユーザーを取得している。
```
mysql> select * from users as u
    -> where not exists (
    ->     select 1 from orders as o
    ->     where o.user_id = u.user_id
    -> );
+---------+-------+-------------------+---------------------+
| user_id | name  | email             | registered_at       |
+---------+-------+-------------------+---------------------+
|       5 | Eve   | eve@example.com   | 2025-02-23 15:12:37 |
|       7 | Grace | grace@example.com | 2025-02-23 15:12:37 |
+---------+-------+-------------------+---------------------+
```
`NULL`の扱いには注意が必要である。`NULL`の影響でフィルタリングされ、1行もレコードが返ってこないと`NOT EXISTS`ではTRUEになり値が取得されることになる。以下のクエリでは`null = null`がEmpty setとなるので全レコードが取得される。
```
mysql> select * from users as u
    -> where not exists (
    ->     select 1 from orders as o
    ->     where null = null
    -> );
+---------+---------+---------------------+---------------------+
| user_id | name    | email               | registered_at       |
+---------+---------+---------------------+---------------------+
|       1 | Alice   | alice@example.com   | 2025-02-23 15:12:37 |
|       2 | Bob     | bob@example.com     | 2025-02-23 15:12:37 |
|       3 | Charlie | charlie@example.com | 2025-02-23 15:12:37 |
|       4 | David   | NULL                | 2025-02-23 15:12:37 |
|       5 | Eve     | eve@example.com     | 2025-02-23 15:12:37 |
|       6 | Frank   | NULL                | 2025-02-23 15:12:37 |
|       7 | Grace   | grace@example.com   | 2025-02-23 15:12:37 |
+---------+---------+---------------------+---------------------+
```

`EXISTS`のパフォーマンスについて調べると、速いやら遅いやら出てくる。DBの種類やバージョンによっても違いそうなので、実際に動かす環境でパフォーマンステストしてみるしかないのかも。