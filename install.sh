#!/bin/bash

# Zjištění absolutní cesty k adresáři, kde se nachází tento skript install.sh
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo "=== Instalace SMGP Regressoru pro SRBench ==="

TARGET_DIR="$SCRIPT_DIR/smgp_src"

# 1. Stažení zdrojových kódů z tvého GitHubu
if [ -d "$TARGET_DIR" ]; then
    echo "Složka smgp_src již existuje, aktualizuji kód..."
    cd "$TARGET_DIR" && git pull
else
    echo "Stahuji zdrojové kódy z GitHubu..."
    git clone https://github.com/MichalicekPetr/SRBench-SMGPRegressor-Src-Files.git "$TARGET_DIR"
fi

# 2. Instalace závislostí PŘÍMO z requirements.txt, který se zrovna stáhl z GitHubu
echo "Instaluji Python knihovny podle requirements.txt..."
pip install -r "$TARGET_DIR/requirements.txt"

echo "=== Instalace dokončena úspěšně ==="