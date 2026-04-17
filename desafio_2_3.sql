-- Limpa tudo antes (ESSENCIAL)
DROP TABLE IF EXISTS tb_funcionarios;
DROP TABLE IF EXISTS tb_departamentos;
DROP TABLE IF EXISTS tb_faixa_salarial;

-- Departamentos
CREATE TABLE tb_departamentos (
    id_departamento INT PRIMARY KEY,
    nome_departamento VARCHAR(100)
);

-- Funcionários
CREATE TABLE tb_funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(100),
    salario DECIMAL(10,2),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES tb_departamentos(id_departamento)
);

-- Faixa salarial
CREATE TABLE tb_faixa_salarial (
    id_faixa INT PRIMARY KEY,
    nivel VARCHAR(50),
    salario_min DECIMAL(10,2),
    salario_max DECIMAL(10,2)
);

-- Inserts corretos
INSERT INTO tb_departamentos (id_departamento, nome_departamento) VALUES
(1, 'Financeiro'),
(2, 'RH'),
(3, 'TI'),
(4, 'Vendas'),
(5, 'Inovação');

INSERT INTO tb_funcionarios (id_funcionario, nome_funcionario, salario, id_departamento) VALUES
(1, 'Ana', 1800.00, 1),
(2, 'Bruno', 2500.00, 4),
(3, 'Carlos', 3200.00, 2),
(4, 'Daniela', 4500.00, 4),
(5, 'Eduardo', 5200.00, 3),
(6, 'Fernanda', 7000.00, 4);

INSERT INTO tb_faixa_salarial (id_faixa, nivel, salario_min, salario_max) VALUES
(1, 'Junior', 0, 2000),
(2, 'Pleno', 2001, 5000),
(3, 'Senior', 5001, 99999);

SELECT 
    f.nome_funcionario,
    f.salario,
    fs.nivel
FROM tb_funcionarios f
JOIN tb_faixa_salarial fs
    ON f.salario BETWEEN fs.salario_min AND fs.salario_max;
    
    SELECT 
    f.nome_funcionario
FROM tb_funcionarios f
JOIN tb_departamentos d 
    ON f.id_departamento = d.id_departamento
JOIN tb_faixa_salarial fs 
    ON f.salario BETWEEN fs.salario_min AND fs.salario_max
WHERE fs.nivel = 'Pleno'
  AND d.nome_departamento = 'Vendas';