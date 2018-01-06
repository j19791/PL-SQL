--------------------------------------------------------
--  Arquivo criado - Sexta-feira-Janeiro-05-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure INCLUIR_CLIENTE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "CURSOPLSQL"."INCLUIR_CLIENTE" 
   (p_id in cliente.id%type,
    p_razao_social IN cliente.razao_social%type,
    p_CNPJ cliente.CNPJ%type , --padrão é IN
    p_segmercado_id IN cliente.segmercado_id%type,
    p_faturamento_previsto IN cliente.faturamento_previsto%type)
IS
    v_categoria cliente.categoria%type;
    v_CNPJ cliente.cnpj%type := p_CNPJ;
BEGIN

    /*IF p_faturamento_previsto < 10000 THEN
       v_categoria := 'PEQUENO';
    ELSIF p_faturamento_previsto < 50000 THEN
        v_categoria := 'MEDIO';
    ELSIF p_faturamento_previsto < 100000 THEN
        v_categoria := 'MEDIO GRANDE';
    ELSE
        v_categoria := 'GRANDE';
    END IF;     */
    --codigo extraido para função catergoria_cliente
    v_categoria := categoria_cliente(p_faturamento_previsto);
    
    FORMAT_CNPJ(v_CNPJ); --chamada da procedure FORMAT_CNPJ com paramentro IN OUT

    INSERT INTO cliente VALUES (p_id, UPPER(p_razao_social), v_CNPJ, p_segmercado_id, SYSDATE, p_faturamento_previsto, v_categoria);
    COMMIT;

END;

/
