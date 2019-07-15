#!/bin/bash
############################################################################################
#
# Bob utilities script bash 
#
#                                                                      The MIT License (MIT)
#                                                         Copyright (c) 2019 elizeudesantana
#
version="2019.01"             											# Versão do Programa
#
scriptFileVersion="1.0.0"                                                 # Versão do script
#
# History:
# 	0.0.1                                    script version inicial, estrutura de diretório.
#   2019.01      Dividido em diretórios criação de route e tipando de forma MVC (23/06/2019)
#
# Dependências:                                                Nome do arquivo: bob_util.sh
#	function Dependencias()
#
# * Retorno: n/a
# * Data: n/a
#
# by: Elizeu de Santana -------------------------------------------------------------------

# -----------------------------------------------------------------------------------------    
                                                                                  # [Rotas]
                                        # Variável  -> pespectiva de localizações do script
# -----------------------------------------------------------------------------------------
function Location(){
    instalacao="/projetos/bob";                                          # Diretorio de Instalação apartir de HOME
    
    scriptPath_Home="${HOME}";                                           # Diretorio HOME (~)
    scriptPath_Bob="${scriptPath_Home}${instalacao}";                    # Diretrio de Instalação do Bob
    scriptPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";      # Diretorio de instalação do script 
    if [ $scriptPath != $scriptPath_Bob ] ; then
        utilsLocation="${scriptPath_Bob}/lib/bob_util.sh";               # Diretorio de localização bob_util.sh
        enderecoRelativo_bin="${scriptPath_Bob}/bin";                    # Estrutura de diretorio bin
        enderecoRelativo_lib="${scriptPath_Bob}/lib";                    # Estrutura de diretorio lib
        enderecoRelativo_view="${scriptPath_Bob}/lib/view";              # Estrutura de diretorio lib/view
        enderecoRelativo_doc="${scriptPath_Bob}/doc";                    # Estrutura de diretorio doc          
    else
        utilsLocation="${scriptPath}/lib/bob_util.sh"; 
        enderecoRelativo_bin="${scriptPath}/bin";                        # Estrutura de diretorio bin
        enderecoRelativo_lib="${scriptPath}/lib";                        # Estrutura de diretorio lib
        enderecoRelativo_view="${scriptPath}/lib/view";                  # Estrutura de diretorio lib/view
        enderecoRelativo_doc="${scriptPath}/doc";                        # Estrutura de diretorio doc
    fi
    bobLocation="${enderecoRelativo_bin}/bob.sh";                        # Diretorio de localização bob.sh
    confLocation="${enderecoRelativo_doc}/bob.conf";                     # Diretorio de localização bob.conf
    coresLocation="${enderecoRelativo_view}/bob_util_cores.sh";          # Diretorio de localização bob_util_cores.sh
    montanteLocation="${enderecoRelativo_lib}/bob_util_montante.sh";     # Diretorio de localização bob_util_montante.sh
    tituloLocation="${enderecoRelativo_view}/bob_util_titulo.sh";        # Diretorio de localização bob_util_titulo.sh
    confLocation="${enderecoRelativo_lib}/bob_util_conf.sh";             # Diretorio de localização bob_util_conf.sh
    manutencaoLocation="${enderecoRelativo_lib}/bob_manutencao.sh";      # Diretorio de localização bob_manutencao.sh
    instalacaoLocation="${enderecoRelativo_lib}/bob_instalacao.sh";      # Diretorio de localização bob_instalacao.sh
    shellfontsLocation="${enderecoRelativo_lib}/bob_shellfonts.sh";      # Diretorio de localização bob_shellfonts.sh
    bancodadosLocation="${enderecoRelativo_lib}/bob_bancodados.sh";      # Diretorio de localização bob_bancodados.sh
    financeiroLocation="${enderecoRelativo_lib}/bob_financeiro.sh";      # Diretorio de localização bob_financeiro.sh
    financeiroBDLocation="${enderecoRelativo_lib}/bob_financeiro_BD.sh"; # Diretorio de localização bob_financeiroBD.sh
    lembraLocation="${enderecoRelativo_lib}/bob_lembra.sh";              # Diretorio de localização bob_lembra.sh
    lembramontanteLocation="${enderecoRelativo_lib}/bob_lembra_montante.sh"; # Diretorio de localização bob_lembra.sh
    programasLocation="${enderecoRelativo_lib}/bob_programas.sh";        # Diretorio de localização bob_programas.sh
    pythonLocation="${enderecoRelativo_lib}/bob_python.sh";              # Diretorio de localização bob_python.sh
    servidorLocation="${enderecoRelativo_lib}/bob_servidor.sh";          # Diretorio de localização bob_servidor.sh
    textoLocation="${enderecoRelativo_lib}/bob_texto.sh";                # Diretorio de localização bob_texto.sh
    zzfuncaoLocation="${enderecoRelativo_lib}/bob_zzfuncao.sh";          # Diretorio de localização bob_zzfuncao.sh
    chtLocation="${enderecoRelativo_lib}/cht.sh";                        # Diretorio de localização cht.sh
    errosLocation="${enderecoRelativo_lib}/Erros.sh";                    # Diretorio de localização Erros.sh
    fluxogramasLocation="${enderecoRelativo_lib}/fluxograma.sh";         # Diretorio de localização fluxograma.sh
    bobMenuLocation="${enderecoRelativo_view}/bob_menu.sh";              # Diretorio de localização bob_menu.sh
    datasLocation="${enderecoRelativo_lib}/datas";                       # Diretorio de localização datas
    fontsLocation="${scriptPath_Home}/.local/share/fonts";               # Diretorio de localização fonts
    bobfontsLocation="${enderecoRelativo_view}/bob_util_fonts.sh";       # Arquivo de localização fonts
    climaLocation="${enderecoRelativo_doc}/clima.tmp";                   # Arquivo para uso do Clima Titulo
    info_arq="${enderecoRelativo_doc}/bob_snapshot.${myhost}.$tempo";    # Arquivo para manutenção Relatorio
    aptlistLocation="${enderecoRelativo_doc}/listaPacotes_apt.cfg";      # Arquivo auxiliar instalação
    searchLocation="${enderecoRelativo_doc}/search.tmp";                 # Arquivo auxiliar search
    bobradioLocation="${enderecoRelativo_lib}/bob_radio.sh";             # Arquivo bob_radio
    botLocation="${enderecoRelativo_lib}/shellbot.sh";                   # Arquivo bob_shellbot   
    notoemojiLocation="${enderecoRelativo_doc}/NotoEmoji.zip";           # Arquivo font   
    nerdfontLocation="${enderecoRelativo_doc}/ubuntu.zip";               # Arquivo font   
    #codecsjasonLocation="${enderecoRelativo_doc}/codecs.json";           # Arquivo auxiliar dependencias json
    #browsersjasonLocation="${enderecoRelativo_doc}/browsers.json";       # Arquivo auxiliar dependencias json
    #desenvolvimentojasonLocation="${enderecoRelativo_doc}/desenvolvimento.json"; # Arquivo auxiliar dependencias json
    #diversosjasonLocation="${enderecoRelativo_doc}/diversos.json";       # Arquivo auxiliar dependencias json
    #outrosjasonLocation="${enderecoRelativo_doc}/outros.json";       # Arquivo auxiliar dependencias json
}    

# -----------------------------------------------------------------------------------------
                                                                  # {Carregando os scripts}
# -----------------------------------------------------------------------------------------
function Change(){
    # -----------------------------------------------------------------------------------------
    if [ -f "${montanteLocation}" ] ; then       ### carregando o arquivo util montante ###
        source "${montanteLocation}";
        e_success "Carregado ... ${montanteLocation}";
    else
        e_error "Erro carregando ${montanteLocation}";
    fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${tituloLocation}" ]; then     ### carregando o arquivo de title and exit ###
        source "${tituloLocation}";
        e_success "Carregado ... ${tituloLocation}";
    else
        e_error "Erro carregando ${tituloLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${bobMenuLocation}" ]; then
        source "${bobMenuLocation}";
        e_success "Carregado ... ${bobMenuLocation}";
    else
        e_error "Erro carregando ${bobMenuLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${pythonLocation}" ]; then
        source "${pythonLocation}";
        e_success "Carregado ... ${pythonLocation}";
    else
        e_error "Erro carregando ${pythonLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${instalacaoLocation}" ]; then
        source "${instalacaoLocation}";
        e_success "Carregado ... ${instalacaoLocation}";
    else
        e_error "Erro carregando ${instalacaoLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${lembraLocation}" ]; then
        source "${lembraLocation}";
        e_success "Carregado ... ${lembraLocation}";
    else
        e_error "Erro carregando ${lembraLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    # if [ -f "${textoLocation}" ]; then
    #     source "${textoLocation}"; Class_Tratamento_Arquivo;
    # else
    #     e_error "Erro carregando ${textoLocation}"; Sair;
    # fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${financeiroLocation}" ]; then
        source "${financeiroLocation}";
        e_success "Carregado ... ${financeiroLocation}";
    else
        e_error "Erro carregando ${financeiroLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${fluxogramasLocation}" ]; then
        source "${fluxogramasLocation}";
        e_success "Carregado ... ${fluxogramasLocation}";
    else
        e_error "Erro carregando ${fluxogramasLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${manutencaoLocation}" ]; then
        source "${manutencaoLocation}";
        e_success "Carregado ... ${manutencaoLocation}";
    else
        e_error "Erro carregando ${manutencaoLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${bancodadosLocation}" ]; then
        source "${bancodadosLocation}";
        e_success "Carregado ... ${bancodadosLocation}";
    else
        e_error "Erro carregando ${bancodadosLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${bobfontsLocation}" ]; then
        source "${bobfontsLocation}";
        e_success "Carregado ... ${bobfontsLocation}";
    else
        e_error "Erro carregando ${bobfontsLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    # if [ -f "${bobradioLocation}" ]; then
    #     source "${bobradioLocation}";
    #     echo "${bobradioLocation}";
    # else
    #     e_error "Erro carregando ${bobradioLocation}"; Sair;
    # fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${programasLocation}" ]; then
        source "${programasLocation}";
        e_success "Carregado ... ${programasLocation}";
    else
        e_error "Erro carregando ${programasLocation}"; Sair;
    fi 
    # -----------------------------------------------------------------------------------------    
    if [ -f "${coresLocation}" ]; then      ### carregando o arquivo de cores ###
        source "${coresLocation}";
        e_success "Carregado ... ${coresLocation}";
    else
        e_error "Erro carregando ${coresLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${confLocation}" ]; then       ### carregando o arquivo .conf ###
        source "${confLocation}";
        e_success "Carregado ... ${confLocation}";
    else
        e_error "Erro carregando ${confLocation}"; Sair;
    fi
    #[ -e ${confLocation} ] || { echo "Arquivo bob.conf ausente!"; }; source ${confLocation} 
}

# ========================================================================================
# Class Bob
# ----------------------------------------------------------------------------------------
   # Função  (não usada) porque foram usadas na versão inicial na próxima revisão deixaram 
                                                                              # de existir.
# ----------------------------------------------------------------------------------------
function Class_Bob(){
    Location; Change;
    # -----------------------------------------------------------------------------------------    
    set Desliga_cores="${Desliga_cores}";               ### set constantes ###
    set Cor_linha_logotipo="${Cor_linha_logotipo}"; 
    set Cor_linhas="${Cor_linhas}"; 
    set Cor_texto_result="${Cor_texto_result}"; 
    set Cor_texto_Menu="$Cor_texto_Menu"; 
    set Cor_logo="$Cor_logo"; 
    set Logotipo_Titulo="${Logotipo_Titulo}"; 
    set Nome_do_Usuario="${Nome_do_Usuario}";
    set Relogio_tela="${Relogio_tela}"; 
    set Tela_Entrada="${Tela_Entrada}";
    # -----------------------------------------------------------------------------------------    
                                                                                 # [ shellbot ]
    # -----------------------------------------------------------------------------------------  
    # if [ -f "${botLocation}" ]; then       
    #     source "${botLocation}";
    #     varDebug_conf="Realizado Source no arquivo: ${botLocation}"; 
    # else
    #     e_error "Erro carregando ${botLocation}"; Sair;
    # fi
    # Token do bot
    # bot_token='870211541:AAHIrM9nAMwmgQCK8XATctOyTzOKcxhAOHk'
    # Inicializando o bot
    # ShellBot.init --token "$bot_token"
    # Imprime o username do bot.
    # ShellBot.username
    # -----------------------------------------------------------------------------------------    
                                                                               # [ Constantes ]
    # -----------------------------------------------------------------------------------------                                                                               
                                      # array contendo todas as funções da classe -> declare -a
    declare -a array_Class_Bob=();
    array_Class_Bob=( "_Clima_" "_Services_" "Inicia_radio" "_Anime_" "_Annime_" "progressBar" 
        "display_info" "join" "is_linux" "is_ubuntu" "is_ubuntu_desktop" "is_exists" 
        "is_not_exists" "is_file" "is_not_file" "is_dir" "is_not_dir" "is_symlink" 
        "is_not_symlink" "is_empty" "is_not_empty" "type_not_exists" "is_os" 
        "seek_confirmation_force" "is_confirmed_force" "is_not_confirmed_force" "skip" 
        "unmountDrive" "help" "pauseScript" "in_array" "lower" "upper" "ltrim" "rtrim" "trim" 
        "squeeze" "squeeze_lines" "Escreve" "Desenha" "Dependencias" "__dialogo" );            
                                                                                # Dependencias
    deps=() #byobu nmcli grep awk figlet tput htop irssi neofetch
                                                             # banco de dados relacional mysql
                                              # credit : https://thobias.org/doc/shell_bd.html
    sql_root="sudo mysql -u root -pelizeu -e";
    sql_user_name="bob"; 
    sql_user_senha="senha"; # ~.my.cnf
    agenda_DB="bob_DB"; 
    agenda_tabela="agenda"; 
    lembrete_tabela="lembrete";
    sql_user="mysql -u $sql_user_name -p$sql_user_senha -e "; 

    # -----------------------------------------------------------------------------------------    
                                                                                # [ Variaveis ]
    # -----------------------------------------------------------------------------------------    
    scriptName=`basename $0`; 
    scriptBasename="$(basename ${scriptName} .sh)"                              # Em bob_i.sh
    thisHost=$(hostname); 
                                                # data & hora
    now=$(LC_ALL=C date +"%m-%d-%Y %r")                                         # Returns: 06-14-2015 10:34:40 PM
    datestamp=$(LC_ALL=C date +%Y-%m-%d)                                        # Returns: 2015-06-14
    #hourstamp=$(LC_ALL=C date +%r)                                             # Returns: 10:34:40 PM
    hourstamp=`date | cut -d" " -f4 | cut -d: -f1`; 
    timestamp=$(LC_ALL=C date +%Y%m%d_%H%M%S)                                   # Returns: 20150614_223440
    today=$(LC_ALL=C date +"%m-%d-%Y")                                          # Returns: 06-14-2015
    longdate=$(LC_ALL=C date +"%a, %d %b %Y %H:%M:%S %z")                       # Returns: Sun, 10 Jan 2016 20:47:53 -0500
    gmtdate=$(LC_ALL=C date -u -R | sed 's/\+0000/GMT/')                        # Returns: Wed, 13 Jan 2016 15:55:29 GMT
    
    local pid=$(ps -eo pid,comm | awk '$2 == "bob.sh" {print $1 }' | sed -n '1p' );
    #myhost=$(/bin/hostname); 
    #tempo=$(/bin/date +%m%d%y_%H%M%S); 
    hi="";

    COMPACTARDIR=/home/elizeu/Documentos        # Diretorio para Compactação
    BACKUPDIR=/home/elizeu/Documentos           # Directory to backup
    GDRIVEDIR=/mnt/GoogleDrive                  # Google Drive directory
    TARGETDIR=backups                           # Directory target in remote
    #Key=cat ChaveGoogleDriver.txt
    Driver=https://drive.google.com/drive/my-drive

    # arquivos de log
    declare -a log;
    log=( 'bob.log' 'setupapp.log' 'bob.conf'); 
    # Logging
    # ----------------------------------------------------------------------------------------
    # Log is only used when the '-l' flag is set.
    # Save to Desktop use: $HOME/Desktop/${scriptBasename}.log
    # Save to standard user log location use: $HOME/Library/Logs/${scriptBasename}.log
    # ----------------------------------------------------------------------------------------
    logFile="${enderecoRelativo_doc}/${scriptBasename}.log"

    # ----------------------------------------------------------------------------------------
                                                      # (O arquivo de saída é usado em Titulo)
                                                                    # Guaratiba Rio de Janeiro 
    # ----------------------------------------------------------------------------------------                                                    
    function _Clima_(){                       # consulta -t js, config -c e -i para instalação
        
        if [[ "${1}" = "-c" ]]; then                                              # configurar
            local geoLocation="Guaratiba"                  # is default Rio de Janeiro, Brazil
            # implementar

        # https://www.npmjs.com/package/wttr 
        elif [[ "${1}" = "-i" ]]; then                                            # instalação
            # Node CLI for wttr.in
            npm i wttr -g                                               # globally install 💾                         
        
        elif [[ "${1}" = "-t" ]]; then                                             # consulta
            if [[ "${2}" = "js" ]]; then
                Titulo_Inicial;
                wttr Guaratiba;                                  # get weather ☀️☁️🌦️❄️  
                wttr -M ;                                                 # get Moon phase 🌗
                read;
            else                                    # gera o arquivo de montagem para o titulo
                curl 'wttr.in/{Guaratiba}?format=%l:%c+%t+%h+%M+%w+%p+%P+%m' >${climaLocation}
            fi 
        fi
    }
    # ----------------------------------------------------------------------------------------
                                                      # (O arquivo de saída é usado em Titulo)
    # ----------------------------------------------------------------------------------------                                                    
    function _Services_(){
        Titulo_Inicial; printf "\n\n"; e_arrow -l "Escolhas disponivesi: (s)ystemctl, (l)og, sai(r)"; read opt;
        if [ ${opt} = "s" ] ; then
            Titulo_Inicial;
            systemctl list-dependencies --type service; 
            systemctl list-units --type service --all;
            systemctl list-units --type service; 
            Titulo_Inicial; seek_confirmation "Verificar status-all?";
            if is_confirmed ;then
                service --status-all; 
            fi
            Titulo_Inicial; seek_confirmation "Verificar status?";
            if is_confirmed ;then
                e_arrow -l "Digite o nome do service: "; read nome;
                service ${nome} status; read;
            fi
            _Services_
        elif [ ${opt} = "l" ] ; then
            Titulo_Inicial;
            printf "\n\n\n";
            e_arrow "A listagem do diretorio /etc/init.d";
            Mostra_diretorio "/etc/init.d"; printf "\n\n";
            e_arrow "Analise do historico log do sistema, para sair (q ou C-c).";
            e_arrow "Dentro dos logs, pode-se  usar (i), (p) ou (m) para melhor visualizar.";
            which lnav || Dependencias lnav; 
            e_arrow -l "As escolhas disponiveis são: (l)nav, (d)pkg log, (a)pache2 log, -(r) old logs, -(t) timestamps e -a re(c)ent : "; read opt;
            if [ ${opt} = "l"] ; then
                sudo lnav 
            elif [ ${opt} = "d" ] ; then
                sudo lnav /var/log/dpkg.log
            elif [ ${opt} = "a" ] ; then
                sudo lnav /var/log/apache2
            elif [ ${opt} = "r" ] ; then
                sudo lnav -r # old logs
            elif [ ${opt} = "t" ] ; then
                sudo lnav -t # with timestamps options 
            elif [ ${opt} = "c" ] ; then
                sudo lnav -a # To load all of the most recent log file types, run the following command:
            fi
            _Services_
        else
            Principal;
        fi
    }
    # -----------------------------------------------------------------------------------------
                                                                     # (Ator para help escreve)
           # boy, dog unicornio whirly(nuvem) xes(circulo)  twisted (quadro) spring  scroll-akn  
                # santa (papai-noel) peek nuke mouse ian_jones girl boxquote(mp3)  capgirl  cat
                                                                        # uso :
                                                                          # Escreve string ator
    # -----------------------------------------------------------------------------------------
    function Escreve(){
        which boxes || Dependencias boxes; 
        echo -e $1 | boxes -d $2 > ${searchLocation}
    }
    # -----------------------------------------------------------------------------------------
                                                                    #(Ator para help desenha)
    # -----------------------------------------------------------------------------------------
    function Desenha(){
        count=0
        while IFS="\n" read lin; do 
            count=$((${count} + 1)); 
            lins[${count}]=${lin}
        done < ${searchLocation}; i=11
        for lin in "${lins[@]}"; do
            flc ${i} 80; printf "${blue}$lin${reset}"
            ((i=$i+1))
        done
    }
    
    # -----------------------------------------------------------------------------------------
                                                                       # REVIEW  (function dp )
    # -----------------------------------------------------------------------------------------
    function Bob_dp(){
        declare codecs_dp=();                          # NOTE Matrizes contendo as dependências.
        declare develop_dp=();
        declare browser_dp=();
        declare diversos_dp=();
        declare outros_dp=();

        codecs_dp=( "libdvdnav4" "libdvdread4" "gstreamer1_0_plugins_bad" 
            "gstreamer1_0_plugins_ugly" "ubuntu_restricted_extras" );
        develop_dp=( "kdevelop" "codeblocks_contrib" "codeblocks" "mingw_w64"
            "build_essential" "gcc" "g_plus_plus" "gpp" "bluefish_plugins" "bluefish" 
            "openjdk_8_jdk" "python3_pip" "python_pip" "anjuta_extra" "anjuta" );
        browser_dp=( "google" "links" "chromium" "epiphany_browser" "tor" 
            "torbrowser_launcher" );
        diversos_dp=( "tilix" "terminology" "playonlinux" "wine" "geany" "atom" 
            "codium" "Neovim" "code" "sublime_text" "eclipse" "Anaconda3" 
            "android_studio" "Glade" "Chatty_StreamlinkTwitchGUI" "StreamlinkTwitchGUI" 
            "vlc");
        outros_dp=( "libgdbm-dev" "tmux-xpanes" "ansible" "zlib1g-dev" "libgdbm3" "libffi-dev" 
            "libncurses5-dev" "libreadline6-dev" "libyaml-dev" "libssl-dev" "build-essential" 
            "bison" "autoconf" "rvm" "handbrake-cli" "vim" "silentcast" "yad" "xdg-utils" 
            "python-cairo" "python-gobject" "wmctrl" "wininfo" "xdotool" "x11-xserver-utils" 
            "libav-tools" "php7.2-opcache" "php7.2-readline" "php7.2-json" "php7.2-common" 
            "php7.2-cli" "php-common" "php7.2-mysql" "libapache2-mod-php7.2" "php-gettext" 
            "php7.2-pgsql" "phppgadmin" "php7.2" "mysql-server" "postgresql-contrib" "postgresql"
            "mysql-workbench" "tree"  "telnet" "sl" "thefuck" "silversearcher-ag" "nmap" "python-pip"
            "mercurial" "jq" "imagemagick" "id3tool" "hollywood" "groff" "git-core" "docker-compose"
            "docker.io" "curl" "cowsay" "cmatrix" "build-essential" "awscli" "neofetch" "irssi" "htop"
            "tput" "figlet" "awk" "grep" "nmcli" "byobu" "aptitude" "xampp" );

        echo $1
        
        ___Dependencia desenvolvimento; e_success "Carregado ... desenvolvimento";   # 0 .. 14
        for ((i=0;i<=14;i++)); do
            echo "${'desenvolvimentoNome_'${i}}"
            echo "${'desenvolvimentoDescription_'$[i]}"
            echo "${'desenvolvimentoversion_'${i}}"
            echo "${'desenvolvimentoHomepage_'${i}}"
            echo "${'desenvolvimentoInstall_'${i}'[0]'}"
            echo "${'desenvolvimentoInstall_'${i}'[1]'}"
            echo "${'desenvolvimentoInstall_'${i}'[2]'}";
        done
        read
        ___Dependencia browsers; e_success "Carregado ... browsers";                 # 0 .. 5
        ___Dependencia codecs; e_success "Carregado ... codecs";                     # 0 .. 4
        ___Dependencia diversos; e_success "Carregado ... diversos";                 # 0 .. 16
        ___Dependencia outros; e_success "Carregado ... outros";                     # 0 .. 74

        echo Nome_74
        echo Description_74
        echo version_74
        echo Homepage_74
        echo Install_74 # "sudo apt install tmux-xpanes -${Yn}" );
        read;
        #//-\_(``)_/-
    }
    # -----------------------------------------------------------------------------------------
    # Função Construtor_Apt_Get
    # -----------------------------------------------------------------------------------------
    # Construtor para o gerenciador apt-get linux ubuntu
    # -----------------------------------------------------------------------------------------
    function Construtor_Apt_Get1(){
        # is_ubuntu || return 1

        clear
        e_arrow "O ${red}${reset}${blue}   ${reset} instala vários aplicativos, conforme o usuários faz uso do software."
        printf "\n"; apt-cache stats; printf "\n";
        e_note "Você pode ter a lista de todos os pacotes (${purple}i${reset}${blue})nstalados ou uma (${purple}l${reset}${blue})ista de todos os"
        e_note -c "pacotes disponiveis para instalação no aplicativo gerênciador de pacotes, ainda"
        e_note -c "pode pesquisar por um pacote (${purple}e${reset}${blue})specífico, bastando digitar o nome do aplicativo"
        e_note -c "abaixo, contendo dependências e informações diversas, pode ainda pesquisar por pacotes"
        e_note -c "(${purple}q${reset}${blue})uebrados. Ou mesmo (${purple}a${reset}${blue})tualizar com update e fazer upgrade. O (${purple}h${reset}${blue})olding de pacotes" 
        e_note -c "significa que ele não pode ser atualizado até você voltar a usá-lo novamente."
        e_note -c "Aqui (${purple}u${reset}${blue})nhold. Se quizer editar o arquivo de o(${purple}r${reset}${blue})igem, sera mostrado uma"
        e_note -c "lista com os editores disponiveis aconselhamos o uso do indicado pela seta. Gostaria" 
        e_note -c "de usar o au(${purple}t${reset}${blue})oremove + purge. E re(${purple}m${reset}${blue})over e purgar, digite o nome abaixo."
        e_note -c "E se deseja i(${purple}n${reset}${blue})stalar. Descubra todo o pacote Debian que pode"
        e_note -c "ser usado para detecção de intru(${purple}s${reset}${blue})ão. Descubra todos os pacotes sni(${purple}f${reset}${blue})fer."
        e_note -c "E por último, tudo em um só lu(${purple}g${reset}${blue})ar aptitude."
        read -p "Digite uma das letras entre parenteses, acima : " opt
        # -----------------------------------------------------------------------------------------    
                                                                  # [ lista de pacotes instalados ]
        # -----------------------------------------------------------------------------------------
        if [ ${opt} = "i" ] ; then
            apt list --installed; 
            seek_confirmation "Gostaria de mais detalhes."
            if is_confirmed; then
                dpkg -l; 
            fi
            read; 
        # -----------------------------------------------------------------------------------------    
                                                               # [ Programa de controle de pacote ]
        # -----------------------------------------------------------------------------------------
        elif [ ${opt} = "g" ] ; then
            aptitude
        # -----------------------------------------------------------------------------------------    
                                              # [ lista de pacotes que compẽm o conjunto snniffer ]
        # -----------------------------------------------------------------------------------------
        elif [ ${opt} = "f" ] ; then
            apt-cache search sniffer; read;
        # -----------------------------------------------------------------------------------------    
                                  # [ lista de pacotes que compẽm o conjunto Intrusion Detectioln ]
        # -----------------------------------------------------------------------------------------
        elif [ ${opt} = "s" ] ; then
            apt-cache search "Intrusion Detection"; read;
        # -----------------------------------------------------------------------------------------    
                                                                           # [ Remover de pacotes ]
        # -----------------------------------------------------------------------------------------
        elif [ ${opt} = "m" ] ; then
            read -p "Digite o nome do pacote, para remover e purgar : " pac
            sudo apt remove ${pac};
            sudo apt purge ${pac}; read;
        # -----------------------------------------------------------------------------------------    
                                                                          # [ Instalar de pacotes ]
        # -----------------------------------------------------------------------------------------
        elif [ ${opt} = "n" ] ; then
            read -p "Digite o nome do pacote, para instalar : " pac
            sudo apt install ${pac}; read;
        # -----------------------------------------------------------------------------------------    
                                                 # [ lista de pacotes disponiveis para instalação ]
        # -----------------------------------------------------------------------------------------
        elif [ ${opt} = "l" ] ; then
            local count=0;
            declare apt_depens_search;
            if is_not_exists ${aptlistLocation}; then  
                echo "aqui"
                apt-cache pkgnames > ${aptlistLocation}
            fi 
            function carrega_apt_depens(){
                while IFS="\n" read package; do 
                    count=$((${count} + 1)); 
                    apt_depens[${count}]=${count}" - ${package}"
                done < ${aptlistLocation}
            }
            carrega_apt_depens; clear
            e_header "listando APT pacotes, totalizando (${#apt_depens[@]})"; i=0;
            if [[ ${#apt_depens[@]} -lt 100 ]]; then
                for package in "${apt_depens[@]}"; do
                    printf "$(e_arrow "$package")\t"
                    ((i=$i+1))
                done
            else
                for package in "${apt_depens[@]}"; do
                    printf "$(e_arrow "$package")\t"
                    ((i=$i+1))
                    if [ $i = 100 ] ; then
                        break
                    fi
                done
            fi
            printf "\n\n"; seek_confirmation "Estamos falando de (${#apt_depens[@]}) pacotes, gotaria de realizar um search?"
            if is_confirmed; then
                while true; do
                    unset apt_depens_search;
                    printf "\nDigite a palavra para a busca ou (i)nstalar, (s)air : "; read string
                    if [ ${string} = "s" ] ; then
                        break
                    fi
                    if [ ${string} = "i" ] ; then
                        printf "\nDigite o nome do pacote para instalar ou (s)air : "; read string
                        if [ ${string} = "s" ] ; then
                            break
                        else
                            clear;
                            apt-cache showpkg ${string}
                            apt depends ${string}; 
                            printf "\nVocê pode escolher instalar com (a)pt ou a(p)titude : "; read opt
                            if [[ ${opt} = "a" ]]; then
                                sudo apt install ${string}
                            elif [[ ${opt} = "p" ]]; then
                                sudo aptitude install ${string}
                            fi
                        fi
                    else
                        grep -r ${string} ${aptlistLocation} > ${searchLocation}; count=0;
                        while IFS="\n" read package; do 
                            count=$((${count} + 1)); 
                            apt_depens_search[${count}]=${count}" - ${package}"
                        done < ${searchLocation}; i=0;
                        for package in "${apt_depens_search[@]}"; do
                            printf "$(e_arrow "$package")\t"
                            ((i=$i+1))
                        done
                    fi
                done
            else
                e_header "listando APT pacotes, toltalizando (${#apt_depens[@]})"; i=0;
                for package in "${apt_depens[@]}"; do
                    printf "$(e_arrow "$package")\t"
                    ((i=$i+1))
                done
            fi
            read; 
        # -----------------------------------------------------------------------------------------    
                                                              # [ Purge e auto-remover de pacotes ]
        # -----------------------------------------------------------------------------------------
        elif [ ${opt} = "t" ] ; then
            sudo apt --purge autoremove
        elif [ ${opt} = "r" ] ; then
            #sudo apt edit-sources
            nano /etc/apt/sources.list
        elif [ ${opt} = "h" ] ; then
            read -p "Digite o nome do pacote, para holding : " pac
            apt hold ${pac}; read;
        elif [ ${opt} = "u" ] ; then
            read -p "Digite o nome do pacote, para unholding : " pac
            apt unhold ${pac}; read;
        elif [ ${opt} = "a" ] ; then
            sudo apt update && sudo apt upgrade; read
        elif [ ${opt} = "e" ] ; then
            read -p "Digite o nome do pacote, para pesquisar : " pac
            apt-cache search ${pac}; read;
            apt-cache pkgnames ${pac}; read;
            apt-cache show ${pac}; read;
            apt-cache showpkg ${pac}; read; 
            apt depends ${pac}; read; 
        elif [ ${opt} = "q" ] ; then # pacotes quebrados
            sudo apt-get check                  
            seek_confirmation "Instalar dependências ?"
            if is_confirmed; then
                read -p "Digite o nome do pacote, para instalar dependências : " pac
                which ${pac}; printf "\n"; seek_confirmation "Instalar dependências ?"
                if is_confirmed; then
                    printf "\n"; sudo apt-get build-dep $pac
                else
                    e_arrow -d "Retornando ao menu principal."; 
                fi
            fi
        fi
        Principal
    }
    # -----------------------------------------------------------------------------------------
                                                                  # Testes de funções para json
    # -----------------------------------------------------------------------------------------
    function bashJson(){
        python readjson.py "$@"
    }
    function jsonGet {
        python -c 'import json,sys
        o=json.load(sys.stdin)
        k="'$1'"
        if k != "":
            for a in k.split("."):
                if isinstance(o, dict):
                    o=o[a] if a in o else ""
                elif isinstance(o, list):
                    if a == "length":
                        o=str(len(o))
                elif a == "join":
                    o=",".join(o)
                else:
                    o=o[int(a)]
                else:
                    o=""
        if isinstance(o, str) or isinstance(o, unicode):
            print o
        else:
            print json.dumps(o)
        '
    }
    function lp(){
        python -c "
            from jsonpath_rw import jsonpath, parse
            import sys,json
            jsonpath_expr = parse('Install.comandos[1]')
            out = [match.value for match in jsonpath_expr.find(json.load(sys.stdin))]
            print out;
        "
    }
    function json_extract() {
        local key=$1
        local json=$2

        local string_regex='"([^"\]|\\.)*"'
        local number_regex='-?(0|[1-9][0-9]*)(\.[0-9]+)?([eE][+-]?[0-9]+)?'
        local value_regex="${string_regex}|${number_regex}|true|false|null"
        local pair_regex="\"${key}\"[[:space:]]*:[[:space:]]*(${value_regex})"

        if [[ ${json} =~ ${pair_regex} ]]; then
            echo $(sed 's/^"\|"$//g' <<< "${BASH_REMATCH[1]}")
        else
            return 1
        fi
    }
    function parse_json()
    {
        echo $1 | \
        sed -e 's/[{}]/''/g' | \
        sed -e 's/", "/'\",\"'/g' | \
        sed -e 's/" ,"/'\",\"'/g' | \
        sed -e 's/" , "/'\",\"'/g' | \
        sed -e 's/","/'\"---SEPERATOR---\"'/g' | \
        awk -F=':' -v RS='---SEPERATOR---' "\$1~/\"$2\"/ {print}" | \
        sed -e "s/\"$2\"://" | \
        tr -d "\n\t" | \
        sed -e 's/\\"/"/g' | \
        sed -e 's/\\\\/\\/g' | \
        sed -e 's/^[ \t]*//g' | \
        sed -e 's/^"//'  -e 's/"$//'
    }
    function LerJson() {
        python -c "import json,sys;sys.stdout.write(json.dumps(json.load(sys.stdin)$1))";
    }
    # ----------------------------------------------------------------------------------------
                                                               # REVIEW  Dependencias Function
                                    # Instala dependencias necessarias, para o software rodar. 
                                                                  # comando para instalar som:
                                               # conda install nwani::portaudio nwani::pyaudio
    # ----------------------------------------------------------------------------------------
    function Dependencias() {
        Titulo_Inicial; printf "\n\n\n\n"
        deps+="$1"
        e_arrow "Iniciando configuração dependências. $(e_success)"
        for i in ${deps[@]}; do
            seek_confirmation "${USER}, existe a seguinte dependência  ${i}, permite a manutenção do sistema ?" 
            if is_confirmed; then
                e_arrow -d "Instalando : $i."
                if [ ${i} = "aptitude" ] ; then
                    sudo apt install ${i}
                else
                    if [ -f *.deb ] ; then
                        sudo dpkg -i ${i}
                    else
                        sudo aptitude install ${i}
                        if [ $? = 0 ] ; then
                            sudo apt-get install ${i} -y
                        fi
                        if [ $? = 0 ] ; then
                            sudo apt install ${i} -y
                        fi
                    fi
                fi
            else
                e_error "Sem a manutenção do sistema, não é possível a execução ${lgt}, supra as dependências e execute novamente."
                Sair
            fi
            e_arrow -d "Configuração dependência ${i} terminada. $(e_success)"
        done; sleep 1
    }
    # ----------------------------------------------------------------------------------------
                                                                                     # (Radio)
    # ----------------------------------------------------------------------------------------                                                    
    function Inicia_radio(){
       bob_radio; 
       Principal;
    }
    # ----------------------------------------------------------------------------------------
                                                                                   # (dialogo)
    # ----------------------------------------------------------------------------------------                                                    
    function __dialogo(){
    #__dialogo escala 
    #__dialogo arquivos 
    #__dialogo progresso 
    #__dialogo notificacao  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>deu erro
    #__dialogo listas pode ser esse
    #__dialogo formularios 
    #__dialogo fontes 
    #__dialogo diretorios 
    #__dialogo icones 
    #__dialogo entradas 
    #__dialogo cores 
    #__dialogo calendario

        if [ ${1} = "calendario" ] ; then
            # uso do yad com --calendar
            # mostra um calendário iniciando com o dia 20/05/2011
            # guarda o valor selecionar na variável $DATA
            DATA=$(\
                    yad --calendar \
                    --day=20 \
                    --month=5 \
                    --year=2011 \
                    --date-format=%d\/%m\/%Y \
                            --title=Calendario \
                            --center \ # disposição do diálogo na tela
            )

            # mostra um diálogo informando a $DATA selecionada
            yad --title="AVISO" \         --text="Você selecionou a data $DATA"

            #.EOF
         elif [ ${1} = "cores" ] ; then
            # uso do yad - com color
            # permite selecionar determinada cor numa paleta de cores
            # e envia o valor para a saída padrão, no caso armazenei na variável $COR

            COR=$(\
            yad --color \
                    --init-color="#FFFFFF" \ #cor que inicialmente fica selecionada na paleta de cores.
                    --palette \
            )

            yad --title="YAD COM COLOR" \
                    --text="Você selecionou a cor $COR"

            #.EOF 
        elif [ ${1} = "entradas" ] ; then
            # yad com --entry
            # recebe valores e armazena em variáveis
            NOME=$(\
                    yad --entry \
                    --entry-label="Nome" \
                    --entry-text="seu nome aqui" \
                    --completion \
                    --editable \
                            --title="USO DO YAD COM --entry" \
                            --width="300" \
            )

            SENHA=$(\
                    yad --entry \
                    --entry-label="Senha" \
                    --entry-text="123456" \
                    --completion \
                    --editable \
                    --hide-text \#senha – esconde o texto digitado apresentando apenas um “.” ponto
                            --title="USO DO YAD COM --entry" \
                            --width="300" \
            )

            yad --title="YAD COM --entry" \
                    --text="Nome: $NOME, Senha: $SENHA" \
                            --width="300" \
                            --height="100"

            #.EOF
        elif [ ${1} = "icones" ] ; then
            # yad com icons
            # mostra os ícones das aplicações instaladas no seu sistema
            # você pode abrir uma aplicação clicando no ícone correspondente
            yad --icons \
                    --read-dir="/usr/share/applications" \
                            --width="600" \
                            --height="500"

            #.EOF
        elif [ ${1} = "diretorios" ] ; then        
            # yas com file
            # permite selecionar um arquivo/diretório através de caixa de diálogo
            # retorna o caminho do arquivo/diretório, deixando a nós o critério de fazer
            # o que quiser com ele, nesse caso só vou mostrar o tamanho
            ARQUIVO=$(\
                    yad --file \
                            --directory \
                            --title="Selecione um diretório para ver seu tamanho" \
                            --width="500" \
                            --height="300" \
            )

            TAMANHO=$(du -sh $ARQUIVO | cut -d"/" -f 1)

            yad --title="Tamanho do diretório" \
                    --text="Tamanho do diretório $ARQUIVO = $TAMANHO" \
                            --width="400" \
                            --height="100" \
                            --button=gtk-ok:0

            # a opcao button=gtk-ok:0 - mostra apenas o botao de ok no dialog
            # e seu código de retorno é 0 (zero)

            #.EOF
        elif [ ${1} = "fontes" ] ; then
            # yad com font
            # mostra um diálogo de seleção de fonte
            # retorna o nome da fonte selecionada e tamanho selecionado, gravando num html
            RESULTADO=$(\
                    yad --font \
                    --fontname="Ubuntu",14 \
                    --preview="Texto para exemplo do uso de fonte yad é 10 :-) " \
                            --title="Selecione uma fonte" \
            )
            # usa expressão regular para pegar apenas o  texto
            FONTE=$(echo $RESULTADO | grep -o '[[:alpha:]]*')
            # usa expressão regular para pegar apenas o tamanho da fonte, 2 digitos
            TAMANHO=$(echo $RESULTADO | egrep -o '[0-9]{2}')

            # grava o resultado num arquivo html para fazer um teste um pouco útil :-)
            echo "texto com a fonte $FONTE e TAMANHO $TAMANHO " > arq_teste.htm

            # abre o firefox para fazer um teste
            firefox file://$PWD/arq_teste.htm

            #.EOF
        elif [ ${1} = "formularios" ] ; then
            # yad com FORMULARIOS, que bacana, tem algumas novidades aprecie com calma
            #HOJE=$(date +%d/%m/%Y)
            #touch $HOME/cad_usuario.txt

            var_form=$(                                                             \
                yad     --form                                                      \
                        --title="Bob instalador"                                    \
                        --width=400                                                 \
                        --height=400                                                \
                        --image="accessories-text-editor"                           \
                        --field="Os seguintes pacotes não estão instalados:":RO ""  \
                        --field="$dp[0]":CHK FALSE                              \
                        --field="$dp[1]":CHK FALSE                   \
                        --field="$dp[2]":CHK TRUE                    \
            )
                        #--field="Cadastrando em":RO "$HOJE"         \
                        #--field="Nome:" ""                          \
                        #--field="Sexo":CB Masculino!Feminino        \
                        #--field="Login:" "$USER"                    \
                        #--field="Senha:":H "123456"                 \
                        #--field="Quantos Filhos:":NUM 0!0..10!1     \
                        #--field="Foto:":FL "$HOME/Pictures"         \
                        #--field="Salvar dados em:":DIR "$HOME"      \
                        #--field="Cor preferida:":CLR "#00DDDD"      \

            DATA=$(echo "$var_form" | cut -d"|" -f 1)
            NOME=$(echo "$var_form" | cut -d"|" -f 2)
            SEXO=$(echo "$var_form" | cut -d"|" -f 3)
            LOGIN=$(echo "$var_form" | cut -d"|" -f 4)
            SENHA=$(echo "$var_form" | cut -d"|" -f 5)
            #notem que pulei o campo 6, pois o mesmo nao retorna valor útil para nós
            LIVRO_PROGRAMACAO=$(echo "$var_form" | cut -d"|" -f 7)
            LIVRO_REDES=$(echo "$var_form" | cut -d"|" -f 8)
            LIVRO_LINUX=$(echo "$var_form" | cut -d"|" -f 9)
            QTD_FILHOS=$(echo "$var_form" | cut -d"|" -f 10)
            FOTO=$(echo "$var_form" | cut -d"|" -f 11)
            SALVAR_EM=$(echo "$var_form" | cut -d"|" -f 12)
            COR=$(echo "$var_form" | cut -d"|" -f 13)
            # repare que o campo $QTD_FILHOS retorna um valor no formato 0.000000
            # vc pode usar uma expressão regular, ou o cut, para capturar apenas os digitos antes do .
            QTD_FILHOS=$(echo $QTD_FILHOS | cut -d"." -f 1)

            #apenas vou mostrar os campos e valores de retorno em um html
            DADOS_USUARIO="<table border=1><br/>
                     <tr><th>CAMPO</th><th>VALOR</th></tr>
                     <tr><td>DATA</td><td>$DATA</td></tr>
                     <tr><td>NOME</td><td>$NOME</td></tr>
                     <tr><td>SEXO</td><td>$SEXO</td></tr>
                     <tr><td>LOGIN</td><td>$LOGIN</td></tr>
                     <tr><td colspan=2 align=center>LIVROS</td></tr>
                     <tr><td>PROGRAMACAO</td><td>$LIVRO_PROGRAMACAO</td></tr>
                     <tr><td>REDES</td><td>$LIVRO_REDES</td></tr>
                     <tr><td>LINUX</td><td>$LIVRO_LINUX</td></tr>
                     <tr><td>QTD_FILHOS</td><td>$QTD_FILHOS</td></tr>
                     <tr><td>FOTO</td><td><img src='$FOTO' /></td></tr>
                     <tr><td>DIRETORIO</td><td>$SALVAR_EM</td></tr>
                     <tr><td>COR</td><td bgcolor='$COR'></td></tr>
                  </table>"

            echo $DADOS_USUARIO > cad_usuario.htm

#            firefox cad_usuario.htm

            #.EOF
        elif [ ${1} = "formularios1" ] ; then
            # yad com FORMULARIOS, que bacana, tem algumas novidades aprecie com calma
            HOJE=$(date +%d/%m/%Y)
            touch $HOME/cad_usuario.txt

            VAR_FORM=$(                                             \
                yad     --form                                      \
                        --title="Bob instalador"              \
                        --width=400                                 \
                        --height=400                                \
                        --image="accessories-text-editor"           \
                        --field="Cadastrando em":RO "$HOJE"         \
                        --field="Nome:" ""                          \
                        --field="Sexo":CB Masculino!Feminino        \
                        --field="Login:" "$USER"                    \
                        --field="Senha:":H "123456"                 \
                        --field="Ler livro sobre:":RO ""            \
                        --field="Programação":CHK FALSE             \
                        --field="Redes":CHK FALSE                   \
                        --field="Linux":CHK TRUE                    \
                        --field="Quantos Filhos:":NUM 0!0..10!1     \
                        --field="Foto:":FL "$HOME/Pictures"         \
                        --field="Salvar dados em:":DIR "$HOME"      \
                        --field="Cor preferida:":CLR "#00DDDD"      \
            )

            DATA=$(echo "$VAR_FORM" | cut -d"|" -f 1)
            NOME=$(echo "$VAR_FORM" | cut -d"|" -f 2)
            SEXO=$(echo "$VAR_FORM" | cut -d"|" -f 3)
            LOGIN=$(echo "$VAR_FORM" | cut -d"|" -f 4)
            SENHA=$(echo "$VAR_FORM" | cut -d"|" -f 5)
            #notem que pulei o campo 6, pois o mesmo nao retorna valor útil para nós
            LIVRO_PROGRAMACAO=$(echo "$VAR_FORM" | cut -d"|" -f 7)
            LIVRO_REDES=$(echo "$VAR_FORM" | cut -d"|" -f 8)
            LIVRO_LINUX=$(echo "$VAR_FORM" | cut -d"|" -f 9)
            QTD_FILHOS=$(echo "$VAR_FORM" | cut -d"|" -f 10)
            FOTO=$(echo "$VAR_FORM" | cut -d"|" -f 11)
            SALVAR_EM=$(echo "$VAR_FORM" | cut -d"|" -f 12)
            COR=$(echo "$VAR_FORM" | cut -d"|" -f 13)
            # repare que o campo $QTD_FILHOS retorna um valor no formato 0.000000
            # vc pode usar uma expressão regular, ou o cut, para capturar apenas os digitos antes do .
            QTD_FILHOS=$(echo $QTD_FILHOS | cut -d"." -f 1)

            #apenas vou mostrar os campos e valores de retorno em um html
            DADOS_USUARIO="<table border=1><br/>
                     <tr><th>CAMPO</th><th>VALOR</th></tr>
                     <tr><td>DATA</td><td>$DATA</td></tr>
                     <tr><td>NOME</td><td>$NOME</td></tr>
                     <tr><td>SEXO</td><td>$SEXO</td></tr>
                     <tr><td>LOGIN</td><td>$LOGIN</td></tr>
                     <tr><td colspan=2 align=center>LIVROS</td></tr>
                     <tr><td>PROGRAMACAO</td><td>$LIVRO_PROGRAMACAO</td></tr>
                     <tr><td>REDES</td><td>$LIVRO_REDES</td></tr>
                     <tr><td>LINUX</td><td>$LIVRO_LINUX</td></tr>
                     <tr><td>QTD_FILHOS</td><td>$QTD_FILHOS</td></tr>
                     <tr><td>FOTO</td><td><img src='$FOTO' /></td></tr>
                     <tr><td>DIRETORIO</td><td>$SALVAR_EM</td></tr>
                     <tr><td>COR</td><td bgcolor='$COR'></td></tr>
                  </table>"

            echo $DADOS_USUARIO > cad_usuario.htm

            firefox cad_usuario.htm

            #.EOF
        elif [ ${1} = "listas" ] ; then
            # yas com list
            # Permite ao escolher uma pernonalista na lista e ver detalhes sobre ela na internet :-)
            # Tem uma coluna com o nome e outra com a imagem da personalidade, se alguem
            # copiar esse script, vai aparecer os nomes, mas não as imagens :-), pois elas no meu
            # disco, é apenas um exemplo

            show_list() {

            ESCOLHIDO=$( \
               yad --list \
               --title="Detalhes sobre Personalidades" \
               --column="ID":NUM \
               --column="PERSONALIDADE":TEXT \
               --column="FOTO":IMG \
               --print-column=1 \
               --hide-column=1 \
                  --width="300" \
                  --height="400" \
                  --button="Sair":1 \
                  --button="Ver detalhes":0 \
               1 "rai3mb :-)" "myAvatar.png" \
               2 "Linus Torvalds" "linus.png" \
               3 "Richard Stallman" "stallman.png" \
               4 "Mad Dog" "maddog.png" \
            )

            # ver se o usuário clicou em 'sair' or no 'x' da janela
            ACAO="$?"
            test "$ACAO" -eq "1" || test "$ACAO" -eq "252"
            if [ "$?" -eq "0" ]; then
               exit
            fi

            #captura apenas o numero da opcao selecionada
            ESCOLHIDO=$(echo $ESCOLHIDO | egrep -o '^[0-9]')

            # de acordo com a opcao selecionada, abre o firefox com detalhes da personalidade
            case "$ESCOLHIDO" in
               1)
                  firefox http://www.vivaolinux.com.br/perfil/verPerfil.php?login=rai3mb
                  show_list
               ;;
               2)
                  firefox http://pt.wikipedia.org/wiki/Linus_Torvalds
                  show_list
               ;;
               3)
                  firefox http://pt.wikipedia.org/wiki/Stallman
                  show_list
               ;;
               4)
                  firefox http://pt.wikipedia.org/wiki/Jon_Hall
                  show_list
               ;;
               *)
                  yad --image="face-angry" \
                     --title="Alerta" \
                     --text "Você não selecionou uma personalidade!" \
                     --button="Voltar e Selecionar"
                  show_list
               ;;
            esac
            }
            show_list

            #.EOF
        elif [ ${1} = "notificacao" ] ; then
            # yad com --notification
            # mostra uma notificação no painel, na área de notificação
            # neste exemplo verifico a hora e uma tarefa associada a mesma
            HORA=$(date +%H)
            if [ "$HORA" -lt 06 ]; then
               FAIXA="1"
            else
               if [ "$HORA" -lt 12 ]; then
                  FAIXA="2"
               else
                  if [ "$HORA" -lt 18 ]; then
                     FAIXA="3"
                  else
                     if [ "$HORA" -le 24 ]; then
                        FAIXA="4"
                     fi
                  fi      
               fi
            fi
            case "$FAIXA" in
               1)
                  MSG="Bom sonhos...."
               ;;
               2)
                  MSG="Bom dia \o/"
               ;;
               3)
                  MSG="Boa tarde"
               ;;
               4)
                  MSG="Aproveite o fim do dia"
               ;;
            esac
            yad --notification \
               --image="appointment-soon" \
               --text "$MSG - clique para atualizar o sistema" \
               --command "gnome-terminal --command='sudo apt-get upgrade'"

            #.EOF
        elif [ ${1} = "progresso" ] ; then
            # yad com --progress
            # mostra uma barra de progresso para determinada ação, sendo que ler linha a linha
            # dar entrada padrão
            # neste exemplo busco arquivos .png na basta /home do usuário

            locate $HOME -name '*.png' | \
            yad --progress \
                    --title "Progresso da busca" \
                    --width="300" \
                    --progress-text="Buscando imagens PNG" \
                    --pulsate \
                    --auto-close \
                    --auto-kill # mata o processo anterior caso usuario clique em cancelar

            #.EOF
        elif [ ${1} = "arquivos" ] ; then        
            # yad com --text-info
            # exemplo para selecionar um arquivo e ver seu conteúdo (editá-lo se desejar)
            ARQUIVO=$(\
               yad --file \
               --filename="$HOME/" \
               --title="Selecione um arquivo" \
               --width="500" \
               --height="400" \
            )
            # testa se o usuário quer cancelou
            ACAO="$?"
            test "$ACAO" -eq "1" || test "$ACAO" -eq "252"
            if [ "$?" -eq 0 ]; then
               exit
            fi

            # filename - nome do arquivo, editable - permite edição, fore - cor do texto
            # back - cor do fundo, fontname - fonte a ser usada, justify - alinhamento do texto
            # margins - tamanho da margem, tail - barra de rolagem
            MOD_ARQUIVO=$( \
               yad --text-info \
               --title="Visualizando o arquivo $ARQUIVO" \
               --filename="$ARQUIVO" \
               --editable \
               --fore="#00FF00" \
               --back="#000000" \
               --fontname="Ubuntu" \
               --justify="left" \
               --margins="2" \
               --tail \
               --width="500" \
               --height="400" \
               --button="Cancelar":1 \
               --button="Salvar":0 \
            )

            # testa se o usuário quer cancelou
            ACAO="$?"
            test "$ACAO" -eq "1" || test "$ACAO" -eq "252"
            if [ "$?" -eq 0 ]; then
                    #exit
                    echo
            fi

            # salva as modificações no arquivo
            echo $MOD_ARQUIVO \n > $ARQUIVO

            #.EOF
        elif [ ${1} = "escala" ] ; then
            # yad com --scale
            # neste exemplo uso o scale para permitir escolher o tamanho da imagem numa pagina html
            #armazena o valor escolhido na escala
            VALOR=$(\
                    yad --scale \
                            --title="Escolha o tamanho da imagem" \
                            --value="100" \
                            --min-value="100" \
                            --max-value="500" \
                            --step="50" \
            )

            #grava o conteúdo a ser gravado em uma pagina html com o tamanho da imagem escolhido
            CONTEUDO="Vux <img src='scale02.png' /> Todos os direitos reservados ao VOL :$"

            echo $CONTEUDO > scale.htm

            #abre o arquivo no firefox
            firefox scale.htm

            #.EOF
        fi
    }
    # ----------------------------------------------------------------------------------------
                                                              # sleep 3 & _Anime_  (não usada)
    # ----------------------------------------------------------------------------------------                                                               
    function _Anime_(){ 
        local i=2 
        while [[ ! -z $(ps | grep "$!") ]]; do  
            printf "Processando [          ]" | sed "s/ /\-\>/$i" 
            printf "\r"; sleep 0.05; ((i++))
            if [ "$i" == 11 ]; then 
                for ((i;i>2;i--)); do 
                    printf "Processando [          ]" | sed "s/ /\<\-/$i"
                    printf "\r" 
                    sleep 0.05
                done
            fi
        done
        printf "Processando [---feito---]\n"
    }
    # -----------------------------------------------------------------------------------------
                                                             # sleep 3 & _Annime_  (bancodados)
    # -----------------------------------------------------------------------------------------                                                             
    function _Annime_(){
        spinner=(\\ \| / -)
        while [[ ! -z $(ps | grep "$!") ]]; do
            i=0
            for ((i;i<4;i++)); do
                printf "Processando [${spinner[i]}]"
                sleep 0.20; printf "\r"
            done
        done                
        printf "Processando [*]\n"
    }
    # -----------------------------------------------------------------------------------------
                                                                # (não usada)
                                                                # progressBar
                                                                # uso:
                                                                #   for 1 in $(seq 0 100); do
                                                                #     sleep 1
                                                                #     progressBar 100
                                                                #   done
    # -----------------------------------------------------------------------------------------
    function progressBar() {
        if [[ "${quiet}" = "true" ]] || [ "${quiet}" == "1" ]; then
            return
        fi

        local width
        width=30
        bar_char="#"

        # Don't run this function when scripts are running in verbose mode
        if ${verbose}; then return; fi

        # Reset o count
        if [ -z "${progressBarProgress}" ]; then
            progressBarProgress=0
        fi

        # só se for terminal
        if [ ! -t 1 ]; then
            echo "Output is not a terminal" 1>&2
            return
        fi
        # esconde o cursor
        tput civis
        trap 'tput cnorm; exit 1' SIGINT

        if [ ! "${progressBarProgress}" -eq $(( $1 - 1 )) ]; then
            perc=$(( progressBarProgress * 100 / $1 ))
            # percentual
            num=$(( progressBarProgress * width / $1 ))
            # criar a barra strings
            bar=
            if [ ${num} -gt 0 ]; then
                bar=$(printf "%0.s${bar_char}" $(seq 1 ${num}))
            fi
            # imprimir a barra
            progressBarLine=$(printf "%s [%-${width}s] (%d%%)" "Running Process" "${bar}" "${perc}")
            echo -en "${progressBarLine}\r"
            progressBarProgress=$(( progressBarProgress + 1 ))
        else
            # limpar a barra de progresso
            echo -ne "${width}%\033[0K\r"
            unset progressBarProgress
        fi
        tput cnorm
    }
    # -----------------------------------------------------------------------------------------
                                                                                  # (não usada)
    # -----------------------------------------------------------------------------------------
    function marquee_left()
    {
        string="$*"
        let eidx=${#string}+1
        for i in $(seq 1 $eidx)
        do
            let j=i-1; strout="$(echo "$string" |cut -b $i-)"
            [ $j -ne 0 ] && strout="$strout$(echo "$string" |cut -b -$j)"
            $PRINT "$strout\r"; sleep $INTERVAL
        done
    }
    # -----------------------------------------------------------------------------------------
                                                                                  # (não usada)
    # -----------------------------------------------------------------------------------------
    function marquee_right()
    {
        string="$*"
        let eidx=${#string}+1
        for i in $(seq 1 $eidx)
        do
            let j=$eidx-$i+1; strout="$(echo "$string" | cut -b $j-)"; let --j
            [ $j -gt 0 ] && strout="$strout$(echo "$string" | cut -b -$j)"
            $PRINT "$strout\r"; sleep $INTERVAL
        done
    }
    # -----------------------------------------------------------------------------------------
                                                                                  # (não usada)
    # -----------------------------------------------------------------------------------------
    function marquee()
    {
        [ -z "$*" ] && echo "Uso: $(basename $0) <string>" && exit 1
        for SIG in INT TERM
            do trap "$PRINT '' && exit" $SIG
        done
        n=0
        while true
        do
            let "$n"; n=$?
            [ $n -ne 0 ] && marquee_right "$*" || marquee_left "$*"
            sleep $INTERVAL2
        done
    }
    # -----------------------------------------------------------------------------------------
                                                                                  # (não usada)
    # -----------------------------------------------------------------------------------------
    function display_info(){
        d_title=$USER@$HOSTNAME
        d=$(cat /proc/version | egrep -o '\([A-Z][a-z]+ ' | tr -d \()
        d_os=$(uname -o)
        d_kname=$(cat /proc/sys/kernel/ostype)
        d_kversion=$(cat /proc/sys/kernel/osrelease)
        d_uptime=$(uptime | awk '{print $3}' | tr -d ,)" min"
        d_shell=$(basename $SHELL)
        d_res=$(xrandr | sed -n '1p' | sed 's/.*current.//g;s/,.*//g;s/ //g')
        d_desk=$XDG_SESSION_DESKTOP
        d_font=$(fc-match | sed 's/\..*//g')
        d_cpu=$(cat /proc/cpuinfo | grep -o 'model name.*' | sed -n 1p | sed 's/.*:.//g;s/(.*)//g')
        d_mem=$(echo $(cat /proc/meminfo | sed -n 1p | tr -d [A-Za-z:' ']) / 1000000 | bc)" MB"
        d_memfree=$(echo "scale=2;$(cat /proc/meminfo | sed -n 2p | tr -d [A-Za-z:' '])" / 1000000 | bc)" MB"
        d_arch=$(getconf LONG_BIT)"-bit"
        d_browser=$(xdg-settings get default-web-browser | sed 's/userapp-//g;s/-.*//g;s/\..*//g')
        d_char=$(expr length "$d_title"); qtd=
        for i in $(seq 1 $d_char); do
            qtd="$qtd─"
        done
    }
    # -----------------------------------------------------------------------------------------
                                                        # (não usada)
                                                        # Uso:
                                                        #   join , a "b c" d #a,b c,d
                                                        #   join / var local tmp #var/local/tmp
                                                        #   join , "${FOO[@]}" #a,b,c
    # -----------------------------------------------------------------------------------------
    function join() { local IFS="${1}"; shift; echo "${*}"; }
    # -----------------------------------------------------------------------------------------
                                                                    # (função comumente usada)
    # -----------------------------------------------------------------------------------------
    function is_linux(){
        if [ $(uname) = 'Linux' ] ; then
            return 0
        fi
        return 1
    }
    # -----------------------------------------------------------------------------------------
                                                                    # (função comumente usada)
    # -----------------------------------------------------------------------------------------
    function is_ubuntu(){
        #[[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1           # faz o mesmo
        d=$(cat /proc/version | egrep -o '\([A-Z][a-z]+ ' | tr -d \()
        if [ ${d} = 'Ubuntu' ] ; then
            return 0
        fi
        return 1
    }
    # -----------------------------------------------------------------------------------------
                                                                    # (função comumente usada)
    # -----------------------------------------------------------------------------------------
    function is_ubuntu_desktop() {
        dpkg -l ubuntu-desktop >/dev/null 2>&1 || return 1
    }
    # -----------------------------------------------------------------------------------------
                                                                    # (função comumente usada)
    # -----------------------------------------------------------------------------------------
    function is_exists() {
        if [[ -e "$1" ]]; then
            return 0
        fi
        return 1
    }
    # -----------------------------------------------------------------------------------------
                                                                    # (função comumente usada)
    # -----------------------------------------------------------------------------------------
    function is_not_exists() {
        if [[ ! -e "$1" ]]; then
            return 0
        fi
        return 1
    }
    # -----------------------------------------------------------------------------------------
                                                                    # (função comumente usada)
    # -----------------------------------------------------------------------------------------
    function is_file() {
        if [[ -f "$1" ]]; then
            return 0
        fi
        return 1
    }
    # -----------------------------------------------------------------------------------------
                                                                    # (função comumente usada)
    # -----------------------------------------------------------------------------------------
    function is_not_file() {
        if [[ ! -f "$1" ]]; then
            return 0
        fi
        return 1
    }
    # -----------------------------------------------------------------------------------------
                                                                    # (função comumente usada)
    # -----------------------------------------------------------------------------------------
    function is_dir() {
        if [[ -d "$1" ]]; then
           return 0
          fi
        return 1
    }
    # -----------------------------------------------------------------------------------------
                                                                    # (função comumente usada)
    # -----------------------------------------------------------------------------------------
    function is_not_dir() {
        if [[ ! -d "$1" ]]; then
            return 0
        fi
        return 1
    }
    # -----------------------------------------------------------------------------------------
                                                                    # (função comumente usada)
    # -----------------------------------------------------------------------------------------
    function is_symlink() {
        if [[ -L "$1" ]]; then
            return 0
        fi
        return 1
    }
    # -----------------------------------------------------------------------------------------
                                                                    # (função comumente usada)
    # -----------------------------------------------------------------------------------------
    function is_not_symlink() {
        if [[ ! -L "$1" ]]; then
            return 0
        fi
        return 1
    }
    # -----------------------------------------------------------------------------------------
                                                                    # (função comumente usada)
    # -----------------------------------------------------------------------------------------
    function is_empty() {
        if [[ -z "$1" ]]; then
            return 0
        fi
        return 1
    }
    # -----------------------------------------------------------------------------------------
                                                                    # (função comumente usada)
    # -----------------------------------------------------------------------------------------
    function is_not_empty() {
        if [[ -n "$1" ]]; then
            return 0
        fi
        return 1
    }
    # -----------------------------------------------------------------------------------------    
                                                                # (não usada)
                                                                # Usage:
                                                                #    if type_exists 'git'; then
                                                                #      some action
                                                                #    else
                                                                #      some other action
                                                                #    fi
    # -----------------------------------------------------------------------------------------
                                                                                # (não usada)
    # -----------------------------------------------------------------------------------------    
    function type_exists() {
        if [ "$(type -P "$1")" ]; then
            return 0
        fi
        return 1
    }
    # -----------------------------------------------------------------------------------------
                                                                                # (não usada)
    # -----------------------------------------------------------------------------------------    
    function type_not_exists() {
        if [ ! "$(type -P "$1")" ]; then
            return 0
        fi
        return 1
    }
    # -----------------------------------------------------------------------------------------
                                                                                # (não usada)
    # -----------------------------------------------------------------------------------------    
    function is_os() {
        if [[ "${OSTYPE}" == $1* ]]; then
            return 0
        fi
        return 1
    }
    # -----------------------------------------------------------------------------------------
                                                                    # (será usada futuramente)
    # -----------------------------------------------------------------------------------------    
    function seek_confirmation_force() {
        input "$@"
        if "${force}"; then
            notice "Forcing confirmation with '--force' flag set"
        else
            read -p " (y/n) " -n 1
            echo ""
        fi
    }
    # -----------------------------------------------------------------------------------------
                                                                    # (será usada futuramente)
    # -----------------------------------------------------------------------------------------    
    function is_confirmed_force() {
        if "${force}"; then
            return 0
        else
            if [[ "${REPLY}" =~ ^[Yy]$ ]]; then
                return 0
            fi
            return 1
        fi
    }
    # -----------------------------------------------------------------------------------------
                                                                    # (será usada futuramente)
    # -----------------------------------------------------------------------------------------    
    function is_not_confirmed_force() {
        if "${force}"; then
            return 1
        else
            if [[ "${REPLY}" =~ ^[Nn]$ ]]; then
                return 0
            fi
            return 1
        fi
    }
    # -----------------------------------------------------------------------------------------
                                                                                  # (não usada)
                                                   # Credit: https://github.com/cowboy/dotfiles
    # -----------------------------------------------------------------------------------------    
    function skip() {
        REPLY=noskip
        read -t 5 -n 1 -s -p "${bold}To skip, press ${underline}X${reset}${bold} within 5 seconds.${reset}"
        if [[ "$REPLY" =~ ^[Xx]$ ]]; then
            notice "  Skipping!"
            return 0
        else
            notice "  Continuing..."
            return 1
        fi
    }
    # -----------------------------------------------------------------------------------------
                                                                                # (não usada)
    # -----------------------------------------------------------------------------------------    
    function unmountDrive() {
        if [ -d "$1" ]; then
            diskutil unmount "$1"
        fi
    }
    # -----------------------------------------------------------------------------------------
                                                                    # (será usada futuramente)
    # -----------------------------------------------------------------------------------------    
    function help () {
        echo "" 1>&2
        input "   $@" 1>&2
        if [ -n "${usage}" ]; then # print usage information if available
            echo "   ${usage}" 1>&2
        fi
        echo "" 1>&2
        exit 1
    }
    # -----------------------------------------------------------------------------------------
                                                                    # (será usada futuramente)
    # -----------------------------------------------------------------------------------------    
    function pauseScript() {
        seek_confirmation "Ready to continue?"
        if is_confirmed; then
            info "Continuing"
        else
            warning "Exiting Script."
            safeExit
        fi
    }
    # -----------------------------------------------------------------------------------------
                                                                    # (função comumente usada)
                                                        # Determine if a value is in an array.
                                            # Usage: if in_array "VALUE" "${ARRAY[@]}"; then ...
    # -----------------------------------------------------------------------------------------
    function in_array() {
        local value="$1"; shift
        for arrayItem in "$@"; do
            [[ "${arrayItem}" == "${value}" ]] && return 0
        done
        return 1
    }
    # -----------------------------------------------------------------------------------------
                                                                                # (não usada)
                                                    # Convert stdin to lowercase.
                                                    # usage:  text=$(lower <<<"$1")
                                                    #         echo "MAKETHISLOWERCASE" | lower
                                            # Adapted from https://github.com/jmcantrell/bashful
    # -----------------------------------------------------------------------------------------    
    function lower() {
        tr '[:upper:]' '[:lower:]'
    }
    # -----------------------------------------------------------------------------------------
                                                                                # (não usada)
                                                    # Convert stdin to uppercase.
                                                    # usage:  text=$(upper <<<"$1")
                                                    #         echo "MAKETHISUPPERCASE" | upper
    # -----------------------------------------------------------------------------------------
    function upper() { 
        tr '[:lower:]' '[:upper:]'
    }
    # -----------------------------------------------------------------------------------------
                                                                                # (não usada)
                                            # Removes all leading whitespace (from the left).
    # -----------------------------------------------------------------------------------------
    function ltrim() {
        local char=${1:-[:space:]}
        sed "s%^[${char//%/\\%}]*%%"
    }
    # -----------------------------------------------------------------------------------------
                                                                                # (não usada)
                                            # Removes all trailing whitespace (from the right).
    # -----------------------------------------------------------------------------------------
    function rtrim() {
        local char=${1:-[:space:]}
        sed "s%[${char//%/\\%}]*$%%"
    }
    # -----------------------------------------------------------------------------------------
                                                                                # (não usada)
                                      # Removes all leading/trailing whitespace
                                      # Usage examples:
                                      #     echo "  foo  bar baz " | trim  #==> "foo  bar baz"
    # -----------------------------------------------------------------------------------------
    function trim() {
        ltrim "$1" | rtrim "$1"
    }
    # -----------------------------------------------------------------------------------------
                                                                                # (não usada)
                      # Removes leading/trailing whitespace and condenses all other consecutive
                      # whitespace into a single space.
                                  # Usage examples:
                                  #     echo "  foo  bar   baz  " | squeeze  #==> "foo bar baz"
    # -----------------------------------------------------------------------------------------
    function squeeze() {
        local char=${1:-[[:space:]]}
        sed "s%\(${char//%/\\%}\)\+%\1%g" | trim "$char"
    }
    # -----------------------------------------------------------------------------------------
                                                                                # (não usada)
                            # <doc:squeeze_lines> {{{
                            #
                            # Removes all leading/trailing blank lines and condenses all other
                            # consecutive blank lines into a single blank line.
                            #
                            # </doc:squeeze_lines> }}}
    # -----------------------------------------------------------------------------------------
    function squeeze_lines() {
        sed '/^[[:space:]]\+$/s/.*//g' | cat -s | trim_lines
    }
                                                         
}

# ========================================================================================
# Class Dependncias
# ----------------------------------------------------------------------------------------
# 
# 
# ----------------------------------------------------------------------------------------
function Class_Dependencias(){
    # -----------------------------------------------------------------------------------------    
                                                                               # [ Constantes ]
    # -----------------------------------------------------------------------------------------    
    release_name=$(lsb_release -c | awk '{print $2}')
    installers_path="$DOTFILES/caches/installers"
    declare -a apt_depens=()
    declare -a apt_keys=()
    declare -a apt_source_files=()
    declare -a apt_source_texts=()
    declare -a deb_installed=()
    declare -a deb_sources=()
    # -----------------------------------------------------------------------------------------    
                                                                                  # [ Funções ]
                                                             # Auxiliar para instalações de ppa                                                                              
    # -----------------------------------------------------------------------------------------    
    function add_ppa() {
      apt_source_texts+=($1)
      IFS=':/' eval 'local parts=($1)'
      apt_source_files+=("${parts[1]}-ubuntu-${parts[2]}-$release_name")
    }
    # -----------------------------------------------------------------------------------------    
                                                                                    # [ ppa's ]
    # -----------------------------------------------------------------------------------------    
    # https://github.com/neovim/neovim/wiki/Installing-Neovim
    add_ppa ppa:neovim-ppa/stable
    # https://launchpad.net/~stebbins/+archive/ubuntu/handbrake-releases
    add_ppa ppa:stebbins/handbrake-releases
    # https://github.com/rvm/ubuntu_rvm
    add_ppa ppa:rael-gc/rvm
    # https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-16-04
    add_ppa ppa:ansible/ansible
    # http://tipsonubuntu.com/2016/09/13/vim-8-0-released-install-ubuntu-16-04/
    add_ppa ppa:jonathonf/vim
    # https://launchpad.net/~hnakamur/+archive/ubuntu/tmux
    add_ppa ppa:hnakamur/tmux
    # https://github.com/greymd/tmux-xpanes   BOM
    add_ppa ppa:greymd/tmux-xpanes
    if is_ubuntu_desktop; then
        add_ppa ppa:fossfreedom/arc-gtk-theme-daily
        # https://www.techrepublic.com/article/how-to-connect-a-linux-machine-to-google-cloud-print/
        # sudo /usr/share/cloudprint-cups/setupcloudprint.py  
        add_ppa ppa:simon-cadman/niftyrepo
        # https://github.com/tagplus5/vscode-ppa
        apt_keys+=(https://tagplus5./.io/vscode-ppa/ubuntu/gpg.key)
        apt_source_files+=(vscode.list)
        apt_source_texts+=("deb https://tagplus5.github.io/vscode-ppa/ubuntu ./")
        # https://www.ubuntuupdates.org/ppa/google_chrome
        apt_keys+=(https://dl-ssl.google.com/linux/linux_signing_key.pub)
        apt_source_files+=(google-chrome)
        apt_source_texts+=("deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main")
        # https://www.charlesproxy.com/documentation/installation/apt-repository/
        apt_keys+=(https://www.charlesproxy.com/packages/apt/PublicKey)
        apt_source_files+=(charles)
        apt_source_texts+=("deb https://www.charlesproxy.com/packages/apt/ charles-proxy3 main")
        # https://github.com/aluxian/Messenger-for-Desktop#linux
        apt_keys+=('--keyserver pool.sks-keyservers.net --recv 6DDA23616E3FE905FFDA152AE61DA9241537994D')
        apt_source_files+=(aluxian)
        apt_source_texts+=("deb https://dl.bintray.com/aluxian/deb/ beta main")
        # https://www.spotify.com/us/download/linux/
        apt_keys+=('--keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886')
        apt_source_files+=(spotify)
        apt_source_texts+=("deb http://repository.spotify.com stable non-free")
        # https://tecadmin.net/install-oracle-virtualbox-on-ubuntu/
        apt_keys+=(https://www.virtualbox.org/download/oracle_vbox_2016.asc)
        apt_source_files+=(virtualbox)
        apt_source_texts+=("deb http://download.virtualbox.org/virtualbox/debian $release_name contrib")
        # https://www.skype.com/en/download-skype/skype-for-linux/
        # https://community.skype.com/t5/Linux/Skype-for-Linux-Beta-signatures-couldn-t-be-verified-because-the/td-p/4645756
        apt_keys+=(https://repo.skype.com/data/SKYPE-GPG-KEY)
        apt_source_files+=(skype-stable)
        apt_source_texts+=("deb https://repo.skype.com/deb stable main")
        # http://askubuntu.com/a/190674
        add_ppa ppa:webupd8team/java
        # https://github.com/colinkeenan/silentcast/#ubuntu
        # https://github.com/colinkeenan/silentcast/#ubuntu-linux-full-install
        add_ppa ppa:sethj/silentcast
        add_ppa ppa:webupd8team/y-ppa-manager
        # https://be5invis.github.io/Iosevka/
        # https://launchpad.net/~laurent-boulard/+archive/ubuntu/fonts
        add_ppa ppa:laurent-boulard/fonts
        # https://launchpad.net/grub-customizer
        add_ppa ppa:danielrichter2007/grub-customizer
    fi
    # -----------------------------------------------------------------------------------------    
                                                                                  # [ Array's ]
    # -----------------------------------------------------------------------------------------    
    apt_depens=( "aptitude" "byobu" "nmcli" "grep" "awk" "figlet" "tput" "htop" "irssi" "neofetch"
             "awscli" "build-essential" "cmatrix" "cowsay" "curl" "docker.io" "docker-compose"
             "git-core" "groff" "hollywood" "htop" "id3tool" "imagemagick" "jq" "mercurial"
             "nmap" "postgresql" "python-pip" "silversearcher-ag" "sl" "telnet" "thefuck"
             "tree" );
    apt_depens+=( "postgresql" "postgresql-contrib" "mysql-server" "php7.2" "phppgadmin" "php7.2-pgsql")
    apt_depens+=( "phpmyadmin" "php-mbstring" "php-gettext" "mysql-workbench")

    apt_depens+=( "libapache2-mod-php7.2" "php7.2-mysql" "php-common" "php7.2-cli" 
            "php7.2-common" "php7.2-json" "php7.2-opcache" "php7.2-readline" "libav-tools" 
            "x11-xserver-utils" "xdotool" "wininfo" "wmctrl" "python-gobject" 
            "python-cairo" "xdg-utils" "yad" "silentcast" "vim" "neovim" "handbrake-cli" "rvm" );
    # https://github.com/rbenv/ruby-build/wiki
    apt_depens+=( "autoconf" "bison" "build-essential" "libssl-dev" "libyaml-dev" "libreadline6-dev"
            "libncurses5-dev" "libffi-dev" "libgdbm3" "libgdbm-dev" "zlib1g-dev" "ansible" "vim" 
            "tmux-xpanes" )
    if is_ubuntu_desktop; then
        apt_depens+=( "vim-gnome" );
        apt_depens+=( "handbrake-gtk" );
        # http://www.omgubuntu.co.uk/2016/06/install-latest-arc-gtk-theme-ubuntu-16-04
        # apt_keys+=(http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key)
        # apt_source_files+=(arc-theme)
        # apt_source_texts+=("deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /")
        # apt_depens+=(arc-theme)
        apt_depens+=( "arc-theme" );
        apt_depens+=( "cupscloudprint" );
        apt_depens+=( "code code-insiders" );
        apt_depens+=( "google-chrome-stable" );
        apt_depens+=( "charles-proxy" );
        apt_depens+=( "messengerfordesktop" );
        apt_depens+=( "spotify-client" );
        apt_depens+=( "virtualbox-5.1" );
        apt_depens+=( "skypeforlinux" );
        apt_depens+=( "oracle-java8-installer" );
        function preinstall_oracle-java8-installer() {
            echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
            echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
        }
        apt_depens+=( "libav-tools" "x11-xserver-utils" "xdotool" "wininfo" "wmctrl" "python-gobject" 
                    "python-cairo" "xdg-utils" "yad" "silentcast" );
        apt_depens+=( "adb fastboot" )
        apt_depens+=( "chromium-browser" "fonts-mplus" "gnome-tweak-tool" "k4dirstat" "rofi"
                    "network-manager-openconnect" "network-manager-openconnect-gnome" "openssh-server"
                    "shutter" "unity-tweak-tool" "vlc" "xclip" "zenmap" );
        # Manage online accounts via "gnome-control-center" in launcher
        apt_depens+=( "gnome-control-center" "gnome-online-accounts" );
        # https://github.com/mitchellh/vagrant/issues/7411
        deb_installed+=(/usr/bin/vagrant)
        deb_sources+=(https://releases.hashicorp.com/vagrant/1.9.2/vagrant_1.9.2_x86_64.deb)
        # https://github.com/vagrant-libvirt/vagrant-libvirt/issues/575
        # apt_depens+=(vagrant)
        # function postinstall_vagrant() {
        #   sudo sed -i'' "s/Specification.all = nil/Specification.reset/" /usr/lib/ruby/vendor_ruby/vagrant/bundler.rb
        # }
        apt_depens+=( "fonts-iosevka" );
        apt_depens+=( "grub-customizer" );

        # https://support.gitkraken.com/how-to-install
        deb_installed+=(/usr/bin/gitkraken)
        deb_sources+=(https://release.gitkraken.com/linux/gitkraken-amd64.deb)

        # http://www.get-notes.com/linux-download-debian-ubuntu
        apt_depens+=( "libqt5concurrent5" );
        deb_installed+=(/usr/bin/notes)
        deb_sources+=("https://github.com/nuttyartist/notes/releases/download/v1.0.0/notes_1.0.0_amd64-$release_name.deb")

        # https://www.dropbox.com/install-linux
        apt_depens+=("python-gtk2" "python-gpgme" );
        deb_installed+=(/usr/bin/dropbox)
        deb_sources+=("https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb")

        # http://askubuntu.com/a/852727
        apt_depens+=( "cabextract" );
        deb_installed+=(/usr/share/fonts/truetype/msttcorefonts)
        deb_sources+=(deb_source_msttcorefonts)
        function deb_source_msttcorefonts() {
            echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
            echo http://ftp.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.6_all.deb
        }

        # https://slack.com/downloads/instructions/linux
        deb_installed+=(/usr/bin/slack)
        deb_sources+=(https://downloads.slack-edge.com/linux_releases/slack-desktop-2.5.2-amd64.deb)

        # https://discordapp.com/download
        deb_installed+=(/usr/bin/discord)
        deb_sources+=("https://discordapp.com/api/download?platform=linux&format=deb")

        # http://askubuntu.com/questions/854480/how-to-install-the-steam-client/854481#854481
        apt_depens+=(python-apt)
        deb_installed+=(/usr/bin/steam)
        deb_sources+=(deb_source_steam)
        function deb_source_steam() {
            local steam_root steam_file
            steam_root=http://repo.steampowered.com/steam/pool/steam/s/steam/
            steam_file="$(wget -q -O- "$steam_root?C=M;O=D" | sed -En '/steam-launcher/{s/.*href="([^"]+)".*/\1/;p;q;}')"
            echo "$steam_root$steam_file"
        }
        # https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=772598
        # apt_depens+=(steam)
        # function preinstall_steam() {
        #   echo steam steam/question select I AGREE | sudo debconf-set-selections
        #   echo steam steam/license note | sudo debconf-set-selections
        # }
    fi

    function other_stuff() {
        # Install Git Extras
        if [[ ! "$(type -P git-extras)" ]]; then
            e_header "Installing Git Extras"
            (
                cd $DOTFILES/vendor/git-extras &&
                sudo make install
            )
        fi
        # Install misc bins from zip file.
        #install_from_zip ngrok 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip'
        #install_from_zip terraform 'https://releases.hashicorp.com/terraform/0.9.2/terraform_0.9.2_linux_amd64.zip'
    }

    if (( ${#apt_depens[@]} > 0 )); then
        e_header "Instalando APT pacotes (${#apt_depens[@]})"; i=0;
        for package in "${apt_depens[@]}"; do
            printf "$(e_arrow " ${i}-$apt_source_texts")\t"
            printf "$(e_arrow " ${i}-$package")\t"
            ((i=$i+1))
        done
        printf "\n\n"; e_header "Instalando PPA pacotes (${#apt_source_texts[@]})"; i=0;
        for package in "${apt_source_texts[@]}"; do
            printf "$(e_arrow " ${i}-$apt_source_texts")\t"
            ((i=$i+1))
        done
    fi
    read
    ####################
    # ACTUALLY DO THINGS
    ####################

    # Add APT keys.
    keys_cache=$DOTFILES/caches/init/apt_keys
    IFS=$'\n' GLOBIGNORE='*' command eval 'setdiff_cur=($(<$keys_cache))'
    setdiff_new=("${apt_keys[@]}"); setdiff; apt_keys=("${setdiff_out[@]}")
    unset setdiff_new setdiff_cur setdiff_out

    if (( ${#apt_keys[@]} > 0 )); then
        e_header "Adding APT keys (${#apt_keys[@]})"
        for key in "${apt_keys[@]}"; do
            e_arrow "$key"
            if [[ "$key" =~ -- ]]; then
                sudo apt-key adv $key
            else
                wget -qO- $key | sudo apt-key add -
            fi && \
            echo "$key" >> $keys_cache
        done
    fi

    # Add APT sources.
    function __temp() { [[ ! -e /etc/apt/sources.list.d/$1.list ]]; }
    source_i=($(array_filter_i apt_source_files __temp))

    if (( ${#source_i[@]} > 0 )); then
        e_header "Adding APT sources (${#source_i[@]})"
        for i in "${source_i[@]}"; do
            source_file=${apt_source_files[i]}
            source_text=${apt_source_texts[i]}
            if [[ "$source_text" =~ ppa: ]]; then
                e_arrow "$source_text"
                sudo add-apt-repository -y $source_text
            else
                e_arrow "$source_file"
                sudo sh -c "echo '$source_text' > /etc/apt/sources.list.d/$source_file.list"
            fi
        done
    fi

    # Update APT.
    e_header "Updating APT"
    sudo apt-get -qq update

    # Only do a dist-upgrade on initial install, otherwise do an upgrade.
    e_header "Upgrading APT"
    if is_dotfiles_bin; then
        sudo apt-get -qy upgrade
    else
        sudo apt-get -qy dist-upgrade
    fi

    # Install APT packages.
    installed_apt_depens="$(dpkg --get-selections | grep -v deinstall | awk 'BEGIN{FS="[\t:]"}{print $1}' | uniq)"
    apt_depens=($(setdiff "${apt_depens[*]}" "$installed_apt_depens"))

    if (( ${#apt_depens[@]} > 0 )); then
        e_header "Instalando APT pacotes (${#apt_depens[@]})"
        for package in "${apt_depens[@]}"; do
            e_arrow "$package"
            [[ "$(type -t preinstall_$package)" == function ]] && preinstall_$package
            sudo apt-get -qq install "$package" && \
            [[ "$(type -t postinstall_$package)" == function ]] && postinstall_$package
        done
    fi

    # Install debs via dpkg
    function __temp() { [[ ! -e "$1" ]]; }
    deb_installed_i=($(array_filter_i deb_installed __temp))

    if (( ${#deb_installed_i[@]} > 0 )); then
        mkdir -p "$installers_path"
        e_header "Installing debs (${#deb_installed_i[@]})"
        for i in "${deb_installed_i[@]}"; do
            e_arrow "${deb_installed[i]}"
            deb="${deb_sources[i]}"
            [[ "$(type -t "$deb")" == function ]] && deb="$($deb)"
            installer_file="$installers_path/$(echo "$deb" | sed 's#.*/##')"
            wget -O "$installer_file" "$deb"
            sudo dpkg -i "$installer_file"
        done
    fi

    # install bins from zip file
    function install_from_zip() {
        local name=$1 url=$2 bins b zip tmp
        shift 2; bins=("$@"); [[ "${#bins[@]}" == 0 ]] && bins=($name)
        if [[ ! "$(which $name)" ]]; then
            mkdir -p "$installers_path"
            e_header "Installing $name"
            zip="$installers_path/$(echo "$url" | sed 's#.*/##')"
            wget -O "$zip" "$url"
            tmp=$(mktemp -d)
            unzip "$zip" -d "$tmp"
            for b in "${bins[@]}"; do
              sudo cp "$tmp/$b" "/usr/local/bin/$(basename $b)"
            done
            rm -rf $tmp
        fi
    } 

    # Run anything else that may need to be run.
    type -t other_stuff >/dev/null && other_stuff
}

# =========================================================================================
# ## DEBUG ###
# if [ $1 = "-d" ] ; then
# -----------------------------------------------------------------------------------------
function debugPath_bob_util(){               ### PATH ###
    echo $instalacao
    echo $scriptPath_Home
    echo $scriptPath_Bob
    echo $scriptPath
    echo $utilsLocation
    echo $confLocation
    echo $enderecoRelativo_bin
    echo $enderecoRelativo_lib
    echo $enderecoRelativo_view
    echo $enderecoRelativo_doc
    echo $jusanteLocation; echo $varDebug_jusante
    echo $coresLocation; echo $varDebug_cores
    echo $montanteLocation; echo $varDebug_montante
    echo $tituloLocation; echo $varDebug_titulo
    echo $confLocation; echo $varDebug_conf
}
# -----------------------------------------------------------------------------------------
# fi
### END DEBUG ###
# =========================================================================================
#Class_Dependencias

# NÃO USADO
# -----------------------------------------------------------------------------------------
# Criar paths adicionais para arquivos que não foram tratados indivicualmente
# -----------------------------------------------------------------------------------------
# SOURCE="${BASH_SOURCE[0]}"

# while [ -h "${SOURCE}" ]; do # resolve ${SOURCE} until the file is no longer a symlink
# 	DIR="$( cd -P "$( dirname "${SOURCE}" )" && pwd )"
# 	SOURCE="$(readlink "${SOURCE}")"
# 	[[ ${SOURCE} != /* ]] && SOURCE="${DIR}/${SOURCE}" 
# 	# if ${SOURCE} was a relative symlink, we need to resolve it relative to the path where 
# 	#the symlink file was located
# done
# SOURCEPATH="$( cd -P "$( dirname "${SOURCE}" )" && pwd )"

# if [ ! -d "${SOURCEPATH}" ] ; then
#   	die "Failed to find library files expected in: ${SOURCEPATH}"
# fi

# for utility_file in "${SOURCEPATH}"/*.sh
# do
#   	if [ -e "${utility_file}" ]; then
#     	# Don't source self
#     	if [[ "${utility_file}" == *"utils.sh"* ]]; then
#       		continue
#     	fi
#     	source "$utility_file"
#   	fi
# done
# -----------------------------------------------------------------------------------------