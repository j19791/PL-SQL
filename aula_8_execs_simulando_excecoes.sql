SET SERVEROUTPUT ON
--testando tratamento de erro com nome pr-e-definido (violação de pk)
EXECUTE INCLUIR_CLIENTE(1, 'SUPERMERCADO XYZ', '12345', NULL, 150000) 

EXECUTE INCLUIR_CLIENTE(null, 'SUPERMERCADO XYZ', '12345', NULL, 150000) --passando valor null na pk
--ORA-01400: não é possível inserir NULL em ("CURSOPLSQL"."CLIENTE"."ID")

execute atualizar_cli_seg_mercado(10,1) --cliente nao existente - erro do usuário


