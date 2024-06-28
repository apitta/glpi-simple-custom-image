
# GLPI Custom Image

Essa imagem oferece uma instalação nova e completa do GLPI. 

O GLPI é um webapp opensource francês, que permite que times ao redor do mundo, organize os pedidos, gerencie serviços e infraestrutura, dando melhores respostas as necessidades de negócio e da TI.

Essa imagem customizada do GLPI é composta por um servidor web apache, o php 8.3 com o módulo de integração com o servidor web, o glpi versão 10.0.15 e por fim openssh. 

Essa imagem de container não inclui o banco de dados mysql e esse poderá rodar em um recurso instalado em qualquer lugar.


## Funcionalidades

- Instalação nova em container
- Servidor web (apache)
- PHP 8.3
- SSHD
- Exposição da porta 80
- Exposição da porta 2222
- Customização de configurações



## Gerando a image localmente

Crie a imagem localmente a partir do Dockerfile. A partir do diretório raiz desse projeto, execute:

```bash
  docker build -t glpi-custom --build-arg PASSWORD=password .
```

## Executando GLPI

Após gerar a imagem customizada do GLPI, você poderá executar uma instância.

```bash
   docker run --name glpi-instance -p 8000:80 -p 2222:2222 glpi-custom:latest
```


## Autores

- [@apitta](https://www.github.com/apitta)

