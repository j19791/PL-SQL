DECLARE --declara��o das vari�veis, j� inicializando-as
    --v_id number(5) := 1;
    --v_descricao varchar2(100) := 'varejo';
    
    --melhorando a defini��o do tipo da vari�vel p/ que seja sempre compat�vel com a defini��o da coluna no banco
    v_id segmercado.id%type := 2; 
    v_descricao segmercado.descricao%type := 'atacado';

BEGIN
    --insert inicia a transa��o automaticamente
    INSERT INTO segmercado VALUES (v_id, upper(v_descricao)); --upper for�a a inser��o de dados em maiuscula p/ manter um padr�o de armazenamento
    COMMIT; --encerra a transa��o, confirmando
END;

select * from SEGMERCADO;