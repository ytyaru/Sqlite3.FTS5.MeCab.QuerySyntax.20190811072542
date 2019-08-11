.load /home/pi/root/sys/env/tool/sqlite_ext/fts5_mecab
create virtual table posts using fts5(title, content, tokenize = 'mecab');
insert into posts values('タイトル1', '本文1');
insert into posts values('タイトル2', '本文2');
insert into posts values('たいとる3', 'ほんぶん3');
insert into posts values('間違ったタイトルの書き方', '間違った本文の書き方');

-- ヒットした
select * from posts where posts match 'NEAR(タイトル 間違っ, 10)';
-- ヒットせず
select * from posts where posts match 'NEAR(タイトル 間違っ, 0)';
-- ヒットした
select * from posts where posts match 'NEAR(タイトル "間違った", 0)';
-- N=0なら以下のようにしたほうがわかりやすい
select * from posts where posts match 'NEAR("間違ったタイトル", 0)';
select * from posts where posts match 'NEAR("^間違ったタイトル", 0)';
select * from posts where posts match 'NEAR("^ 間違ったタイトル", 0)';

-- つまり、`N`が1以上のときに`NEAR()`を使う価値があるはず。3トークン以上あるときに使うものなのだろう。
select * from posts where posts match 'NEAR("間違った" "書き方", 2)';

-- N=7のレコード追加
insert into posts values('NEAR確認用','間違ったお前のやり方を悪しざまに貶める書き方');
select * from posts where posts match 'NEAR("間違った" "書き方", 2)';
select * from posts where posts match 'NEAR("間違った" "書き方", 7)';

-- N=1のレコード追加
insert into posts values('NEAR確認用','間違った恥ずかしい書き方');
select * from posts where posts match 'NEAR("間違った" "書き方", 2)';

