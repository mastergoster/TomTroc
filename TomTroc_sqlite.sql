DROP TABLE IF EXISTS `messages`;
DROP TABLE IF EXISTS `books`;
DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` integer PRIMARY KEY,
  `username` varchar(255) UNIQUE NOT NULL,
  `role` TEXT CHECK(`role` IN ('user', 'admin')) DEFAULT 'user',
  `mail` varchar(255) UNIQUE NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `books` (
  `id` integer PRIMARY KEY,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `picture` varchar(255),
  `description` text NOT NULL,
  `user_id` integer NOT NULL,
  `status` TEXT CHECK(`status` IN ('available', 'not_available')) DEFAULT 'not_available',
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

CREATE TABLE `messages` (
  `id` integer PRIMARY KEY,
  `body` text NOT NULL,
  `sender_user_id` int NOT NULL,
  `recipient_user_id` int NOT NULL,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`sender_user_id`) REFERENCES `users` (`id`),
  FOREIGN KEY (`recipient_user_id`) REFERENCES `users` (`id`)
);

INSERT INTO `users` (`username`, `role`, `mail`, `password`, `created_at`) VALUES
('user1', 'user', 'user1@example.com', 'password', CURRENT_TIMESTAMP),
('user2', 'user', 'user2@example.com', 'password', CURRENT_TIMESTAMP),
('user3', 'user', 'user3@example.com', 'password', CURRENT_TIMESTAMP),
('user4', 'user', 'user4@example.com', 'password', CURRENT_TIMESTAMP),
('user5', 'user', 'user5@example.com', 'password', CURRENT_TIMESTAMP),
('user6', 'user', 'user6@example.com', 'password', CURRENT_TIMESTAMP),
('user7', 'user', 'user7@example.com', 'password', CURRENT_TIMESTAMP),
('user8', 'user', 'user8@example.com', 'password', CURRENT_TIMESTAMP),
('user9', 'user', 'user9@example.com', 'password', CURRENT_TIMESTAMP),
('user10', 'user', 'user10@example.com', 'password', CURRENT_TIMESTAMP);

INSERT INTO `books` (`title`, `author`, `picture`, `description`, `user_id`, `status`, `created_at`) VALUES
-- Livres pour user1
('Book 1-1', 'Author 1', 'picture1.jpg', 'Description of Book 1-1', 1, 'available', CURRENT_TIMESTAMP),
('Book 1-2', 'Author 1', 'picture2.jpg', 'Description of Book 1-2', 1, 'available', CURRENT_TIMESTAMP),
('Book 1-3', 'Author 1', 'picture3.jpg', 'Description of Book 1-3', 1, 'available', CURRENT_TIMESTAMP),
('Book 1-4', 'Author 1', 'picture4.jpg', 'Description of Book 1-4', 1, 'available', CURRENT_TIMESTAMP),
('Book 1-5', 'Author 1', 'picture5.jpg', 'Description of Book 1-5', 1, 'available', CURRENT_TIMESTAMP),
('Book 1-6', 'Author 1', 'picture6.jpg', 'Description of Book 1-6', 1, 'available', CURRENT_TIMESTAMP),
-- Livres pour user2
('Book 2-1', 'Author 2', 'picture1.jpg', 'Description of Book 2-1', 2, 'available', CURRENT_TIMESTAMP),
('Book 2-2', 'Author 2', 'picture2.jpg', 'Description of Book 2-2', 2, 'available', CURRENT_TIMESTAMP),
('Book 2-3', 'Author 2', 'picture3.jpg', 'Description of Book 2-3', 2, 'available', CURRENT_TIMESTAMP),
('Book 2-4', 'Author 2', 'picture4.jpg', 'Description of Book 2-4', 2, 'available', CURRENT_TIMESTAMP),
('Book 2-5', 'Author 2', 'picture5.jpg', 'Description of Book 2-5', 2, 'available', CURRENT_TIMESTAMP),
-- Livres pour user3
('Book 3-1', 'Author 3', 'picture1.jpg', 'Description of Book 3-1', 3, 'available', CURRENT_TIMESTAMP),
('Book 3-2', 'Author 3', 'picture2.jpg', 'Description of Book 3-2', 3, 'available', CURRENT_TIMESTAMP),
('Book 3-3', 'Author 3', 'picture3.jpg', 'Description of Book 3-3', 3, 'available', CURRENT_TIMESTAMP),
('Book 3-4', 'Author 3', 'picture4.jpg', 'Description of Book 3-4', 3, 'available', CURRENT_TIMESTAMP),
('Book 3-5', 'Author 3', 'picture5.jpg', 'Description of Book 3-5', 3, 'available', CURRENT_TIMESTAMP),
('Book 3-6', 'Author 3', 'picture6.jpg', 'Description of Book 3-6', 3, 'available', CURRENT_TIMESTAMP),
('Book 3-7', 'Author 3', 'picture7.jpg', 'Description of Book 3-7', 3, 'available', CURRENT_TIMESTAMP),
-- Livres pour user4
('Book 4-1', 'Author 4', 'picture1.jpg', 'Description of Book 4-1', 4, 'available', CURRENT_TIMESTAMP),
('Book 4-2', 'Author 4', 'picture2.jpg', 'Description of Book 4-2', 4, 'available', CURRENT_TIMESTAMP),
('Book 4-3', 'Author 4', 'picture3.jpg', 'Description of Book 4-3', 4, 'available', CURRENT_TIMESTAMP),
('Book 4-4', 'Author 4', 'picture4.jpg', 'Description of Book 4-4', 4, 'available', CURRENT_TIMESTAMP),
('Book 4-5', 'Author 4', 'picture5.jpg', 'Description of Book 4-5', 4, 'available', CURRENT_TIMESTAMP),
('Book 4-6', 'Author 4', 'picture6.jpg', 'Description of Book 4-6', 4, 'available', CURRENT_TIMESTAMP),
('Book 4-7', 'Author 4', 'picture7.jpg', 'Description of Book 4-7', 4, 'available', CURRENT_TIMESTAMP),
('Book 4-8', 'Author 4', 'picture8.jpg', 'Description of Book 4-8', 4, 'available', CURRENT_TIMESTAMP),
-- Livres pour user5
('Book 5-1', 'Author 5', 'picture1.jpg', 'Description of Book 5-1', 5, 'available', CURRENT_TIMESTAMP),
('Book 5-2', 'Author 5', 'picture2.jpg', 'Description of Book 5-2', 5, 'available', CURRENT_TIMESTAMP),
('Book 5-3', 'Author 5', 'picture3.jpg', 'Description of Book 5-3', 5, 'available', CURRENT_TIMESTAMP),
('Book 5-4', 'Author 5', 'picture4.jpg', 'Description of Book 5-4', 5, 'available', CURRENT_TIMESTAMP),
('Book 5-5', 'Author 5', 'picture5.jpg', 'Description of Book 5-5', 5, 'available', CURRENT_TIMESTAMP),
('Book 5-6', 'Author 5', 'picture6.jpg', 'Description of Book 5-6', 5, 'available', CURRENT_TIMESTAMP),
('Book 5-7', 'Author 5', 'picture7.jpg', 'Description of Book 5-7', 5, 'available', CURRENT_TIMESTAMP),
('Book 5-8', 'Author 5', 'picture8.jpg', 'Description of Book 5-8', 5, 'available', CURRENT_TIMESTAMP),
('Book 5-9', 'Author 5', 'picture9.jpg', 'Description of Book 5-9', 5, 'available', CURRENT_TIMESTAMP),
-- Livres pour user6
('Book 6-1', 'Author 6', 'picture1.jpg', 'Description of Book 6-1', 6, 'available', CURRENT_TIMESTAMP),
('Book 6-2', 'Author 6', 'picture2.jpg', 'Description of Book 6-2', 6, 'available', CURRENT_TIMESTAMP),
('Book 6-3', 'Author 6', 'picture3.jpg', 'Description of Book 6-3', 6, 'available', CURRENT_TIMESTAMP),
('Book 6-4', 'Author 6', 'picture4.jpg', 'Description of Book 6-4', 6, 'available', CURRENT_TIMESTAMP),
('Book 6-5', 'Author 6', 'picture5.jpg', 'Description of Book 6-5', 6, 'available', CURRENT_TIMESTAMP),
('Book 6-6', 'Author 6', 'picture6.jpg', 'Description of Book 6-6', 6, 'available', CURRENT_TIMESTAMP),
('Book 6-7', 'Author 6', 'picture7.jpg', 'Description of Book 6-7', 6, 'available', CURRENT_TIMESTAMP),
('Book 6-8', 'Author 6', 'picture8.jpg', 'Description of Book 6-8', 6, 'available', CURRENT_TIMESTAMP),
('Book 6-9', 'Author 6', 'picture9.jpg', 'Description of Book 6-9', 6, 'available', CURRENT_TIMESTAMP),
-- Livres pour user7
('Book 7-1', 'Author 7', 'picture1.jpg', 'Description of Book 7-1', 7, 'available', CURRENT_TIMESTAMP),
('Book 7-2', 'Author 7', 'picture2.jpg', 'Description of Book 7-2', 7, 'available', CURRENT_TIMESTAMP),
('Book 7-3', 'Author 7', 'picture3.jpg', 'Description of Book 7-3', 7, 'available', CURRENT_TIMESTAMP),
('Book 7-4', 'Author 7', 'picture4.jpg', 'Description of Book 7-4', 7, 'available', CURRENT_TIMESTAMP),
('Book 7-5', 'Author 7', 'picture5.jpg', 'Description of Book 7-5', 7, 'available', CURRENT_TIMESTAMP),
('Book 7-6', 'Author 7', 'picture6.jpg', 'Description of Book 7-6', 7, 'available', CURRENT_TIMESTAMP),
('Book 7-7', 'Author 7', 'picture7.jpg', 'Description of Book 7-7', 7, 'available', CURRENT_TIMESTAMP),
('Book 7-8', 'Author 7', 'picture8.jpg', 'Description of Book 7-8', 7, 'available', CURRENT_TIMESTAMP),
('Book 7-9', 'Author 7', 'picture9.jpg', 'Description of Book 7-9', 7, 'available', CURRENT_TIMESTAMP),
('Book 7-10', 'Author 7', 'picture10.jpg', 'Description of Book 7-10', 7, 'available', CURRENT_TIMESTAMP),
-- Livres pour user8
('Book 8-1', 'Author 8', 'picture1.jpg', 'Description of Book 8-1', 8, 'available', CURRENT_TIMESTAMP),
('Book 8-2', 'Author 8', 'picture2.jpg', 'Description of Book 8-2', 8, 'available', CURRENT_TIMESTAMP),
('Book 8-3', 'Author 8', 'picture3.jpg', 'Description of Book 8-3', 8, 'available', CURRENT_TIMESTAMP),
('Book 8-4', 'Author 8', 'picture4.jpg', 'Description of Book 8-4', 8, 'available', CURRENT_TIMESTAMP),
('Book 8-5', 'Author 8', 'picture5.jpg', 'Description of Book 8-5', 8, 'available', CURRENT_TIMESTAMP),
('Book 8-6', 'Author 8', 'picture6.jpg', 'Description of Book 8-6', 8, 'available', CURRENT_TIMESTAMP),
('Book 8-7', 'Author 8', 'picture7.jpg', 'Description of Book 8-7', 8, 'available', CURRENT_TIMESTAMP),
('Book 8-8', 'Author 8', 'picture8.jpg', 'Description of Book 8-8', 8, 'available', CURRENT_TIMESTAMP),
('Book 8-9', 'Author 8', 'picture9.jpg', 'Description of Book 8-9', 8, 'available', CURRENT_TIMESTAMP),
('Book 8-10', 'Author 8', 'picture10.jpg', 'Description of Book 8-10', 8, 'available', CURRENT_TIMESTAMP),
-- Livres pour user9
('Book 9-1', 'Author 9', 'picture1.jpg', 'Description of Book 9-1', 9, 'available', CURRENT_TIMESTAMP),
('Book 9-2', 'Author 9', 'picture2.jpg', 'Description of Book 9-2', 9, 'available', CURRENT_TIMESTAMP),
('Book 9-3', 'Author 9', 'picture3.jpg', 'Description of Book 9-3', 9, 'available', CURRENT_TIMESTAMP),
('Book 9-4', 'Author 9', 'picture4.jpg', 'Description of Book 9-4', 9, 'available', CURRENT_TIMESTAMP),
('Book 9-5', 'Author 9', 'picture5.jpg', 'Description of Book 9-5', 9, 'available', CURRENT_TIMESTAMP),
('Book 9-6', 'Author 9', 'picture6.jpg', 'Description of Book 9-6', 9, 'available', CURRENT_TIMESTAMP),
('Book 9-7', 'Author 9', 'picture7.jpg', 'Description of Book 9-7', 9, 'available', CURRENT_TIMESTAMP),
('Book 9-8', 'Author 9', 'picture8.jpg', 'Description of Book 9-8', 9, 'available', CURRENT_TIMESTAMP),
('Book 9-9', 'Author 9', 'picture9.jpg', 'Description of Book 9-9', 9, 'available', CURRENT_TIMESTAMP),
('Book 9-10', 'Author 9', 'picture10.jpg', 'Description of Book 9-10', 9, 'available', CURRENT_TIMESTAMP),
-- Livres pour user10
('Book 10-1', 'Author 10', 'picture1.jpg', 'Description of Book 10-1', 10, 'available', CURRENT_TIMESTAMP),
('Book 10-2', 'Author 10', 'picture2.jpg', 'Description of Book 10-2', 10, 'available', CURRENT_TIMESTAMP),
('Book 10-3', 'Author 10', 'picture3.jpg', 'Description of Book 10-3', 10, 'available', CURRENT_TIMESTAMP),
('Book 10-4', 'Author 10', 'picture4.jpg', 'Description of Book 10-4', 10, 'available', CURRENT_TIMESTAMP),
('Book 10-5', 'Author 10', 'picture5.jpg', 'Description of Book 10-5', 10, 'available', CURRENT_TIMESTAMP),
('Book 10-6', 'Author 10', 'picture6.jpg', 'Description of Book 10-6', 10, 'available', CURRENT_TIMESTAMP),
('Book 10-7', 'Author 10', 'picture7.jpg', 'Description of Book 10-7', 10, 'available', CURRENT_TIMESTAMP),
('Book 10-8', 'Author 10', 'picture8.jpg', 'Description of Book 10-8', 10, 'available', CURRENT_TIMESTAMP),
('Book 10-9', 'Author 10', 'picture9.jpg', 'Description of Book 10-9', 10, 'available', CURRENT_TIMESTAMP),
('Book 10-10', 'Author 10', 'picture10.jpg', 'Description of Book 10-10', 10, 'available', CURRENT_TIMESTAMP);

INSERT INTO `messages` (`body`, `sender_user_id`, `recipient_user_id`, `created_at`) VALUES
-- Conversations entre user1 et user2
('Hello user2, this is user1.', 1, 2, CURRENT_TIMESTAMP),
('Hi user1, how are you?', 2, 1, CURRENT_TIMESTAMP),
('I am fine, thank you!', 1, 2, CURRENT_TIMESTAMP),

-- Conversations entre user1 et user3
('Hey user3, user1 here.', 1, 3, CURRENT_TIMESTAMP),
('Hello user1, nice to hear from you.', 3, 1, CURRENT_TIMESTAMP),

-- Conversations entre user2 et user4
('Hi user4, user2 speaking.', 2, 4, CURRENT_TIMESTAMP),
('Hello user2, how can I help you?', 4, 2, CURRENT_TIMESTAMP),

-- Conversations entre user2 et user5
('Good morning user5, this is user2.', 2, 5, CURRENT_TIMESTAMP),
('Good morning user2, how are you?', 5, 2, CURRENT_TIMESTAMP),

-- Conversations entre user3 et user6
('Hi user6, user3 here.', 3, 6, CURRENT_TIMESTAMP),
('Hello user3, nice to meet you.', 6, 3, CURRENT_TIMESTAMP),
('Nice to meet you too!', 3, 6, CURRENT_TIMESTAMP),

-- Conversations entre user3 et user7
('Hey user7, user3 here.', 3, 7, CURRENT_TIMESTAMP),
('Hello user3, nice to hear from you.', 7, 3, CURRENT_TIMESTAMP),

-- Conversations entre user4 et user8
('Hi user8, user4 speaking.', 4, 8, CURRENT_TIMESTAMP),
('Hello user4, how can I help you?', 8, 4, CURRENT_TIMESTAMP),

-- Conversations entre user4 et user9
('Good morning user9, this is user4.', 4, 9, CURRENT_TIMESTAMP),
('Good morning user4, how are you?', 9, 4, CURRENT_TIMESTAMP),

-- Conversations entre user5 et user10
('Hi user10, user5 here.', 5, 10, CURRENT_TIMESTAMP),
('Hello user5, nice to meet you.', 10, 5, CURRENT_TIMESTAMP),
('Nice to meet you too!', 5, 10, CURRENT_TIMESTAMP),

-- Conversations entre user5 et user1
('Hey user1, user5 here.', 5, 1, CURRENT_TIMESTAMP),
('Hello user5, nice to hear from you.', 1, 5, CURRENT_TIMESTAMP),

-- Conversations entre user6 et user2
('Hi user2, user6 speaking.', 6, 2, CURRENT_TIMESTAMP),
('Hello user6, how can I help you?', 2, 6, CURRENT_TIMESTAMP),

-- Conversations entre user6 et user3
('Good morning user3, this is user6.', 6, 3, CURRENT_TIMESTAMP),
('Good morning user6, how are you?', 3, 6, CURRENT_TIMESTAMP),

-- Conversations entre user7 et user4
('Hi user4, user7 here.', 7, 4, CURRENT_TIMESTAMP),
('Hello user7, nice to meet you.', 4, 7, CURRENT_TIMESTAMP),
('Nice to meet you too!', 7, 4, CURRENT_TIMESTAMP),

-- Conversations entre user7 et user5
('Hey user5, user7 here.', 7, 5, CURRENT_TIMESTAMP),
('Hello user7, nice to hear from you.', 5, 7, CURRENT_TIMESTAMP),

-- Conversations entre user8 et user6
('Hi user6, user8 speaking.', 8, 6, CURRENT_TIMESTAMP),
('Hello user8, how can I help you?', 6, 8, CURRENT_TIMESTAMP),

-- Conversations entre user8 et user7
('Good morning user7, this is user8.', 8, 7, CURRENT_TIMESTAMP),
('Good morning user8, how are you?', 7, 8, CURRENT_TIMESTAMP),

-- Conversations entre user9 et user8
('Hi user8, user9 here.', 9, 8, CURRENT_TIMESTAMP),
('Hello user9, nice to meet you.', 8, 9, CURRENT_TIMESTAMP),
('Nice to meet you too!', 9, 8, CURRENT_TIMESTAMP),

-- Conversations entre user9 et user10
('Hey user10, user9 here.', 9, 10, CURRENT_TIMESTAMP),
('Hello user9, nice to hear from you.', 10, 9, CURRENT_TIMESTAMP),

-- Conversations entre user10 et user1
('Hi user1, user10 speaking.', 10, 1, CURRENT_TIMESTAMP),
('Hello user10, how can I help you?', 1, 10, CURRENT_TIMESTAMP),

-- Conversations entre user10 et user2
('Good morning user2, this is user10.', 10, 2, CURRENT_TIMESTAMP),
('Good morning user10, how are you?', 2, 10, CURRENT_TIMESTAMP);