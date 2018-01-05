CREATE OR REPLACE FUNCTION obter_descricao_segmercado (p_id IN segmercado.id%type)
    RETURN segmercado.descricao%type
IS --defini��o dos componentes do trabalho
    v_descricao segmercado.descricao%type;

BEGIN
    SELECT descricao INTO v_descricao --atribui��o na vari�vel. O select dever� retorna apenas 1 resultado.
        FROM segmercado
        WHERE id = p_id;
    RETURN v_descricao; --para  axecu��o e devolve o valor da vari�vel
END;

--chamando a fun��o atrav�s dos comandos do sql developer
/*VARIABLE g_descricao varchar2(100)
EXECUTE :g_descricao := obter_descricao_segmercado (1)
PRINT g_descricao*/

--chamando a fun��o atrav�s do bloco de execu��o
SET SERVEROUTPUT ON; --p/ utiliza��o do pacote dbms_output

DECLARE
    v_descricao segmercado.descricao%type;

BEGIN
    v_descricao := obter_descricao_segmercado(2);
    dbms_output.put_line('Descricao: ' ||v_descricao); -- || concatena��o de string

END;