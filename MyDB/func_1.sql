CREATE DEFINER=`root`@`localhost` FUNCTION `GetTotalServicesByEmployee`(employee_id INT, start_date DATE, end_date DATE) RETURNS int
    READS SQL DATA
BEGIN
DECLARE total_services INT;

    SELECT COUNT(*) INTO total_services
    FROM Посещения
    JOIN Сотрудники ON Посещения.Сотрудники_id = Сотрудники.id
    JOIN Услуги ON Посещения.Услуги_id = Услуги.id
    WHERE Сотрудники.id = employee_id
    AND Посещения.Дата BETWEEN start_date AND end_date;

    RETURN total_services;
END