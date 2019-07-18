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
#   0.0.2                                                                 Modificado o menu.
#   0.0.3                                                               Acrescentado change.
#   0.0.4                                                                Iniciado Class bob.
#   0.0.5                                                               Várias modificações.
#   0.0.6                                                              Acrescentado _Clima_.
#   0.0.7                                                         Acrescentado __Instalador.
#   0.0.8                                                                Acrescentado radio.
#   2019.01      Dividido em diretórios criação de route e tipando de forma MVC (23/06/2019)
#.
# Dependências:                                                Nome do arquivo: bob_util.sh
#	function Dependencias()
#
# * Retorno: n/a
# * Data: n/a
#
# by: Elizeu de Santana -------------------------------------------------------------------

# if [[ ! "$1" || "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP
# Curl a remote file into an editor.
# http://benalman.com/

# echo "Usage: $(basename "$0") [curloptions...] url"

# Curl a remote file into the editor of your choice. The filename will be based
# on the URL's filename. If a file extension can't be determined from the URL,
# index.html will be used.

# The editor will be auto-magically determined by stripping any leading "curl"
# off this script's filename. For example, call this script "curlmate" and "mate"
# will be run.

# Copyright (c) 2012 "Cowboy" Ben Alman
# Licensed under the MIT license.
# http://benalman.com/about/license/
# HELP
# exit; fi

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
    deviconsLocation="${enderecoRelativo_doc}/devicons.zip";             # Arquivo font   
}    
# -----------------------------------------------------------------------------------------
                                                                  # {Carregando os scripts}
# -----------------------------------------------------------------------------------------
function Change(){
    # -----------------------------------------------------------------------------------------    
    if [ -f "${coresLocation}" ]; then      ### carregando o arquivo de cores ###
        source "${coresLocation}";
        e_success "Carregado ... ${coresLocation}";
    else
        e_error "Erro carregando ${coresLocation}"; Sair;
    fi
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
    if [ -f "${confLocation}" ]; then       ### carregando o arquivo .conf ###
        source "${confLocation}";
        e_success "Carregado ... ${confLocation}";
    else
        e_error "Erro carregando ${confLocation}"; Sair;
    fi
    #[ -e ${confLocation} ] || { echo "Arquivo bob.conf ausente!"; }; source ${confLocation} 
}

#/* ========================================================================================
# Class Bob
# ----------------------------------------------------------------------------------------*/
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
        which boxes &>/dev/null || Dependencias boxes; 
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
                                                                   #( Evolução do repositorio )
    # -----------------------------------------------------------------------------------------
    function Evolution__(){
        which gource &>/dev/null || Dependencias gource; 
        gource --background-image $HOME/projetos/bob/doc/sky.jpg;
        Principal;
    }
    # -----------------------------------------------------------------------------------------
                                                                       # REVIEW  (function dp )
    # -----------------------------------------------------------------------------------------
    function p(){                             #-\_(``)_/-#
        unset __dp; declare __dp=(); #
        __dp=( "libdvdnav4" "libdvdread4" "gstreamer1_0_plugins_bad" "bluefish" "anjuta" "tor" "byobu"
            "gstreamer1_0_plugins_ugly" "ubuntu_restricted_extras" "bluefish_plugins" "eclipse" "grep"
            "figlet" "codeblocks_contrib" "codeblocks" "mingw_w64" "build_essential" "gcc"  "aptitude"
            "g_plus_plus" "gpp" "openjdk_8_jdk" "python3" "python_pip" "anjuta_extra" "tilix"  "nmcli"
            "google" "links" "chromium" "epiphany_browser" "torbrowser_launcher"  "terminology"  "awk"
            "playonlinux" "wine" "geany" "atom"  "vscodium" "Neovim" "vscode"  "sublime_text"  "boxes"
            "Anaconda3"  "android_studio"  "Glade"  "Chatty_StreamlinkTwitchGUI" "StreamlinkTwitchGUI" 
            "vlc"  "libgdbm-dev"  "gource"  "npm"  "ffmpeg"  "sublime-merge"  "tmux-xpanes"  "ansible" 
            "zlib1g-dev" "libgdbm3" "libffi-dev"  "postgresql"  "python-pip" "xampp" "libncurses5-dev" 
            "libreadline6-dev"  "libyaml-dev"  "libssl-dev" "build-essential" "bison" "autoconf" "rvm" 
            "handbrake-cli"  "vim"  "silentcast"  "yad"  "xdg-utils"  "python-cairo"  "python-gobject" 
            "wmctrl" "wininfo" "xdotool"  "x11-xserver-utils"  "libav-tools"  "php7.2-opcache" "irssi"
            "php7.2-readline" "php7.2-json" "php7.2-common" "php7.2-cli"  "php-common"  "php7.2-mysql" 
            "libapache2-mod-php7.2" "php-gettext" "php7.2-pgsql" "phppgadmin" "php7.2"  "mysql-server" 
            "postgresql-contrib" "mysql-workbench" "tree" "telnet" "sl" "thefuck"  "silversearcher-ag" 
            "nmap" "mercurial" "jq" "imagemagick" "id3tool" "hollywood" "groff" "git-core" "docker.io"
            "docker-compose" "curl" "cowsay" "cmatrix" "build-essential"  "awscli"  "neofetch"  "htop" 
            "tput" "kdevelop" );
        l=${#__dp[@]};
        for ((i=0;i<=l;i++)); do
             clicked[$i]="[ ]"
        done; c=0
        while true ; do
            Titulo_Inicial; printf "\n\n\n\n"; e_arrow "Click as dependências para instalação : "
            for ((i=0;i<l;i++)) ; do
                e_arrow -d "$((${i}+1)))\t${clicked[${i}]}${__dp[${i}]}\t"            
            done
            e_arrow -l "(${red}s${reset})air | Número [ 1 .. $i ] :${blue}${bold} "; read opt
            if [ "${opt}" = "s" ] ; then
                break
            else
                t=$((opt-1))
                if [ "${clicked[${t}]}" = "[ ]" ] ; then
                    clicked[${t}]="[$(e_success)]"
                else
                    clicked[${t}]="[ ]"
                fi
            fi
        done
        l=${#clicked[@]}; 
        for i in ${clicked[@]} ; do
            if [ "${clicked[${c}]}" = "[$(e_success)]" ] ; then
                Titulo_Inicial; printf "\n\n\n\n"
                e_arrow "Iniciando instalação dependências. $(e_success)"
                #echo "c=${c}, __dp=${__dp[${c}]}, click=${clicked[${c}]}"
                which ${__dp[${c}]} &>/dev/null ||
                    seek_confirmation "${USER}, permite a instalação do pacote  ${__dp[${c}]}, no sistema ?" 
                    if is_confirmed; then
                        ___Dependencia; e_success "Carregado ... dependências";   
                        e_arrow -d "Atualizando cache ... & Instalando : ${__dp[${c}]}."
                        sudo apt update && sudo apt upgrade && sudo apt autoremove
                        #echo ${#desenvolvimentoNome[@]}
                        for ((j=0;j<=${#desenvolvimentoNome[@]};j++)); do
                            if [ "${__dp[${c}]}" = "${desenvolvimentoNome[$j]}" ] ; then
                                echo "${desenvolvimentoNome[$j]}"
                                echo "${desenvolvimentoDescription[$j]}"
                                echo "${desenvolvimentoversion[$j]}"
                                echo "${desenvolvimentoHomepage[$j]}"
                                echo "${desenvolvimentoInstall[$j]}"
                                if [ ${__dp[${c}]} = "python3" ] ; then      # colcocar escolhas
                                    for ((a=0;a<=${#desenvolvimentoInstall_11[@]};a++)); do 
                                        echo ${desenvolvimentoInstall_11[$a]} # 3        
                                        ${desenvolvimentoInstall_11[$a]}
                                    done                                                 
                                    for ((b=0;b<=${#desenvolvimentoInstall_11A[@]};b++)); do
                                        echo ${desenvolvimentoInstall_11A[$b]} # 5          
                                        ${desenvolvimentoInstall_11A[$b]}
                                    done                                                    
                                    for ((c=0;c<=${#desenvolvimentoInstall_11B[@]};c++)); do
                                        echo ${desenvolvimentoInstall_11B[$c]} # 16         
                                        ${desenvolvimentoInstall_11B[$c]}
                                    done                                                    
                                    for ((d=0;d<=${#desenvolvimentoInstall_11C[@]};d++)); do
                                        echo ${desenvolvimentoInstall_11C[$d]} # 21         
                                        ${desenvolvimentoInstall_11C[$d]}
                                    done                            
                                else
                                    ${desenvolvimentoInstall[$j]}                        
                                fi                                                          
                            fi
                        done
                        #echo ${#browsersNome[@]}
                        for ((j=0;j<=${#browsersNome[@]};j++)); do
                            if [ "${__dp[${c}]}" = "${browsersNome[$j]}" ] ; then
                                echo "${browsersNome[$j]}"
                                echo "${browsersDescription[$j]}"
                                echo "${browsersversion[$j]}"
                                echo "${browsersHomepage[$j]}"
                                echo "${browsersInstall[$j]}"
                                ${browsersInstall[$j]}
                            fi
                        done
                        #echo ${#codecsNome[@]}
                        for ((j=0;j<=${#codecsNome[@]};j++)); do
                            if [ "${__dp[${c}]}" = "${codecsNome[$j]}" ] ; then
                                echo "${codecsNome[$j]}"
                                echo "${codecsDescription[$j]}"
                                echo "${codecsversion[$j]}"
                                echo "${codecsHomepage[$j]}"
                                echo "${codecsInstall[$j]}"
                                ${codecsInstall[$j]}
                            fi
                        done
                        ##echo ${#diversosNome[@]}
                        for ((j=0;j<=${#diversosNome[@]};j++)); do
                            if [ "${__dp[${c}]}" = "${diversosNome[$j]}" ] ; then
                                echo "${diversosNome[$j]}"
                                echo "${diversosDescription[$j]}"
                                echo "${diversosversion[$j]}"
                                echo "${diversosHomepage[$j]}"
                                echo "${diversosInstall[$j]}"
                                ${diversosInstall[$j]}
                            fi
                        done
                        #echo ${#Nome[@]}
                        for ((j=0;j<=${#Nome[@]};j++)); do
                            if [ "${__dp[${c}]}" = "${Nome[$j]}" ] ; then
                                echo "${Nome[$j]}"
                                echo "${Description[$j]}"
                                echo "${version[$j]}"
                                echo "${Homepage[$j]}"
                                echo "${Install[$j]}"
                                ${Install[$j]}
                            fi
                        done

                    else
                        e_success "O pacote ${__dp[${c}]} escolhido, esta instalado em $(which ${__dp[${c}]})."
                    fi
                    e_arrow "Configuração dependência ${__dp[${c}]} terminada. $(e_success)"
                    sleep 1
            fi
            let $((++c))
        done
        read; Principal;

    
    for ((i=0;i<${#result[@]};i++)); do
        #echo ${result[${i}]}
        case ${result[${i}]} in
            "true") echo "selecionado variavel:${result[${i}]} como true";;
            "false") echo "selecionado variavel:${result[${i}]} como false";;
            " ") echo "selecionado variavel:${result[${i}]} como espaço";;
            *) echo "selecionado variavel: ${result[${i}]} como *";;
        esac
    done
    }
    function pro_multiselect {
        # little helpers for terminal print control and key input
        ESC=$( printf "\033")
        cursor_blink_on()   { printf "$ESC[?25h"; }
        cursor_blink_off()  { printf "$ESC[?25l"; }
        cursor_to()         { printf "$ESC[$1;${2:-1}H"; }
        print_inactive()    { printf "$2   $1 "; }
        print_active()      { printf "$2  $ESC[7m $1 $ESC[27m"; }
        get_cursor_row()    { IFS=';' read -sdR -p $'\E[6n' ROW COL; echo ${ROW#*[}; }
        key_input()         {
          local key
          IFS= read -rsn1 key 2>/dev/null >&2
          if [[ $key = ""      ]]; then echo enter; fi;
          if [[ $key = $'\x20' ]]; then echo space; fi;
          if [[ $key = $'\x1b' ]]; then
            read -rsn2 key
            if [[ $key = [A ]]; then echo up;    fi;
            if [[ $key = [B ]]; then echo down;  fi;
          fi 
        }
        toggle_option()    { #space
          local arr_name=$1
          eval "local arr=(\"\${${arr_name}[@]}\")"
          local option=$2
          if [[ ${arr[option]} == true ]]; then
            arr[option]=
          else
            arr[option]=true
          fi
          eval $arr_name='("${arr[@]}")'
        }

        local retval=$1
        local options
        local defaults

        IFS=';' read -r -a options <<< "$2"
        if [[ -z $3 ]]; then
          defaults=()
        else
          IFS=';' read -r -a defaults <<< "$3"
        fi
        local selected=()

        for ((i=0; i<${#options[@]}; i++)); do
          selected+=("${defaults[i]}")
          printf "\n"
        done

        # determine current screen position for overwriting the options
        local lastrow=`get_cursor_row`
        local startrow=$(($lastrow - ${#options[@]}))

        # ensure cursor and input echoing back on upon a ctrl+c during read -s
        trap "cursor_blink_on; stty echo; printf '\n'; exit" 2
        cursor_blink_off

        local active=0
        while true; do
            # print options by overwriting the last lines
            local idx=0
            for option in "${options[@]}"; do
                local prefix="[ ]"
                if [[ ${selected[idx]} == true ]]; then
                  prefix="[x]"
                fi

                cursor_to $(($startrow + $idx))
                if [ $idx -eq $active ]; then
                    print_active "$option" "$prefix"
                else
                    print_inactive "$option" "$prefix"
                fi
                ((idx++))
            done

            # user key control
            case `key_input` in
                space)  toggle_option selected $active;;
                enter)  break;;
                up)     ((active--));
                        if [ $active -lt 0 ]; then active=$((${#options[@]} - 1)); fi;;
                down)   ((active++));
                        if [ $active -ge ${#options[@]} ]; then active=0; fi;;
            esac
        done

        # cursor position back to normal
        cursor_to $lastrow
        printf "\n"
        cursor_blink_on

        eval $retval='("${selected[@]}")'
    }
    # -----------------------------------------------------------------------------------------
                                                                        # Função Instalador
    # -----------------------------------------------------------------------------------------
    function __Instalador(){
        which yad || Dependencias yad; clear;
        
        e_arrow "O ${red}${reset}${blue}   ${reset} instala vários aplicativos,
            conforme o usuários faz uso do software."
        printf "\n"; apt-cache stats; printf "\n"; read -p "Digite, qq tecla para continuar ...";
        
        clear
        e_arrow "As seguintes dependencias foram detectadas:"; printf "\n";
        echo $1; printf "\n";
        read -p "Você, pode instala(${purple}r${reset}) os pacotes que desejar no próximo \
            passo ou permitir que o Bo(${purple}b${reset}) realize este trabalho: " opt
        if [ $opt = "r" ] ; then
            e_note -c "Você pode ter a lista de todos os pacotes \
                (${purple}i${reset}${blue})nstalados ou uma \
                (${purple}l${reset}${blue})ista de todos os"
            e_note -c "pacotes disponiveis para instalação no aplicativo gerênciador de \
                pacotes, ainda"
            e_note -c "pode pesquisar por um pacote (${purple}e${reset}${blue})specífico, \
                bastando digitar o nome do aplicativo"
            e_note -c "abaixo, contendo dependências e informações diversas, pode ainda \
                pesquisar por pacotes"
            e_note -c "(${purple}q${reset}${blue})uebrados. Ou mesmo \
                (${purple}a${reset}${blue})tualizar com update e fazer upgrade. O \
                (${purple}h${reset}${blue})olding de pacotes" 
            e_note -c "significa que ele não pode ser atualizado até você voltar a usá-lo \
                novamente."
            e_note -c "Aqui (${purple}u${reset}${blue})nhold. Se quizer editar o arquivo de \
                o(${purple}r${reset}${blue})igem, sera mostrado uma"
            e_note -c "lista com os editores disponiveis aconselhamos o uso do indicado pela \
                seta. Gostaria" 
            e_note -c "de usar o au(${purple}t${reset}${blue})oremove + purge. E \
                re(${purple}m${reset}${blue})over e purgar, digite o nome abaixo."
            e_note -c "E se deseja i(${purple}n${reset}${blue})stalar. Descubra todo o pacote \
                Debian que pode"
            e_note -c "ser usado para detecção de intru(${purple}s${reset}${blue})ão. Descubra \
                todos os pacotes sni(${purple}f${reset}${blue})fer."
            e_note -c "E por último, tudo em um só lu(${purple}g${reset}${blue})ar aptitude.";
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
                sudo apt install ${pac}; #read;
            # -----------------------------------------------------------------------------------------    
                                                     # [ lista de pacotes disponiveis para instalação ]
            # -----------------------------------------------------------------------------------------
            elif [ ${opt} = "l" ] ; then
                local count=0;
                declare apt_depens_search;
                if [ -f ${aptlistLocation} ] ; then  
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
                #read; 
            # -----------------------------------------------------------------------------------------    
                                                                  # [ Purge e auto-remover de pacotes ]
            # -----------------------------------------------------------------------------------------
            elif [ ${opt} = "t" ] ; then
                sudo apt --purge autoremove
            # -----------------------------------------------------------------------------------------    
                                                                              # [ editar sources.list ]
            # -----------------------------------------------------------------------------------------
            elif [ ${opt} = "r" ] ; then
                #sudo apt edit-sources
                nano /etc/apt/sources.list
            # -----------------------------------------------------------------------------------------    
                                                                               # [ holding de pacotes ]
            # -----------------------------------------------------------------------------------------
            elif [ ${opt} = "h" ] ; then
                read -p "Digite o nome do pacote, para holding : " pac
                apt hold ${pac}; read;
            # -----------------------------------------------------------------------------------------    
                                                                             # [ unholding de pacotes ]
            # -----------------------------------------------------------------------------------------
            elif [ ${opt} = "u" ] ; then
                read -p "Digite o nome do pacote, para unholding : " pac
                apt unhold ${pac}; read;
            # -----------------------------------------------------------------------------------------    
                                                                      # [ update e upgrade de pacotes ]
            # -----------------------------------------------------------------------------------------
            elif [ ${opt} = "a" ] ; then
                sudo apt update && sudo apt upgrade; read
            # -----------------------------------------------------------------------------------------    
                                                                                # [ pesquisar pacotes ]
            # -----------------------------------------------------------------------------------------
            elif [ ${opt} = "e" ] ; then
                read -p "Digite o nome do pacote, para pesquisar : " pac
                apt-cache search ${pac}; read;
                apt-cache pkgnames ${pac}; read;
                apt-cache show ${pac}; read;
                apt-cache showpkg ${pac}; read; 
                apt depends ${pac}; read; 
            # -----------------------------------------------------------------------------------------    
                                                                                # [ pacotes quebrados ]
            # -----------------------------------------------------------------------------------------
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
        elif [ $opt = "b" ] ; then
            apt-cache showpkg ${1}
            apt depends ${1}; read;
            Dependencias ${1}; 
        fi
        unset dp; Verifica_dp;
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
# -----------------------------------------------------------------------------------------
                                                                       #(parte util do bob)
# -----------------------------------------------------------------------------------------
# bob_util script shell em: 17/07/2019 por: Elizeu de Santana copyright(c) MIT 2019
# ----------------------------------------THE END------------------------------------------    
