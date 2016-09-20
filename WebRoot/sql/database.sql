
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
  `level` int(11) DEFAULT NULL,
  `empiricalvalue` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
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
