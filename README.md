# Sistema de Controle e Gerenciamento de Ordem de Serviço para Oficina Mecânica

## Descrição do Projeto

Este projeto consiste na criação de um esquema conceitual de banco de dados para o contexto de uma oficina mecânica, baseado na narrativa fornecida no desafio. O objetivo é modelar as entidades, relacionamentos e atributos necessários para o controle e gerenciamento das ordens de serviço (OS) emitidas para os veículos que chegam à oficina.

O esquema foi desenvolvido a partir da seguinte narrativa:

- Clientes levam seus veículos para conserto ou revisão periódica.
- Cada veículo está associado a uma equipe de mecânicos.
- A equipe identifica e executa os serviços necessários, gerando uma OS com data de emissão, data prevista para conclusão, valor total, status, e observações.
- O valor da OS é calculado com base na soma do custo dos serviços (mão-de-obra) e das peças utilizadas.
- Cada mecânico possui código, nome, especialidade e telefone.
- Cada equipe possui um nome e é formada por um ou mais mecânicos.
- As peças possuem descrição, código de fornecedor, valor unitário e estoque disponível.
- Serviços possuem descrição e valor de mão-de-obra.
  
## Diagrama Entidade-Relacionamento (DER)

O esquema apresenta as seguintes entidades principais:

- **Cliente**: Contém informações dos clientes que levam veículos para a oficina.
- **Veículo**: Associado a um cliente, possui placa, marca, modelo e ano.
- **Equipe**: Grupo de mecânicos responsáveis pelas ordens de serviço.
- **Mecânico**: Profissional com especialidade, telefone e associado a uma equipe.
- **Ordem de Serviço (OS)**: Documento que registra a solicitação dos serviços para um veículo.
- **Serviço**: Serviços que podem ser aplicados na OS, com descrição e custo de Mão de obra.
- **Peça**: Componentes utilizados nas OS, com preço e estoque.
- **OS_Serviço**: Relação entre OS e serviços aplicados, com quantidade e custo aplicado.
- **OS_Peça**: Relação entre OS e peças utilizadas, com quantidade e custo aplicado.

O modelo completo está ilustrado no diagrama do banco de dados incluído no projeto.
