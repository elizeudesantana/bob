#!/bin/bash
############################################################################################
#
# Bob utilities script bash 
#
version="2019.01"               # Sets version variable
#
scriptFileVersion="1.0.0"
#
# History:
#   1.0.0  script version inicial, estrutura de diretorio.
#   2019.01  Dividido em diretorios criação de route e tipando de forma MVC (23/06/2019)
#
# Dependências:
#   function Dependencias()
#
# * Retorno: n/a
# * Data: n/a
#
# by: Elizeu de Santana -------------------------------------------------------------------


# -----------------------------------------------------------------------------------------
# Prover uma variavel com a pespectiva de localizações do script
# instalacao="/Projetos/bob";                                          # Diretorio de Instalação apartir de HOME
# scriptPath_Home="${HOME}";                                           # Diretorio HOME (~)
# scriptPath_Bob="${scriptPath_Home}${instalacao}";                    # Diretrio de Instalação do Bob
# scriptPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";      # Diretorio de instalação do script 
# # -----------------------------------------------------------------------------------------
# if [ $scriptPath != $scriptPath_Bob ] ; then
#     utilsLocation="${scriptPath_Bob}/lib/bob_util.sh";               # Diretorio de localização bob_util.sh
# else
#     utilsLocation="${scriptPath}/lib/bob_util.sh"; 
# fi
# # -----------------------------------------------------------------------------------------
# if [ -f "${utilsLocation}" ]; then
#     source "${utilsLocation}";
# else
#     e_error "Erro carregando ${utilsLocation}"; Sair;
# fi
# -----------------------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------------------
function MenuBD(){
    e_header "Você pode fazer as  seguintes escolhas." 
}



# by: Elizeu de Santana / 23-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function InstallMySQL_Communit(){
    mysqlRootPass="Elizeu"

    # echo ' -> Removing previous mysql server installation'
    # systemctl stop mysqld.service 
    # apt remove -y mysql-community-server 
    # rm -rf /var/lib/mysql 
    # rm -rf /var/log/mysqld.log 
    # rm -rf /etc/my.cnf

    echo " -> Installing mysql server (community edition)"
    # sudo wget -c https://dev.mysql.com/get/mysql-apt-config_0.8.10-1_all.deb 
    # sudo dpkg -i mysql-apt-config_0.8.10-1_all.deb 
    # sudo apt update
    # sudo apt-get install mysql-server

    # sudo apt install mysql-community-server-core -y
    # sudo dpkg -i mysql-community-server-core-dbgsym_8.0.16-2ubuntu18.04_amd64.deb
    
    echo " -> Starting mysql server (first run)"
    sudo systemctl enable mysqld.service
    sudo systemctl start mysqld.service
    tempRootDBPass="`grep 'temporary.*root@localhost' /var/log/mysqld.log | tail -n 1 | sed 's/.*root@localhost: //'`"

    echo " -> Setting up new mysql server root password"
    sudo systemctl stop mysqld.service
    sudo rm -rf /var/lib/mysql/*logfile*
    sudo cp -v my.cnf /etc/my.cnf 
    sudo systemctl start mysqld.service
    sudo mysqladmin -u root --password="$tempRootDBPass" password "$mysqlRootPass"
    sudo mysql -u root --password="$mysqlRootPass" -e "DELETE FROM mysql.user WHERE User='';"
    sudo mysql -u root --password="$mysqlRootPass" -e "DROP DATABASE IF EXISTS test;"
    sudo mysql -u root --password="$mysqlRootPass" -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"
    sudo mysql -u root --password="$mysqlRootPass" -e "DELETE FROM mysql.user where user != 'mysql.sys';"
    sudo mysql -u root --password="$mysqlRootPass" -e "CREATE USER 'root'@'%' IDENTIFIED BY '${mysqlRootPass}';"
    sudo mysql -u root --password="$mysqlRootPass" -e "GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION;"
    sudo mysql -u root --password="$mysqlRootPass" -e "FLUSH PRIVILEGES;"

    sudo systemctl status mysqld.service
    echo " -> MySQL server installation completed, root password: $mysqlRootPass"
}

# by: Elizeu de Santana / 23-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function ConfiguraUsuarioPSQL(){
    ### ###
    Titulo
    echo -e "${ctr} \n Digite o nome do USER este terá user no linux, postgres e banco de dados.: ${dlc}"
    read usuario
    
    tmpD="$(date)"
    tmpL=" Processo: Criando novo usuario [sudo -u postgres createuser --interactive]"
    echo -e "${ctr} Criando novo usuario [sudo -u postgres createuser --interactive] ... ${dlc}"

    sudo -u postgres createuser --interactive # Nome do usuario, e se é suoer user
                                              # man createuser para mais informação de privilegios
    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> BdadosLog.log

    echo -e "${ctr} Criado novo usuario pronto. ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    echo -e "${ctr} Criando BD [sudo -u postgres createdb elizeu] ... ${dlc}"

    tmpL=" Processo: Criando BD [sudo -u postgres createdb elizeu]"
    sudo -u postgres createdb $usuario          # psql precisa de um db com o mesmo nome do user
                                              # digite a senha!
    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> BdadosLog.log

    echo -e "${ctr} Criado BD pronto. ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    echo -e "${ctr} O LINUX tem que ter um user com o mesmo nome. ${dlc}"
    
    tmpL=" Processo: LINUX [User]"
    sudo adduser $usuario                       # O LINUX tem que ter um user com o mesmo nome
    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> BdadosLog.log

    echo -e "${ctr} Criado User pronto. ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    echo -e "${ctr} Informação da conecção. ${dlc}"

    #sudo -u elizeu psql                       # Conectar ao bd usando o novo user
    # sudo -i -u elizeu                       # Usando root
    # psql
    # psql -d postgres                        # Para conectar a outro bd
    tmpL=" Processo: Informação da conecção"
    sudo -u elizeu psql -d $usuario -c '\conninfo'  # Para obter informação da conecção
    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> BdadosLog.log

    echo -e "${ctr} Criado User pronto. ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    sleep 25
    MenuBD
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function StatusMySQL(){
    ### ###
    #-------------------------------------------------------------
    sudo service mysql status
    #-------------------------------------------------------------
    if [ "#?" == 0 ] ; then
      notify-send -i important "MySQL rodando!"
    else
      notify-send -i important "MySQL parado/inexiste!"
    fi
    #-------------------------------------------------------------

    MenuServidor_Esc               #Volta ao fluxo!
}


# Tratamento de erros --------------------------------------------
# by: Elizeu de Santana / 21-05-2019------------------------------
# ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
erroLocaLroot(){ 
   " /etc/init.d/mysql start

    SET PASSWORD FOR 'root'@'localhost' = PASSWORD('senha');
    # se ERROR 1819 (HY000): Your password does not satisfy the current policy requirements
    create user lamim@'localhost' identified by 'lamim123';
    show global variables like 'validate_password%';
    #nivel medio de segurança
    SET GLOBAL validate_password_policy=LOW;
    # set para baixo
    SET PASSWORD FOR 'root'@'localhost' = PASSWORD('@2elizeu');
    create database mysql_bash;
    GRANT usage ON *.* TO thobias@localhost IDENTIFIED BY '12452522gggffhghgghg';
    GRANT usage ON *.* TO thobias@'%' IDENTIFIED BY '12452522gggffhghgghg';
    GRANT CREATE, DROP, SELECT, INSERT, UPDATE, DELETE ON mysql_bash.* TO thobias@localhost;
    GRANT CREATE, DROP, SELECT, INSERT, UPDATE, DELETE ON mysql_bash.* TO thobias@'%';
flush privileges;
quit"
#-------------------------------------------------------------
    senha="eli"
    user="root"
    #-------------------------------------------------------------
    sudo mysql -u $user -p $senha -D mysql -e "USE mysql;"
    sedo mysql -u $user -p $senha -D mysql -e "UPDATE user SET plugin='mysql_native_password' WHERE User='root';"
    sudo mysql -u $user -p $senha -D mysql -e "FLUSH PRIVILEGES;"
    sudo mysql -u $user -p $senha -D mysql -e "exit;"
    #-------------------------------------------------------------
    sudo service mysql restart
    #-------------------------------------------------------------
    
    MenuServidor                  #Volta ao fluxo!
}
# Fim - Tratamento de erros --------------------------------------

# by: Elizeu de Santana / 21-05-2019------------------------------
UnistallMySQL(){
    #-------------------------------------------------------------
    #apt list --installed | grep mysql <<<<<<<<<<<<<<<<<<<< MELHOR
    #-------------------------------------------------------------
    sudo apt-get purge mysql-server mysql-client mysql-common 
    #-------------------------------------------------------------
    sudo apt-get remove mysql-server mysql-client mysql-common 
    #-------------------------------------------------------------
    sudo rm -rf /etc/mysql /var/lib/mysql /var/run/mysqld
    #-------------------------------------------------------------
    sudo apt-get autoremove
    #-------------------------------------------------------------
    sudo apt-get autoclean
    #-------------------------------------------------------------

    MenuServidor                  #Volta ao fluxo!    
}


