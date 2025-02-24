Sistema de Banco de Dados para uma Fintech

Curso: Ciência da Computação
Disciplina: Banco de Dados e Aplicações
Título: Desenvolvimento de um Sistema de Banco de Dados para uma Fintech

Descrição do Projeto
Este projeto consiste no desenvolvimento de um banco de dados relacional para uma Fintech utilizando o MySQL , com foco na gestão de contas bancárias, transações financeiras e histórico de operações. O sistema foi projetado para garantir a integridade dos dados em operações críticas, seguindo as propriedades ACID (Atomicidade, Consistência, Isolamento e Durabilidade).

O banco de dados implementa funcionalidades como abertura de conta, depósitos, saques, transferências entre contas, consultas de saldo, geração de extratos, cartão de crédito e empréstimos . Além disso, foram utilizados Triggers e Stored Procedures para automatizar tarefas e aumentar a eficiência e segurança das operações. A concorrência entre operações é gerenciada por meio de níveis de isolamento adequados , evitando problemas como leitura suja, leituras não repetíveis e phantom reads.

Objetivos do Projeto
Desenvolver um banco de dados relacional para uma Fintech capaz de gerenciar contas bancárias e transações financeiras.
Implementar controle de transações que sigam as propriedades ACID, garantindo a integridade dos dados.
Utilizar Triggers e Stored Procedures para automatizar tarefas e aumentar a eficiência e segurança.
Gerenciar concorrência entre operações usando níveis de isolamento adequados.
Simular cenários práticos de transações financeiras, como transferências, saques e depósitos, assegurando consistência e segurança.
Funcionalidades Principais
1. Gerenciamento de Contas Bancárias
Criação de novas contas (com informações como nome do cliente, CPF, saldo inicial, etc.).
Atualização e consulta de saldo de uma conta.
2. Transações Bancárias
Depósito: Creditar valor na conta.
Saque: Debitar valor de uma conta, garantindo que o saldo não fique negativo.
Transferências: Realizar transferências entre contas, garantindo consistência nos saldos.
Consulta de Saldo: Verificar o saldo disponível em uma conta.
Geração de Extratos: Exibir o histórico de transações de uma conta.
3. Outras Funcionalidades
Cartão de Crédito
Empréstimos
Tecnologias Utilizadas
MySQL: Banco de dados relacional utilizado para armazenar e gerenciar os dados.
Triggers: Automatização de validações e atualizações automáticas no banco de dados.
Stored Procedures: Funções pré-definidas para executar operações complexas de forma eficiente.
Controle de Transações: Implementação de operações seguras que seguem as propriedades ACID.
Como Executar o Projeto
Pré-requisitos:
Instale o MySQL em sua máquina.
Certifique-se de ter acesso a uma ferramenta de gerenciamento de banco de dados, como MySQL Workbench ou CLI.
Configuração Inicial:
Clone este repositório:

git clone https://github.com/DarllanLeinat/UNI-Z-BANK

Importe o script SQL fornecido (database.sql) para criar o banco de dados e suas tabelas.

Execução:
Execute as Stored Procedures e Triggers conforme necessário para realizar operações no banco de dados.
Simule transações financeiras para testar a integridade e segurança das operações.
Estrutura do Banco de Dados
O esquema do banco de dados inclui as seguintes tabelas principais:

Clientes: Armazena informações sobre os clientes (nome, CPF, etc.).
Contas: Gerencia as contas bancárias (número da conta, saldo, tipo de conta, etc.).
Transações: Registra todas as transações realizadas (depósitos, saques, transferências, etc.).
Extratos: Mantém o histórico detalhado das operações de cada conta.
