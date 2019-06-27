#!/bin/bash
############################################################################################
#
# Bob utilities script bash 
#
version="2019.01"               											# Versão do Programa
#
scriptFileVersion="1.0.0" 													# Versão do script
#
# History:
# 	0.0.1    script version inicial, estrutura de diretorio.
#   2019.01  Dividido em diretorios criação de route e tipando de forma MVC (23/06/2019)
#
# Dependências:
#	function Dependencias()
#
# * Retorno: n/a
# * Data: n/a
#
# by: Elizeu de Santana -------------------------------------------------------------------


# by: Elizeu de Santana / 08-06-2019 -------------------------------------------------------
function checa_data(){
	### Função auxiliar para agenda, verifica data para o formato mysql ###
    [ $(echo "$1" | sed 's,[12][0-9]\{3\}/\(0[1-9]\|1[012]\)/\(0[1-9]\|[12][0-9]\|3[01]\),,') ] &&
    return 1 || return 0
}

# by: Elizeu de Santana / 08-06-2019 -------------------------------------------------------
function linha(){
	### Retorna quantas linhas a query SQL alterou na base de dados ###
  	sed -n '/^Query/s/.*, \([0-9]\+\) row.*/\1/p'
 }

# by: Elizeu de Santana / 08-06-2019 -------------------------------------------------------
function data_mysql-to-brasil(){
	### converte data de aaaa-mm-dd para dia/mes/ano ###
	echo "$*" | sed 's,\([0-9]\{4\}\)-\([0-9][0-9]\)-\([0-9][0-9]\),\3/\2/\1,'
}

# by: Elizeu de Santana / 08-06-2019 -------------------------------------------------------
function criaBD(){
	### Função auxiliar para agenda, cria BD mysql ###
	$sql_root "drop database $agenda_DB;";
	$sql_root "create database $agenda_DB;";
	$sql_root "grant usage on *.* to $sql_user_name@localhost identified by '$sql_user_senha';";
	$sql_root "grant usage on *.* to $sql_user_name@'%' identified by '$sql_user_senha';";
	$sql_root "grant create, drop, select, insert, update, delete on $agenda_DB.* to $sql_user_name@localhost;";
	$sql_root "grant create, drop, select, insert, update, delete on $agenda_DB.* to $sql_user_name@'%';";
	$sql_root "flush privileges;";
	$sql_user "use $agenda_DB;";
	$sql_user "drop table $agenda_tabela;";
	$sql_user "create table if not exists $agenda_tabela (nome VARCHAR(50) NOT NULL PRIMARY KEY, telefone VARCHAR(150), email VARCHAR(100), aniversario DATE);" $agenda_DB;
	$sql_user "drop table $lembrete_tabela;";
	$sql_user "create table if not exists $lembrete_tabela (lembrete VARCHAR(500) NOT NULL PRIMARY KEY, mes VARCHAR(10), dia VARCHAR(10));" $agenda_DB;
	$sql_user "\q";
	#tmp="[client] \npassword=senha"; cat $tmp > /home/elizeu/.my.cnf
	Agenda

# MUSER="root"
# MPASS="MYSQL-ROOT-PASSWORD"
# MHOST="localhost"
# MYSQL="$(which mysql)"
# MYSQLDUMP="$(which mysqldump)"
# BAK="/backup/mysql"
# GZIP="$(which gzip)"
# ### FTP SERVER Login info ###
# FTPU="FTP-SERVER-USER-NAME"
# FTPP="FTP-SERVER-PASSWORD"
# FTPS="FTP-SERVER-IP-ADDRESS"
# NOW=$(date +"%d-%m-%Y")
 
# ### See comments below ###
# ### [ ! -d $BAK ] && mkdir -p $BAK || /bin/rm -f $BAK/* ###
# [ ! -d "$BAK" ] && mkdir -p "$BAK"
 
# DBS="$($MYSQL -u $MUSER -h $MHOST -p$MPASS -Bse 'show databases')"
# for db in $DBS
# do
#  FILE=$BAK/$db.$NOW-$(date +"%T").gz
#  $MYSQLDUMP -u $MUSER -h $MHOST -p$MPASS $db | $GZIP -9 > $FILE
# done
 
# lftp -u $FTPU,$FTPP -e "mkdir /mysql/$NOW;cd /mysql/$NOW; mput /backup/mysql/*; quit" $FTPS

}

# by: Elizeu de Santana / 08-06-2019 -------------------------------------------------------
function SearchRegistro(){  
	### Procurar porque não funciona ###
	### Testa pra ver se é procura exata ou parcial ###
	if [ "$*" = "${*#*\*}" ];then 
		# procura exata
		S=$($sql_user "select * from $agenda_tabela where nome = '$*'" $agenda_DB)
	# Procura por partes do nome
	else
		# ${*//\\*/%} = troca todos * por %, que é o curinga do LIKE
		S=$($sql_user "select * from $agenda_tabela where nome like '%$($1)%'" $agenda_DB)
	fi
	# a procura retornou algum registro ?!
  	[ "$S" ] || { echo "Registro não encontrado";Agenda; }
  
	# colocar um TAB como IFS
	IFS="$(echo -e '\t')"
	# Apagamos a primeira linha, pois ela contém o nome dos campos
	S=$(echo "$S" | sed '1d')
	
	# colocamos um espaço em branco entre TABs repetidos (\t\t)
	echo "$S" | sed ":a;s/\(`echo -e '\t'`\)\(\1\)/\1 \2/;ta" | \
	while read nome fone mail aniver; do
  		echo " Nome       : $nome"
		echo " Telefone   : $fone"
		echo " E-mail     : $mail"
		echo " Aniversário: $(data_mysql-to-brasil $aniver)"
	done 
}

# by: Elizeu de Santana / 08-06-2019 -------------------------------------------------------
function DeletaRegistro(){
	### Testa pra ver se é procura exata ou parcial ###
	if [ "$*" = "${*#*\*}" ];then # procura exata
		S=$(mysql -vv -u $sql_user_name -e \
		"delete from $agenda_tabela where nome = '$*'" $agenda_DB | linha)
		
		[ $S -eq 0 ] && echo "Registro não encontrado" || echo "Foram deletado(s) $S registro(s)"
	
	# Procura por partes do nome
	else
		S=$(mysql -vv -u $sql_user_name -e \
		"delete from $agenda_tabela where nome like '${*//\\*/%}'" $agenda_DB | linha)
		[ $S -eq 0 ] && echo "Registro não encontrado" || echo "Foram deletado(s) $S registro(s)"
	fi
}

# by: Elizeu de Santana / 02-06-2019 -------------------------------------------------------
function EditaRegistro(){
	### testa se o campo a alterar é válido ###
	[ "$1" != nome -a "$1" != telefone -a "$1" != email -a "$1" != aniversario ] &&
	{ echo "Campos Validos: nome telefone email aniversario";Agenda; }
	campo=$1
	shift
	if [ "$campo" = "aniversario" ];then
		read -n2 -p "Novos dados para Aniversário (dia/mes/ano): " dia
		read -n2 -p "/" mes
		read -n4 -p "/" ano
		dados="$ano/$mes/$dia"
		echo
		checa_data "$dados" || { echo "ERRO: Data de aniversário inválida";Agenda; }
	else
		read -p "Novos dados para $campo: " dados
		[ "$campo" = "nome" -a ! "$dados" ] && { echo "ERRO: nome inválido";Agenda; }
	fi
	
	if [ "$*" = "${*#*\*}" ];then # procura exata
		S=$(mysql -vv -u $sql_user_name -e \
		"update $agenda_tabela set $campo='$dados' where nome = '$*'" $agenda_DB | linha)	
		[ $S -eq 0 ] && echo "Registro não encontrado" || echo "Foram alterado(s) $S registro(s)"
	else
		S=$(mysql -vv -u $sql_user_name -e \
		"update $agenda_tabela set $campo='$dados' where nome like '${*//\\*/%}'" $agenda_DB | linha)
		[ $S -eq 0 ] && echo "Registro não encontrado" || echo "Foram alterado(s) $S registro(s)"
	fi
}

# by: Elizeu de Santana / 21-06-2019 -------------------------------------------------------
function mycli_db(){
	### Inicia mycli mysql & Ppython ###
	Titulo_Inicial;	
	$(mycli -u $sql_user_name -psenha $agenda_DB)
	Agenda
}