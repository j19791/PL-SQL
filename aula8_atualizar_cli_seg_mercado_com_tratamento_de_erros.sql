--------------------------------------------------------
--  Arquivo criado - Sábado-Janeiro-06-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure ATUALIZAR_CLI_SEG_MERCADO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "CURSOPLSQL"."ATUALIZAR_CLI_SEG_MERCADO" 
    (p_id cliente.id%type,
    p_segmercado_id IN cliente.segmercado_id%type)
    IS
    
    e_cliente_id_inexistente exception; --criando excecao p/ erro do usuário: cliente inexistente
    
    
BEGIN
    UPDATE cliente
        SET segmercado_id = p_segmercado_id
        WHERE id = p_id;
        
    IF SQL%NOTFOUND then --update nao afetou nenhuma linha
        RAISE e_cliente_id_inexistente; --lança exceção definida 
    END IF;
    
    COMMIT;
    
    EXCEPTION --tratamento da excecao definida, lançada
    WHEN e_cliente_id_inexistente then 
        raise_application_error(-20100,'Cliente inexistente');
END;

/
