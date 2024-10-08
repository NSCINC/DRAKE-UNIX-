#!/bin/bash

# Instala Node.js e npm usando Homebrew
echo "Instalando Node.js e npm..."
brew install node

# Verifica se a instalação foi bem-sucedida
if command -v node &> /dev/null; then
    echo "Node.js instalado. Versão: $(node -v)"
else
    echo "Falha na instalação do Node.js."
fi
