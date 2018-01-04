--CREATE PROCEDURE incluir_segmercado (p_id IN NUMBER, p_descricao IN VARCHAR2) 
CREATE OR REPLACE PROCEDURE incluir_segmercado (p_id IN segmercado.id%type, p_descricao IN segmercado.descricao%type) --para que a definição do tipo da variável seja sempre compatível com a definição da coluna no banco
IS
BEGIN

    INSERT into segmercado values(p_id, UPPER(p_descricao));
    COMMIT;

END;

EXECUTE incluir_segmercado(3, 'Farmaceutico')

BEGIN
    incluir_segmercado(6, 'Militar');
END;

SELECT *FROM SEGMERCADO;