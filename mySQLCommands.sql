# MySQL Commands
#starting MySQL service
net start mysql80;
#stopping MySQL service
net stop mysql80;
create name_database;
create name_tables;
show databases;
show tables;
use name_database;
SHOW VARIABLES;
CREATE DATABASE `name_database` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;



CREATE TABLE usuarios (
    UsuarioID int not null auto_increment primary key,
    Usuario varchar(255) not null default 'Nome Padrão',
    Telefone varchar(50) null default '0',
    DataCriacao timestamp not null default current_timestamp
);
describe usuarios;
INSERT INTO usuarios (
    UsuarioID, Usuario, Telefone, DataCriacao) VALUES ('Nome do Usuário', '95999668877', NOW());

UPDATE usuarios SET Usuario = 'Nome Atualizado' WHERE UsuarioID = 1;
UPDATE Produtos SET preco = preco * 1.1 WHERE UsuarioID = 1;
DELETE FROM usuarios WHERE UsuarioID = 1;

CREATE TABLE `fornecedor` (
	`ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`NomeFornecedor` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`TelefoneFornecedor` VARCHAR(50) NULL DEFAULT '0' COLLATE 'utf8mb4_0900_ai_ci',
	PRIMARY KEY (`ID`) USING BTREE
)

INSERT INTO `fornecedor` (`ID`, `Nome`, `Telefone`) VALUES (NULL, 'PCgamerTwo', '95999668877'), (NULL, 'PCgamerThree', '95999668878'), (NULL, 'PCgamerFour', '95999668879');
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
SHOW CREATE TABLE `crm`.`fornecedor`;

ALTER TABLE `fornecedor`
	CHANGE COLUMN `Coluna 1` `ID` INT NOT NULL AUTO_INCREMENT FIRST,
	ADD COLUMN `Nome` VARCHAR(50) NOT NULL AFTER `ID`,
	ADD COLUMN `Telefone` VARCHAR(50) NULL DEFAULT '0' AFTER `Nome`,
	ADD PRIMARY KEY (`ID`);

CREATE TABLE `crm`.`Produtos` (
    `ID` INT NOT NULL AUTO_INCREMENT primary key,
    `NomeProdutos` VARCHAR(50) NOT NULL,
    `Descricao` VARCHAR(100) NULL DEFAULT NULL,
    `Preco` DECIMAL(10,2) NOT NULL,
    `Estoque` INT NOT NULL DEFAULT '0',
    `MinimoEstoque` INT NOT NULL DEFAULT '0',
    PRIMARY KEY (`ID`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#Adicionando Chave Estrangeira
ALTER TABLE vendas
ADD CONSTRAINT fk_vendas_cliente
FOREIGN KEY (cod_cliente)
REFERENCES clientes (id_cliente);

#ALTER TABLE vendas: Inicia a modificação da tabela vendas. 
#ADD CONSTRAINT fk_vendas_cliente: Adiciona uma restrição com o nome fk_vendas_cliente. 
#FOREIGN KEY (cod_cliente): Indica que a coluna cod_cliente na tabela vendas será a chave estrangeira. 
#REFERENCES clientes (id_cliente): Especifica que a coluna cod_cliente deve referenciar valores existentes na coluna id_cliente da tabela clientes. 
#Considerações Importantes:
#As tabelas que utilizam chaves estrangeiras devem usar o motor de armazenamento InnoDB. 

SELECT * FROM produtos WHERE nome LIKE '%_ECLAD_%';
SELECT * FROM produtos WHERE estoque BETWEEN 10 AND 50;
SELECT * FROM produtos WHERE fornecedorID IN (1, 2, 5);
SELECT * FROM produtos WHERE estoque >= 10 AND estoque <= 50;
SELECT * FROM produtos WHERE FornecedorID = 1 OR FornecedorID = 2 OR FornecedorID = 5;
SELECT SUM (Estoque) AS TotalEstoque, fornecedoresID FROM Produtos GROUP BY fornecedorID;
SELECT COUNT(*) AS ContagemProdutos, fornecedoresID FROM Produtos GROUP BY fornecedorID;
SELECT AVG(Preco) AS PrecoMedio, fornecedoresID FROM Produtos GROUP BY fornecedorID;
SELECT MIN(Preco) AS PrecoMinimo, fornecedoresID FROM Produtos GROUP BY fornecedorID;
SELECT MAX(Preco) AS PrecoMaximo, fornecedoresID FROM Produtos GROUP BY fornecedorID;
SELECT produtos_ID, SUM(Quantidade) AS TotalVendido FROM vendas GROUP BY produtos_ID;
SELECT *, (SELECT fornecedores.Nome FROM fornecedores WHERE fornecedores.ID = produtos.fornecedores_ID LIMIT 1) AS NomeFornecedor FROM produtos;
SELECT * FROM produtos WHERE (SELECT fornecedores.Nome FROM fornecedores WHERE fornecedores.ID = produtos.fornecedores_ID LIMIT 1) = 'Generico';
SELECT Produtos.*, Fornecedores.nomeFornecedor AS FornecedorRelacao FROM Produtos INNER JOIN Fornecedores ON Produtos.FornecedorID = Fornecedores.ID;

CREATE TABLE teste.Users (
	ID INT auto_increment NOT NULL,
	Name varchar(100) NOT NULL,
	Column1 INT DEFAULT 18 NOT NULL,
	CONSTRAINT Users_pk PRIMARY KEY (ID)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;

#------------------------- PHP -------------------------;
<?php

$produtos = $pdo->query('SELECT * FROM Produtos WHERE Estoque > 0 ORDER BY NomeProdutos');

foreach($produtos->fetchAll() as $produto){
    echo $produto['NomeProdutos'] . ' - ' . $produto['Preco'] . '<br>';
}

?>

#------------------------- javascript -------------------------;
<script>
let produtos = await db.produtos.where('Estoque').above(0).sortBy('NomeProdutos');
produtos.forEach(produto => {
    console.log(`${produto.NomeProdutos} - ${produto.Preco}`);
});
</script>
