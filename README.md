# Repositório de Desenvolvimento

Bem-vindo ao repositório de desenvolvimento da **Equipe Harpia**.

VERSÃO: 
- ``COM`` suporte à aceleração por hardware usando GPU Nvidia.
- Imagem: `ufrjharpia/development:humble-px4`

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

### 3. Preparar os volumes do container

Antes de criar o container, é necessário criar os diretórios que serão montados como volumes:

```bash
mkdir -p harpia_ws/src
mkdir -p .git-identity && touch .git-identity/.gitconfig
```

> **harpia_ws/src** — workspace ROS2 onde seus pacotes serão desenvolvidos. Esse diretório é compartilhado entre o host e o container.
>
> **.git-identity/.gitconfig** — arquivo de configuração do Git dentro do container. Permite que sua identidade Git (nome e email) persista entre sessões.

### 4. Instalar as dependências

```bash
sudo chmod +x ./install-dependencies.sh
sudo ./install-dependencies.sh
```

### 5. Criar o container

```bash
docker compose up -d
```

### 6. Acessar o container

```bash
docker exec -it harpia bash
```

## Estrutura do diretório

```
    development/
    ├── harpia_ws/              
    │   └── src/                # volume
    ├── .git-identity/          # volume
    │   └── .gitconfig
    ├── compose.yaml            # arquivo de configuração
    └── README.md
```

## Descrição dos arquivos

- **compose.yaml**: Configuração do Docker Compose para criação do container.
- **.git-identity/.gitconfig**: Arquivo de configuração do Git, persistido localmente entre sessões do container.