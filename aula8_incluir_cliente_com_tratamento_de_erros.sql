--------------------------------------------------------
--  Arquivo criado - S�bado-Janeiro-06-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure INCLUIR_CLIENTE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "CURSOPLSQL"."INCLUIR_CLIENTE" 
   (p_id in cliente.id%type,
    p_razao_social IN cliente.razao_social%type,
    p_CNPJ cliente.CNPJ%type , --padr�o � IN
    p_segmercado_id IN cliente.segmercado_id%type,
    p_faturamento_previsto IN cliente.faturamento_previsto%type)
IS
    v_categoria cliente.categoria%type;
    v_CNPJ cliente.cnpj%type := p_CNPJ;
    
    e_null exception; --explicitando um erro do oracle - inclus�o de valor nulo na pk
    pragma exception_init (e_null, -1400); --relacionando exception definida com o erro -1400
    ----ORA-01400: n�o � poss�vel inserir NULL em ("CURSOPLSQL"."CLIENTE"."ID")
    

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
    --codigo extraido para fun��o catergoria_cliente
    v_categoria := categoria_cliente(p_faturamento_previsto);
    
    FORMAT_CNPJ(v_CNPJ); --chamada da procedure FORMAT_CNPJ com paramentro IN OUT

    INSERT INTO cliente VALUES (p_id, UPPER(p_razao_social), v_CNPJ, p_segmercado_id, SYSDATE, p_faturamento_previsto, v_categoria);
    COMMIT;
    
    EXCEPTION
    WHEN dup_val_on_index then -- exce��es do Oracle, com nome pr�-definido
        --dbms_output.put_line ('Cliente j� cadastrado'); --saida : utilizar SET SERVEROUTPUT ON no exec da proc
        raise_application_error(-20010,'Cliente j� cadastrado'); --nao precisa do SET SERVEROUTPUT ON, utilizando p/ retornar erro p/ aplica��o tratar.
    WHEN e_null then
        raise_application_error(-20015,'A coluna ID tem preenchimento obrigat�rio'); --definindo mensagem personalizada 
    WHEN others then --erros n�o previstos
        raise_application_error(-20020,sqlerrm()); --sqlerrm lan�a a mensagem de erro do oracle

END;

/
