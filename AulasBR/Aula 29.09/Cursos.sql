CREATE DATABASE Cursos_Online;
USE Cursos_Online;

-- Tabela Alunos
CREATE TABLE Alunos (
    id_Alunos INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Data_Nascimento DATE
);

-- Tabela Cursos
CREATE TABLE Cursos (
    id_Cursos INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(100) NOT NULL,
    Descricao TEXT,
    Carga_Horaria INT,
    status VARCHAR(10) DEFAULT 'ativo' CHECK (status IN ('ativo','inativo'))
);

-- Tabela Inscrições
CREATE TABLE Inscricoes (
    id_Inscricao INT PRIMARY KEY AUTO_INCREMENT,
    Aluno_id INT,
    Curso_id INT,
    Data_inscricao DATE,
    FOREIGN KEY (Aluno_id) REFERENCES Alunos(id_Aluno),
    FOREIGN KEY (Curso_id) REFERENCES Cursos(id_Curso)
);

-- Tabela Avaliações
CREATE TABLE Avaliacoes (
    id_Avaliacao INT PRIMARY KEY AUTO_INCREMENT,
    Inscricao_id INT UNIQUE,
    Nota DECIMAL(5,2),
    Comentario TEXT,
    FOREIGN KEY (Inscricao_id) REFERENCES Inscricoes(id_Inscricao)
);

-- Inserindo dados nas tabelas --

-- Inserir 5 Alunos
INSERT INTO Alunos (Nome, Email, Data_Nascimento) VALUES
('Douglas Jr', 'Douglinha@email.com', '2007-02-14'),
('Eduardo Rocha', 'Duardina@email.com', '2006-05-05'),
('Marques', 'Marques@email.com', '2005-03-23'),
('Hairon Orlando', 'hiro@email.com', '2005-11-19'),
('Isadora', 'Isa@email.com', '2005-12-19');

-- Inserir 5 Cursos (1 com status 'inativo')
INSERT INTO Cursos (Titulo, Descricao, Carga_Horaria, status) VALUES
('Redes de Computadores', 'Fundamentos de redes e protocolos', 45, 'inativo'),
('Cibersegurança', 'Conceitos básicos de segurança digital', 55, 'ativo'),
('Engenharia de Software', 'Metodologias e boas práticas de desenvolvimento', 80, 'ativo'),
('Banco de Dados Avançado', 'Modelagem, consultas e otimização', 65, 'ativo'),
('Machine Learning', 'Introdução a algoritmos de aprendizado de máquina', 75, 'ativo');

-- Inserir 5 Inscrições
INSERT INTO Inscricoes (Aluno_id, Curso_id, Data_Inscricao) VALUES
(1, 1, '2025-12-19'),
(2, 2, '2025-11-19'),
(3, 3, '2025-07-04'),
(4, 4, '2025-02-08'),
(5, 5, '2025-10-20');

-- Inserir 3 Avaliações
INSERT INTO Avaliacoes (Inscricao_id, Nota, Comentario) VALUES
(1, 10.00, 'Maravilhoso o curso'),
(2, 8.50, 'Muito bom, recomendo'),
(3, 7.50, 'Bom, mas precisa de mais profundidade.');

-- Atualizações --

-- Atualizar email de um aluno
UPDATE Alunos
SET Email = 'EMAIL@email.com'
WHERE id_Aluno = 1;

-- Alterar carga horária de um curso
UPDATE Cursos
SET Carga_Horaria = 80
WHERE id_Curso = 2;

-- Corrigir nome de um aluno
UPDATE Alunos
SET Nome = 'Hayron'
WHERE id_Aluno = 4;

-- Mudar status de um curso
UPDATE Cursos
SET status = 'inativo'
WHERE id_Curso = 2;

-- Alterar notas de uma avaliação
UPDATE Avaliacoes
SET Nota = 10.00
WHERE id_Avaliacao = 2;

-- Exclusões de Dados --

-- Criar dados específicos para exclusão --

-- Inscrição extra
INSERT INTO Inscricoes (Aluno_id, Curso_id, Data_Inscricao) VALUES
(1, 2, '2025-01-01');

-- Curso extra
INSERT INTO Cursos (Titulo, Descricao, Carga_Horaria, status) VALUES
('TESTE', 'TESTE', 10, 'ativo');

-- Avaliação ofensiva
INSERT INTO Avaliacoes (Inscricao_id, Nota, Comentario) VALUES
(4, 5.00, 'TESTE');

-- Aluno extra
INSERT INTO Alunos (Nome, Email, Data_Nascimento) VALUES
('ALUNO TESTE', 'TESTE@email.com', '2005-10-01');

-- Inscrições para curso inativo
INSERT INTO Inscricoes (Aluno_id, Curso_id, Data_Inscricao) VALUES
(3, 5, '2025-09-26'), 
(4, 5, '2025-09-26');

-- Deletar pendências --

DELETE FROM Inscricoes WHERE id_Inscricao = 6; -- inscrição extra
DELETE FROM Cursos WHERE Titulo = 'TESTE';
DELETE FROM Avaliacoes WHERE Comentario LIKE '%TESTE%';
DELETE FROM Alunos WHERE Nome = 'ALUNO TESTE';

DELETE FROM Avaliacoes
WHERE Inscricao_id IN (
    SELECT id_Inscricao FROM Inscricoes 
    WHERE Curso_id IN (SELECT id_Curso FROM Cursos WHERE status = 'inativo')
);

DELETE FROM Inscricoes
WHERE Curso_id IN (SELECT id_Curso FROM Cursos WHERE status = 'inativo');

DELETE FROM Cursos WHERE status = 'inativo';

-- Consultas --

SELECT * FROM Alunos;

SELECT Nome, Email FROM Alunos;

SELECT * FROM Cursos WHERE Carga_Horaria > 25;

SELECT * FROM Cursos WHERE status = 'inativo';

SELECT * FROM Alunos WHERE Data_Nascimento > '2005-12-19';

SELECT * FROM Avaliacoes WHERE Nota > 8;

SELECT COUNT(*) AS Total_Cursos FROM Cursos;

SELECT * FROM Cursos ORDER BY Carga_Horaria DESC LIMIT 3;

-- Índice
CREATE INDEX idx_Email_Aluno ON Alunos(Email);

