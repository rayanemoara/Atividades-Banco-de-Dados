CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

CREATE TABLE tb_categorias(
id_categoria INT PRIMARY KEY AUTO_INCREMENT,
nome_categoria VARCHAR(50) NOT NULL,
descricao VARCHAR(255)
);

CREATE TABLE tb_pizzas(
id_pizza INT PRIMARY KEY AUTO_INCREMENT,
sabor_pizza VARCHAR(50) NOT NULL,
tamanho VARCHAR(20),
valor DECIMAL (10,2),
id_categoria INT,
FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_categorias  (nome_categoria, descricao)
VALUES
('Sabores Clássicos', 'As pizzas que você ama, sempre frescas e deliciosas.'),
('Doçura Irresistível', 'A combinação perfeita entre pizza e sobremesa.'),
('Sabores Naturais', 'O melhor da natureza em cada pedaço.'),
('Sabores Inovadores', 'Combinamos ingredientes inusitados para criar pizzas únicas.'),
('Atemporal', 'Sabores que nunca saem de moda.');

INSERT INTO tb_pizzas (sabor_pizza, tamanho, valor, id_categoria)
VALUES
('Margherita', 'Média', 40.00, 1),
('Calabresa', 'Grande', 55.00, 1),
('Portuguesa', 'Média', 45.00, 1),
('Nutella', 'Pequena', 35.00, 2),
('Romeu e Julieta', 'Média', 48.00, 2),
('Vegetariana', 'Grande', 50.00, 3),
('Strogonoff', 'Média', 42.00, 4),
('Frango com catupiry', 'Grande', 60.00, 5);

SELECT * FROM tb_pizzas WHERE valor > 45.00;
SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;
SELECT * FROM tb_pizzas WHERE sabor_pizza LIKE '%M%';

SELECT p.sabor_pizza, p.tamanho, p.valor, c.id_categoria
FROM tb_pizzas p
INNER JOIN tb_categorias c 
ON p.id_pizza = c.id_categoria;

SELECT p.sabor_pizza, p.tamanho, p.valor
FROM tb_pizzas p
INNER JOIN tb_categorias c 
ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Doçura Irresistível';