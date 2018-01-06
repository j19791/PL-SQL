DECLARE
    v_segmercado_id cliente.segmercado_id%type := 2;
    CURSOR cur_cliente is SELECT id FROM cliente;

BEGIN

    --nao precisa OPEN

    FOR cli_rec IN cur_cliente LOOP --cli_rec é um registro exatamente ugual ao resultset
        --nao precisa do fetch
        --nao precisa de teste p/ saida
        ATUALIZAR_CLI_SEG_MERCADO(cli_rec.id, v_segmercado_id);
    END LOOP;
    
    --nao precisa de close

    COMMIT;

END;

select *from CLIENTE