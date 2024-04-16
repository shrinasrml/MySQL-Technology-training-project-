CREATE DEFINER=`root`@`localhost` TRIGGER `посещения_BEFORE_INSERT` BEFORE INSERT ON `посещения` FOR EACH ROW BEGIN
    SET NEW.Дата = NOW();
    
    IF NEW.Клиенты_id IS NULL OR NEW.Услуги_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Необходимо указать клиента и услугу для посещения.';
    END IF;
END