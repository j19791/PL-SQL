DECLARE
    v_id segmercado.id%type := 3;
    v_descricao segmercado.descricao%type := 'esportivo';

BEGIN

    INSERT INTO segmercado VALUES (v_id, upper(v_descricao));
    COMMIT;

END;