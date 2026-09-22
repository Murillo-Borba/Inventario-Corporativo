Create Database InventarioCorporativo;

Use InventarioCorporativo;

Create Table Usuario (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    perfil VARCHAR(50) NOT NULL,
    ativo BOOLEAN DEFAULT TRUE
);

Create Table equipamentos (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    patrimonio VARCHAR(50) NOT NULL UNIQUE,
    tipo VARCHAR(100) NOT NULL,
    marca VARCHAR(100),
    modelo VARCHAR(100),
    numero_serie VARCHAR(100),
    stat VARCHAR(50) NOT NULL,
    localizacao VARCHAR(150),
    responsavel_id BIGINT,
    data_aquisicao DATE,
    observacao TEXT,
    
    FOREIGN KEY (responsavel_id) REFERENCES Usuario(id)
);

CREATE TABLE movimentacoes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    equipamento_id BIGINT NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    usuario_anterior_id BIGINT,
    usuario_novo_id BIGINT,
    data_movimentacao DATETIME NOT NULL,
    observacao TEXT,

    FOREIGN KEY (equipamento_id)
        REFERENCES equipamentos(id),

    FOREIGN KEY (usuario_anterior_id)
        REFERENCES Usuario(id),

    FOREIGN KEY (usuario_novo_id)
        REFERENCES Usuario(id)
);

