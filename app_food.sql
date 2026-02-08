DROP TABLE IF EXISTS `order`;
DROP TABLE IF EXISTS `sub_food`;
DROP TABLE IF EXISTS `like_res`;
DROP TABLE IF EXISTS `rate_res`;
DROP TABLE IF EXISTS `food`;
DROP TABLE IF EXISTS `food_type`;
DROP TABLE IF EXISTS `restaurant`;
DROP TABLE IF EXISTS `user`;

CREATE TABLE `user`(
`user_id` INT PRIMARY KEY AUTO_INCREMENT,
`full_name` VARCHAR(255),
`email` VARCHAR(255),
`password` VARCHAR(255)
);

CREATE TABLE `restaurant`(
`res_id` INT PRIMARY KEY AUTO_INCREMENT,
`res_name` VARCHAR(255),
`image` VARCHAR(255),
`desc` VARCHAR(255)
);

CREATE TABLE `rate_res`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`user_id` INT,
`res_id` INT,
`amount` INT,
`date_rate` DATETIME,
FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`),
FOREIGN KEY (`res_id`) REFERENCES `restaurant`(`res_id`)
);

CREATE TABLE `like_res`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`user_id` INT,
`res_id` INT,
`date_rate` DATETIME,
FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`),
FOREIGN KEY (`res_id`) REFERENCES `restaurant`(`res_id`)
);

CREATE TABLE `food_type`(
`type_id` INT PRIMARY KEY AUTO_INCREMENT,
`type_name` VARCHAR(255)
);

CREATE TABLE `food` (
`food_id` INT PRIMARY KEY AUTO_INCREMENT,
`food_name` VARCHAR(255),
`image` VARCHAR(255),
`price` FLOAT,
`desc` VARCHAR(255),
`type_id` INT,
FOREIGN KEY (`type_id`) REFERENCES `food_type`(`type_id`)
);

CREATE TABLE `sub_food`(
`sub_id` INT PRIMARY KEY AUTO_INCREMENT,
`sub_name` VARCHAR(255),
`sub_price` FLOAT,
`food_id` INT,
FOREIGN KEY (`food_id`) REFERENCES `food`(`food_id`)
);

CREATE TABLE `order`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`user_id` INT,
`food_id` INT,
`amount` INT,
`code` VARCHAR(255),
`arr_sub_id` VARCHAR(255),
FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`),
FOREIGN KEY (`food_id`) REFERENCES `food`(`food_id`)
);

INSERT INTO `user` (`full_name`,`email`,`password`) VALUES
('Nguyễn Văn A','nguyenvana@gmail.com','123456'),
('Trần Thị B','tranthib@gmail.com','abcdef'),
('Lê Văn C','levanc@gmail.com','password1'),
('Phạm Thị D','phamthid@gmail.com','pass123'),
('Hoàng Văn E','hoangvane@gmail.com','qwerty'),
('Võ Thị F','vothif@gmail.com','111111'),
('Đặng Văn G','dangvang@gmail.com','222222'),
('Bùi Thị H','buithih@gmail.com','333333'),
('Ngô Văn I','ngovani@gmail.com','444444'),
('Phan Thị K','phanthik@gmail.com','555555');

INSERT INTO `restaurant` (`res_name`,`image`,`desc`) VALUES
('Phở 24','pho24.jpg','Chuyên các món phở truyền thống Việt Nam'),
('KFC','kfc.jpg','Chuỗi thức ăn nhanh nổi tiếng với gà rán'),
('Pizza Hut','pizzahut.jpg','Nhà hàng pizza phong cách châu Âu'),
('Lotteria','lotteria.jpg','Thức ăn nhanh phù hợp giới trẻ'),
('Highlands Coffee','highlands.jpg','Quán cà phê và đồ uống phổ biến');

INSERT INTO `food_type` (`type_name`) VALUES
('Món nước'),
('Đồ chiên'),
('Pizza'),
('Đồ uống'),
('Món khác');

INSERT INTO `food` (`food_name`,`image`,`price`,`desc`,`type_id`) VALUES
('Phở bò','phobo.jpg',45000,'Phở bò truyền thống với nước dùng đậm đà',1),
('Gà rán','garan.jpg',55000,'Gà rán giòn cay hấp dẫn',2),
('Pizza hải sản','pizza.jpg',120000,'Pizza hải sản phủ phô mai béo ngậy',3),
('Burger bò','burger.jpg',40000,'Burger bò kèm rau và sốt đặc biệt',2),
('Cà phê sữa','caphe.jpg',30000,'Cà phê sữa đá đậm vị Việt Nam',4);

INSERT INTO `sub_food` (`sub_name`,`sub_price`,`food_id`) VALUES
('Trứng gà',10000,1),
('Thêm gà',20000,2),
('Phô mai',15000,3),
('Khoai tây chiên',12000,4),
('Sữa đặc',8000,5);

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(3, 1, 5, '2025-01-01 08:00:00'),
(8, 2, 4, '2025-01-02 09:00:00'),
(10, 5, 3, '2025-01-03 10:00:00'),
(1, 1, 5, '2025-01-04 11:00:00'),
(7, 3, 4, '2025-01-05 12:00:00'),
(6, 4, 3, '2025-01-06 13:00:00'),
(5, 1, 2, '2025-01-07 14:00:00'),
(3, 5, 5, '2025-01-08 15:00:00'),
(8, 3, 4, '2025-01-09 16:00:00'),
(10, 2, 3, '2025-01-10 17:00:00'),
(7, 4, 5, '2025-01-11 18:00:00'),
(6, 5, 4, '2025-01-12 19:00:00'),
(5, 3, 3, '2025-01-13 20:00:00'),
(3, 2, 5, '2025-01-14 21:00:00'),
(8, 4, 4, '2025-01-15 22:00:00'),
(10, 1, 3, '2025-01-16 23:00:00'),
(7, 2, 2, '2025-01-17 08:30:00'),
(6, 1, 5, '2025-01-18 09:30:00'),
(5, 5, 4, '2025-01-19 10:30:00'),
(3, 4, 3, '2025-01-20 11:30:00'),
(8, 1, 5, '2025-01-21 12:30:00'),
(10, 3, 4, '2025-01-22 13:30:00'),
(7, 5, 3, '2025-01-23 14:30:00'),
(6, 2, 5, '2025-01-24 15:30:00'),
(3, 3, 4, '2025-01-25 16:30:00'),
(8, 5, 3, '2025-01-26 17:30:00'),
(10, 4, 5, '2025-01-27 18:30:00'),
(7, 1, 4, '2025-01-28 19:30:00'),
(3, 1, 5, '2025-01-29 20:30:00'),
(8, 2, 4, '2025-01-30 21:30:00'),
(10, 5, 3, '2025-01-31 22:30:00'),
(3, 2, 5, '2025-02-01 08:15:00'),
(8, 4, 4, '2025-02-02 09:15:00'),
(10, 1, 3, '2025-02-03 10:15:00'),
(3, 3, 5, '2025-02-04 11:15:00'),
(3, 4, 4, '2025-02-05 12:15:00'),
(8, 1, 3, '2025-02-06 13:15:00'),
(3, 5, 5, '2025-02-07 14:15:00'),
(3, 2, 4, '2025-02-08 15:15:00'),
(8, 3, 3, '2025-02-09 16:15:00'),
(3, 1, 5, '2025-02-10 17:15:00'),
(3, 4, 4, '2025-02-11 18:15:00'),
(6, 3, 5, '2025-02-12 19:15:00'),
(7, 4, 4, '2025-02-13 20:15:00'),
(10, 2, 3, '2025-02-14 21:15:00');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_rate`) VALUES
(3, 1, '2025-01-01'),
(8, 2, '2025-01-02'),
(10, 5, '2025-01-03'),
(1, 1, '2025-01-04'),
(7, 3, '2025-01-05'),
(6, 4, '2025-01-06'),
(5, 1, '2025-01-07'),
(2, 2, '2025-01-08'),
(3, 5, '2025-01-09'),
(8, 3, '2025-01-10'),
(10, 2, '2025-01-11'),
(7, 4, '2025-01-12'),
(6, 5, '2025-01-13'),
(5, 3, '2025-01-14'),
(2, 4, '2025-01-15'),
(3, 2, '2025-01-16'),
(8, 4, '2025-01-17'),
(10, 1, '2025-01-18'),
(7, 2, '2025-01-19'),
(6, 1, '2025-01-20'),
(5, 5, '2025-01-21'),
(3, 4, '2025-01-22'),
(8, 1, '2025-01-23'),
(10, 3, '2025-01-24'),
(7, 5, '2025-01-25'),
(6, 2, '2025-01-26'),
(3, 3, '2025-01-27'),
(8, 5, '2025-01-28'),
(10, 4, '2025-01-29'),
(7, 1, '2025-01-30'),
(3, 1, '2025-01-31'),
(8, 2, '2025-02-01'),
(10, 5, '2025-02-02'),
(3, 2, '2025-02-03'),
(8, 4, '2025-02-04'),
(3, 3, '2025-02-05'),
(3, 4, '2025-02-06'),
(8, 1, '2025-02-07'),
(3, 5, '2025-02-08'),
(3, 2, '2025-02-09'),
(3, 1, '2025-02-10');

INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(3, 1, 1, 'ORD001', '1'),
(8, 2, 2, 'ORD002', '2'),
(10, 3, 1, 'ORD003', '3'),
(1, 4, 1, 'ORD004', '4'),
(7, 5, 2, 'ORD005', '5'),
(6, 1, 1, 'ORD006', '1'),
(5, 2, 3, 'ORD007', '2'),
(2, 3, 1, 'ORD008', '3'),
(3, 2, 1, 'ORD009', '2'),
(8, 1, 2, 'ORD010', '1'),
(10, 4, 1, 'ORD011', '4'),
(5, 5, 1, 'ORD012', '5'),
(7, 2, 2, 'ORD013', '2'),
(6, 3, 1, 'ORD014', '3'),
(1, 1, 2, 'ORD015', '1'),
(2, 5, 1, 'ORD016', '5'),
(3, 3, 1, 'ORD017', '3'),
(8, 4, 1, 'ORD018', '4'),
(10, 2, 2, 'ORD019', '2'),
(5, 1, 1, 'ORD020', '1'),
(7, 3, 1, 'ORD021', '3'),
(6, 4, 2, 'ORD022', '4'),
(3, 4, 1, 'ORD023', '4'),
(8, 5, 1, 'ORD024', '5'),
(10, 1, 2, 'ORD025', '1'),
(5, 2, 1, 'ORD026', '2'),
(7, 5, 1, 'ORD027', '5'),
(3, 5, 2, 'ORD028', '5'),
(8, 3, 1, 'ORD029', '3'),
(10, 2, 1, 'ORD030', '2'),
(1, 2, 2, 'ORD031', '2'),
(3, 1, 1, 'ORD032', '1'),
(8, 2, 1, 'ORD033', '2'),
(5, 3, 2, 'ORD034', '3'),
(6, 5, 1, 'ORD035', '5'),
(7, 1, 1, 'ORD036', '1'),
(3, 2, 1, 'ORD037', '2'),
(8, 4, 2, 'ORD038', '4'),
(10, 3, 1, 'ORD039', '3'),
(5, 4, 1, 'ORD040', '4'),
(1, 3, 1, 'ORD041', '3'),
(3, 3, 2, 'ORD042', '3'),
(8, 1, 1, 'ORD043', '1'),
(7, 4, 1, 'ORD044', '4'),
(6, 2, 1, 'ORD045', '2'),
(5, 5, 2, 'ORD046', '5'),
(3, 4, 1, 'ORD047', '4'),
(10, 4, 1, 'ORD048', '4'),
(3, 5, 1, 'ORD049', '5'),
(2, 1, 1, 'ORD050', '1'),
(3, 1, 1, 'ORD051', '1'),
(8, 2, 1, 'ORD052', '2'),
(10, 5, 2, 'ORD053', '5'),
(3, 2, 1, 'ORD054', '2');

-- Tìm 5 người đã like nhà hàng nhiều nhất
SELECT
    COUNT(`like_res`.`user_id`) AS "Số lượt like nhà hàng",
    `user`.`user_id`           AS "Mã người dùng",
    `user`.`full_name`         AS "Họ tên",
    `user`.`email`             AS "Email",
    `user`.`password`          AS "Mật khẩu"
FROM `like_res`
INNER JOIN `user` ON `like_res`.`user_id` = `user`.`user_id`
GROUP BY `like_res`.`user_id`
ORDER BY `Số lượt like nhà hàng` DESC
LIMIT 5;

-- Tìm 2 nhà hàng có lượt like nhiều nhất
SELECT
    COUNT(`like_res`.`res_id`) AS "Số lượt like nhà hàng",
    `restaurant`.`res_id`           AS "Mã nhà hàng",
    `restaurant`.`res_name`         AS "Tên nhà hàng",
    `restaurant`.`desc`             AS "Mô tả"
FROM `like_res`
INNER JOIN `restaurant` ON `like_res`.`res_id` = `restaurant`.`res_id`
GROUP BY `like_res`.`res_id`
ORDER BY `Số lượt like nhà hàng` DESC
LIMIT 2;

-- Tìm người đã đặt hàng nhiều nhất
SELECT 
 COUNT(`order`.`user_id`) AS "Số lần đặt",
    `user`.`user_id`           AS "Mã người dùng",
    `user`.`full_name`         AS "Họ tên",
    `user`.`email`             AS "Email",
    `user`.`password`          AS "Mật khẩu"
FROM `order`
INNER JOIN `user` ON `order`.`user_id` = `user`.`user_id`
GROUP BY `order`.`user_id`
ORDER BY `Số lần đặt` DESC
LIMIT 1;

-- Tìm người dùng không hoạt động trong hệ thống (không đặt hàng, không like, không đánh giá nhà hàng)
SELECT 
    `user`.`user_id`   AS "Mã người dùng",
    `user`.`full_name` AS "Họ tên",
    `user`.`email`     AS "Email"
FROM `user`
LEFT JOIN `order`
    ON `user`.`user_id` = `order`.`user_id`
LEFT JOIN `like_res`
    ON `user`.`user_id` = `like_res`.`user_id`
LEFT JOIN `rate_res`
    ON `user`.`user_id` = `rate_res`.`user_id`
WHERE 
    `order`.`user_id` IS NULL
    AND `like_res`.`user_id` IS NULL
    AND `rate_res`.`user_id` IS NULL;
