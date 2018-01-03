SET SERVEROUTPUT ON; --Para obtermos uma sa�da, temos que setar a vari�vel de ambiente SERVEROUTPUT para ON
--bloco
DECLARE
    v_id number(5) := 1; --declara��o da vari�vel e atribui��o de valor. Importante: padronizar. N�o � case-sensitive
BEGIN
    --Se��o do bloco onde se processa os comandos de execu��o
    
    v_id := 3; --altera��o do valor
    Dbms_output.put_line (v_id); --importa pacote Dbms_output e executa sua proc put_line p/ exibir valores
END;