# Instructions d'utilisation

## Étape initiale

1. **Rendre les scripts exécutables**
```bash
chmod +x docker/scripts/*.sh
```

2. **Creation de l'image `ubuntu-dev`**
```bash
./docker/scripts/build.sh
```

## Utilisation quotidienne

1. **Compilation d'un programme**
```bash
./docker/scripts/compile.sh src/main.cpp
```

2. **Exécution du programme compilé**
```bash
./docker/scripts/run.sh src/main
```

## Exemples d'utilisation

1. **Compilation avec options**
```bash
./docker/scripts/compile.sh src/main.cpp -O2 -Wall
```

2. **Exécution avec arguments**
```bash
./docker/scripts/run.sh src/main arg1 arg2
```

## Conseils pratiques

1. **Alias utiles** (à ajouter à ~/.bashrc ou ~/.zshrc)
```bash
alias docker-build='~/projet_dev/docker/scripts/build.sh'
alias docker-compile='~/projet_dev/docker/scripts/compile.sh'
alias docker-run='~/projet_dev/docker/scripts/run.sh'
```

2. **Shell interactif dans le conteneur**
```bash
docker run -it --rm -v "$(pwd)":/projet ubuntu-dev bash
```