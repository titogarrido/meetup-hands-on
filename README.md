# Getting started with Fabric and Composer

Esse documento descreve o Meetup com hands-on. Os arquivos necessários para a execução se encontram neste repositório.



## Pre-requisitos

- [x] Criar sua conta na Linux Community Cloud (https://developer.ibm.com/linuxone/request-a-trial/)
- [x] Noção Básica de Linux
- [x] Noção Básica de Programação
- [x] Cliente SSH



## Crie sua instancia

Para nosso exercício iremos utilizar uma instancia SuSE 12 SP3.

![](https://raw.githubusercontent.com/titogarrido/meetup-hands-on/master/img/flavor.png)

Depois de criado o seu servidor terá um IP válido. O usuário para acesso é *linux1* e utilizará a chave que você especificou quando criou a instância.

![](https://raw.githubusercontent.com/titogarrido/meetup-hands-on/master/img/server.png)



Utilize o cliente SSH de sua preferência com sua chave e acesse o servidor.

![](https://raw.githubusercontent.com/titogarrido/meetup-hands-on/master/img/ssh.png)

## Conteúdo Abordado

Nosso workshop consistirá nos seguintes tutoriais oficiais:

1. Iniciando no Composer Playground
   1. Entender a interface do framework
   2. O que são os models, logic e acls
   3. Criar um aplicação simples de teste
   4. Testa-la e exporta-la
2. Instalando seu ambiente de desenvolvimento
   1. Utilizando seu Linux no mainframe, vamos instalar o Hyperledger Composer e o Fabric para desenvolvimento.
   2. Vamos importar nossa aplicação para a rede de desenvolvimento.
   3. Demonstrar o acesso ao Blockchain via REST API.

## Iniciando no Composer Playground

Vamos começar seguindo o tutorial do Composer Playground:

[Tutorial Composer Playground](https://hyperledger.github.io/composer/latest/tutorials/playground-tutorial.html)

## Instalando seu ambiente de desenvolvimento

Como estamos utilizando o SuSE Linux no LinuxOne Community Cloud, vamos utilizar o arquivo "[suse-prereq.sh](https://github.com/titogarrido/meetup-hands-on/blob/master/suse-prereq.sh)" deste repositório. Siga os passos abaixo:

Acesse seu servidor: *ssh linux1@IP_DO_SEU_SERVER*

Com o usuário *linux1* clone o repositório para seu servidor:

```bash
git clone https://github.com/titogarrido/meetup-hands-on.git
```

Acesse a pasta do repositório e execute o script dos pre-reqs

```bash
cd meetup-hands-on
bash suse-prereq.sh
```

Ao final você terá o Docker, Python, Docker-Compose, NodeJS e o NPM instalados. Esses são os requisitos do Hyperledger Composer e Fabric.

Para a instalação do ambiente de desenvolvimento vamos utilizar o seguinte tutorial oficial:

[Installing the development environment](https://hyperledger.github.io/composer/latest/installing/development-tools.html)

