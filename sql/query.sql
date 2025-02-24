CREATE TABLE `users` (
  `user_no` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `user_age` TINYINT DEFAULT NULL,
  `user_gender` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `users` (user_name, user_age, user_gender, user_email) VALUES
('김민수', 25, '남', 'minsukim@example.com'),
('이지은', 30, '여', 'jieunlee@example.com'),
('박지훈', 27, '남', 'jihun.park@example.com'),
('최수빈', 22, '여', 'subin.choi@example.com'),
('정우진', 35, '남', 'woojin.jung@example.com'),
('한예슬', 28, '여', 'yesle.han@example.com'),
('오세훈', 31, '남', 'sehun.oh@example.com'),
('신민아', 26, '여', 'mina.shin@example.com'),
('유재석', 40, '남', 'jaeseok.yu@example.com'),
('송혜교', 33, '여', 'hyegyo.song@example.com');
