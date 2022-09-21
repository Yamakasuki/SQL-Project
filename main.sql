


--Criação de tabela para as disciplinas
CREATE TABLE disciplinas(                
    id_disc VARCHAR(10) NOT NULL PRIMARY KEY,        --Primary key significa que o id_disc não pode conter valores repetidos(duas disciplinas com o mesmo id)
    NOME VARCHAR(100) NOT NULL,                     -- NOT NULL siginifica que os valores não podem ser nulos
    qtd_cred INT NOT NULL);


--Inserindo valores para o tabela de disciplinas
INSERT INTO disciplinas (id_disc,nome,qtd_cred) VALUES ('12902','PI: DESENVOLVIMENTO DE SISTEMAS WEB ','4'); 
INSERT INTO disciplinas (id_disc,nome,qtd_cred) VALUES ('12901','ROBOTICA COMPUTACIONAL','4');
INSERT INTO disciplinas (id_disc,nome,qtd_cred) VALUES ('11445','CALCULO I','4');
INSERT INTO disciplinas (id_disc,nome,qtd_cred) VALUES ('11135','TEOLOGIA E FENOMENO HUMANO','2');
INSERT INTO disciplinas (id_disc,nome,qtd_cred) VALUES ('12903','ORGANIZACAO DE SISTEMAS DE COMPUTACAO','4');
INSERT INTO disciplinas (id_disc,nome,qtd_cred) VALUES ('12902P','PI: DESENVOLVIMENTO DE SISTEMAS WEB (Pratica)','2');
INSERT INTO disciplinas (id_disc,nome,qtd_cred) VALUES ('12901P','ROBOTICA COMPUTACIONAL (Pratica)','2');
INSERT INTO disciplinas (id_disc,nome,qtd_cred) VALUES ('11445P','CALCULO I (Pratica)','2');
INSERT INTO disciplinas (id_disc,nome,qtd_cred) VALUES ('12903P','ORGANIZACAO DE SISTEMAS DE COMPUTACAO (Pratica)','2');


--Criação de tabela para os professores
CREATE TABLE professor(                 
    rp  BIGSERIAL NOT NULL PRIMARY KEY,   --BIGSERIAL é um contador (a cada adição o rp somará um número)
    nome VARCHAR(40) NOT NULL,
    sobrenome VARCHAR(40) NOT NULL
    );

--Insirindo valores para a tabela de professores
--Nome que o rp não precisa ser inserido, pois ele é um BIGSERIAL (será contado automaticamente)
INSERT INTO professor (nome,sobrenome) VALUES ('Leandro','Xastre');         --Rp 1
INSERT INTO professor (nome,sobrenome) VALUES ('Ricardo','Pannain');        --Rp 2
INSERT INTO professor (nome,sobrenome) VALUES ('Valdomiro','Santos');       --Rp 3
INSERT INTO professor (nome,sobrenome) VALUES ('Vinicius','Simionatto');    --Rp 4
INSERT INTO professor (nome,sobrenome) VALUES ('Danilo','Rodrigues');       --Rp 5
INSERT INTO professor (nome,sobrenome) VALUES ('Sergio','Marques');         --Rp 6
INSERT INTO professor (nome,sobrenome) VALUES ('Dimas','Lemes');            --Rp 7
INSERT INTO professor (nome,sobrenome) VALUES ('Alexandre','Monteiro');     --Rp 8


--Criação de uma tabela para a relação de professores e disciplinas
-- Essa tabela funciona como uma tabela auxiliar que guarda os ids das disciplinas e seus respectivos professores
CREATE TABLE professor_disciplinas(
    id_disc VARCHAR(10) NOT NULL,
    rp BIGSERIAL NOT NULL,
    PRIMARY KEY (id_disc,rp),
    FOREIGN KEY (id_disc) REFERENCES disciplinas(id_disc) ON UPDATE CASCADE,
    FOREIGN KEY (rp) REFERENCES professor(rp) ON UPDATE CASCADE
);

--Inserindo valores na tabela de professores_disciplinas
INSERT INTO professor_disciplinas VALUES ('12902','1');    --Primero valor = Id da disciplina, Segundo valor = Seu respectivo professor
INSERT INTO professor_disciplinas VALUES ('12902P','1');
INSERT INTO professor_disciplinas VALUES ('12901','4');
INSERT INTO professor_disciplinas VALUES ('12901','7');
INSERT INTO professor_disciplinas VALUES ('12901P','4');
INSERT INTO professor_disciplinas VALUES ('12901P','6');
INSERT INTO professor_disciplinas VALUES ('11445','3');
INSERT INTO professor_disciplinas VALUES ('11135','5');
INSERT INTO professor_disciplinas VALUES ('12903','2');
INSERT INTO professor_disciplinas VALUES ('12903P','2');
INSERT INTO professor_disciplinas VALUES ('11445P','8');


--Criação de uma tabela para os alunos
CREATE TABLE alunos (
    ra BIGSERIAL NOT NULL PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    sobrenome VARCHAR(40) NOT NULL,
    sexo VARCHAR(20) NOT NULL
    );

--Inserindo valores na tabela de alunos
INSERT INTO alunos (ra,nome,sobrenome,sexo)VALUES ('22003967','Gabriel','Yamamoto','Masculino');
INSERT INTO alunos (ra,nome,sobrenome,sexo)VALUES ('22005252','Arthur','Maluf','Masculino');
INSERT INTO alunos (ra,nome,sobrenome,sexo)VALUES ('22002241','Joao','Pamponet','Masculino');
INSERT INTO alunos (ra,nome,sobrenome,sexo)VALUES ('22005768','Vinicius','Galassi','Masculino');

--Criação de uma tabela que relaciona as disciplinas com seus respectivos alunos
CREATE TABLE alunos_disciplinas(
    id_disc VARCHAR(10) NOT NULL,
    ra BIGSERIAL NOT NULL,
    PRIMARY KEY (id_disc,ra),
    FOREIGN KEY (id_disc) REFERENCES disciplinas(id_disc) ON UPDATE CASCADE, 
    FOREIGN KEY (ra) REFERENCES alunos(ra) ON UPDATE CASCADE
);

--Inserindo valores na tabela alunos_disciplinas
INSERT INTO alunos_disciplinas VALUES ('12902','22003967');    --Primero valor = Id da disciplina, Segundo valor = Seu respectivo aluno
INSERT INTO alunos_disciplinas VALUES ('12902','22005252');
INSERT INTO alunos_disciplinas VALUES ('12902','22002241');
INSERT INTO alunos_disciplinas VALUES ('12902','22005768');
INSERT INTO alunos_disciplinas VALUES ('12902P','22003967');
INSERT INTO alunos_disciplinas VALUES ('12902P','22005252');
INSERT INTO alunos_disciplinas VALUES ('12902P','22002241');
INSERT INTO alunos_disciplinas VALUES ('12902P','22005768');
INSERT INTO alunos_disciplinas VALUES ('12901','22003967');
INSERT INTO alunos_disciplinas VALUES ('12901','22005252');
INSERT INTO alunos_disciplinas VALUES ('12901','22002241');
INSERT INTO alunos_disciplinas VALUES ('12901','22005768');
INSERT INTO alunos_disciplinas VALUES ('12901P','22003967');
INSERT INTO alunos_disciplinas VALUES ('12901P','22005252');
INSERT INTO alunos_disciplinas VALUES ('12901P','22002241');
INSERT INTO alunos_disciplinas VALUES ('12901P','22005768');
INSERT INTO alunos_disciplinas VALUES ('11445','22003967');
INSERT INTO alunos_disciplinas VALUES ('11445','22005252');
INSERT INTO alunos_disciplinas VALUES ('11445','22002241');
INSERT INTO alunos_disciplinas VALUES ('11445','22005768');
INSERT INTO alunos_disciplinas VALUES ('11445P','22003967');
INSERT INTO alunos_disciplinas VALUES ('11445P','22005252');
INSERT INTO alunos_disciplinas VALUES ('11445P','22002241');
INSERT INTO alunos_disciplinas VALUES ('11445P','22005768');
INSERT INTO alunos_disciplinas VALUES ('11135','22003967');
INSERT INTO alunos_disciplinas VALUES ('11135','22005252');
INSERT INTO alunos_disciplinas VALUES ('11135','22002241');
INSERT INTO alunos_disciplinas VALUES ('11135','22005768');
INSERT INTO alunos_disciplinas VALUES ('12903','22003967');
INSERT INTO alunos_disciplinas VALUES ('12903','22005252');
INSERT INTO alunos_disciplinas VALUES ('12903','22002241');
INSERT INTO alunos_disciplinas VALUES ('12903','22005768');
INSERT INTO alunos_disciplinas VALUES ('12903P','22003967');
INSERT INTO alunos_disciplinas VALUES ('12903P','22005252');
INSERT INTO alunos_disciplinas VALUES ('12903P','22002241');
INSERT INTO alunos_disciplinas VALUES ('12903P','22005768');


--Comando para mostrar tabela de professor relacionados com disciplinas
/*
SELECT * FROM PROFESSOR
JOIN professor_disciplinas ON professor.rp = professor_disciplinas.rp
JOIN disciplinas ON disciplinas.id_disc = professor_disciplinas.id_disc
ORDER BY professor.rp;
*/ 

--Comando para mostrar tabela de alunos relacionados com disciplinas 
/*
SELECT * FROM ALUNOS
JOIN alunos_disciplinas ON alunos.ra = alunos_disciplinas.ra
JOIN disciplinas ON disciplinas.id_disc = alunos_disciplinas.id_disc
ORDER BY alunos.ra;
*/

--Comando para mostrar qualquer outra tabela 
-- SELECT * FROM <nome da tabela>
