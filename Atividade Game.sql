CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

CREATE TABLE tb_classes(
id_classe INT PRIMARY KEY AUTO_INCREMENT,
nome_classe VARCHAR(50) NOT NULL,
descricao VARCHAR(255)
);

CREATE TABLE tb_personagens(
id_personagem INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
nivel INT,
ataque INT,
defesa INT,
id_classe INT,
FOREIGN KEY (id_classe) REFERENCES tb_classes(id_classe)
);

INSERT INTO tb_classes(nome_classe, descricao)
VALUES
("Guerreiro", "Excelentes em combate corpo a corpo"),
("Mago", "Dominam poderosas magias"),
("Arqueiro", "Mestres da precisão com arco e flecha"),
("Ladrão", "Ágeis e furtivos"),
("Curandeiro", "Especialistas em cura e suporte");

INSERT INTO tb_personagens (nome, nivel, ataque, defesa, id_classe)
VALUES
("Aragorn", 10, 2500, 2000, 1),
("Gandalf", 20, 1500, 1000, 2),
("Legolas", 15, 2200, 1800, 3),
("Bilbo", 5, 1000, 800, 4),
("Frodo", 8, 800, 700, 4),
("Gimli", 12, 2800, 2200, 1),
("Galadriel", 18, 1800, 1200, 2),
("Arwen", 10, 1600, 1400, 3);

SELECT * FROM tb_personagens WHERE ataque > 2000;
SELECT * FROM tb_personagens WHERE defesa BETWEEN 1000 AND 2000;
SELECT * FROM tb_personagens WHERE nome LIKE '%C%';

SELECT p.nome, p.nivel, c.nome_classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id_classe;

SELECT p.nome, p.nivel
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id_classe
WHERE c.nome_classe = 'Arqueiro';

SELECT * FROM tb_classes;
SELECT * FROM tb_personagens;