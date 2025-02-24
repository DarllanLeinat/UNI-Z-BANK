Proposta de Projeto para Banco de Dados de uma Fintech
Curso: Ciência da Computação
Disciplina: Banco de Dados e Aplicações
Título: Desenvolvimento de um Sistema de Banco de Dados para uma Fintech
Objetivos do Projeto:
1. Desenvolver um banco de dados relacional para uma Fintech utilizando o MySQL,
capaz de gerenciar contas bancárias, transações financeiras e histórico de
operações.
2. Implementar controle de transações para garantir a integridade dos dados em
operações críticas, seguindo as propriedades ACID (Atomicidade, Consistência,
Isolamento e Durabilidade).
3. Utilizar Triggers e Stored Procedures para automatizar tarefas e aumentar a
eficiência e segurança do banco de dados.
4. Gerenciar concorrência entre diferentes operações usando níveis de isolamento
adequados para evitar problemas como leitura suja, leituras não repetíveis e
phantom reads.
5. Simular cenários práticos de transações financeiras que incluam transferências
entre contas, saques e depósitos, assegurando a consistência e a segurança das
operações.
Descrição do Projeto:
A Fintech que vocês irão modelar deve ser capaz de gerenciar contas de clientes e
realizar transações financeiras seguras, tais como:
Abertura de conta
Depósitos
Saques
Transferências entre contas
Consultas de saldo
Geração de extratos
Cartão de Crédito
Empréstimos
Os alunos serão responsáveis por projetar o esquema do banco de dados e implementar as
funcionalidades com o uso de Triggers, Stored Procedures e controle de Transações.
Requisitos Funcionais do Sistema:
1. Gerenciamento de Contas Bancárias:
Criação de novas contas (com informações como nome do cliente, CPF,
saldo inicial, etc.).
Atualização e consulta de saldo de uma conta.
2. Transações Bancárias:
Depósito: Creditar valor na conta.
Saque: Debitar valor de uma conta, garantindo que o saldo não fique
negativo.
