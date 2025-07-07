-- Criar banco de dados
CREATE DATABASE IF NOT EXISTS redehoteis;
USE redehoteis;

-- Tabela Hotel
CREATE TABLE Hotel (
  idHotel INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  categoria VARCHAR(50),
  telefone VARCHAR(20),
  email VARCHAR(100),
  rua VARCHAR(100),
  numero VARCHAR(10),
  complemento VARCHAR(50),
  bairro VARCHAR(50),
  cep VARCHAR(10),
  cidade VARCHAR(50),
  estado VARCHAR(2)
);

-- Tabela Funcionario
CREATE TABLE Funcionario (
  cpf CHAR(14) PRIMARY KEY,
  nome VARCHAR(100),
  telefone VARCHAR(20),
  email VARCHAR(100),
  login VARCHAR(50),
  senha VARCHAR(50),
  idHotel INT,
  FOREIGN KEY (idHotel) REFERENCES Hotel(idHotel)
);

-- Tabela Quarto
CREATE TABLE Quarto (
  idQuarto INT PRIMARY KEY AUTO_INCREMENT,
  numLeitos INT,
  tipo VARCHAR(20),
  preco DECIMAL(10,2),
  status VARCHAR(20),
  idHotel INT,
  FOREIGN KEY (idHotel) REFERENCES Hotel(idHotel)
);

-- Tabela Hospede
CREATE TABLE Hospede (
  cpf CHAR(14) PRIMARY KEY,
  nome VARCHAR(100),
  telefone VARCHAR(20),
  email VARCHAR(100),
  rua VARCHAR(100),
  numero VARCHAR(10),
  complemento VARCHAR(50),
  bairro VARCHAR(50),
  cep VARCHAR(10),
  cidade VARCHAR(50),
  estado VARCHAR(2)
);

-- Tabela Reserva
CREATE TABLE Reserva (
  idReserva INT PRIMARY KEY AUTO_INCREMENT,
  dataEntrada DATE,
  dataSaida DATE,
  status VARCHAR(20),
  cpfHospede CHAR(14),
  cpfFuncionario CHAR(14),
  FOREIGN KEY (cpfHospede) REFERENCES Hospede(cpf),
  FOREIGN KEY (cpfFuncionario) REFERENCES Funcionario(cpf)
);

-- Tabela Pagamento
CREATE TABLE Pagamento (
  idPagamento INT PRIMARY KEY AUTO_INCREMENT,
  forma VARCHAR(20),
  data DATE,
  valor DECIMAL(10,2),
  status VARCHAR(20),
  idReserva INT UNIQUE,
  FOREIGN KEY (idReserva) REFERENCES Reserva(idReserva)
);

-- Tabela de associação entre Reserva e Quarto (Relacionamento N:N)
CREATE TABLE Reserva_Quarto (
  idReserva INT,
  idQuarto INT,
  PRIMARY KEY (idReserva, idQuarto),
  FOREIGN KEY (idReserva) REFERENCES Reserva(idReserva),
  FOREIGN KEY (idQuarto) REFERENCES Quarto(idQuarto)
);
