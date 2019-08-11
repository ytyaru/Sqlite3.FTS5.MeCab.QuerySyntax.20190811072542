.load /home/pi/root/sys/env/tool/sqlite_ext/fts5_mecab
create virtual table posts using fts5(title, content, tokenize = 'mecab');
insert into posts values('タイトル1', '本文1');
insert into posts values('タイトル2', '本文2');
insert into posts values('たいとる3', 'ほんぶん3');
insert into posts values('間違ったタイトルの書き方', '間違った本文の書き方');

-- ヒットしなかった

-- ワイルドカード風
select * from posts where posts match '"間違*"';
select * from posts where posts match '間違*';

--　ドキュメントをマネてみた
select * from posts where posts match '"間違" *';
select * from posts where posts match '間違 *';
select * from posts where posts match '"間違 *"';

-- 列を指定してもダメ。
select * from posts where posts match 'title:"間違*"';
select * from posts where posts match 'title:間違*';
select * from posts where posts match 'title:"間違" *';
select * from posts where posts match 'title:間違 *';
select * from posts where posts match 'title:"間違 *"';

select * from posts where posts match 'content:"間違*"';
select * from posts where posts match 'content:間違*';
select * from posts where posts match 'content:"間違" *';
select * from posts where posts match 'content:間違 *';
select * from posts where posts match 'content:"間違 *"';

-- スペースを入れてもダメ。
select * from posts where posts match 'title: "間違*"';
select * from posts where posts match 'title: 間違*';
select * from posts where posts match 'title: "間違" *';
select * from posts where posts match 'title: 間違 *';
select * from posts where posts match 'title: "間違 *"';

-- テーブル値関数を使ってもダメ。
select * from posts('"間違*"');
select * from posts('間違*');
select * from posts('"間違" *');
select * from posts('間違 *');
select * from posts('"間違 *"');

-- `=`を使ってもダメ。
select * from posts where posts = '"間違*"';
select * from posts where title = '"間違*"';
select * from posts where content = '"間違*"';
select * from posts where posts = '間違*';
select * from posts where title = '間違*';
select * from posts where content = '間違*';
select * from posts where posts = '"間違" *';
select * from posts where title = '"間違" *';
select * from posts where content = '"間違" *';
select * from posts where posts = '間違 *';
select * from posts where title = '間違 *';
select * from posts where content = '間違 *';
select * from posts where posts = '"間違 *"';
select * from posts where title = '"間違 *"';
select * from posts where content = '"間違 *"';

