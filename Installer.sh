#!/bin/bash

## Install AutoUpdate
# 
# @elmojunior <http://elmojunior.com>
# @version 1.0.0
# 
# Script criado para instalar a 
# atualização automática do sistema.
## 


# Variáveis
# - Nome
NOME="AutoUpdate"
VERSAO="1.3.2"
# - Locais
SCRIPTS="/home/$USER/Scripts"
LOGS="/home/$USER/Logs"
CRONTEMP="$SCRIPTS/crontab"
# - Intervalos do Crontab
UMAHORA="0 * * * *" # Intervalos de 1 hora

# Cabeçalho
clear
echo ""
echo "Instalação do AutoUpdate"
echo "========================"
echo ""


# Cria pastas para armazenar os códigos do sistema
# - Scripts
if [ ! -d "$SCRIPTS" ]; then
    mkdir $SCRIPTS
    echo '
    [Desktop Entry]
    Icon=folder-script
    ' > $SCRIPTS/.directory
fi
# - Logs
if [ ! -d "$LOGS" ]; then
    mkdir $LOGS
    echo '
    [Desktop Entry]
    Icon=folder-text
    ' > $LOGS/.directory
fi



# Cria arquivos com os códigos do sistema
# - Scripts
if [ ! -e "$SCRIPTS/$NOME" ]; then
    touch $SCRIPTS/$NOME
fi
# - Logs
if [ ! -e "$LOGS/$NOME.md" ]; then
    touch $LOGS/$NOME.md
fi



# Altera as permissões para execução do sistema
sudo chmod +x $SCRIPTS/$NOME
sudo chmod 777 $LOGS/$NOME.md



# Instala o código do sistema
echo '
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
ARQLOG="/home/$USER/Logs/$NOME.md"
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
' > $SCRIPTS/$NOME



# Adiciona a linha de execução no Crontab
touch $CRONTEMP
sudo crontab -l > $CRONTEMP
echo "$UMAHORA       $SCRIPTS/$NOME" >> $CRONTEMP
sudo crontab $CRONTEMP


# Rodapé
echo ""
echo "Fim da instalação."
echo ""
