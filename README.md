# Api responsavel por listar modulos

### Manual para utilização

#### Criando network
`make create-network`

#### Criando banco de dados
`make mysql`

***OBS>Verificar se não existe nenhum processo na port 3306 antes de rodar o comando acima. Após rodar o comando aguardar o container subir para seguir para os próximos passos

#### Criando schema e migrations
`make init-db`

***OBS>Comando responsável por criar a base de dados e as migrations necessárias

#### Iniciando stack
`make init-stack`

***OBS>Comando responsável por a subir aplicação e o nginx

#### Excluindo stack
`make delete-stack`

***OBS>Comando responsável por remover o network e os containers criados nos demais comandos

## Utilizando a api

Com todos os comandos rodando corretamente, será posível acessar o endereço `http://localhost:8080/` da sua máquina.

#### Link para a listagem de módulos

`http://localhost:8080/v1/module`
