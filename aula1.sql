SET SERVEROUTPUT ON; --Para obtermos uma saída, temos que setar a variável de ambiente SERVEROUTPUT para ON
--bloco
DECLARE
    v_id number(5) := 1; --declaração da variável e atribuição de valor. Importante: padronizar. Não é case-sensitive
BEGIN
    --Seção do bloco onde se processa os comandos de execução
    
    v_id := 3; --alteração do valor
    Dbms_output.put_line (v_id); --importa pacote Dbms_output e executa sua proc put_line p/ exibir valores
END;