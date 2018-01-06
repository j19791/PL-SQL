DECLARE
    v_segmercado_id cliente.segmercado_id%type := 2;
BEGIN
    FOR i in 1..3 LOOP
        ATUALIZAR_CLI_SEG_MERCADO(i, v_segmercado_id);
    END LOOP;
     COMMIT;
END;

select * from cliente