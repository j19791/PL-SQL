EXECUTE INCLUIR_CLIENTE(1, 'SUPERMERCADO XYZ', '12345', NULL, 150000)

EXECUTE INCLUIR_CLIENTE(2, 'SUPERMERCADO IJR', '67890', NULL, 90000); --com funcao q determina categoria do cliente

EXECUTE INCLUIR_CLIENTE(3, 'Industria RTY', '12378', NULL, 110000) --com procedure de formatação do cnpj

SELECT * FROM CLIENTE;