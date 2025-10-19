create table users (
	id int auto_increment primary key not null,
	username varchar (250) not null unique,
	first_name varchar (50) not null,
    last_name varchar (50) not null,
    birth_date date,
    email varchar (250) not null,
    created_date timestamp default NOW()
);

INSERT INTO users (username, first_name, last_name, birth_date, email)
VALUES 
('skywanderer', 'Derrick', 'McBride', '1999-04-15', 'derrick.mcbride@email.com'),
('cyberfox', 'Ava', 'Johnson', '2001-09-22', 'ava.johnson@email.com'),
('techsavant', 'Liam', 'Nguyen', '1998-02-10', 'liam.nguyen@email.com'),
('pixelpilot', 'Sophia', 'Martinez', '2000-06-05', 'sophia.martinez@email.com'),
('datahacker', 'Ethan', 'Kim', '1997-12-30', 'ethan.kim@email.com'),
('wanderlust', 'Olivia', 'Brown', '1996-05-12', 'olivia.brown@email.com', '2023-03-15 08:45:00'),
('codewizard', 'Noah', 'Davis', '2002-11-03', 'noah.davis@email.com', '2023-07-20 14:12:00'),
('lenslover', 'Emma', 'Wilson', '1995-08-22', 'emma.wilson@email.com', '2022-12-05 17:30:00'),
('adventureseeker', 'Mason', 'Taylor', '1999-02-18', 'mason.taylor@email.com', '2023-01-11 09:20:00'),
('cityscape', 'Isabella', 'Moore', '2000-04-09', 'isabella.moore@email.com', '2023-06-23 11:10:00');


create table photos (
	id int auto_increment primary key not null,
    photo_url varchar (100) not null,
    user_id int not null,
    post_date timestamp default NOW() ON UPDATE NOW(),
    foreign key (user_id) references users(id)
);

INSERT INTO photos (photo_url, user_id, post_date)
VALUES 
('https://images.example.com/pic001.jpg', 1, '2025-10-15'),
('https://images.example.com/pic002.jpg', 2, '2025-10-10'),
('https://images.example.com/pic003.jpg', 3, '2025-09-28'),
('https://images.example.com/pic004.jpg', 4, '2025-08-15'),
('https://images.example.com/pic005.jpg', 5, '2025-07-22'),
('https://images.example.com/pic006.jpg', 6, '2025-10-01'),  
('https://images.example.com/pic007.jpg', 7, '2025-09-20'),  
('https://images.example.com/pic008.jpg', 8, '2025-09-12'),  
('https://images.example.com/pic009.jpg', 9, '2025-08-25'),  
('https://images.example.com/pic010.jpg', 10, '2025-07-30'); 

create table comments (
	id int auto_increment primary key not null,
    comment_texts varchar (100) not null,
    comment_likes bigint,
    user_id int not null,
    photo_id int not null,
    post_date timestamp default NOW(),
    foreign key (user_id) references users(id),
    foreign key (photo_id) references photos(id)
);

INSERT INTO comments (comment_text, comment_likes, user_id, photo_id, post_date)
VALUES
('This photo is stunning! The lighting is perfect.', 14, 2, 1, '2025-10-15 09:32:00'),
('Wow, that sunset looks unreal', 7, 3, 2, '2025-10-14 16:20:00'),
('Love this angle, really creative shot!', 9, 1, 3, '2025-10-13 11:05:00'),
('So peaceful. Where was this taken?', 4, 4, 4, '2025-10-12 19:42:00'),
('Amazing composition! You’ve got a great eye', 11, 5, 5, '2025-10-11 08:55:00'),
('This is incredible!', 5, 6, 1, '2025-10-15 12:05:00'),
('Absolutely love this shot!', 8, 7, 2, '2025-10-14 10:22:00'),
('Stunning colors!', 6, 8, 3, '2025-10-13 16:40:00'),
('Where is this place? Amazing!', 3, 9, 4, '2025-10-12 09:55:00'),
('Such a perfect moment captured.', 10, 10, 5, '2025-10-11 18:30:00');

create table likes (
	user_id int not null,
    photo_id int not null,
    created_date timestamp default NOW(),
    foreign key (user_id) references users(id),
    foreign key (photo_id) references photos(id),
    primary key(user_id, photo_id)
);

INSERT INTO likes (user_id, photo_id, created_date)
VALUES
(1, 1, '2025-10-15 09:00:00'),  
(1, 2, '2025-10-11 20:40:00'),
(1, 3, '2025-10-15 10:45:00'),
(1, 4, '2025-10-12 08:00:00'),  
(1, 5, '2025-10-13 09:30:00'),  
(1, 6, '2025-10-01 09:00:00'),
(1, 7, '2025-09-21 08:45:00'),  
(1, 8, '2025-09-12 14:50:00'),  
(1, 9, '2025-08-25 11:10:00'),  
(1, 10, '2025-07-30 14:00:00'), 
(2, 1, '2025-10-15 09:50:00'),
(2, 3, '2025-10-12 15:10:00'),
(2, 7, '2025-09-20 12:22:00'),
(3, 1, '2025-10-12 16:05:00'),
(3, 2, '2025-10-14 17:12:00'),
(3, 8, '2025-09-12 15:30:00'),
(4, 4, '2025-10-13 08:25:00'),
(4, 5, '2025-10-11 09:15:00'),
(4, 9, '2025-08-25 11:15:00'),
(5, 1, '2025-10-10 22:55:00'),
(5, 5, '2025-10-13 19:35:00'),
(5, 10, '2025-07-30 13:45:00'),
(6, 1, '2025-10-15 12:15:00'),
(7, 2, '2025-10-14 10:35:00'),
(8, 3, '2025-10-13 16:50:00'),
(9, 4, '2025-10-12 10:10:00'),
(10, 5, '2025-10-11 18:40:00');

create table hashtags (
	id int auto_increment primary key not null,
    hashtag varchar (100) unique
);

INSERT INTO hashtags (hashtag) VALUES
('sunrise'),
('travel'),
('photography'),
('nature'),
('landscape'),
('portrait'),
('urban'),
('adventure'),
('sunset'),
('mountains'),
('foodie'),
('wildlife'),
('travelphotography'),
('citylife'),
('hiking'),
('streetstyle');

create table photo_hashtags (
    photo_id INT NOT NULL,
    hashtag_id INT NOT NULL,
    added_date TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (photo_id) REFERENCES photos(id),
    FOREIGN KEY (hashtag_id) REFERENCES hashtags(id),
    PRIMARY KEY (photo_id, hashtag_id)
);

INSERT INTO photo_hashtags (photo_id, hashtag_id, added_date) VALUES
(1, 1, '2025-10-15 08:30:00'),  -- photo 1 tagged with #sunrise
(1, 3, '2025-10-15 08:31:00'),  -- photo 1 tagged with #photography
(2, 2, '2025-10-14 09:20:00'),  -- photo 2 tagged with #travel
(2, 5, '2025-10-14 09:21:00'),  -- photo 2 tagged with #landscape
(3, 3, '2025-10-13 11:00:00'),  -- photo 3 tagged with #photography
(3, 4, '2025-10-13 11:01:00'),  -- photo 3 tagged with #nature
(4, 6, '2025-10-12 14:15:00'),  -- photo 4 tagged with #portrait
(5, 7, '2025-10-11 16:45:00'),  -- photo 5 tagged with #urban
(5, 8, '2025-10-11 16:46:00'),  -- photo 5 tagged with #adventure
(6, 2, '2025-10-01 08:00:00'),  -- Olivia's photo #mountains
(6, 5, '2025-10-01 08:05:00'),  -- #travelphotography
(7, 1, '2025-09-20 09:00:00'),  -- Noah's photo #sunset
(7, 6, '2025-09-20 09:05:00'),  -- #citylife
(8, 4, '2025-09-12 14:00:00'),  -- Emma's photo #wildlife
(8, 3, '2025-09-12 14:10:00'),  -- #foodie
(9, 7, '2025-08-25 10:30:00'),  -- Mason's photo #hiking
(10, 6, '2025-07-30 12:00:00'), -- Isabella's photo #citylife
(10, 8, '2025-07-30 12:10:00'); -- #streetstyle

create table follows (
	follower_id int not null, 
    followee_id int not null, 
    created_date timestamp default NOW(),
	foreign key (follower_id) references users(id),
	foreign key (followee_id) references users(id),
    primary key (follower_id, followee_id)
);

INSERT INTO follows (follower_id, followee_id, created_date)
VALUES
(1, 2, '2025-10-10 09:30:00'),  -- Derrick follows Ava
(1, 3, '2025-10-11 11:45:00'),  -- Derrick follows Liam
(2, 3, '2025-10-12 15:20:00'),  -- Ava follows Liam
(3, 1, '2025-10-13 18:10:00'),  -- Liam follows Derrick
(4, 5, '2025-10-14 20:05:00'),  -- Sophia follows Ethan
(5, 2, '2025-10-15 10:40:00'),  -- Ethan follows Ava
(2, 1, '2025-10-16 12:00:00'),  -- Ava follows Derrick
(3, 4, '2025-10-16 13:15:00'),  -- Liam follows Sophia
(6, 1, '2025-10-01 09:30:00'),  -- Olivia follows Derrick
(7, 2, '2025-09-20 10:15:00'),  -- Noah follows Ava
(8, 3, '2025-09-12 15:00:00'),  -- Emma follows Liam
(9, 4, '2025-08-25 11:00:00'),  -- Mason follows Sophia
(10, 5, '2025-07-30 14:00:00'), -- Isabella follows Ethan
(1, 6, '2025-10-02 08:00:00'),  -- Derrick follows Olivia
(2, 7, '2025-09-21 09:30:00'),  -- Ava follows Noah
(3, 8, '2025-09-13 16:00:00');  -- Liam follows Emma