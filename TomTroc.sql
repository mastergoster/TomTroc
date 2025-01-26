CREATE TABLE `users` (
  `id` integer PRIMARY KEY,
  `username` varchar(255) UNIQUE NOT NULL,
  `role` ENUM ('user', 'admin') DEFAULT 'user',
  `mail` varchar(255) UNIQUE NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp DEFAULT (now())
);

CREATE TABLE `books` (
  `id` integer PRIMARY KEY,
  `title` varchar(255) NOT NULL,
  `auteur` varchar(255) NOT NULL,
  `picture` varchar(255),
  `description` text NOT NULL,
  `user_id` integer NOT NULL,
  `status` ENUM ('available', 'not_available') DEFAULT 'not_avaible',
  `created_at` timestamp DEFAULT (now())
);

CREATE TABLE `messages` (
  `id` integer PRIMARY KEY,
  `body` text NOT NULL,
  `sender_user_id` int NOT NULL,
  `recipient_user_id` int NOT NULL,
  `created_at` timestamp DEFAULT (now())
);

ALTER TABLE `messages` ADD FOREIGN KEY (`sender_user_id`) REFERENCES `users` (`id`);
ALTER TABLE `messages` ADD FOREIGN KEY (`recipient_user_id`) REFERENCES `users` (`id`);
ALTER TABLE `books` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
