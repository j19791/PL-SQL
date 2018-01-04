DECLARE
    v_id segmercado.id%type := 3;
BEGIN
    DELETE FROM segmercado 
         WHERE id = v_id;
    COMMIT;
END;

select *from segmercado;