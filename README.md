# Repositório de Desenvolvimento

Bem-vindo ao repositório de desenvolvimento da **Equipe Harpia**.

## Como usar este repositório

### 1. Clonar o repositório

```bash
git clone git@github.com:harpia-drones/development-nvidia.git
mv development-nvidia development
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

Ao final a instalação do QGroundControl será concluida, e o ambiente está pronto para ser usado. 

Para verificar a instalação, construia o workspace do ros2 e compile o gazebo pela primeira vez.

```bash
cb
cd ~/PX4-Autopilot && PX4_GZ_WORLD=eletroquad make px4_sitl gz_x500_mono_cam
```

A primeira compilação do gazebo é um pouco demorada. Uma vez que os arquivos foram compilados, as proximas vezes que o gazebo for aberto será mais rápido.

Feche o gazebo dando CRTL + c no terminal em que ele está rodando. Uma vez fechado, inicie a simulação completa (todos os softwares de simulação serão abertos).

```bash
ros2 launch offboard_control_bringup simulation.launch.py && tmux attach-session -t simulation
```

Esse comando iniciará o MicroXRCE, PX4 SITL + Gazebo + ros_gz_bridge, duas janelas de visualizaçao para câmeras e o QGroundControl em uma sessão do tmux chamada ```simulation``` e anexará à essa sessão:

Utilidades:

## Usando multiplos terminais

Ao acessar o terminal bash do container, inicie uma nova seção do tmux, executando:

```bash
tmux
```
 
> Comandos tmux:

- **Dividir horizontalmente**: ctrl + b, %
- **Dividir verticalmente**: ctrl + b, "
- **Fechar um terminal**: exit
- **Navegar entre os terminais de uma mesma sessão**: crtl + seta

## Solução de Problemas

### Desempenho lento no Gazebo com GPU NVIDIA (WSL2 ou nativo)

Se você estiver usando o Gazebo com uma GPU NVIDIA e notar desempenho lento, é possível habilitar a aceleração por GPU manualmente:

1. No seu arquivo `compose.yaml`, adicione o bloco abaixo **embaixo de `harpia:`**, no mesmo nível de indentação que `build` e `container_name`:

    ```yaml
    deploy:                                         # Enable GPU access
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: all
              capabilities: [gpu]
    ```

2. Para evitar que essa configuração local seja enviada para o repositório, adicione o arquivo ao `.gitignore`:

    ```bash
    echo "compose.yaml" >> .gitignore
    ```


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
