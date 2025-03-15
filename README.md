# Repositório de Desenvolvimento

Bem-vindo ao repositório de desenvolvimento da **Equipe Harpia**.

## Como usar este repositório

### 1. Clonar o repositório

    git clone git@github.com:harpia-drones/development.git
    cd development

### 2. Construir e iniciar o container

Use o Docker Compose para construir e iniciar o ambiente:

    docker-compose up -d

### 3. Acessar o container

Para acessar o terminal do container, utilize:

    docker exec -it harpia bash

### 4. Configurações iniciais

Ao entrar no container o diretório atual será /root/harpia_ws. Execute o script de inicialização que está dentro da pasta src/:

    bash ./src/start.sh

Esse script faz as configurações iniciais. Valide as configurações com

    bashrc

Instale a PX4 rodando

    setup

Após a esse passo, será solicitado que o container seja reiniciado. Para reiniciar o container, saia do container com ctrl + D ou rodando "exit" no terminal. Fora do container execute:

    docker restart harpia

Acesse o container novamente e rode o script de start.sh novamente. Após a conclusão dessa fase, a PX4-Autopilot e o Micro-XRCE-DDS estarão devidamente instalados. Verifique se a instalação foi bem sucedida executando:

    cd /root/PX4-Autopilot
    make px4_sitl gz_x500

Obs.: Se o gazebo abrir SEM o drone spawnado, cancele a operação com ctrl + C e rode novamente

    make px4_sitl gz_x500

Após a verificação, o próximo passo é instalar o QGroundControl:

    tmux
    su - harpia -s /bin/bash
    setup

Isso iniciará a preparação para a instalação, e ao terminar será solicitado que o container seja reiniciado. Após o container ser reiniciado, acesse o container e rode os mesmo três últimos comandos. Ao final a instalação do QGroundControl será concluida, e o ambiente está pronto para ser usado. Reinicie o container, abra o tmux e divida o terminal em quatro janelas.  Na primeira janela, acesse a pasta da px4 e inicie o simulador

    cd /root/PX4-Autopilot
    make px4_sitl gz_x500

Obs.: garanta que o gazebo abra COM o drone, como já instruído acima.
Na segunda janela, rode o agente Micro-XRCE

    MicroXRCEAgent udp4 -p 8888

Na terceira janela, acesse o usuário harpia e rode o QGroundControl

    su - harpia -s /bin/bash
    qgc

Na quarta janela, rode o código para levantar voo

    cd /root/harpia_ws
    ros2 run px4_ros_com offboard_control

Se tudo funcionar bem, o drone vai levantar voo no gazebo.

Utilidades:

## Usando multiplos terminais

Ao acessar o terminal bash do container, inicie uma nova seção do tmux, executando:

    tmux
 
> Comandos tmux:

- **Dividir horizontalmente**: ctrl + b, %
- **Dividir verticalmente**: ctrl + b, "
- **Fechar um terminal**: exit
- **Navegar entre os terminais de uma mesma sessão**: crtl + seta

## Estrutura do diretório

```
    development/
    ├── harpia_ws/
    │   └── src/ 
    │       └── Makefile
    │       └── start.sh
    ├── compose.yaml
    └── Dockerfile
```

## Descrição dos arquivos

- **compose.yaml**: Configuração do Docker Compose para o container.
- **Dockerfile**: Especificações para construir a imagem do ROS2 e Gazebo.
- **Makefile**: Script de automatização de criação de pacotes.
- **start.sh**: Script de configuração do ambiente.
