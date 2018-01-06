CREATE OR REPLACE FUNCTION categoria_cliente (p_faturamento_previsto IN cliente.faturamento_previsto%type) 
RETURN CLIENTE.CATEGORIA%type

IS
BEGIN

    IF p_faturamento_previsto < 10000 THEN
           RETURN 'PEQUENO'; --1o. retorno satisfeito, sai da execução
        ELSIF p_faturamento_previsto < 50000 THEN
            RETURN 'MEDIO';
        ELSIF p_faturamento_previsto < 100000 THEN
            RETURN 'MEDIO GRANDE';
        ELSE
            RETURN 'GRANDE';
        END IF;
END;