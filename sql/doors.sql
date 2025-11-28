CREATE TABLE IF NOT EXISTS `node_doors` (
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL,
    `data` longtext NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `node_doors_logs` (
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `action` varchar(50) NOT NULL,
    `staff_passport` int(11) NOT NULL,
    `staff_name` varchar(100) NOT NULL,
    `door_name` varchar(50) DEFAULT NULL,
    `door_coords` varchar(100) DEFAULT NULL,
    `staff_coords` varchar(100) DEFAULT NULL,
    `additional_info` text DEFAULT NULL,
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `idx_staff_passport` (`staff_passport`),
    KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

