drop table if exists ec3_checking;
drop table if exists ec3_savings;

CREATE TABLE `ec3_checking` (
`id_count` int(11) not null ,
`account_id` varchar(12) DEFAULT NULL,
`balance` float NOT NULL,
`overdraft_limit` float NOT NULL,
PRIMARY KEY (`id_count`),
UNIQUE KEY `id_count_UNIQUE` (`id_count`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

CREATE TABLE `ec3_savings` (
`id_count` int(11) not null,
`account_id` varchar(12) DEFAULT NULL,
`balance` float NOT NULL,
`minimum_balance` float NOT NULL,
PRIMARY KEY (`id_count`),
UNIQUE KEY `id_count_UNIQUE` (`id_count`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

