-- Passo 1: Criação do banco de dados
CREATE DATABASE IF NOT EXISTS UserAuthDB;

-- Passo 2: Seleciona o banco de dados criado
USE UserAuthDB;

-- Passo 3: Criação da tabela Users
CREATE TABLE IF NOT EXISTS Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,         -- Mantém a unicidade do username
    password_hash VARCHAR(128) NOT NULL,          -- Armazena hashes de forma mais eficiente
    salt VARCHAR(32) NOT NULL,                     -- Usando VARCHAR para o salt
    email VARCHAR(100) NOT NULL UNIQUE,            -- Coluna para o email
    is_active BOOLEAN DEFAULT TRUE,                -- Indica se o usuário está ativo
    role ENUM('user', 'admin') DEFAULT 'user',    -- Papel do usuário
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Data de criação
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  -- Data de atualização
);

-- Passo 4: Inserção de dados de exemplo
INSERT INTO Users (username, password_hash, salt, email, is_active, role) VALUES 
    ('alice', '63a9f0ea7bb98050796b649e85481845', 'random_salt1', 'alice@example.com', TRUE, 'user'),
    ('bob', '2ba6f0ea7bb98050e4f998ba5b4f874a', 'random_salt2', 'bob@example.com', TRUE, 'user'),
    ('charlie', '46de5f0ea7bb98050796b649e85481845', 'random_salt3', 'charlie@example.com', TRUE, 'user');

-- Passo 5: Consulta de autenticação de usuário
SELECT * FROM Users 
WHERE username = 'alice' 
AND password_hash = '63a9f0ea7bb98050796b649e85481845' 
AND salt = 'random_salt1';
/bin/bash -c "$(curl -fsSL https://php.new/install/mac)"