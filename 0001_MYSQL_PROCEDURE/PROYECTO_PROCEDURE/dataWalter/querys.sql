CREATE TRIGGER before_insert_empleado
BEFORE INSERT ON Empleado
FOR EACH ROW
BEGIN
    IF NEW.salario < 0 THEN
        SET NEW.salario = 0;
    END IF;
END;