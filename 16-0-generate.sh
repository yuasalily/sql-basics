#!/bin/bash
DB_NAME="my_db"
TABLE_NAME="test_index"
DATA_FILE="data.csv"

# 生成するレコード数を指定
ROW_COUNT=10000000

mysql -u root $DB_NAME -e "SET GLOBAL local_infile = 1;"

echo "Dropping and creating table..."
# here documentで(再)テーブル作成
mysql -u root $DB_NAME <<EOF
DROP TABLE IF EXISTS $TABLE_NAME;
CREATE TABLE $TABLE_NAME (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
EOF

rm -f $DATA_FILE
echo "Creating data file: $DATA_FILE"
seq 1 "$ROW_COUNT" | sed 's/^/name/' > $DATA_FILE

echo "Inserting data"
# LOAD DATAでデータ投入
mysql -u root --local-infile=1 $DB_NAME <<EOF
LOAD DATA LOCAL INFILE "$DATA_FILE"
INTO TABLE $TABLE_NAME
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
(name);
EOF

rm -f $DATA_FILE

echo "Data insertion is complete."