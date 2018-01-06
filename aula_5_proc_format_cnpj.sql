CREATE OR REPLACE PROCEDURE FORMAT_CNPJ
    (p_cnpj IN OUT cliente.CNPJ%type) --in out: parametro q pode ser de leitura ou de escrita

IS
BEGIN
    p_cnpj := substr(p_cnpj,1,2) || '/' || substr(p_cnpj,3);
END;

--testes
VARIABLE g_cnpj varchar2(10)
EXECUTE :g_cnpj := '12345'
PRINT g_cnpj

EXECUTE FORMAT_CNPJ(:g_cnpj)
PRINT g_cnpj