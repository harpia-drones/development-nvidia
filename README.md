# Repositório de Desenvolvimento

Bem-vindo ao repositório de desenvolvimento da **Equipe Harpia**.

VERSÃO: ``Com`` suporte à aceleração por hardware usando GPU Nvidia.

## Como usar este repositório

### 1. Clonar o repositório

```bash
git clone git@github.com:harpia-drones/development-nvidia.git
mv development-nvidia/ development/
```

### 2. Acessar o diretório ```development``` que acabou de ser clonado.

```bash
cd development
```

### 3. Criar o container

```bash
docker compose up -d
```

### 4. Acessar o container

```bash
docker exec -it harpia bash
```

### 5. Clonar os pacotes base

```bash
clone-base-packages
```

Esse script clona os pacotes `movement_controller`, `simulation_bringup` e `px4_msgs`, que usamos como base para o desenvolvimento dos códigos.

### 6. Sincronizar as mensagem da PX4-Autopilot com as do pacote px4_msgs

```bash
sync-px4-msgs
```

### 7. Compilar os pacotes

```bash
cb
```

## Utilidades

### 1. Iniciar softwares de simulação

```bash
sim                 # ros2 launch simulation_bringup simulation.launch.py && tmux attach-session -t simulation
```

Esse comando iniciará o `MicroXRCE`, `PX4 SITL` + `Gazebo` + `ros_gz_bridge`, uma janela de visualizaçao para câmeras e o QGroundControl em uma sessão do tmux chamada ```simulation``` e anexará à essa sessão.

### 2. Colcon build

```bash
cb                   # colcon build padrão
cb <pkg1> <pkg2>     # colcon build --packages-select <pkg1> <pkg2>
cbsi                 # colcon build --symlink-install
cbsi <pkg1> <pkg2>   # colcon build --packages-select <pkg1> <pkg2> --symlink-install
cbpi <pkg1> <pkg2>   # colcon build --packages-ignore <pkg1> <pkg2>
```

### 3. Aplicar atualizações no .bashrc

```bash
bashrc               # source .bashrc
```

### 4. Abrir um visualizador de imagem do rqt

```bash
view                 # ros2 run rqt_image_view rqt_image_view
```

## Estrutura do diretório

```
    development/
    ├── harpia_ws/
    │   └── src/ 
    │       └── Makefile
    ├── compose.yaml
    └── README.md
```

## Descrição dos arquivos

- **compose.yaml**: Configuração do Docker Compose para criação do container.
- **Makefile**: Script de automatização de criação de pacotes.