CREATE OR REPLACE FUNCTION obter_descricao_segmercado (p_id IN segmercado.id%type)
    RETURN segmercado.descricao%type
IS --definição dos componentes do trabalho
    v_descricao segmercado.descricao%type;

BEGIN
    SELECT descricao INTO v_descricao --atribuição na variável. O select deverá retorna apenas 1 resultado.
        FROM segmercado
        WHERE id = p_id;
    RETURN v_descricao; --para  axecução e devolve o valor da variável
END;

--chamando a função através dos comandos do sql developer
/*VARIABLE g_descricao varchar2(100)
EXECUTE :g_descricao := obter_descricao_segmercado (1)
PRINT g_descricao*/

--chamando a função através do bloco de execução
SET SERVEROUTPUT ON; --p/ utilização do pacote dbms_output

DECLARE
    v_descricao segmercado.descricao%type;

BEGIN
    v_descricao := obter_descricao_segmercado(2);
    dbms_output.put_line('Descricao: ' ||v_descricao); -- || concatenação de string

END;