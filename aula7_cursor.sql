DECLARE
    v_id cliente.id%type;
    v_segmercado_id cliente.segmercado_id%type := 1;
    CURSOR cur_cliente is SELECT id FROM cliente; --defini��o do cursor
BEGIN
     OPEN cur_cliente; --executa a query do cursor e guarda as linhas em mem�ria - RESULTSET

    LOOP
        FETCH cur_cliente into v_id; --CADA VEZ Q FAZ O FETCH, le uma linha do resultset
        EXIT WHEN cur_cliente%NOTFOUND; --teste p/ sair do loop - n�o achou mais nenhum registro p/ iterar
        ATUALIZAR_CLI_SEG_MERCADO(v_id, v_segmercado_id);
    END LOOP;
    
    CLOSE cur_cliente; --libera o resultset da mem�ria

    COMMIT;
END;

select *from CLIENTE