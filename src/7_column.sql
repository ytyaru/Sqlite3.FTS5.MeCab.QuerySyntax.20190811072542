.load /home/pi/root/sys/env/tool/sqlite_ext/fts5_mecab
create virtual table posts using fts5(title, content, tokenize = 'mecab');
insert into posts values('タイトル1', '本文1');
insert into posts values('タイトル2', '本文2');
insert into posts values('たいとる3', 'ほんぶん3');
insert into posts values('間違ったタイトルの書き方', '間違った本文の書き方');
insert into posts values('NEAR確認用','間違ったお前のやり方を悪しざまに貶める書き方');
insert into posts values('NEAR確認用','間違った恥ずかしい書き方');

select * from posts where posts match 'title:タイトル';
select * from posts where posts match 'title:本文';
select * from posts where posts match 'content:本文';

-- {列名}
select * from posts where posts match '{title content}:書き方';

-- -列名
select * from posts where posts match '-title:本文';

