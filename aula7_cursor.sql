DECLARE
    v_id cliente.id%type;
    v_segmercado_id cliente.segmercado_id%type := 1;
    CURSOR cur_cliente is SELECT id FROM cliente; --definição do cursor
BEGIN
     OPEN cur_cliente; --executa a query do cursor e guarda as linhas em memória - RESULTSET

    LOOP
        FETCH cur_cliente into v_id; --CADA VEZ Q FAZ O FETCH, le uma linha do resultset
        EXIT WHEN cur_cliente%NOTFOUND; --teste p/ sair do loop - não achou mais nenhum registro p/ iterar
        ATUALIZAR_CLI_SEG_MERCADO(v_id, v_segmercado_id);
    END LOOP;
    
    CLOSE cur_cliente; --libera o resultset da memória

    COMMIT;
END;

select *from CLIENTE