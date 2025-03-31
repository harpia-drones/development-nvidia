# Repositório de Desenvolvimento

Bem-vindo ao repositório de desenvolvimento da **Equipe Harpia**.

## Como usar este repositório

### 1. Clonar o repositório

    ```bash
    git clone git@github.com:harpia-drones/development.git
    cd development
    ```

### 2. Preparação para contruir o container

Acesse o diretório ```development``` que acabou de ser clonado.

    ```bash
    cd development
    ```
e rode

    ```bash
    echo "DOCKERFILE_PATH=$(pwd)/Dockerfile" >> .env
    echo "HOME=$(echo $HOME)" >> .env
    ```

### 3. Construir e iniciar o container

Use o Docker Compose para construir e iniciar o ambiente.

    ```bash
    docker compose up -d --build
    ```

### 3. Acessar o container

Para acessar o terminal do container, utilize:

    ```bash
    docker exec -it harpia bash
    ```

### 4. Configurações iniciais

Ao entrar no container o diretório atual será /root/harpia_ws. Execute o script de inicialização que está dentro da pasta src/ com o comando:

    ```bash
    start
    ```

Esse script faz as configurações iniciais. Valide as configurações com

    ```bash
    bashrc
    ```

Instale a PX4 rodando

    ```bash
    setup
    ```

Após a esse passo, será solicitado que o container seja reiniciado. Para reiniciar o container, saia do container com ctrl + D ou rodando "exit" no terminal. Fora do container execute:

    ```bash
    docker restart harpia
    ```

Acesse o container novamente e rode setup novamente. Após a conclusão dessa fase, a PX4-Autopilot e o Micro-XRCE-DDS estarão devidamente instalados. O próximo passo é instalar o QGroundControl:

    ```bash
    setup
    ```

Ao final a instalação do QGroundControl será concluida, e o ambiente está pronto para ser usado. Para verificar a instalação, construia o workspace do ros2 e rode a launch de display dos programas usados na simulação:

    cb
    ros2 launch offboard_control_bringup simulation.display.py

Esse comando iniciará o MicroXRCE, PX4 SITL + Gazebo + ros_gz_bridge, duas janelas de visualizaçao para câmeras e o QGroundControl em uma sessão do tmux chamada ```simulation```. Anexe à essa sessão:

    tmux attach-session -t simulation


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
