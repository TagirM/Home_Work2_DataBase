-- Задание 2. Написать скрипт, добавляющий в созданную БД vk 2-3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей) (CREATE TABLE)

USE vk;
CREATE TABLE guests (
guest_id BIGINT UNSIGNED NOT NULL UNIQUE,
firstname_guest VARCHAR(50),
lastname_guest VARCHAR(50),
gender_guest CHAR(1),
visited_user_id BIGINT UNSIGNED NOT NULL,
time_visited DATETIME DEFAULT NOW(),

FOREIGN KEY (visited_user_id) REFERENCES users(id)
);

CREATE TABLE vk_groups (
group_id BIGINT UNSIGNED NOT NULL UNIQUE,
name_group VARCHAR(50),
count_of_users VARCHAR(50),
user_id BIGINT UNSIGNED NOT NULL,

FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Задание 3. Заполнить 2 таблицы БД vk данными (по 10 записей в каждой таблице) (INSERT)

INSERT INTO users(id, firstname, lastname, email, password_hash, phone)
	VALUES ('1', 'Иван', 'Васильев', 'iv@gmail.com', 'kjaskgjdfhvlksajdlvh', '89234445533'),
			('2', 'Василий', 'Пупкин', 'vp1@gmail.com', 'qwdf1gjdfhvlksajdlvh', '89034045123'),
			('3', 'Максим', 'Иванов', 'mi@gmail.com', 'f1gjdfhvlksajdlvh', '89134045112'),    
 			('4', 'Петр', 'Дедов', 'pd@gmail.com', 'aaSDAFTHC34gksajdn5lvh', '89994532423'),   
			('5', 'Сергей', 'Деев', 'sd@gmail.com', 'DDAAC1gjdfhvlvcxajdlvh', '89886645163'),    
			('6', 'Василий', 'Попов', 'vp2@gmail.com', 'q2rtwetg346wdf1gjdsdbbb3478sajdlvh', '894334553654'),    
			('7', 'Иван', 'Уваров', 'iu@gmail.com', 'q523244w3425df561gjdfhv56lksajdlvh', '890964353463'),    
			('8', 'Олег', 'Орлов', 'oo@gmail.com', '23tf1g346jdfhwetvlksajdlvh', '89063463446'),    
			('9', 'Игорь', 'Сидоров', 'is@gmail.com', 'wert4536gjdfhverwtlksajdlvh', '8912654556344'),    
			('10', 'Андрей', 'Тулин', 'at@gmail.com', '457qwd34567f1gjdfhvlk567sajdlvh', '89143654567');
            
INSERT INTO guests(guest_id, firstname_guest, lastname_guest, gender_guest, visited_user_id, time_visited)
	VALUES ('12', 'Артем', 'Васильев', 'М', '2', '2017-04-24 09:30:19'),
			('112', 'Елена', 'Васильева', 'Ж', '9', '2003-02-03 04:56:27'),
			('212', 'Георгий', 'Мун', 'М', '8', '2008-12-17 13:03:56'),
			('222', 'София', 'Иванова', 'Ж', '2', '2007-04-20 09:31:19'),
			('324', 'Иван', 'Петров', 'М', '1', '2017-03-14 09:33:19'),
			('456', 'Ольга', 'Сорокина', 'Ж', '1', '2013-03-23 05:32:19'),
            ('675', 'Федор', 'Артемьев', 'М', '4', '2019-02-12 09:10:11'),
            ('5478', 'Лидия', 'Орлова', 'Ж', '4', '2022-06-21 11:11:19'),
            ('5685', 'Джордж', 'Буш', 'М', '2', '2021-05-24 11:22:19'),
			('5185', 'Майкл', 'Смит', 'М', '3', '2011-04-21 22:30:10');
    
            
SELECT * FROM users;
SELECT * FROM guests;            

-- Задание 4.* Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = true). 
-- При необходимости предварительно добавить такое поле в таблицу profiles со значением по умолчанию = false (или 0) (ALTER TABLE + UPDATE)

ALTER TABLE vk.profiles 
ADD COLUMN is_active BIT DEFAULT 1;
UPDATE profiles
SET is_active = 0
WHERE (birthday + INTERVAL 18 YEAR) > NOW();

-- Вывод результата
SELECT *
FROM profiles
WHERE is_active = 0;
SELECT *
FROM profiles
WHERE is_active = 1;

-- Задание 5.* Написать скрипт, удаляющий сообщения «из будущего» (дата позже сегодняшней) (DELETE)

DELETE FROM messages
WHERE created_at > NOW();

-- Вывод результата
SELECT *
WHERE messages;