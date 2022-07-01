#!/bin/bash
#Diretório de execução do script: /home/valcann/backupsFrom
#Criar um CRONJOB para a execução do scrip de forma automatizada/agendada

HORA=`date +%H`
DATA=`date +'%Y%m%d'`
TIPO="pm"

#Definição das variáveis
LOGFILE=/home/valcann/backupsFrom.log
DESTINO=/home/valcann/backupsTo
LOGFILE2=/home/valcann/backupsTo.log

#Cria um diretório de backup para armazenar arquivos com data de criação menor ou igual a 3 (três) dias
mkdir $DESTINO

#lista arquivos no diretório em que o script está sendo executado
ls -l 

#Gera o arquivo de .log
ls -l >> $LOGFILE

if [ $? = 0 ]; then
   echo "`date +%c` - Resultado salvo com sucesso" >> $LOGFILE
else
   echo "`date +%c` - ERRO ao salvar o resultado" >> $LOGFILE
fi

#Remove arquivos com data de criação superior a 3 dias
find $ARQUIVO -mtime +3 -exec rm -rf "{}" \;

#Copia arquivos com data de criação <= a 3 dias para o diretório de backup
cp -R ./ /$DESTINO

#Lista o diretório atualizado e gera o arquivo .log
ls -l >> $LOGFILE2

if [ $? = 0 ]; then
   echo "`date +%c` - Resultado salvo com sucesso" >> $LOGFILE2
else
   echo "`date +%c` - ERRO ao salvar o resultado" >> $LOGFILE2
fi