CREATE DATABASE oficina;
USE oficina;


CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(20)
);


CREATE TABLE Veiculo (
    veiculo_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    placa VARCHAR(10) NOT NULL,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    ano SMALLINT,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);


CREATE TABLE Equipe (
    equipe_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_equipe VARCHAR(50) NOT NULL
);


CREATE TABLE Mecanico (
    mecanico_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50),
    telefone VARCHAR(20),
    equipe_id INT,
    FOREIGN KEY (equipe_id) REFERENCES Equipe(equipe_id)
);


CREATE TABLE Ordem_Servico (
    os_id INT PRIMARY KEY AUTO_INCREMENT,
    numero_os VARCHAR(20) UNIQUE NOT NULL,
    veiculo_id INT NOT NULL,
    equipe_id INT,
    data_emissao DATE NOT NULL,
    data_conclusao DATE,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    status ENUM('ABERTA', 'AUTORIZADA', 'EM_ANDAMENTO', 'CONCLUIDA', 'CANCELADA') NOT NULL,
    observacoes TEXT,
    FOREIGN KEY (veiculo_id) REFERENCES Veiculo(veiculo_id),
    FOREIGN KEY (equipe_id) REFERENCES Equipe(equipe_id)
);


CREATE TABLE Servico (
    servico_id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(200) NOT NULL,
    valor_mao_obra DECIMAL(10,2)
);


CREATE TABLE Peça (
    peca_id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(200) NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    codigo_fornecedor VARCHAR(50),
    estoque INT
);


CREATE TABLE OS_Servico (
    os_id INT NOT NULL,
    servico_id INT NOT NULL,
    quantidade INT DEFAULT 1,
    valor_mao_obra_aplicado DECIMAL(10,2),
    valor_total_servico DECIMAL(10,2),
    PRIMARY KEY (os_id, servico_id),
    FOREIGN KEY (os_id) REFERENCES Ordem_Servico(os_id),
    FOREIGN KEY (servico_id) REFERENCES Servico(servico_id)
);


CREATE TABLE OS_Peça (
    os_id INT NOT NULL,
    peca_id INT NOT NULL,
    quantidade INT DEFAULT 1,
    valor_unitario_aplicado DECIMAL(10,2),
    valor_total_peca DECIMAL(10,2),
    PRIMARY KEY (os_id, peca_id),
    FOREIGN KEY (os_id) REFERENCES Ordem_Servico(os_id),
    FOREIGN KEY (peca_id) REFERENCES Peca(peca_id)
);
