use mydb;
SELECT 
    Клиенты.ФИО AS Клиент,
    COALESCE(Контакты.`E-mail`, 'Нет данных') AS `E-mail`,
    COALESCE(SUM(Услуги.Себестоимость), 0) AS Сумма_всех_пройденных_услуг,
    COALESCE((SELECT COUNT(*) FROM Услуги WHERE Услуги.id IN (SELECT Посещения.Клиенты_id FROM Посещения WHERE Посещения.Клиенты_id = Клиенты.id)), 0) AS Общее_количество_пройденных_услуг
FROM
    Клиенты 
LEFT JOIN 
    Контакты ON Клиенты.id = Контакты.id
LEFT JOIN 
    Посещения ON Клиенты.id = Посещения.id AND Посещения.Статус = 'Пришел'
LEFT JOIN 
    Услуги ON Посещения.id = Услуги.id
GROUP BY 
    Клиенты.ФИО, Контакты.`E-mail`, Клиенты.id
ORDER BY 
    Сумма_всех_пройденных_услуг DESC;

SET @start_date = '2023-11-01';
SET @end_date = '2023-12-29';
SELECT GetTotalServicesByEmployee(1, @start_date, @end_date) AS Количество_оказанных_услуг;