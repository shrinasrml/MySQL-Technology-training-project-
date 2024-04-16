CREATE DEFINER=`root`@`localhost` TRIGGER `услуги_BEFORE_INSERT` BEFORE INSERT ON `услуги` FOR EACH ROW BEGIN
    DECLARE avg_cost INTEGER;
    SELECT AVG(Себестоимость) INTO avg_cost
    FROM Услуги
    WHERE Группы_услуг_id = NEW.Группы_услуг_id;

    IF NEW.Себестоимость < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Стоимость услуги не может быть отрицательной.';
	END IF;
    
    IF avg_cost IS NOT NULL THEN
        SET NEW.Себестоимость = NEW.Себестоимость + (avg_cost * 0.1);
    END IF;
END