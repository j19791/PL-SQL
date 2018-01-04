DECLARE
    v_id segmercado.id%type := 1;
    v_descricao segmercado.descricao%type := 'varejista';

BEGIN

    UPDATE segmercado SET descricao = UPPER(v_descricao) WHERE id = v_id;

    v_id := 2;
    v_descricao := 'atacadista';

    UPDATE segmercado SET descricao = UPPER(v_descricao) WHERE id = v_id;

END;


select * from SEGMERCADO;