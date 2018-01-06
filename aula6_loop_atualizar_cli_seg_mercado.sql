select * from cliente;

DECLARE
    v_segmercado_id cliente.segmercado_id%type := 1;
    v_i number(3);
BEGIN
    v_i := 1;
LOOP
    ATUALIZAR_CLI_SEG_MERCADO(v_i, v_segmercado_id);
    v_i := v_i + 1;
    EXIT WHEN v_i > 3;
 END LOOP;
END;

select * from cliente;