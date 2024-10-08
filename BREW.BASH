#!/bin/bash

# Instala o Homebrew, o gerenciador de pacotes do macOS
if ! command -v brew &> /dev/null; then
    echo "Homebrew não encontrado. Instalando..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew já está instalado."
fi

# Atualiza o Homebrew
brew update
