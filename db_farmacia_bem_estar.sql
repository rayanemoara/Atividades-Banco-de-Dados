CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (
id_categoria INT PRIMARY KEY AUTO_INCREMENT,
nome_categoria VARCHAR(50) NOT NULL,
descricao VARCHAR(255)
);

CREATE TABLE tb_produtos (
id_produto INT PRIMARY KEY AUTO_INCREMENT,
nome_produto VARCHAR(100) NOT NULL,
preco DECIMAL(10,2),
quantidade INT,
id_categoria INT,
FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_categorias (nome_categoria, descricao)
VALUES
('Medicamentos', 'Remédios com prescrição médica'),
('Higiene Pessoal', 'Produtos para higiene corporal'),
('Cosméticos', 'Produtos para cuidados com a pele e cabelo'),
('Alimentos', 'Alimentos para dietas especiais'),
('Infantil', 'Produtos para bebês e crianças');

INSERT INTO tb_produtos (nome_produto, preco, quantidade, id_categoria)
VALUES
('Dipirona 500mg', 10.00, 100, 1),
('Paracetamol', 8.00, 120, 1),
('Sabonete', 2.00, 80, 2),
('Shampoo', 15.00, 50, 2),
('Batom', 25.00, 30, 3),
('Hidratante Facial', 35.00, 40, 3),
('Leite em Pó', 25.00, 20, 4),
('Fralda P', 80.00, 150, 5);

SELECT * FROM tb_produtos WHERE preco > 50.00;
SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;
SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%';

SELECT p.nome_produto, p.preco, c.nome_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c 
ON p.id_categoria = c.id_categoria;

SELECT p.nome_produto, p.preco
FROM tb_produtos p
INNER JOIN tb_categorias c 
ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Cosméticos';

SELECT * FROM tb_categorias, tb_produtos;