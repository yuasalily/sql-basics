テーブルは5-1で準備したものをそのまま使用する。条件によって表示を変えたい場合は`CASE`を使用することもできる。複数の条件を扱う場合、`IF`と比べて簡潔に書くことができる。`CASE`は以下の2種類の方法で書くことができる。後者の方が一般的。
```
mysql> select *,
    ->     case order_status
    ->         when "cancelled" then "( ;∀;)"
    ->         else "!(^^)!"
    ->     end as "feeling"
    -> from orders;
+----+---------------+--------------+--------+---------------------+----------+
| id | customer_name | order_status | amount | created_at          | feeling  |
+----+---------------+--------------+--------+---------------------+----------+
|  1 | Alice         | pending      | 100.00 | 2025-02-17 15:52:35 | !(^^)!   |
|  2 | Bob           | shipped      | 200.00 | 2025-02-17 15:52:35 | !(^^)!   |
|  3 | Charlie       | delivered    | 300.00 | 2025-02-17 15:52:35 | !(^^)!   |
|  4 | Dave          | cancelled    | 150.00 | 2025-02-17 15:52:35 | ( ;∀;)   |
|  5 | Eve           | pending      |   NULL | 2025-02-17 15:52:35 | !(^^)!   |
|  6 | Frank         | shipped      | 250.00 | 2025-02-17 15:52:35 | !(^^)!   |
+----+---------------+--------------+--------+---------------------+----------+


mysql> select *,
    ->     case
    ->         when order_status = "cancelled" then "( ;∀;)"
    ->         when order_status = "delivered" then "(*^▽^*)"
    ->         else "!(^^)!"
    ->     end as "feeling"
    -> from orders;
+----+---------------+--------------+--------+---------------------+-----------+
| id | customer_name | order_status | amount | created_at          | feeling   |
+----+---------------+--------------+--------+---------------------+-----------+
|  1 | Alice         | pending      | 100.00 | 2025-02-17 15:52:35 | !(^^)!    |
|  2 | Bob           | shipped      | 200.00 | 2025-02-17 15:52:35 | !(^^)!    |
|  3 | Charlie       | delivered    | 300.00 | 2025-02-17 15:52:35 | (*^▽^*)   |
|  4 | Dave          | cancelled    | 150.00 | 2025-02-17 15:52:35 | ( ;∀;)    |
|  5 | Eve           | pending      |   NULL | 2025-02-17 15:52:35 | !(^^)!    |
|  6 | Frank         | shipped      | 250.00 | 2025-02-17 15:52:35 | !(^^)!    |
+----+---------------+--------------+--------+---------------------+-----------+
```

`ORDER BY`の中で`CASE`を利用すると条件に基づいてソートを行うことができる。以下のコマンドではorder_statusがpending(保留中) → shipped(発送済み) → delivered(配達完了) → cancelled(キャンセル済み)の順に並べている。
```
mysql> select * from orders
    -> order by
    ->     case order_status
    ->         when 'pending' then 1
    ->         when 'shipped' then 2
    ->         when 'delivered' then 3
    ->         when 'cancelled' then 4
    ->         else 5
    ->     end;
+----+---------------+--------------+--------+---------------------+
| id | customer_name | order_status | amount | created_at          |
+----+---------------+--------------+--------+---------------------+
|  1 | Alice         | pending      | 100.00 | 2025-02-17 15:52:35 |
|  5 | Eve           | pending      |   NULL | 2025-02-17 15:52:35 |
|  2 | Bob           | shipped      | 200.00 | 2025-02-17 15:52:35 |
|  6 | Frank         | shipped      | 250.00 | 2025-02-17 15:52:35 |
|  3 | Charlie       | delivered    | 300.00 | 2025-02-17 15:52:35 |
|  4 | Dave          | cancelled    | 150.00 | 2025-02-17 15:52:35 |
+----+---------------+--------------+--------+---------------------+
```
`UPDATE`で値を更新する際にも`CASE`を使用することができる。以下のコマンドではamountが`NULL`のもの0にし、amountが200より小さいのものを1割引きにしている。
```
mysql> select * from orders;
+----+---------------+--------------+--------+---------------------+
| id | customer_name | order_status | amount | created_at          |
+----+---------------+--------------+--------+---------------------+
|  1 | Alice         | pending      | 100.00 | 2025-02-17 15:52:35 |
|  2 | Bob           | shipped      | 200.00 | 2025-02-17 15:52:35 |
|  3 | Charlie       | delivered    | 300.00 | 2025-02-17 15:52:35 |
|  4 | Dave          | cancelled    | 150.00 | 2025-02-17 15:52:35 |
|  5 | Eve           | pending      |   NULL | 2025-02-17 15:52:35 |
|  6 | Frank         | shipped      | 250.00 | 2025-02-17 15:52:35 |
+----+---------------+--------------+--------+---------------------+
6 rows in set (0.00 sec)

mysql> update orders
    -> set amount =
    ->     case
    ->         when amount is null then 0
    ->         when amount < 200 then amount * 0.9
    ->         else amount
    ->     end;
Query OK, 3 rows affected (0.01 sec)
Rows matched: 6  Changed: 3  Warnings: 0

mysql> select * from orders;
+----+---------------+--------------+--------+---------------------+
| id | customer_name | order_status | amount | created_at          |
+----+---------------+--------------+--------+---------------------+
|  1 | Alice         | pending      |  90.00 | 2025-02-17 15:52:35 |
|  2 | Bob           | shipped      | 200.00 | 2025-02-17 15:52:35 |
|  3 | Charlie       | delivered    | 300.00 | 2025-02-17 15:52:35 |
|  4 | Dave          | cancelled    | 135.00 | 2025-02-17 15:52:35 |
|  5 | Eve           | pending      |   0.00 | 2025-02-17 15:52:35 |
|  6 | Frank         | shipped      | 250.00 | 2025-02-17 15:52:35 |
+----+---------------+--------------+--------+---------------------+
```
