# Funções e Atalhos do Container

Referência rápida dos comandos disponíveis dentro do container `harpia`.

---

## Pacotes pré-compilados

O container já vem com os seguintes pacotes compilados no workspace `/root/px4_ws`:

| Pacote | Descrição |
|---|---|
| `px4_msgs` | Mensagens ROS2 da PX4-Autopilot |
| `as2_platform_pixhawk` | Plataforma Aerostack2 para Pixhawk |

> Esses pacotes são carregados automaticamente pelo `.bashrc` do container. Não é necessário cloná-los ou compilá-los manualmente.

---

## Colcon Build — `cb`

Atalhos para compilar pacotes ROS2 no workspace `harpia_ws`:

```bash
cb                         # colcon build padrão
cb <pkg1> <pkg2>           # colcon build --packages-select <pkg1> <pkg2>
cbsi                       # colcon build --symlink-install
cbsi <pkg1> <pkg2>         # colcon build --packages-select <pkg1> <pkg2> --symlink-install
cbpi <pkg1> <pkg2>         # colcon build --packages-ignore <pkg1> <pkg2>
```

---

## PX4 — `px4`

Função para gerenciar o firmware da PX4-Autopilot (build, upload e simulação).

### Uso

```bash
px4 <comando> [opções]
```

### Comandos disponíveis

| Comando | Descrição |
|---|---|
| `px4 clean` | Limpa os builds de firmwares anteriores |
| `px4 build` | Compila o firmware para a placa `fmu-v6c` |
| `px4 upload` | Faz upload do firmware para a placa conectada |
| `px4 sim` | Inicia a simulação SITL com Gazebo |

### Simulação — `px4 sim`

```bash
px4 sim                    # make px4_sitl gz_x500  (frame x500, mundo default)
px4 sim <frame>            # make px4_sitl gz_<frame>
px4 sim <frame> <world>    # make px4_sitl gz_<frame>_<world>
```

**Exemplos:**

```bash
px4 sim                    # Inicia simulação com x500 no mundo vazio (default)
px4 sim x500_depth         # Inicia simulação com x500_depth no mundo default
px4 sim x500 baylands      # Inicia simulação com x500 no mundo baylands
```

---

## QGroundControl — `qgc`

Abre o QGroundControl:

```bash
qgc
```
