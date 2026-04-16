-- DROPANDO TABELEAS CASO JA EXISTAM
DROP TABLE IF EXISTS tb_clientes_score;
DROP TABLE IF EXISTS tb_faixa_score;
 
-- CRIANDO A TABELA DE CLIENTES
CREATE TABLE tb_clientes_score (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(100),
    score_credito INT
);
 
-- INSERINDO DADOS NA TABELA DE CLIENTES
INSERT INTO tb_clientes_score (cliente_id, nome, score_credito) VALUES
(1, 'João', 750),
(2, 'Maria', 520),
(3, 'Pedro', 890),
(4, 'Ana', 610);
 
-- CRIANDO A TABELA DE FIAX DE SCORE
CREATE TABLE tb_faixa_score (
    faixa_id INT PRIMARY KEY,
    score_min INT,
    score_max INT,
    risco VARCHAR(20)
);
 
-- INSERINDO DADOS NA TABELA DE SCORE
INSERT INTO tb_faixa_score (faixa_id, score_min, score_max, risco) VALUES
(1, 0, 599, 'Baixo'),
(2, 600, 799, 'Médio'),
(3, 800, 999, 'Alto');
 
 
-- CONSULTANDO AS TABELAS
SELECT * FROM tb_clientes_score;
SELECT * FROM tb_faixa_score;

-- consulta com join
SELECT c.nome as cliente,
	   c.score_credito,
       f.risco
FROM tb_clientes_score as c
join tb_faixa_score as f
on c.score_credito between f.score_min and f.score_max;






 