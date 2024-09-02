CREATE TRIGGER trigger_auditoria_usuario
AFTER UPDATE ON usuario 
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_usuario(
        DNI,
        accion,
        nombre_anterior,
        nombre_nuevo,
        n_de_expediente_anterior,
        n_de_expediente_nuevo,
        usuariosistema
    ) VALUES (
        OLD.DNI,
        'UPDATE',
        OLD.nombre,
        NEW.nombre,
        OLD.n_de_expediente,
        NEW.n_de_expediente,
        USER()
    );
END;
