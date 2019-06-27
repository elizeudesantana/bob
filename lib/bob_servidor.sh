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
# Variaveis ------------------------------------------------------
Pacote_Apache="apache2"
Modulos_Apache=" apache2-bin apache2-doc apache2-utils libexpat1 ssl-cert zlib1g-dev openssl libssl-dev libxml2-dev lynx lua-expat-dev libjansson-dev apache2-doc apache2-suexec-pristine"

Status_Apache="$Pacote_Apache status"
Status_Active="running"
Status_Stop="$Pacote_Apache stop"
Status_Start="$Pacote_Apache start"

Status_Firewall="status verbose"
Status_FActive="ativo"

# retirei a variavel ${WORDPRESS_DOMAIN} da linha 164 server name e acrescentei myhostname.
# [ -z "${WORDPRESS_DOMAIN}" ] && WORDPRESS_DOMAIN=$(myhostname)
# [ -z "${WORDPRESS_SITENAME}" ] && WORDPRESS_SITENAME=wordpress
# MYSQL_VERSION=5.7
# [ -z "${MYSQL_PASSWD}" ] && MYSQL_PASSWD=mysql

#. 'bob_util.sh'	
# by: Elizeu de Santana / 23-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function MenuServidor(){
    Titulo
    echo -e "${ctm} \n Menu Servidores :                                                 ${dlc}"
    echo -e "${ctm} 1 - Instalar Banco de Dados Relacionais [ MySQL, PostGres ].         ${dlc}"
    echo -e "${ctm} 2 - 瘟 Instalar Servidor de Internet [ LAMP ] { byTeddysun }.           ${dlc}"
    echo -e "${ctm} 3 - 瘟 Instalar Servidor de Internet lampe-server^.*.*.*.*.*            ${dlc}"
    echo -e "${ctm} 4 - Linux [Update & Upgrade].                                        ${dlc}"
    echo -e "${ctm} 5 - Instalar Servidor de Internet Apache2 .                          ${dlc}"
    echo -e "${ctm} 6 - Configurar servidor de Internet apache2 [Firewall, Permições, Hosts e Conexão Host.local ]. ${dlc}"
    echo -e "${ctm} 7 - Verificação e troca se Status Servidor de Internet Apache2 [service]. ${dlc}"
    echo -e "${ctm} 8 - Desinstalar o Servidor de Internet Apache2 .                     ${dlc}"
    echo -e "${ctm} 9 - Criar chave RSA para conexão SSH.                                ${dlc}"
    echo -e "${ctm} 10 - Instalar Server Monitor Cockpit.(http://localhost:9090)         ${dlc}"
    echo -e "${ctm} 11 - Instalar Server E-mail PostFix.                                 ${dlc}"
    echo -e "${ctm} 12 - Instalar Monitor Server Nagios (necessario antes o -11-).       ${dlc}"
    echo -e "${ctm} 13 - Instalar Monitor Server Nagios xi                               ${dlc}"
    echo -e "${ctm} 14 - Desinstalar Monitor Server Nagios xi                            ${dlc}"
    echo -e "${ctm} 15 - Instalar Web Server WebWin                                      ${dlc}"
    echo -e "${ctm} 16 - 磌 Instalar Web Server WordPress                                   ${dlc}"
    echo -e "${cls} ----------------------------------------------------------------     ${dlc}"
    echo -e "${ctm} s - Retorna ao Menu Instacao Principal.                              ${dlc}"
    echo -e "${ctm} l- Limpar historico.                                                 ${dlc}"
    echo -e "${cls} ----------------------------------------------------------------     ${dlc}"
    echo -e "${ctm} Historico :                                                          ${dlc}"
    tail -n 6 ServidorLog.log
    echo -e "${cls} ----------------------------------------------------------------     ${dlc}"
    echo -ne "${ctm} Digite a preferência [1 .. 7] : ${dlc}"; read opt
    case $opt in
        1) . 'bob_bancodados.sh'; MenuBD;;
        2) LampByTeddysun;;
        3) InstalarLamprServer;;
        4) UpdateUpgrade;;
        5) InstallApache;;
        6) ConfigApache;;
        7) StatusApache;;
        8) UnistallApache;;
        9)
             echo -e "${ctm} Enter e a senha: elizeu . Para sair da conexão exit. ${dlc}"
            ssh-keygen -t rsa
            ssh elizeu@localhost
            MenuServidor;;
        10) InstallCockpit; MenuServidor;;
        11) InstalarServerEmail;;
        12) InstalarMonitorServerNagios;;
        13) InstalarNagiosxi;;
        14) DesinstalarNagiosxi;;
        15) InstalarWebWin;;
        16) wordpress_main;;
        s) . 'bob_instalacao.sh'; MenuInstacaoPrincipal;;
        l) rm ServidorLog.log; MenuServidor;;
        *) echo -e "${ctr} Opção desconhecida. ${dlc}"; MenuServidor ;;
    esac
}

# by: Elizeu de Santana / 25-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function InstalarNagiosxi(){
    ### Em torno de 1:30 min duração para termino do script ###
    Titulo
    tmpD="$(date)"
    tmpL=" Processo: Instalação Servidor Nagios xi."
    echo -e "${ctr} Instalando Servidor NAgios xi ... ${dlc}"

    sudo -i
    curl https://assets.nagios.com/downloads/nagiosxi/install.sh | sh
    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> ServidorLog.log
    
    echo -e "${ctr} Instalado pronto. ${dlc}"
    echo -e "${cls} ----------------------------------------------------------------     ${dlc}"
    sleep 5
    MenuServidor          #retorna ao fluxo  
    
    #====================================================================
    # url : localhsot/nagios
    # login : nagiosadmin
    # senha : nagiosadmin  
    #====================================================================
}

# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function DesinstalarNagiosxi(){
    ### ###
    Titulo
    tmpD="$(date)"
    tmpL=" Processo: Desinstalação Servidor Nagios xi."
    echo -e "${ctm} Desinstalando Servidor Nagios xi ... ${dlc}"

    fmt -s -w $(tput cols) <<-EOF
    ==================================
    !! DESTRUTIVO UNINSTALL NOTICE !!
    ==================================
    CUIDADO: Esse script de unistall

    Nagios 
    MySql
    Postgresql

    Desinstala esse pacotes e dados a eles realacionados.
    Esta ação é irreversivel todos os dados de configuração do Nagios
    e, arquivos de configuração, arquivos de log, e services.
EOF

    read -p "Você quer continuar? [y/N] " res

    if [ "$res" = "y" -o "$res" = "Y" ]; then
        echo "Continuando com uninstall..."
    else
        echo "Uninstall cancelado!"
        MenuServidor          #retorna ao fluxo  
    fi

    # Stop services
    echo "Stopping services..."
    service nagios stop
    service npcd stop
    service ndo2db stop

    # Remove init.d files
    echo "removendo arquivos init ..."
    rm -rf /etc/init.d/nagios
    rm -rf /etc/init.d/npcd
    rm -rf /etc/init.d/ndo2db

    # Remove users and sudoers
    echo "Removendo users and suduoers..."
    userdel -r nagios
    groupdel nagcmd
    rm -f /etc/sudoers.d/nagiosxi

    # Remove crontabs
    echo "Removendo crontabs..."
    rm -f /etc/cron.d/nagiosxi

    # Remove various files
    echo "Removendo arquivos..."
    rm -rf /usr/local/nagios
    rm -rf /usr/local/nagiosxi
    # Remove NagiosQL files
    echo "Removendo arquivos NagiosQL..."
    rm -rf /etc/nagiosql
    rm -rf /var/www/html/nagiosql
    rm -rf /var/lib/mysql
    rm -rf /var/lib/pgsql
    # Not going to do this as it may contain your only backup
    #rm -rf /store/backups
    # Remove Apache configs
    echo "Removendo Apache configs..."
    rm -f /etc/httpd/conf.d/nagios.conf
    rm -f /etc/httpd/conf.d/nagiosxi.conf
    rm -f /etc/httpd/conf.d/nagiosql.conf
    rm -f /etc/httpd/conf.d/nrdp.conf
    rm -f /usr/local/nrdp/nrdp.conf
    service apache2 restart
    # Remove xinetd configs
    echo "Removendo xinetd configs..."
    rm -f /etc/xinetd.d/nrpe
    rm -f /etc/xinetd.d/nsca
    rm -f /etc/xinetd.d/nrdp
    service xinetd restart
    # Remove Postgres databases
    echo "Removendo Postgres and mysql databases..."
    apt remove mysql-server postgresql -y
    # Remove DB backup scripts
    echo "Removendo database backup scripts..."
    rm -f /root/scripts/automysqlbackup
    rm -f /root/scripts/autopostgresqlbackup
    cd /tmp
    rm -rf nagiosxi xi*.tar.gz
    #echo "Preparing to reinstall"
    #cd /tmp
    #echo "Downloading latest stable version installer"
    #wget http://assets.nagios.com/downloads/nagiosxi/xi-latest.tar.gz
    # Begin installation
    #echo "Begining installation! Enjoy the ride!"
    #tar xzf xi-latest.tar.gz
    #(
    #cd /tmp/nagiosxi
    #./fullinstall
    #)

    fmt -s -w $(tput cols) <<-EOF
    ====================
    TUDO CONFIGURADO!! Vai em paz!
    ====================
EOF
    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> ServidorLog.log
    
     echo -e "${ctm} Instalado pronto. ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    sleep 5
    MenuServidor          #retorna ao fluxo  
}

# by: Elizeu de Santana / 24-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function mysql_install(){
    ### ###
    cat <<EOF | sudo debconf-set-selections
mysql-server-${MYSQL_VERSION} mysql-server/root_password password ${MYSQL_PASSWD}
mysql-server-${MYSQL_VERSION} mysql-server/root_password_again password ${MYSQL_PASSWD}
EOF
    sudo apt install -y mysql-server
}

# by: Elizeu de Santana / 24-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function wordpress_install(){
    ### ###
    sudo apt install -y wordpress

    # Change filesystem access method from FTP to direct.
    # This will change plugin installation via FTP to plugin installation
    # with direct filesystem access.
    sudo sed -e "s/^<?php/<?php\ndefine('FS_METHOD', 'direct');/g" \
        -i /usr/share/wordpress/wp-config.php

    TMP=$(mktemp -t wordpress.sh.XXXXXX)
    trap 'rm $TMP* 2>/dev/null' 0
    zcat /usr/share/doc/wordpress/examples/setup-mysql.gz > "${TMP}"

    # You can select remote mysql server with -t option.
    # You can set mysql database username with -u option.
    sudo bash "${TMP}" -n "${WORDPRESS_SITENAME}" "${WORDPRESS_DOMAIN}"
}

# by: Elizeu de Santana / 24-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function apache_install(){
    sudo apt install -y apache2
    cat <<EOF | sudo tee /etc/apache2/sites-available/wordpress.conf
<VirtualHost _default_:443>
SSLEngine on
SSLCertificateFile    /etc/ssl/certs/ssl-cert-snakeoil.pem
SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key

ServerName myhostname
DocumentRoot /usr/share/wordpress/
DirectoryIndex index.php index.html
ErrorLog /var/log/apache2/wp-error.log
TransferLog /var/log/apache2/wp-access.log
Alias /wp-content /var/lib/wordpress/wp-content

<Directory /usr/share/wordpress>
    Options FollowSymLinks
    Require all granted
</Directory>

<Directory /var/lib/wordpress/wp-content>
    Options FollowSymLinks
    Require all granted
</Directory>
</VirtualHost>
EOF
    sudo a2enmod ssl
    sudo a2ensite wordpress
    sudo systemctl enable apache2
    sudo systemctl restart apache2
}

# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function wordpress_main(){
    ### ###
    Titulo
    tmpD="$(date)"
    tmpL=" Processo: Instalação Servidor WordPress."
    echo -e "${ctm} Instalando Servidor WordPress ... ${dlc}"

    mysql_install
    wordpress_install
    apache_install
    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> ServidorLog.log
    
    echo -e "${ctm} Instalado pronto. ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    sleep 5
    MenuServidor          #retorna ao fluxo
}

# by: Elizeu de Santana / 24-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function InstalarWebWin(){
    ### ###
    Titulo
    tmpD="$(date)"
    tmpL=" Processo: Instalação Servidor WebWin."
    echo -e "${ctm} Instalando Servidor WebWin ... ${dlc}"

    echo "deb http://download.webmin.com/download/repository sarge contrib" | \
    sudo tee /etc/apt/sources.list.d/webmin.list
    wget http://www.webmin.com/jcameron-key.asc -O - | sudo apt-key add -
    sudo apt update -y
    sudo apt install -y webmin
    
    # Change "port" and "listen" in /etc/webmin/miniserv.conf. Run "sudo systemctl restart webmin".
    sudo sed -e 's/^port=.*/port=10002/g' \
    -e 's/^listen=.*/listen=10002/g' -i /etc/webmin/miniserv.conf

    sudo systemctl restart webmin
    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> ServidorLog.log
    
    echo -e "${ctr} Instalado pronto. ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    sleep 5
    MenuServidor          #retorna ao fluxo
}

# by: Elizeu de Santana / 24-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function InstalarMonitorServerNagios(){   
    ### ###
    # Send mail to internet via Gmail
    cat <<EOF | sudo tee -a /etc/postfix/main.cf
relayhost = [smtp.gmail.com]:587
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
smtp_sasl_mechanism_filter = plain
smtp_use_tls = yes
EOF

    echo "[smtp.gmail.com]:587 ${GMAIL_ADDR}:${GMAIL_PASSWD}" | sudo tee /etc/postfix/sasl_passwd
    sudo chmod 600 /etc/postfix/sasl_passwd
    sudo postmap hash:/etc/postfix/sasl_passwd
    sudo systemctl restart postfix
    
    #acessar e permitir conexão
    firefox https://myaccount.google.com/lesssecureapps

    # permitir
    firefox https://accounts.google.com/DisplayUnlockCaptcha

    #pode-se enviar email atraves dos comandos
    #postfix/smtp ... to=<yourgmail@gmail.com>,relay=smtp.gmail.com ...

    NAGIOS_PASSWD=nagios
    cat <<EOF | sudo debconf-set-selections
nagios3-cgi nagios3/adminpassword-repeat password ${NAGIOS_PASSWD}
nagios3-cgi nagios3/adminpassword password ${NAGIOS_PASSWD}
nagios3-cgi nagios3/adminpassword-mismatch note
EOF
    sudo apt install -y nagios3

    #configurações ficam em:
    #sudo subl /etc/apache2/conf-available/nagios3.conf

    #para acesso :
    echo "Em 20 seg. firefox! abaixo login e senha."
    echo "login: nagiosadmin // password: nagios"
    sleep 25

    firefox http://localhost/nagios3

    MenuServidor
}

# by: Elizeu de Santana / 24-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function InstalarServerEmail(){
    Titulo
    tmpD="$(date)"
    tmpL=" Processo: Instalação Servidor mutt."
    echo -e "${ctm} Instalando server mutt ... ${dlc}"

    PostfixMain
    sudo apt install -y mutt

    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> ServidorLog.log
    
    echo -e "${ctm} Instalado pronto. ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    sleep 5
    MenuServidor          #retorna ao fluxo
}

# by: Elizeu de Santana / 24-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function PostfixMain(){
    ### ###
    PostfixInstall localhost localdomain             # localhost only.
    # PostfixInstall ${YOUR_HOSTNAME} ${YOUR_DOMAIN} # your network.
}

# by: Elizeu de Santana / 24-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function PostfixInstall(){
    ### ###
    Titulo
    tmpD="$(date)"
    tmpL=" Processo: Instalação server e-mail potfix."
    echo -e "${ctm} Instalando server e-mail potfix ... ${dlc}"

    cat <<EOF | sudo debconf-set-selections
postfix postfix/main_mailer_type select No configuration
EOF
    sudo apt install -y postfix
    sudo systemctl enable postfix

    # shellcheck disable=SC2016
    cat <<EOF | sudo tee /etc/postfix/main.cf
myhostname = ${1}
mydomain = ${2}
myorigin = \$myhostname.\$mydomain
mydestination = localhost, localhost.\$mydomain, \$myhostname, \$mydomain, \$myorigin
compatibility_level = 2
command_directory = /usr/sbin
daemon_directory = /usr/lib/postfix/sbin
data_directory = /var/lib/postfix
mail_owner = postfix
inet_interfaces = all
local_recipient_maps = unix:passwd.byname \$alias_maps
unknown_local_recipient_reject_code = 550
mynetworks_style = subnet
mynetworks = 127.0.0.0/8
alias_maps = hash:/etc/aliases
alias_database = hash:/etc/aliases
smtpd_banner = \$myhostname ESMTP \$mail_name (Ubuntu)
debugger_command =
        PATH=/bin:/usr/bin:/usr/local/bin:/usr/X11R6/bin
        ddd \$daemon_directory/\$process_name \$process_id & sleep 5
sendmail_path = /usr/sbin/sendmail
newaliases_path = /usr/bin/newaliases
mailq_path = /usr/bin/mailq
setgid_group = postdrop
inet_protocols = ipv4
EOF

    sudo newaliases
    sudo systemctl restart postfix
    
    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> ServidorLog.log
    
    echo -e "${ctr} Instalado pronto. ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
}


# by: Elizeu de Santana / 23-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function UnistallApache(){
    ### ###
    Titulo
    tmpD="$(date)"
    tmpL=" Processo: Desinstalação do Servidor de Internet apache2"
    echo -e "${ctm} Desinstalação do Servidor de Internet apache2 ... ${dlc}"

    sudo service $Status_Stop
    sudo apt-get remove --purge $Pacote_Apache2 $Modulos_Apache2
    aptitude purge apache2
    sudo dpkg -P apache2*
    sudo apt autoremove --purge
    sudo rm -rfv /etc/apache2
    sudo rm -v /etc/init.d/apache2
    sudo rm -rfv /var/lib/apache2
    sudo rm -rv /var/log/apache2
    sudo rm -rfv /var/www/html
    sudo rm -rfv /var/www
    MenuServidor
    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> ServidorLog.log
    
    echo -e "${ctr} Desinstalado pronto. ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    sleep 5
    MenuServidor          #retorna ao fluxo
}

# by: Elizeu de Santana / 24-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function InstalarLamprServer(){ 
    Titulo
    tmpD="$(date)"
    tmpL=" Processo: Instado lampe-server^ [apache2,mysql,php,phpmyadmin]"
    echo -e "${ctm} Instando lampe-server^ [apache2,mysql,php,phpmyadmin]... ${dlc}"

    sudo apt-get install lamp-server^
    sudo apt-get install phpmyadmin
    echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/test.php
    sudo /etc/init.d/apache2 restart
    
    sudo mysql -uroot -p
    # Conecta sem senha troca a senha do root
    # SET PASSWORD FOR 'root'@'localhost' = PASSWORD('elizeu');
    # \q
        
    # Cria um bob_bancodados/user/senha conecta digite a senha
    mysql -u root mysql -p
    # create database bob_DB;
    # GRANT usage ON *.* TO bob@localhost IDENTIFIED BY 'senha';
    # GRANT usage ON *.* TO bob@'%' IDENTIFIED BY 'senha';
    # GRANT CREATE, DROP, SELECT, INSERT, UPDATE, DELETE ON bob_DB.* TO bob@localhost;
    # GRANT CREATE, DROP, SELECT, INSERT, UPDATE, DELETE ON bob_DB.* TO bob@'%';
    # \q
    
    # cria a tabela
    #mysql -u bob -psenha -e "CREATE TABLE agenda (nome VARCHAR(50) NOT NULL PRIMARY KEY,telefone VARCHAR(150), email VARCHAR(35), aniversario DATE)" bob_DB
    
    # verifica a saida
    echo "$?" 
    
    # cria .my.cnf e ler direto sem insirir senha,  a senha é senha.
    echo "[client] \npassword=senha" | sudo tee ~/home/elizeu/.my.cnf
    
    mysql -u bob -e "show tables" bob_DB

    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> ServidorLog.log
     echo -e "${ctm} Instalado pronto. ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    sleep 5
    MenuServidor          #retorna ao fluxo
}

# by: Elizeu de Santana / 23-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function StatusApache(){
    ### ###
    Titulo
    tmpD="$(date)"
    tmpL=" Processo: Verificação de funcionamento do Servidor de Internet apache2"
    echo -e "${ctm} Verificação de funcionamento do Servidor de Internet apache2... ${dlc}"

    sudo service $Status_Apache > Test_Active.txt
    Search_Active=$(grep -i $Status_Active Test_Active.txt )
    if [ -n "$Search_Active" ] ; then
        notify-send -i important "$Pacote_Apache Ativo!."
        echo "$Search_Active"
        echo "Gostaria de Desativar Apache2 [s/n]: "
        read ReadStatusSN
        if [ "$ReadStatusSN" = "s" ] ; then
            notify-send -i important "Desativando Apache2!"
            sudo service $Status_Stop
            sudo service $Status_Apache > Test_Active.txt
            Search_Active=$(grep -i $Status_Active Test_Active.txt )
            echo "$Search_Active"
        fi
    else
        notify-send -i important "$Pacote_Apache Desativado!."
        echo "$Search_Active"
        echo "Gostaria de Ativar Apache2 [s/n]: "
        read ReadStatusSN
        if [ "$ReadStatusSN" = "s" ] ; then
            notify-send -i important "Ativando Apache2!"
            sudo service $Status_Start
            if [ "$?" == 0 ] ; then
                sudo service $Status_Apache > Test_Active.txt
                Search_Active=$(grep -i $Status_Active Test_Active.txt )
                echo "$Search_Active"        
            else
                notify-send -i important "Apache2 não instalado!"
            fi
        fi
    fi
    rm Test_Active.txt
    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> ServidorLog.log
    
    echo -e "${ctm} Instalado pronto. ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    sleep 5
    MenuServidor          #retorna ao fluxo
}

# by: Elizeu de Santana / 23-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function ConfigApache(){
    ### ###
    Titulo
    tmpD="$(date)"
    tmpL=" Processo: Configuração Servidor de Internet apache2"
     echo -e "${ctm} Iniciando Configuração Servidor de Internet apache2... ${dlc}"

    # Firewall-----------------------------------------------------
    sudo sudo ufw $Status_Firewall > Test_FActive.txt
    Search_FActive=$(grep -i $Status_FActive Test_FActive.txt )
    if [ -n "$Search_FActive" ] ; then
        notify-send -i important "Firewall Ativo!"
        echo "HABILITE O IPV6"
        sleep 10
        sudo nvim /etc/default/ufw                            #edita hosts IPV6=yes
        
        sudo ufw allow http                                   #sudo ufw allow 80/tcp
        sudo ufw allow https                                  #sudo ufw allow 443/tcp
        sudo ufw allow ssh                                    #sudo ufw allow 22/tcp
        sudo ufw app info "Apache Full"
        sudo ufw allow in "Apache Full"
        sudo ufw app list
        sudo ufw reload
    else
        notify-send -i important "Firewall Inativo!"
        echo "HABILITE O IPV6"
        sleep 10
        sudo nvim /etc/default/ufw                            #edita hosts IPV6=yes
        sudo ufw allow http                                   #sudo ufw allow 80/tcp
        sudo ufw allow https                                  #sudo ufw allow 443/tcp
        sudo ufw allow ssh                                    #sudo ufw allow 22/tcp
        sudo ufw app info "Apache Full"
        sudo ufw allow in "Apache Full"
        sudo ufw app list
        sudo ufw reload
        sudo ufw enable
    fi
    rm Test_FActive.txt
  
    # Permissões --------------------------------------------------
    notify-send -i important "Dando permições em /var/www!"
    sudo chown -R www-data:www-data /var/www

    # hosts ----------------------------------------------------------------
    # notify-send -i important "Edit seus hosts!"
    # Ip_Conn=curl http://icanhazip.com
    # notify-send -i important "Edit hosts $Ip_Conn elisoftware.com!"
    # sudo subl /etc/hosts
    # sudo mkdir -p /var/www/html/elisoftware.com/
    # #sudo rm -rfv /var/www/html/elisoftware.com/
    # sudo chmod -R 775 /var/www/html/elisoftware.com/
    # sudo chown -R www-data:www-data /var/www/html/elisoftware.com/
    # tmp=
    # <html>
    # <cabeça>
    #   <title> Bem vindo ao elisoftware.com! </ title>
    # </ head>
    # <body>
    #   <h1> O host virtual elisoftware.com está funcionando! </ h1>
    # </body>
    # </html>
    # sudo chmod -R 775 /var/www/html/elisoftware.com/
    # sudo cat $tmp > /var/www/html/elisoftware.com/index.html
    # #sudo subl /var/www/html/elisoftware.com/index.html
    # tmp=<VirtualHost *:80>
    #   ServerName elisoftware.com
    #   ServerAlias www.elisoftware.com
    #   ServerAdmin webmaster@elisoftware.com
    #   DocumentRoot /var/www/html/elisoftware.com/
    #   ErrorLog ${APACHE_LOG_DIR}/elisoftware.com_error.log
    #   CustomLog ${APACHE_LOG_DIR}/elisoftware.com_access.log combined
    # </VirtualHost>
    # sudo chmod -R 775 /etc/apache2/sites-available/
    # sudo cat $tmp > /etc/apache2/sites-available/elisoftware.com.conf
    # #sudo subl /etc/apache2/sites-available/elisoftware.com.conf
    # sudo a2ensite elisoftware.com.conf
    # sudo apache2ctl configtest
    # sudo systemctl restart apache2
    # links elisoftware.com # entra intelbras
    # #sudo service apache2 restart
      
    links http://localhost
 
    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> ServidorLog.log
    echo -e "${ctm} Configurado Servidor de Internet apache2... ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    sleep 5
    MenuServidor
}

# by: Elizeu de Santana / 23-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function LampByTeddysun(){
    ### ###
    Titulo
    tmpD="$(date)"
    tmpL=" Processo: Iniciando Instalação Servidor de Internet [ LAMP ] { byTeddysun }"
    echo -e "${ctm} Servidor de Internet [ LAMP ] { byTeddysun }... ${dlc}"

  	sudo apt-get -y install wget screen git
  	cd ~/downloads/
  	git clone https://github.com/teddysun/lamp.git
  	cd lamp
  	sudo chmod 755 *.sh
  	#screen -S lamp
  	sudo ./lamp.sh
    . 'Config_Time.sh'
  	ConfigurarHora
    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> ServidorLog.log
    
    echo -e "${ctm} Instalado pronto. ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    sleep 5
    MenuServidor          #retorna ao fluxo
}

# by: Elizeu de Santana / 23-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function InstallCockpit(){
    ### ###
    Titulo
    tmpD="$(date)"
    tmpL=" Processo: Instalação monitor Cockpit."
    echo -e "${ctr} Instalando monitor Cockpit. ... ${dlc}"

    sudo apt install -y cockpit
    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> ServidorLog.log
    
    echo -e "${ctr} Instalado pronto. ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    sleep 5
    MenuServidor          #retorna ao fluxo
}

# by: Elizeu de Santana / 23-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function InstallApache(){
    ### ###
    Titulo
    tmpD="$(date)"
    tmpL=" Processo: Instalando $Pacote_Apache $Modulos_Apache."
    echo -e "${ctr} Instalando $Pacote_Apache $Modulos_Apache... ${dlc}"
    pacote=$(dpkg --get-selections | grep "$Pacote_Apache" )
    if [ -n "$pacote" ] ; then                                        #pacote existe
        echo "Pacote $Pacote_Apache ja instalado"
        notify-send -i important "Pacote $Pacote_Apache ja instalado!."
    else                                                              #pacote não existe - Instale
         echo -e "${ctr} \n Instando $Pacote_Apache ${dlc}"
        notify-send "Intalando $Pacote_Apache!"
        sudo apt-get install $Pacote_Apache $Modulos_Apache -y
        links "http://localhost"
    fi
    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> ServidorLog.log
    
    echo -e "${ctr} Instalado $Pacote_Apache $Modulos_Apache... ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    sleep 5
    MenuServidor
}