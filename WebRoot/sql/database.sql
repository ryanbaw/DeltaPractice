
CREATE DATABASE IF NOT EXISTS `BRAVO`;
USE `BRAVO`;

CREATE TABLE IF NOT EXISTS `usershort` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `money` double(15,3) DEFAULT NULL,
  `regtime` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `login_create_user` AFTER INSERT ON `user` FOR EACH ROW BEGIN
	INSERT INTO usershort(username, password) values(new.username, new.password);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

INSERT INTO `user` (`username`, `password`, `phone`, `email`, `address`, `sex`, `age`, `money`, `regtime`) VALUES
  ('ryan', 'justdoit', '13530411702', '120360112@qq.com', '广东深圳', '男', 28, 8734, '2016-09-20 15:52:15'),
  ('starlord', '1234567', '15869544782', 'youme@qq.com', '四川成都', '男', 54, 847562, '2016-09-20 15:52:15');

CREATE TABLE dinnerTable(
   id INT PRIMARY KEY AUTO_INCREMENT,
   tableName VARCHAR(20),
   tableStatus INT DEFAULT 0,
   orderDate DATETIME
);

CREATE TABLE foodType(
    id INT PRIMARY KEY AUTO_INCREMENT,
    typeName VARCHAR(20)
);

CREATE TABLE food(
  id INT PRIMARY KEY AUTO_INCREMENT,
  foodName VARCHAR(20),
  foodType_id INT,
  price DOUBLE,
  mprice DOUBLE,
  remark VARCHAR(200),
  img VARCHAR(100)
);

CREATE TABLE orders(
   id INT PRIMARY KEY AUTO_INCREMENT,
   table_id INT,
   orderDate DATETIME,
   totalPrice DOUBLE,
   orderStatus INT DEFAULT 0
);

CREATE TABLE orderDetail(
   id INT PRIMARY KEY AUTO_INCREMENT,
   orderId INT,
   food_id INT,
   foodCount INT
);


ALTER TABLE food ADD CONSTRAINT fk_food_foodType_id FOREIGN KEY(foodType_id) REFERENCES foodType(id);
ALTER TABLE orders ADD CONSTRAINT order_table_id FOREIGN KEY(table_id) REFERENCES dinnerTable(id);
ALTER TABLE orderDetail ADD CONSTRAINT orderDetail_order_id FOREIGN KEY(orderId) REFERENCES orders(id);
ALTER TABLE orderDetail ADD CONSTRAINT orderDetail_food_id FOREIGN KEY(food_id) REFERENCES food(id);



INSERT INTO `dinnerTable` (`id`, `tableName`, `tableStatus`, `orderDate`) VALUES
  (1, '芳菲苑', 1, '2016-09-20 15:52:15'),
  (2, '听涛阁', 1, '2016-09-20 17:00:50'),
  (3, '岳阳楼', 0, NULL),
  (4, '阿房宫', 0, NULL),
  (5, '醉翁亭', 0, NULL),
  (6, '慧语轩', 0, NULL),
  (7, '藏心阁', 0, NULL),
  (8, '摘星楼', 0, NULL),
  (9, '拢烟亭', 0, NULL),
  (10, '梅香阁', 0, NULL),
  (11, '智慈轩', 0, NULL);

INSERT INTO `foodType` (`id`, `typeName`) VALUES
  (1, '江浙菜'),
  (2, '川菜'),
  (3, '粤菜'),
  (4, '东北菜'),
  (5, '湘菜');

INSERT INTO `orders` (`id`, `table_id`, `orderDate`, `totalPrice`, `orderStatus`) VALUES
  (1, 1, '2016-09-20 15:53:08', 65, 0),
  (2, 1, '2016-09-20 16:13:50', 325, 0),
  (3, 2, '2016-09-20 17:20:50', 32, 0);


INSERT INTO `food` (`id`, `foodName`, `foodType_id`, `price`, `mprice`, `remark`, `img`) VALUES
  (1, '蟹黄豆腐', 1, 65, 52, '蟹黄豆腐是一道汉族特色名菜，属于京菜。咸中带鲜，另具风味。虽说是叫蟹黄豆腐，', 'upload/xiehuangdoufu.jpg'),
  (2, '麻婆豆腐', 2, 32, 28, '麻婆豆腐（英文名：Mapo Tofu）也称为陈麻婆豆腐，是四川省地方传统名菜之一。', 'upload/'),
  (3, '瓜丝儿', 2, 42, 36, '好吃，非常好吃','upload/'),
  (4, '山鸡丁儿', 2, 42, 36, '好吃，非常好吃','upload/'),
  (5, '拌海蜇', 2, 42, 36, '好吃，非常好吃','upload/'),
  (6, '龙须菜', 2, 42, 36, '好吃，非常好吃','upload/'),
  (7, '炝冬笋', 2, 42, 36, '好吃，非常好吃','upload/'),
  (8, '玉兰片', 2, 42, 36, '好吃，非常好吃','upload/'),
  (9, '浇鸳鸯', 3, 42, 36, '好吃，非常好吃','upload/'),
  (10, '烧鱼头', 3, 42, 36, '好吃，非常好吃','upload/'),
  (11, '烧槟子', 3, 42, 36, '好吃，非常好吃','upload/'),
  (12, '烧百合', 3, 42, 36, '好吃，非常好吃','upload/'),
  (13, '炸豆腐', 3, 42, 36, '好吃，非常好吃','upload/'),
  (14, '炸面筋', 3, 42, 36, '好吃，非常好吃','upload/'),
  (15, '糖熘儿', 3, 42, 36, '好吃，非常好吃','upload/'),
  (16, '拔丝山药', 3, 42, 36, '好吃，非常好吃','upload/'),
  (17, '糖焖莲子', 3, 42, 36, '好吃，非常好吃','upload/'),
  (18, '酿山药', 3, 42, 36, '好吃，非常好吃','upload/'),
  (19, '杏仁酪', 3, 42, 36, '好吃，非常好吃','upload/'),
  (20, '小炒螃蟹', 3, 42, 36, '好吃，非常好吃','upload/'),
  (21, '氽大甲', 3, 42, 36, '好吃，非常好吃','upload/'),
  (22, '什锦葛仙米', 3, 42, 36, '好吃，非常好吃','upload/'),
  (23, '蛤蟆鱼', 3, 42, 36, '好吃，非常好吃','upload/'),
  (24, '扒带鱼', 3, 42, 36, '好吃，非常好吃','upload/'),
  (25, '海鲫鱼', 3, 42, 36, '好吃，非常好吃','upload/'),
  (26, '黄花鱼', 3, 42, 36, '好吃，非常好吃','upload/'),
  (27, '扒海参', 3, 42, 36, '好吃，非常好吃','upload/'),
  (28, '扒燕窝', 3, 42, 36, '好吃，非常好吃','upload/'),
  (29, '扒鸡腿儿', 3, 42, 36, '好吃，非常好吃','upload/'),
  (30, '扒鸡块儿', 3, 42, 36, '好吃，非常好吃','upload/'),
  (31, '扒肉', 3, 42, 36, '好吃，非常好吃','upload/'),
  (32, '扒面筋', 3, 42, 36, '好吃，非常好吃','upload/'),
  (33, '扒三样儿', 2, 42, 36, '好吃，非常好吃','upload/'),
  (34, '油泼肉', 2, 42, 36, '好吃，非常好吃','upload/'),
  (35, '酱泼肉', 2, 42, 36, '好吃，非常好吃','upload/'),
  (36, '炒虾黄儿', 2, 42, 36, '好吃，非常好吃','upload/'),
  (37, '熘蟹黄儿', 2, 42, 36, '好吃，非常好吃','upload/'),
  (38, '炒子蟹', 2, 42, 36, '好吃，非常好吃','upload/'),
  (39, '佛手海参', 2, 42, 36, '好吃，非常好吃','upload/'),
  (40, '炒芡子米', 2, 42, 36, '好吃，非常好吃','upload/'),
  (41, '奶汤', 2, 42, 36, '好吃，非常好吃','upload/'),
  (42, '翅子汤', 2, 42, 36, '好吃，非常好吃','upload/'),
  (43, '三丝汤', 2, 42, 36, '好吃，非常好吃','upload/'),
  (44, '熏斑鸠', 2, 42, 36, '好吃，非常好吃','upload/'),
  (45, '卤斑鸠', 2, 42, 36, '好吃，非常好吃','upload/'),
  (46, '海白米', 2, 42, 36, '好吃，非常好吃','upload/'),
  (47, '烩腰丁儿', 4, 42, 36, '好吃，非常好吃','upload/'),
  (48, '火烧茨菰', 4, 42, 36, '好吃，非常好吃','upload/'),
  (49, '炸鹿尾儿', 4, 42, 36, '好吃，非常好吃','upload/'),
  (50, '焖鱼头', 4, 42, 36, '好吃，非常好吃','upload/'),
  (51, '拌皮渣儿', 4, 42, 36, '好吃，非常好吃','upload/'),
  (52, '氽肥肠儿', 4, 42, 36, '好吃，非常好吃','upload/'),
  (53, '清拌粉皮儿', 4, 42, 36, '好吃，非常好吃','upload/'),
  (54, '木须菜', 4, 42, 36, '好吃，非常好吃','upload/'),
  (55, '烹丁香', 4, 42, 36, '好吃，非常好吃','upload/'),
  (56, '烹大肉', 4, 42, 36, '好吃，非常好吃','upload/'),
  (57, '烹白肉', 4, 42, 36, '好吃，非常好吃','upload/'),
  (58, '麻辣野鸡', 4, 42, 36, '好吃，非常好吃','upload/'),
  (59, '咸肉丝儿', 4, 42, 36, '好吃，非常好吃','upload/'),
  (60, '白肉丝儿', 4, 42, 36, '好吃，非常好吃','upload/'),
  (61, '荸荠', 4, 42, 36, '好吃，非常好吃','upload/'),
  (62, '一品锅', 4, 42, 36, '好吃，非常好吃','upload/'),
  (63, '素炝春不老', 4, 42, 36, '好吃，非常好吃','upload/'),
  (64, '清焖莲子', 4, 42, 36, '好吃，非常好吃','upload/'),
  (65, '酸黄菜', 4, 42, 36, '好吃，非常好吃','upload/'),
  (66, '烧萝卜', 4, 42, 36, '好吃，非常好吃','upload/'),
  (67, '烩银耳', 4, 42, 36, '好吃，非常好吃','upload/'),
  (68, '炒银枝儿', 4, 42, 36, '好吃，非常好吃','upload/'),
  (69, '八宝榛子酱', 4, 42, 36, '好吃，非常好吃','upload/'),
  (70, '黄鱼锅子', 4, 42, 36, '好吃，非常好吃','upload/'),
  (71, '白菜锅子', 2, 42, 36, '好吃，非常好吃','upload/'),
  (72, '什锦锅子', 5, 42, 36, '好吃，非常好吃','upload/'),
  (73, '汤圆子锅', 5, 42, 36, '好吃，非常好吃','upload/'),
  (74, '菊花锅子', 5, 42, 36, '好吃，非常好吃','upload/'),
  (75, '煮饽饽锅子', 5, 42, 36, '好吃，非常好吃','upload/'),
  (76, '肉丁辣酱', 5, 42, 36, '好吃，非常好吃','upload/'),
  (77, '炒肉丝儿', 5, 42, 36, '好吃，非常好吃','upload/'),
  (78, '炒肉片', 5, 42, 36, '好吃，非常好吃','upload/'),
  (79, '烩酸菜', 5, 42, 36, '好吃，非常好吃','upload/'),
  (80, '烩白菜', 5, 42, 36, '好吃，非常好吃','upload/'),
  (81, '烩豌豆', 5, 42, 36, '好吃，非常好吃','upload/'),
  (82, '焖扁豆', 5, 42, 36, '好吃，非常好吃','upload/'),
  (83, '氽毛豆', 5, 42, 36, '好吃，非常好吃','upload/'),
  (84, '腌苤蓝丝儿', 5, 42, 36, '好吃，非常好吃','upload/');

INSERT INTO `orderDetail` (`id`, `orderId`, `food_id`, `foodCount`) VALUES
  (1, 1, 1, 1),
  (2, 2, 1, 5),
  (3, 3, 2, 1);
