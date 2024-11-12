-- 1. Criando o banco de dados
CREATE DATABASE BancoDigital;
USE BancoDigital;

-- 2. Criando a tabela de clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    rg VARCHAR(20) NOT NULL,
    cpf VARCHAR(20) NOT NULL UNIQUE,
    account_number VARCHAR(20) NOT NULL UNIQUE,
    city VARCHAR(50),
    phone VARCHAR(20),
    dob DATE,
    balance DECIMAL(15, 2) DEFAULT 0.00,
    credit_limit DECIMAL(15, 2) DEFAULT 1000.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Criando a tabela de transações
CREATE TABLE transacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    tipo_transacao ENUM('Depósito', 'Saque', 'Transferência Enviada', 'Transferência Recebida', 'Pagamento de Fatura') NOT NULL,
    valor DECIMAL(15, 2) NOT NULL,
    data_transacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);

-- 4. Inserindo registros de exemplo na tabela clientes
INSERT INTO clientes (username, password, rg, cpf, account_number, city, phone, dob, balance, credit_limit)
VALUES 
('joaodasilva', 'senha123', '123456789', '123.456.789-00', '00012345', 'São Paulo', '(11) 91234-5678', '1985-10-10', 500.00, 1000.00),
('mariafernandes', 'senha456', '987654321', '987.654.321-99', '00012346', 'Rio de Janeiro', '(21) 91234-5678', '1990-05-15', 250.00, 2000.00);

-- 5. Inserindo registros de exemplo na tabela transacoes
INSERT INTO transacoes (cliente_id, tipo_transacao, valor)
VALUES 
(1, 'Depósito', 200.00),
(1, 'Saque', 50.00),
(2, 'Depósito', 300.00),
(2, 'Transferência Recebida', 150.00);

-- 6. Consultando o saldo e o limite de crédito de um cliente específico
SELECT username, balance, credit_limit
FROM clientes
WHERE username = 'joaodasilva';

-- 7. Visualizando o histórico de transações de um cliente específico
SELECT c.username, t.tipo_transacao, t.valor, t.data_transacao
FROM transacoes t
JOIN clientes c ON t.cliente_id = c.id
WHERE c.username = 'joaodasilva';

-- 8. Atualizando o saldo de um cliente após um depósito
UPDATE clientes
SET balance = balance + 100.00
WHERE username = 'mariafernandes';

-- 9. Atualizando o saldo de um cliente após um saque
UPDATE clientes
SET balance = balance - 50.00
WHERE username = 'joaodasilva' AND balance >= 50.00;

-- 10. Exemplo de trigger para registrar automaticamente uma transação de saque ou depósito
DELIMITER //
CREATE TRIGGER registrar_transacao_deposito
AFTER UPDATE ON clientes
FOR EACH ROW
BEGIN
    DECLARE diff DECIMAL(15, 2);
    SET diff = NEW.balance - OLD.balance;
    IF diff > 0 THEN
        INSERT INTO transacoes (cliente_id, tipo_transacao, valor)
        VALUES (NEW.id, 'Depósito', diff);
    ELSEIF diff < 0 THEN
        INSERT INTO transacoes (cliente_id, tipo_transacao, valor)
        VALUES (NEW.id, 'Saque', ABS(diff));
    END IF;
END;
//
DELIMITER ;

-- 11. Exemplo de trigger para registrar o pagamento de fatura do cartão de crédito
DELIMITER //
CREATE TRIGGER pagar_fatura_cartao
AFTER UPDATE ON clientes
FOR EACH ROW
BEGIN
    IF NEW.credit_limit > OLD.credit_limit THEN
        INSERT INTO transacoes (cliente_id, tipo_transacao, valor)
        VALUES (NEW.id, 'Pagamento de Fatura', NEW.credit_limit - OLD.credit_limit);
    END IF;
END;
//
DELIMITER ;

-- 12. Exemplo de atualização de limite de crédito após pagamento
UPDATE clientes
SET credit_limit = credit_limit + 500.00
WHERE username = 'joaodasilva';

-- 13. Exemplo de consulta para verificar o limite de crédito após atualização
SELECT username, credit_limit
FROM clientes
WHERE username = 'joaodasilva';
