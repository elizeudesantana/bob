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
instalacao="/Projetos/bob";                                          # Diretorio de Instalação apartir de HOME
scriptPath_Home="${HOME}";                                           # Diretorio HOME (~)
scriptPath_Bob="${scriptPath_Home}${instalacao}";                    # Diretrio de Instalação do Bob
scriptPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";      # Diretorio de instalação do script 
# -----------------------------------------------------------------------------------------
if [ $scriptPath != $scriptPath_Bob ] ; then
    utilsLocation="${scriptPath_Bob}/lib/bob_util.sh";               # Diretorio de localização bob_util.sh
else
    utilsLocation="${scriptPath}/lib/bob_util.sh"; 
fi
# -----------------------------------------------------------------------------------------
if [ -f "${utilsLocation}" ]; then
    source "${utilsLocation}";
else
    e_error "Erro carregando ${utilsLocation}"; Sair;
fi
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
function InstallPostGres(){  
    ### ###
    Titulo
    tmpD="$(date)"
    tmpL=" Processo: Instalado postgresql postgresql-contrib"
    echo -e "${ctr} Instalando postgresql postgresql-contrib ... ${dlc}"

    sudo apt install postgresql postgresql-contrib -y
    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> BdadosLog.log
    
    echo -e "${ctr} Instalado postgresql postgresql-contrib. ${dlc}"
    echo -e "${cls} ----------------------------------------------------------------------   ${dlc}"
    sleep 5
    MenuBD
    #sudo -i -u postgres
    #psql 
}

# by: Elizeu de Santana / 23-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function InstallMySQL(){
    ### ###
    Titulo
    tmpD="$(date)"
    tmpL=" Processo: Executando service mysql status"
    echo -e "${ctr} Executando service mysql status ... ${dlc}"

    sudo service mysql status #> service_mysql_status.log

    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> BdadosLog.log
    echo -e "${cls} ----------------------------------------------------------------------   ${dlc}"
    notify-send -i important " Banco de Dados Relacional mysql pronto."
    sleep 10 
    echo -e "${ctr} \n Instalando Banco de Dados Relacional mysql-server ... ${dlc}"
    
    tmpL=" Processo: install mysql-server"
    sudo apt install mysql-server -y #> apt_mysql_install.log
    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> BdadosLog.log
    
    echo -e "${ctr} \n Instalado Banco de Dados Relacional mysql-server. ${dlc}"
    echo -e "${cls} ----------------------------------------------------------------------   ${dlc}"
    echo -e "${ctr} \n No plugin [n - y - y - y - y] ${dlc}"
    notify-send -i important "No plugin [n - y - y - y - y]"            
    echo -e "${cls} ----------------------------------------------------------------------   ${dlc}"
    echo -e "${ctr} \n Executando mysql_secure_installation ... ${dlc}"

    tmpL=" Processo: Executando mysql_secure_installation"
    sudo mysql_secure_installation
    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> BdadosLog.log
    
    echo -e "${ctr} \n Executado mysql_secure_installation ... ${dlc}"
    echo -e "${cls} ----------------------------------------------------------------------   ${dlc}"
    echo -e "${ctr} \n Executado systemctl start mysql ... ${dlc}"

    tmpL=" Processo: Executando sudo systemctl start mysql"
    sudo systemctl start mysql
    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> BdadosLog.log
    echo -e "${cls} ----------------------------------------------------------------------   ${dlc}"
    sleep 10

    MenuBD                  #Volta ao fluxo!    
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
function ConfigMySQL(){
    Titulo
    tmpD="$(date)"
    echo -e "${ctr} mysql_secure_installation.                                       ${dlc}"
    
    echo -e "${ctr} Responda com as seguintes strings as perguntas a seguir:         ${dlc}"
    echo -e "${ctr} n -> Para o plugin secure.                                       ${dlc}"
    echo -e "${ctr} y -> Para os demais ...                                          ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    notify-send -i important "Configurando MySQL!"
    
    sudo mysql_secure_installation
    
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    
    sudo systemctl start mysql
      
    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> BdadosLog.log
    echo -e "${ctr} mysql_secure_installation pronto.                                ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    sleep 5
    MenuBD
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function InstalarPhPphppgAdmin(){
    Titulo
    tmpD="$(date)"
    echo -e "${ctr} php7.2 phppgadmin php7.2-pgsql. ${dlc}"

    sudo apt install php7.2 phppgadmin php7.2-pgsql -y

    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    notify-send -i important "Comente 'Require local' adicionando '#'"
    echo -e "${ctr} Comente 'Require local' adicionando '#'!  ${dlc}"
    echo -e "${ctr} Use mause selecione copie dentro apostrofos: 'Require all granted'$Color_Off"
    sleep 30
    sudo nvim /etc/apache2/conf-available/phppgadmin.conf
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
   
    notify-send -i important "$conf['extra_login_security'] = true; <- para false"
    echo -e "${ctr} $conf['extra_login_security'] = true; <- para false ${dlc}"
    echo -e "${ctr} Idem, a linha a cima copie. ${dlc}"
    sleep 30
    sudo nvim /etc/phppgadmin/config.inc.php
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    echo -e "${ctr} Restart postgres e apache2. ${dlc}"
    sudo systemctl restart postgresql
    sudo systemctl restart apache2
    netstat -plntu

    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> BdadosLog.log
    echo -e "${ctr} Sistema pronto. ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    sleep 20
    MenuBD
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function InstalarMyphpadmin(){
    ### ###
    Titulo
    echo -e "${ctr} \n Instalando phpmyadmin php-mbstring php-gettext ... ${dlc}"

    sudo apt install phpmyadmin php-mbstring php-gettext -y > apt_phpmyadmin_install.log
    tmp="$(date)"; printf "%s" "$tmp" " * apt instalpmyadmin phl php-mbstring php-gettext" >>  BdadosLog.log

    echo -e "${ctr} Instalado phpmyadmin php-mbstring php-gettext. ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    echo -e "${ctr} Ativando mbstring ... ${dlc}"

    sudo phpenmod mbstring >> apt_phpmyadmin_install.log
    tmp="$(date)"; printf "%s" "$tmp" " * phpenmod mbstring" >> LogSistema_LampMysql.log    
       
    echo -e "${ctr} Instalado phpmyadmin php-mbstring php-gettext. ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    echo -e "${ctr} Restartando apache2... ${dlc}"

    sudo systemctl restart apache2 >> apt_phpmyadmin_install.log
    tmp="$(date)"; printf "%s" "$tmp" " * systemctl restart apache2" >> LogSistema_LampMysql.log    
    
    echo -e "${ctr} Restartado apache2. ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    echo -e "${ctr} Restartando apache2... ${dlc}"
 
    sleep 10
    
    ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
    FLUSH PRIVILEGES;

    MenuBD           #Volta ao fluxo!   
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


# by: Elizeu de Santana / 21-05-2019------------------------------
InstalarWorkbench(){
    Titulo
    echo -e "${ctr} \n Instalando aplicativo de gerenciamento de B.Dados Workbench ... ${dlc}"
    
    sudo apt install mysql-workbench -y #> apt_workbench_install.log
    tmp="$(date)"; printf "%s\n" "$tmp" " * apt install mysql-workbench" >> LogSistema_LampMysql.log

    echo -e "${ctr} \n Instalado aplicativo de gerenciamento de B.Dados Workbench. ${dlc}"
    echo -e "${cls} \n ---------------------------------------------------------------- ${dlc}"
    echo -e "${ctr} \n Executando apt autoremove ... ${dlc}"
    
    sudo apt autoremove
    tmp="$(date)"; printf "%s\n" "$tmp" " * apt autoremove" >> LogSistema_LampMysql.log
    
    echo -e "${ctr} \n Executado apt autoremove. ${dlc}" 
    echo -e "${cls} \n ---------------------------------------------------------------- ${dlc}"

    MenuServidor                  #Volta ao fluxo!    

    #-------------------------------------------------------------
    #wget -q http://cdn.mysql.com/Downloads/MySQLGUITools/mysql-workbench-community_8.0.12-1ubuntu18.04_amd64.deb -O mysql-workbench-community.deb
    #sudo dpkg -i mysql-workbench-community.deb
    #sudo apt -f install
}

# by: Elizeu de Santana / 21-05-2019------------------------------
PhpMysql(){
    Titulo
    #-------------------------------------------------------------
    echo -e "${ctr} \n Instalando aplicativo de gerenciamento [browser] myphpadmin. [aguarde...] ${dlc}"
    
    sudo apt install php7.2 libapache2-mod-php7.2 php7.2-mysql php-common php7.2-cli php7.2-common php7.2-json php7.2-opcache php7.2-readline  -y > apt_php7-2_install.log
    tmp="$(date)"; printf "%s\n" "$tmp" " * apt install php7.2 libapache2-mod-php7.2 php7.2-mysql php-common php7.2-cli php7.2-common php7.2-json php7.2-opcache php7.2-readline" >> LogSistema_LampMysql.log

    echo -e "${ctr} \n Instalado aplicativo de gerenciamento [browser] myphpadmin. ${dlc}"
    echo -e "${cls} \n ---------------------------------------------------------------- ${dlc}"
    echo -e "${ctr} \n Ativando modulo php7.2 ... ${dlc}"

    sudo a2enmod php7.2
    tmp="$(date)"; printf "%s\n" "$tmp" " * a2enmod php7.2" >> LogSistema_LampMysql.log

    echo -e "${ctr} \n Ativado modulo php7.2. ${dlc}"
    echo -e "${cls} \n ---------------------------------------------------------------- ${dlc}"
    echo -e "${ctr} \n Restartando apache2 ... ${dlc}"

    sudo systemctl restart apache2
    tmp="$(date)"; printf "%s\n" "$tmp" " * systemctl restart apache2" >> LogSistema_LampMysql.log
    
    echo -e "${ctr} \n Restartado apache2 ... ${dlc}"
    echo -e "${cls} \n ---------------------------------------------------------------- ${dlc}"
    echo -e "${ctr} \n Version ... ${dlc}"

    php --version
    tmp="$(date)"; printf "%s\n" "$tmp" " * systemctl restart apache2" >> LogSistema_LampMysql.log
    
    echo -e "${ctr} \n Fim Version. ${dlc}"    
    echo -e "${cls} \n ---------------------------------------------------------------- ${dlc}"
    echo -e "${ctr} \n Criando arquivo /var/www/html/info.php ... ${dlc}"

    #sudo cat info.php > /var/www/html/info.php
    sudo cp info.php /var/www/html/
    tmp="$(date)"; printf "%s\n" "$tmp" " * cat info.php > /var/www/html/info.php" >> LogSistema_LampMysql.log

    echo -e "${ctr} \n Criando arquivo /var/www/html/info.php ... ${dlc}"
    echo -e "${cls} \n ---------------------------------------------------------------- ${dlc}"
    echo -e "${ctr} \n Aguarde 10 seg. ${dlc}"
    sleep 10

    #-------------------------------------------------------------
    # #PHP-FPM. (fast cgi)
    # #Disable the Apache PHP7.2 module.
    # sudo a2dismod php7.2

    # Install PHP-FPM.
    # sudo apt install php7.2-fpm
    # sudo a2enmod proxy_fcgi setenvif #Enable proxy_fcgi and setenvif module.

    # #Enable the /etc/apache2/conf-available/php7.2-fpm.conf configuration file.
    # sudo a2enconf php7.2-fpm
    # #Restart Apache for the changes to take effect.
    # sudo systemctl restart apache2

    # #to prevent prying eyes.
    # sudo rm /var/www/html/info.php
    #-------------------------------------------------------------
    
    MenuServidor           #Volta ao fluxo!
}