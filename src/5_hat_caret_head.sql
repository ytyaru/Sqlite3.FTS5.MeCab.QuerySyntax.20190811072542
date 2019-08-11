.load /home/pi/root/sys/env/tool/sqlite_ext/fts5_mecab
create virtual table posts using fts5(title, content, tokenize = 'mecab');
insert into posts values('タイトル1', '本文1');
insert into posts values('タイトル2', '本文2');
insert into posts values('たいとる3', 'ほんぶん3');
insert into posts values('間違ったタイトルの書き方', '間違った本文の書き方');

-- ヒットした
select * from posts where posts match '^間違っ';
select * from posts where posts match '^タイトル';
select * from posts where posts match '^タイト*';

-- ヒットせず
select * from posts where posts match '^間違*';

