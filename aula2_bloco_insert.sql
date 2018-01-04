DECLARE --declaração das variáveis, já inicializando-as
    --v_id number(5) := 1;
    --v_descricao varchar2(100) := 'varejo';
    
    --melhorando a definição do tipo da variável p/ que seja sempre compatível com a definição da coluna no banco
    v_id segmercado.id%type := 2; 
    v_descricao segmercado.descricao%type := 'atacado';

BEGIN
    --insert inicia a transação automaticamente
    INSERT INTO segmercado VALUES (v_id, upper(v_descricao)); --upper força a inserção de dados em maiuscula p/ manter um padrão de armazenamento
    COMMIT; --encerra a transação, confirmando
END;

select * from SEGMERCADO;