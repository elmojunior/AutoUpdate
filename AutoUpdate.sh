#!/bin/bash

## AutoUpdate
# 
# @elmojunior <http://elmojunior.com>
# @version 1.4.2
# 
# Script criado para realizar a 
# atualização automática do sistema.
# Este procedimento está programado
# para ser executado a cada intervalo.
##

# Variáveis
NOME="AutoUpdate"
VERSAO="1.4.2"
ARQLOG="/home/$USER/$NOME.md"
DATAHORA=$(date +%d/%m/%Y" - "%H:%M:%S)

# Cabeçalho
echo "" >> $ARQLOG
echo "## $NOME" >> $ARQLOG
echo "*Versão $VERSAO*" >> $ARQLOG
echo "*$DATAHORA*" >> $ARQLOG
echo "" >> $ARQLOG

# Verifica atualizações
echo "#### Verificando por atualizações..." >> $ARQLOG
echo "**Comando:** apt update" >> $ARQLOG
echo "\`\`\`shell" >> $ARQLOG
apt update >> $ARQLOG
echo "\`\`\`" >> $ARQLOG
echo "" >> $ARQLOG

# Atualiza o sistema
echo "#### Atualizando o sistema..." >> $ARQLOG
echo "**Comando:** pkcon update -y" >> $ARQLOG
echo "\`\`\`shell" >> $ARQLOG
pkcon update -y >> $ARQLOG
echo "\`\`\`" >> $ARQLOG
echo "" >> $ARQLOG

# Rodapé
echo "#### Atualização concluída" >> $ARQLOG
echo "*$DATAHORA*" >> $ARQLOG
echo ""
echo "---" >> $ARQLOG

# Espaçamento para a próxima execução
echo "" >> $ARQLOG
echo "" >> $ARQLOG
echo "" >> $ARQLOG

# Exibe notificação
kdialog --title "AutoUpdate" --icon "update-none" --passivepopup "Sua atualização automática foi executada com sucesso." 5 
