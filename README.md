# Repositório de Desenvolvimento

Bem-vindo ao repositório de desenvolvimento da **Equipe Harpia**.

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
bash /root/config/clone-basic-packages.sh

```

Esse script se clona os pacotes `offboard_control`, `offboard_control_bringup` e `px4_msgs`, que usamos como base para o desenvolvimento dos códigos.

### 6. Validar as alterações no shell atual

```bash
bashrc
```

### 7. Validação dos softwares de simulação

```bash
cd ~/PX4-Autopilot
make px4_sitl gz_x500_mono_cam
```

A primeira compilação do gazebo é um pouco demorada. Uma vez que os arquivos foram compilados, as proximas vezes que o gazebo for aberto será mais rápido.

Feche o gazebo dando `CRTL + c` no terminal em que ele está rodando. Uma vez fechado, inicie a simulação completa (todos os softwares de simulação serão abertos).

```bash
ros2 launch offboard_control_bringup simulation.launch.py && tmux attach-session -t simulation
```

Esse comando iniciará o `MicroXRCE`, `PX4 SITL` + `Gazebo` + `ros_gz_bridge`, duas janelas de visualizaçao para câmeras e o QGroundControl em uma sessão do tmux chamada ```simulation``` e anexará à essa sessão.

## Estrutura do diretório

```
    development/
    ├── harpia_ws/
    │   └── src/ 
    │       └── Makefile
    ├── .dockerignore
    └── compose.yaml
```

## Descrição dos arquivos

- **.dockerignore**: Arquivo de suporte à contrução do container.
- **compose.yaml**: Configuração do Docker Compose para o container.
- **Makefile**: Script de automatização de criação de pacotes.