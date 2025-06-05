-- Q1
CREATE TABLE departments(
    `department_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(20) NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Q2
ALTER TABLE people ADD department_id INT UNSIGNED AFTER email;

-- Q3
INSERT INTO departments (department_id,name)
VALUES
(01,'営業'),
(02,'開発'),
(03,'経理'),
(04,'人事'),
(05,'情報システム');

INSERT INTO people (name,email,department_id,age,gender)
VALUES
('安藤みなみ','anndou@gizumo.jp',01,23,2),
('前田あいう','maeda@gizumo.jp',01,25,1),
('遠藤えおか','enndou@gizumo.jp',01,30,2),
('樋口花純','higuchi@gizumo.jp',02,37,2),
('福田翔太','hukuda@gizumo.jp',02,39,1),
('高橋ふゆみ','takahashi@gizumo.jp',02,41,2),
('宮田ゆうた','miyata@gizumo.jp',02,44,1),
('飯島ひかり','iizima@gizumo.jp',03,48,2),
('伊藤こころ','itou@gizumo.jp',04,53,2),
('池田まなみ','ikeda@gizumo.jp',05,58,2);

INSERT INTO reports (person_id,content)
VALUES
(7,'お客様先に行って、お昼は現地で親子丼を食べた。'),
(8,'営業の研修があって、色々な作法を学んだ。'),
(9,'明日から出張のため今日はその準備をした。'),
(10,'ずっと同じところでエラーがでているため明日先輩に相談する'),
(11,'特に障害などもなく穏やかな一日だった。'),
(12,'SQLが難しくて、なかなか作業が進まない。'),
(13,'PCの調子が悪いので明日誰かに相談をする。'),
(14,'先輩に簿記検定を受けるように言われたので頑張る。'),
(15,'一人面接をしたが、すごくいい子だったので一緒に働きたい。'),
(16,'勤怠システムでバグを見つけたので明日修正する。');

-- Q4
UPDATE people SET department_id = 01 WHERE person_id IN (1,2);
UPDATE people SET department_id = 02 WHERE person_id IN (3,5,6);

-- Q5
SELECT name,age FROM people WHERE gender = 1 order by age DESC;

-- Q6
peopleテーブルからレコード追加順に、department_idが1であるレコードを、name・email・ageのカラムのみ取得している。

-- Q7
SELECT name,age,gender FROM people
WHERE(
age BETWEEN 20 AND 29
AND gender = 2
)OR(
age BETWEEN 40 AND 49
AND gender = 1
);

-- Q8
SELECT * FROM people WHERE department_id = 1 ORDER BY age;

-- Q9
SELECT AVG(age) AS average_age FROM people
WHERE
department_id = 2
AND
gender = 2
GROUP BY gender;

-- Q10
SELECT
P.name,
D.name ,
R.content
FROM 
people P
INNER JOIN
reports R
USING(person_id)
INNER JOIN
departments D
USING(department_id);

-- Q11
SELECT
P.name,
R.content
FROM
people P
LEFT OUTER JOIN
reports R
USING(person_id)
WHERE
R.content IS NULL;