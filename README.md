# Repositório de Desenvolvimento

Bem-vindo ao repositório de desenvolvimento da **Equipe Harpia**.

## Como usar este repositório

### 1. Clonar e renomear o repositório

```bash
git clone git@github.com:harpia-drones/development-nvidia.git
mv development-nvidia development
```

### 2. Acessar o diretório ```development``` que acabou de ser clonado.

```bash
cd development
```

### 3. Executar o script harpia.sh

```bash
bash harpia.sh
```

Esse script se encarregada de criar e configurar o container.

### 4. Acessar o container

Uma vez que o script ```harpia.sh``` terminou de rodar, execute o comando abaixo para acessar o container.

```bash
docker exec -it harpia bash
```

### 5. Compilar os pacotes ROS 2 dentro do container

Ao abrir o container o diretório atual será ```~/harpia_ws```. O comando ```cb``` (alias para "colcon build") SEMPRE deve ser rodado dentro desse diretório.

```bash
cb
```

### 6. Compilar o gazebo pela primeira vez

```bash
cd ~/PX4-Autopilot
make px4_sitl gz_x500_mono_cam
```

A primeira compilação do gazebo é um pouco demorada. Uma vez que os arquivos foram compilados, as proximas vezes que o gazebo for aberto será mais rápido.

Feche o gazebo dando `CRTL + c` no terminal em que ele está rodando. Uma vez fechado, inicie a simulação completa (todos os softwares de simulação serão abertos).

```bash
ros2 launch offboard_control_bringup simulation.launch.py && tmux attach-session -t simulation
```

Esse comando iniciará o MicroXRCE, PX4 SITL + Gazebo + ros_gz_bridge, duas janelas de visualizaçao para câmeras e o QGroundControl em uma sessão do tmux chamada ```simulation``` e anexará à essa sessão.

## Estrutura do diretório

```
    development-nvidia/
    ├── harpia_ws/
    │   └── src/ 
    │       └── Makefile
    ├── .dockerignore
    ├── compose.yaml
    └── harpia.sh
```

## Descrição dos arquivos

- **.gitignore**: Arquivo de suporte à contrução do container.
- **compose.yaml**: Configuração do Docker Compose para o container.
- **Makefile**: Script de automatização de criação de pacotes.
- **harpia.sh**: Script de automatização de criação do container.
