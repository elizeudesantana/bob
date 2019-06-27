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
    

# ========================================================================================
# Class Bob
# ----------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------
function Class_Bob(){
    # Rotas
    
    # -----------------------------------------------------------------------------------------
    # Variavel  -> pespectiva de localizações do script (configuravel)
    instalacao="/Projetos/bob";                                          # Diretorio de Instalação apartir de HOME
    
    # /* Não modificar ------------------------------------------------------------------------
    scriptPath_Home="${HOME}";                                           # Diretorio HOME (~)
    scriptPath_Bob="${scriptPath_Home}${instalacao}";                    # Diretrio de Instalação do Bob
    scriptPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";      # Diretorio de instalação do script 
    
    if [ $scriptPath != $scriptPath_Bob ] ; then
        utilsLocation="${scriptPath_Bob}/lib/bob_util.sh";                   # Diretorio de localização bob_util.sh
        enderecoRelativo_bin="${scriptPath_Bob}/bin";                        # Estrutura de diretorio bin
        enderecoRelativo_lib="${scriptPath_Bob}/lib";                        # Estrutura de diretorio lib
        enderecoRelativo_view="${scriptPath_Bob}/lib/view";                  # Estrutura de diretorio lib/view
        enderecoRelativo_doc="${scriptPath_Bob}/doc";                        # Estrutura de diretorio doc          
    else
        utilsLocation="${scriptPath}/lib/bob_util.sh"; 
        enderecoRelativo_bin="${scriptPath}/bin";                            # Estrutura de diretorio bin
        enderecoRelativo_lib="${scriptPath}/lib";                            # Estrutura de diretorio lib
        enderecoRelativo_view="${scriptPath}/lib/view";                      # Estrutura de diretorio lib/view
        enderecoRelativo_doc="${scriptPath}/doc";                            # Estrutura de diretorio doc
    fi

    bobLocation="${enderecoRelativo_bin}/bob.sh";                        # Diretorio de localização bob.sh
    confLocation="${enderecoRelativo_doc}/bob.conf";                     # Diretorio de localização bob.conf
    jusanteLocation="${enderecoRelativo_lib}/bob_util_jusante.sh";       # Diretorio de localização bob_util_jusante.sh
    coresLocation="${enderecoRelativo_view}/bob_util_cores.sh";          # Diretorio de localização bob_util_cores.sh
    montanteLocation="${enderecoRelativo_lib}/bob_util_montante.sh";     # Diretorio de localização bob_util_montante.sh
    tituloLocation="${enderecoRelativo_view}/bob_util_titulo.sh";        # Diretorio de localização bob_util_titulo.sh
    confLocation="${enderecoRelativo_lib}/bob_util_conf.sh";             # Diretorio de localização bob_util_conf.sh
    manutencaoLocation="${enderecoRelativo_lib}/bob_manutencao.sh";      # Diretorio de localização bob_manutencao.sh
    instalacaoLocation="${enderecoRelativo_lib}/bob_instalacao.sh";      # Diretorio de localização bob_instalacao.sh
    shellfontsLocation="${enderecoRelativo_lib}/bob_shellfonts.sh";      # Diretorio de localização bob_shellfonts.sh
    bancodadosLocation="${enderecoRelativo_lib}/bob_bancodados.sh";      # Diretorio de localização bob_bancodados.sh
    financeiroLocation="${enderecoRelativo_lib}/bob_financeiro.sh";      # Diretorio de localização bob_financeiro.sh
    financeiroBDLocation="${enderecoRelativo_lib}/bob_financeiro_BD.sh";  # Diretorio de localização bob_financeiroBD.sh
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
    fontsLocation="${scriptPath_Home}/.local/share/fonts";
    climaLocation="${enderecoRelativo_doc}/clima.tmp"
    # */ -----------------------------------------------------------------------------------

    # configurações ----------------------------------------------------------------------------
    ### Nome do programa pode ser configurada para se adpatar a gosto do usuario. ###
    [ -e ${confLocation} ] || { echo "Arquivo bob.conf ausente!"; }; source ${confLocation} 
    dlc="$Desliga_cores"; clt="$Cor_linha_logotipo"; cls="$Cor_linhas"; ctr="$Cor_texto_result"; 
    ctm="$Cor_texto_Menu"; clg="$Cor_logo"; lgt="${Logotipo_Titulo}"; nmu="${Nome_do_Usuario}";
    rlt="${Relogio_tela}"; tle="${Tela_Entrada}";

    scriptName=`basename $0`; scriptBasename="$(basename ${scriptName} .sh)"    # Strips '.sh' from scriptName
    now=$(LC_ALL=C date +"%m-%d-%Y %r")                                         # Returns: 06-14-2015 10:34:40 PM
    datestamp=$(LC_ALL=C date +%Y-%m-%d)                                        # Returns: 2015-06-14
    #hourstamp=$(LC_ALL=C date +%r)                                             # Returns: 10:34:40 PM
    timestamp=$(LC_ALL=C date +%Y%m%d_%H%M%S)                                   # Returns: 20150614_223440
    today=$(LC_ALL=C date +"%m-%d-%Y")                                          # Returns: 06-14-2015
    longdate=$(LC_ALL=C date +"%a, %d %b %Y %H:%M:%S %z")                       # Returns: Sun, 10 Jan 2016 20:47:53 -0500
    gmtdate=$(LC_ALL=C date -u -R | sed 's/\+0000/GMT/')                        # Returns: Wed, 13 Jan 2016 15:55:29 GMT
    thisHost=$(hostname); hourstamp=`date | cut -d" " -f4 | cut -d: -f1`; 

    # Constantes --------------------------------------------------------------------------------
    log=( 'bob.log' 'setupapp.log' 'bob.conf'); sql_root="sudo mysql -u root -pelizeu -e";
    sql_user_name="bob"; sql_user_senha="senha"; # usar ~.my.cnf não precisa colocar a senha
    agenda_DB="bob_DB"; agenda_tabela="agenda"; lembrete_tabela="lembrete";
    sql_user="mysql -u $sql_user_name -p$sql_user_senha -e "; hi="";

    # Variaveis --------------------------------------------------------------------------------
    pid=$(ps -eo pid,comm | awk '$2 == "bob.sh" {print $1 }' | sed -n '1p' );
    dirpath="${PWD}"; maquina="${OSTYPE}"; #inicio=$(cat tmp.txt)  # consertar isso
    myhost=$(/bin/hostname); tempo=$(/bin/date +%m%d%y_%H%M%S); dirTrab=/home/elizeu/Projetos;
    info_arq=${dirTrab}/bob_snapshot.${myhost}.$tempo;

    COMPACTARDIR=/home/elizeu/Documentos        # Diretorio para Compactação
    BACKUPDIR=/home/elizeu/Documentos           # Directory to backup
    GDRIVEDIR=/mnt/GoogleDrive                  # Google Drive directory
    TARGETDIR=backups                           # Directory target in remote
    #Key=cat ChaveGoogleDriver.txt
    Driver=https://drive.google.com/drive/my-drive

    # ----------------------------------------------------------------------------------------
    function ClimaTempo(){
        curl 'wttr.in/{Guaratiba}?format=%l:%c+%t+%h+%M+%w+%p+%P+%m' >${climaLocation}
    }
    # -----------------------------------------------------------------------------------------
    #sleep 3 & Anime1
    function Anime1(){ 
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
    #sleep 3 & Anime2
    function Anime2(){
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
    progressBar() {
        # progressBar
        # uso:
        #   for 1 in $(seq 0 100); do
        #     sleep 1
        #     progressBar 100
        #   done
        # -----------------------------------
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

    # Uso:
    #   join , a "b c" d #a,b c,d
    #   join / var local tmp #var/local/tmp
    #   join , "${FOO[@]}" #a,b,c
    # -----------------------------------------------------------------------------------------
    function join() { local IFS="${1}"; shift; echo "${*}"; }
    # -----------------------------------------------------------------------------------------
    function is_linux(){
        if [ $(uname) = 'Linux' ] ; then
          return 0
        fi
        return 1
    }
    # -----------------------------------------------------------------------------------------
    function is_ubuntu(){
        #[[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1
        d=$(cat /proc/version | egrep -o '\([A-Z][a-z]+ ' | tr -d \()
        if [ ${d} = 'Ubuntu' ] ; then
          return 0
        fi
        return 1
    }
    function is_ubuntu_desktop() {
        dpkg -l ubuntu-desktop >/dev/null 2>&1 || return 1
    }
    # -----------------------------------------------------------------------------------------
    function is_exists() {
      if [[ -e "$1" ]]; then
        return 0
      fi
      return 1
    }
    # -----------------------------------------------------------------------------------------
    function is_not_exists() {
      if [[ ! -e "$1" ]]; then
        return 0
      fi
      return 1
    }
    # -----------------------------------------------------------------------------------------
    function is_file() {
      if [[ -f "$1" ]]; then
        return 0
      fi
      return 1
    }
    # -----------------------------------------------------------------------------------------
    function is_not_file() {
      if [[ ! -f "$1" ]]; then
        return 0
      fi
      return 1
    }
    # -----------------------------------------------------------------------------------------
    function is_dir() {
      if [[ -d "$1" ]]; then
        return 0
      fi
      return 1
    }
    # -----------------------------------------------------------------------------------------
    function is_not_dir() {
      if [[ ! -d "$1" ]]; then
        return 0
      fi
      return 1
    }
    # -----------------------------------------------------------------------------------------
    function is_symlink() {
      if [[ -L "$1" ]]; then
        return 0
      fi
      return 1
    }
    # -----------------------------------------------------------------------------------------
    function is_not_symlink() {
      if [[ ! -L "$1" ]]; then
        return 0
      fi
      return 1
    }
    # -----------------------------------------------------------------------------------------
    function is_empty() {
      if [[ -z "$1" ]]; then
        return 0
      fi
      return 1
    }
    # -----------------------------------------------------------------------------------------
    function is_not_empty() {
      if [[ -n "$1" ]]; then
        return 0
      fi
      return 1
    }

    # Test whether a command exists
    # ------------------------------------------------------
    # Usage:
    #    if type_exists 'git'; then
    #      some action
    #    else
    #      some other action
    #    fi
    # -----------------------------------------------------------------------------------------
    function type_exists() {
      if [ "$(type -P "$1")" ]; then
        return 0
      fi
      return 1
    }

    # -----------------------------------------------------------------------------------------
    function type_not_exists() {
      if [ ! "$(type -P "$1")" ]; then
        return 0
      fi
      return 1
    }

    # Test which OS the user runs
    # $1 = OS to test
    # Usage: if is_os 'darwin'; then
    # -----------------------------------------------------------------------------------------
    function is_os() {
      if [[ "${OSTYPE}" == $1* ]]; then
        return 0
      fi
      return 1
    }
    # -----------------------------------------------------------------------------------------
    function seek_confirmation_force() {
      # echo ""
      input "$@"
      if "${force}"; then
        notice "Forcing confirmation with '--force' flag set"
      else
        read -p " (y/n) " -n 1
        echo ""
      fi
    }

    # Test whether the result of an 'ask' is a confirmation
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
    # Skip something
    # ------------------------------------------------------
    # Offer the user a chance to skip something.
    # Credit: https://github.com/cowboy/dotfiles
    # ------------------------------------------------------
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

    # unmountDrive
    # ------------------------------------------------------
    # If an AFP drive is mounted as part of a script, this
    # will unmount the volume.  This will only work on Macs.
    # ------------------------------------------------------
    function unmountDrive() {
      if [ -d "$1" ]; then
        diskutil unmount "$1"
      fi
    }

    # help
    # ------------------------------------------------------
    # Prints help for a script when invoked from the command
    # line.  Typically via '-h'.  If additional flags or help
    # text is available in the script they will be printed
    # in the '$usage' variable.
    # ------------------------------------------------------
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
    function pauseScript() {
      # A simple function used to pause a script at any point and
      # only continue on user input
      seek_confirmation "Ready to continue?"
      if is_confirmed; then
        info "Continuing"
      else
        warning "Exiting Script."
        safeExit
      fi
    }

    # -----------------------------------------------------------------------------------------
    function in_array() {
        # Determine if a value is in an array.
        # Usage: if in_array "VALUE" "${ARRAY[@]}"; then ...
        local value="$1"; shift
        for arrayItem in "$@"; do
            [[ "${arrayItem}" == "${value}" ]] && return 0
        done
        return 1
    }

    # Text Transformations
    # -----------------------------------
    # Transform text using these functions.
    # Adapted from https://github.com/jmcantrell/bashful
    # -----------------------------------
    lower() {
      # Convert stdin to lowercase.
      # usage:  text=$(lower <<<"$1")
      #         echo "MAKETHISLOWERCASE" | lower
      tr '[:upper:]' '[:lower:]'
    }

    # -----------------------------------------------------------------------------------------
    upper() {
      # Convert stdin to uppercase.
      # usage:  text=$(upper <<<"$1")
      #         echo "MAKETHISUPPERCASE" | upper
      tr '[:lower:]' '[:upper:]'
    }

    # -----------------------------------------------------------------------------------------
    ltrim() {
      # Removes all leading whitespace (from the left).
      local char=${1:-[:space:]}
        sed "s%^[${char//%/\\%}]*%%"
    }

    # -----------------------------------------------------------------------------------------
    rtrim() {
      # Removes all trailing whitespace (from the right).
      local char=${1:-[:space:]}
      sed "s%[${char//%/\\%}]*$%%"
    }

    # -----------------------------------------------------------------------------------------
    trim() {
      # Removes all leading/trailing whitespace
      # Usage examples:
      #     echo "  foo  bar baz " | trim  #==> "foo  bar baz"
      ltrim "$1" | rtrim "$1"
    }

    # -----------------------------------------------------------------------------------------
    squeeze() {
      # Removes leading/trailing whitespace and condenses all other consecutive
      # whitespace into a single space.
      #
      # Usage examples:
      #     echo "  foo  bar   baz  " | squeeze  #==> "foo bar baz"

      local char=${1:-[[:space:]]}
      sed "s%\(${char//%/\\%}\)\+%\1%g" | trim "$char"
    }

    # -----------------------------------------------------------------------------------------
    squeeze_lines() {
        # <doc:squeeze_lines> {{{
        #
        # Removes all leading/trailing blank lines and condenses all other
        # consecutive blank lines into a single blank line.
        #
        # </doc:squeeze_lines> }}}

        sed '/^[[:space:]]\+$/s/.*//g' | cat -s | trim_lines
    }


    # -----------------------------------------------------------------------------------------
    if [ -f "${confLocation}" ]; then       ### carregando o arquivo .conf ###
        source "${confLocation}";
        varDebug_conf="Realizado Source no arquivo: ${confLocation}" 
    else
        e_error "Erro carregando ${confLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${montanteLocation}" ]; then       ### carregando o arquivo .conf ###
        source "${montanteLocation}";
        varDebug_conf="Realizado Source no arquivo: ${montanteLocation}" 
    else
        e_error "Erro carregando ${montanteLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${coresLocation}" ]; then      ### carregando o arquivo de cores ###
        source "${coresLocation}";
        varDebug_cores="Realizado Source no arquivo: ${coresLocation}" 
    else
        e_error "Erro carregando ${coresLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${tituloLocation}" ]; then     ### carre3gando o arquivo de title and exit ###
        source "${tituloLocation}";
        varDebug_titulo="Realizado Source no arquivo: ${tituloLocation}" 
    else
        e_error "Erro carregando ${tituloLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${bobMenuLocation}" ]; then
        source "${bobMenuLocation}";
    else
        e_error "Erro carregando ${bobMenuLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${pythonLocation}" ]; then
        source "${pythonLocation}";
    else
        e_error "Erro carregando ${pythonLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${instalacaoLocation}" ]; then
        source "${instalacaoLocation}";
    else
        e_error "Erro carregando ${instalacaoLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${instalacaoLocation}" ]; then
        source "${instalacaoLocation}";
    else
        e_error "Erro carregando ${instalacaoLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${lembraLocation}" ]; then
        source "${lembraLocation}";
    else
        e_error "Erro carregando ${lembraLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${textoLocation}" ]; then
        source "${textoLocation}";
    else
        e_error "Erro carregando ${textoLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${financeiroLocation}" ]; then
        source "${financeiroLocation}";
    else
        e_error "Erro carregando ${financeiroLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${fluxogramasLocation}" ]; then
        source "${fluxogramasLocation}";
    else
        e_error "Erro carregando ${fluxogramasLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${manutencaoLocation}" ]; then
        source "${manutencaoLocation}";
    else
        e_error "Erro carregando ${manutencaoLocation}"; Sair;
    fi
    # -----------------------------------------------------------------------------------------
    if [ -f "${bancodadosLocation}" ]; then
        source "${bancodadosLocation}";
    else
        e_error "Erro carregando ${bancodadosLocation}"; Sair;
    fi
 
 
    # function BobChildren_ClimaTempo(){
    #     curl 'wttr.in/{Guaratiba}?format=%l:%c+%t+%h+%M+%w+%p+%P+%m' > ${climaLocation}
    # }


}
# -----------------------------------------------------------------------------------------
# Função funcoes
# -----------------------------------------------------------------------------------------
# lista de todas as funções, de bob. 
# n/u - nunca usada  (considerando a retirada do sistema)
# n/a - discontinuada (foi utilizada em versões anteriores, considerar retirar do sistema)
# n/c - não contabilizada (devido a grande uso)
# -----------------------------------------------------------------------------------------
function funcoes(){
    bob_util_cores=(
        "[bob_util_cores]"
        "All_cores_tput"            # n/u
        "tituloAscii"               # bob_util_titulo - linha 65
        "e_header"                  # n/c
        "e_arrow"                   # n/c
        "e_success"                 # n/c
        "e_error"                   # n/c
        "e_warning"                 # n/c
        "e_underline"               # n/c
        "e_bold"                    # n/c
        "e_note"                    # n/c
        "seek_confirmation"         # n/c
        "seek_confirmation_head"    # n/u
        "is_confirmed"              # n/c
        "_alert"                    # pouco uso contabilizar, estudar discontinuação
        "die"                       #
        "error"                     #
        "warning"                   #
        "notice"                    #
        "info"                      #
        "debug"                     # ...
        "success"
        "input"
        "header"
        "verbose"
        "fromhex"
        "tohex"
        "CorRGB" )

    bob_util_montante=( 
        "bob_util_montante"
        "ClimaTempo"
        "mostraRelogio"
        "DiversasZZ"
        "Com"
        "Aquarium"
        "comprimento"
        "Anime1"
        "Anime2"
        "readFile"
        "needSudo"
        "convertsecs"
        "pushover"
        "join"
        "is_linux"
        "is_ubuntu"
        "is_exists"
        "is_not_exists"
        "is_file"
        "is_not_file"
        "is_dir"
        "is_not_dir"
        "is_symlink"
        "is_not_symlink"
        "is_empty"
        'is_not_empty'
        "type_exists"
        "type_not_exists"
        "is_os"
        "seek_confirmation_force"
        "is_confirmed_force"
        "is_not_confirmed_force"
        "skip"
        "unmountDrive"
        "help"
        "pauseScript"
        "in_array"
        "makeCSV"
        "writeCSV"
        "json2yaml"
        "yaml2json")

     bob_texto=(
        "bob_texto"
        "Dependencias"
        "MenuTexto"
        "MenuTextoContinucao"
        "SubMenuTexto"
        "SelecionaArquivo"
        "SelecionaPalavra"
        "SelecionaListagem"
        "Linhas")
    echo "-------------------------------------------------------------------------------"
    for ((i=0;i<=${#bob_util_cores};i++)) ; do
        e_arrow "${bob_util_cores[${i}]}" 
    done
    echo "-------------------------------------------------------------------------------"
    for ((i=0;i<=${#bob_util_montante};i++)) ; do
        e_arrow "${bob_util_montante[${i}]}" 
    done
    echo "-------------------------------------------------------------------------------"
    for ((i=0;i<=${#bob_texto};i++)) ; do
        e_arrow "${bob_texto[${i}]}" 
    done
    echo "-------------------------------------------------------------------------------"
    e_arrow -l "Você pode selecionar e copiar o nome da função com o ."; read toma
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