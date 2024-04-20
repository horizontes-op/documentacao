# Projeto Horizontes
Documentação oficial do projeto horizontes, um projeto sem fins lucrativos que abrirá os horizontes dos jovens brasileiros para as oportunidades que existem e fazem mais sentido para o seu perfil. 

Para essa primeira versão (MVP), objetivamos criar uma landing page onde o estudante pode preencher com seus dados e receber recomendações de instituições baseadas no match com as informações inseridas. Esse match é realizado através do envio das informações para a API do ChatGPT, retornando as principais instituições e motivo do match.

No momento a implementação conta com 3 microsserviços essenciais e alguns outros que serão necessários nas próximas etapas, apresentados a seguir.

## Organização dos microsserviços

Interface - Responsável por guardar as rotas que estão presentes no microsserviço, bem como as informações esperadas para enviar um request e receber a resposta. 


Implementação - Implementação do microsserviço de fato, onde é realizado o contato com o banco de dados e aplicadas as lógicas de negócio. 


## Microsserviços essenciais

### Aluno

Microsserviço responsável por gerenciar as informações dos alunos (pessoas em busca de oportunidades). O microsserviço de aluno conta com: 

[Interface aluno](https://github.com/horizontes-op/aluno)

[Implementação aluno](https://github.com/horizontes-op/aluno-resource)

### Instituição
Microsserviço responsável por gerenciar as informações das instituições e oportunidades cadastradas na plataforma, desde instituições de ensino superior, cursinhos para olimpíadas, vestibulares militares, entre outros. O microsserviço de instituição conta com: 

[Interface instituição](https://github.com/horizontes-op/instituicao)

[Implementação aluno](https://github.com/horizontes-op/aluno-resource)

### Recomendação
Microsserviço responsável por gerenciar as recomendações (matchs) entre um aluno e uma instituição parceira cadastrada na plataforma. Esse microsserviço recebe o id de um aluno cadastrado na base de dados, envia um request para a API do chatGPT, salva e apresenta as instituições recomendadas para o usuário final. O microserviço de recomendação conta com: 

[Interface recomendação](https://github.com/horizontes-op/recomendacao) 

[Implementação recomendação](https://github.com/horizontes-op/recomendacao-resource)


## Microsserviços que serão incorporados no futuro

### Account
Microsserviço responsável por gerenciar as contas presentes na plataforma. Para próximas versões, teremos diferentes tipos de usuário (como o admin, aluno, tutor, coordenador de instituição) que poderão realizar um login na plataforma. Esse microsserviço então será acoplado para integrar o ecossistema e permitir uma interação a longo prazo com a plataforma. Esse micrroserviço conta com:

[Interface account](https://github.com/horizontes-op/account)

[Implementação account](https://github.com/horizontes-op/account-resource)

### Auth

Microsserviço responsável por gerenciar autenticação da plataforma. Conta com uma implementação de Json Web Token (JWT) que é salvo no header da requisição para permitir verificar quem é o usuário (autenticação) e permitir acesso ao recurso que requisitou (caso tenha direito). Ele conta com: 

 
[Interface auth](https://github.com/horizontes-op/auth) 

[Implementação auth](https://github.com/horizontes-op/auth-resource)

## Microsserviços da infraestrutura

### Gateway

Microsserviço que recebe todas as requisições, valida a necessidade de autenticação e redireciona para o próximo microsserviço (discovery).  

[Implementação gateway](https://github.com/horizontes-op/gateway) 

### Discovery

Microsserviço que recebe uma requisição interna e redireciona para o microsserviço que implementa a rota buscada, pois ele tem o mapeamento de portas em que cada microserviço está operando, além de realizar o balanceamento de carga. Ele trabalha em conjunto com o gateway para que seja possível a requisição chegar até o microsserviço correto somente com a informação do endpoint.  

[Implementação discovery](https://github.com/horizontes-op/discovery)

### Jenkins 
Ferramenta utilizada para a implementação contínua, integração contínua e entrega contínua (CI/CD). Utilizamos para automatizar o deploy da aplicação. 

[Docker que roda o jenkins](https://github.com/horizontes-op/jenkins)

### Para rodar o projeto

Nesse projeto foi utilizado o docker compose para criar um ambiente mais próximo de uma implementação em produção, permitindo a execução de todos esses microsserviços em uma rede privada criada pelo docker, em que só o gateway precisa estar visível para máquinas externas. O repositório abaixo apresenta o docker compose utilizado: 

[docker_compose](https://github.com/horizontes-op/docker-compose)

Para executar o projeto só é preciso clonar os repositórios apresentados até então, numa mesma pasta e executar os comandos: 

``` bash
cd ./docker-compose
docker compose up -d --build
```
