-- Criação das tabelas
CREATE TABLE Cliente (
  cliente_id INT PRIMARY KEY,
  nome VARCHAR(100),
  endereco VARCHAR(200),
  telefone VARCHAR(20),
  email VARCHAR(100)
);

CREATE TABLE Veiculo (
  veiculo_id INT PRIMARY KEY,
  marca VARCHAR(50),
  modelo VARCHAR(50),
  ano INT,
  placa VARCHAR(10),
  cliente_id INT,
  FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

CREATE TABLE Servico (
  servico_id INT PRIMARY KEY,
  descricao VARCHAR(200),
  data DATE,
  valor DECIMAL(10, 2),
  status VARCHAR(20),
  veiculo_id INT,
  FOREIGN KEY (veiculo_id) REFERENCES Veiculo(veiculo_id)
);

CREATE TABLE Peca (
  peca_id INT PRIMARY KEY,
  nome VARCHAR(100),
  descricao VARCHAR(200),
  quantidade INT,
  servico_id INT,
  FOREIGN KEY (servico_id) REFERENCES Servico(servico_id)
);

-- Exemplos de queries

-- Recuperação simples com SELECT Statement
SELECT * FROM Cliente;

-- Filtros com WHERE Statement
SELECT * FROM Veiculo WHERE marca = 'Toyota';

-- Criação de atributos derivados
SELECT CONCAT(nome, ' - ', placa) AS cliente_veiculo FROM Cliente INNER JOIN Veiculo ON Cliente.cliente_id = Veiculo.cliente_id;

-- Ordenação dos dados com ORDER BY
SELECT * FROM Servico ORDER BY data DESC;

-- Condições de filtros aos grupos com HAVING Statement
SELECT veiculo_id, COUNT(*) AS num_servicos FROM Servico GROUP BY veiculo_id HAVING num_servicos > 3;

-- Junção entre tabelas para obter informações relacionadas
SELECT Cliente.nome, Veiculo.marca, Servico.descricao FROM Cliente INNER JOIN Veiculo ON Cliente.cliente_id = Veiculo.cliente_id INNER JOIN Servico ON Veiculo.veiculo_id = Servico.veiculo_id;
