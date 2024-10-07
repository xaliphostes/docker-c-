# Guide de dépannage

## Problèmes courants et solutions

1. **Le binaire ne s'exécute pas sur macOS**
   - Normal : le binaire est compilé pour Linux
   - Solution : toujours utiliser `run.sh` pour exécuter

2. **Erreurs de permission**
   - Problème : fichiers créés comme root dans le conteneur
   - Solution : ajouter `-u $(id -u):$(id -g)` aux commandes docker

3. **Performances lentes**
   - Cause : la synchronisation des volumes peut être lente
   - Solution : utiliser un volume Docker pour les fichiers objets

## Exemples de personnalisation

1. **Dockerfile avec plus d'outils**
```dockerfile
FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    gdb \
    cmake \
    make \
    valgrind \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /projet
```

2. **Script de compilation avec tests**
```bash
#!/bin/bash
set -e

./docker/scripts/compile.sh src/main.cpp -Wall -Wextra

echo "Exécution des tests..."
./docker/scripts/run.sh src/main test
```
