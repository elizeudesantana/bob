#!/bin/bash
############################################################################################
#
# Bob utilities script bash 
#
version="2019.01"                                                           # Versão do Programa
#
scriptFileVersion="1.0.0"                                                   # Versão do script
#
# History:
#   0.0.1    script version inicial, estrutura de diretorio.
#   2019.01  Dividido em diretorios criação de route e tipando de forma MVC (23/06/2019)
#
# Dependências:
#   function Dependencias()
#
# * Retorno: n/a
# * Data: n/a
#
# * Funções escritas neste script:
#
# "ClimaTempo"
# "mostraRelogio"
# "DiversasZZ"
# "Com"
# "Aquarium"
# "comprimento"
# "Anime1"
# "Anime2"
# "readFile"
# "needSudo"
# "convertsecs"
# "pushover"
# "join"
# "is_linux"
# "is_ubuntu"
# "is_exists"
# "is_not_exists"
# "is_file"
# "is_not_file"
# "is_dir"
# "is_not_dir"
# "is_symlink"
# "is_not_symlink"
# "is_empty"
# 'is_not_empty'
# "type_exists"
# "type_not_exists"
# "is_os"
# "seek_confirmation_force"
# "is_confirmed_force"
# "is_not_confirmed_force"
# "skip"
# "unmountDrive"
# "help"
# "pauseScript"
# "in_array"
# "makeCSV"
# "writeCSV"
# "json2yaml"
# "yaml2json"
#
# by: Elizeu de Santana -------------------------------------------------------------------


# ----------------------------------------------------------------------------------------
# função ClimaTempo
# ----------------------------------------------------------------------------------------
# Previsão do tempo on-time 

# by: Elizeu de Santana / 31-05-2019 -------------------------------------------------------
Cht(){
    Titulo
    ./cht.sh --help
    echo -e "${ctr} Para voltar ao menu principal (s)! ${dlc}"
    echo -ne "${ctr} Ou digite o comando qq lang (ex. python file): ${dlc}"; read fResp
    case $fResp in
        s)
            Principal;;
        *)
            Titulo
            ./cht.sh ${fResp}
            echo -ne "${ctr} Digite o comando (ex. python file): ${dlc}"; read fResp
            while true; do
                Titulo
                ./cht.sh ${fResp}
                echo -ne "${ctr} Digite o comando (ex. python file) ou (s): ${dlc}"; read fResp
                if  [ "$fResp" == "s" ] ; then
                    Principal
                fi
            done
            ;;
    esac
}

# Define-se a funcao que ira mostrar o relogio
function mostraRelogio(){
   zmodload zsh/datetime
   zmodload zsh/terminfo
   
   local posicao
   
   while true
   do
      # Codigos de controle para o terminal 
      echoti sc
      echoti setaf 2
      echoti smso
      
      # Posicionamento na tela
      (( posicao = $terminfo[cols] - 8 ))
      echoti cup 0 $posicao
      strftime "%X" $EPOCHSECONDS # Relogio
      
      echoti sgr0
      echoti rc
      
      sleep 1s
   done
}

# by: Elizeu de Santana / 31-05-2019 -------------------------------------------------------
function DiversasZZ(){
    Titulo
    ./bob_zzfuncao.sh zzzz
    echo -e "${ctr} Para descrição detalhada de todas as fuções (t), para voltar ao menu principal (s). ${dlc}"
    echo -ne "${ctr} Ou digite o nome da função: ${dlc}"; read zzfResp
    case $zzfResp in
        t)
            Titulo
            ./bob_zzfuncao.sh zzajuda --lista
            echo -ne "${ctr} Digite (s) para sair ou nome da funcão : ${dlc}"; read aFunc
            if  [ "$aFunc" == "s" ] ; then
                Principal
            else
                Titulo
                ./bob_zzfuncao.sh ${aFunc} -h
                echo -ne "${ctr} Digite os argumentos para a função zz${aFunc}: ${dlc}"; read argFesc
                
                while true; do
                    echo -ne "${ctr} Aguarde ... ${dlc}";
                    Titulo
                    ./bob_zzfuncao.sh ${aFunc} ${argFesc}
                    ./bob_zzfuncao.sh ${aFunc} -h            
                    echo -ne "${ctr} Digite (s) para sair ou novos argumentos para a função zz${aFunc}: ${dlc}"; read argFesc
                        
                    if  [ "$argFesc" == "s" ] ; then
                        Principal
                    fi
                done
            fi
            ;;
        s)
            Principal;;
        *)
            Titulo
            ./bob_zzfuncao.sh ${zzfResp} -h
            echo -ne "${ctr} Digite os argumentos para a função zz${zzfResp}: ${dlc}"; read argFesc
            
            while true; do
                echo -ne "${ctr} Aguarde ... ${dlc}";
                Titulo
                ./bob_zzfuncao.sh ${zzfResp} $argFesc
                ./bob_zzfuncao.sh ${zzfResp} -h            
                echo -ne "${ctr} Digite (s) para sair ou novos argumentos para a função zz${zzfResp}: ${dlc}"; read argFesc
                       
                if  [ "$argFesc" == "s" ] ; then
                    Principal
                fi
            done
            ;;
    esac
}

# by: Elizeu de Santana / 31-05-2019 -------------------------------------------------------
function Com(){
    Titulo
    echo -ne "Como : " ; read p
    while true ; do
        where="${p}"; shift
        IFS=+ curl "https://cht.sh/$where/ $*"
        echo -e "${cls} \n ---------------------------------------------------------------------- ${dlc}"
        unset p; echo -ne "Digite uma nova consulta (enter menu) ou (s)air : " ; read p
        if [ "${p}" = "s" ] ; then
            break
        fi
    done
    Principal
}

# by: Elizeu de Santana / 31-05-2019 -------------------------------------------------------
function Aquarium(){
    ### ###
    if [[ ! $(which asciiquarium 2>/dev/null) ]]; then
        e_arrow "Iniciando configuração dependências. $(e_success)"
        seek_confirmation "${USER}, existe a seguinte dependência  ${i}, permite a manutenção do sistema ?" 
        if is_confirmed; then
            e_arrow -d "Instalando : libcurses-perl."
            sudo apt-get install libcurses-perl -y 2>/dev/null; cd /tmp

            e_arrow -d "Baixando modulo perl."
            wget http://search.cpan.org/CPAN/authors/id/K/KB/KBAUCOM/Term-Animation-2.4.tar.gz 2>/dev/null

            e_arrow -d "Descomprimindo modulo perl."
            tar -zxvf Term-Animation-2.4.tar.gz 2>/dev/null; cd Term-Animation-2.4/

            e_arrow -d "Copilando e instalando modulo perl."
            perl Makefile.PL && make && make test 2>/dev/null
            sudo make install 2>/dev/null; cd /home/elizeu/Projetos/

            e_arrow -d "Baixando e descomprimindo script asciiquarium.tar.gz."
            wget https://robobunny.com/projects/asciiquarium/asciiquarium_1.1.tar.gz 2>/dev/null
            tar -zxvf asciiquarium.tar.gz 2>/dev/null
            cd asciiquarium_1.1/
            sudo cp asciiquarium /usr/local/bin
            sudo chmod 0755 /usr/local/bin/asciiquarium
        fi
        e_arrow -d "Configuração dependência ${i} terminada. $(e_success)"
        asciiquarium
        Principal
    else
        asciiquarium
        Principal
    fi
}


# Traps
# ------------------------------------------------------
# These functions are for use with different trap scenarios
# ------------------------------------------------------

# Non destructive exit for when script exits naturally.
# # Usage: Add this function at the end of every script
# function safeExit() {
#   # Delete temp files, if any
#   if is_dir "${tmpDir}"; then
#     rm -r "${tmpDir}"
#   fi
#   trap - INT TERM EXIT
#   exit
# }

# trapCleanup Function
# ----------------------------------------------------------------------------------------
# Ações que precipítam a saida antes do termino do script
# # ----------------------------------------------------------------------------------------
# function trapCleanup() {
#     echo ""
#       if is_dir "${tmpDir}"; then
#       rm -r "${tmpDir}"
#     fi
#     die "Saindo trapped. Na função: '${FUNCNAME[*]}'"
# }

# readFile
# ------------------------------------------------------
# Function to read a line from a file.
#
# Most often used to read the config files saved in my etc directory.
# Outputs each line in a variable named $result
# ------------------------------------------------------
function readFile() {
  unset "${result}"
  while read result
  do
    echo "${result}"
  done < "$1"
}

# Escape a string
# ------------------------------------------------------
# usage: var=$(escape "String")
# ------------------------------------------------------
escape() { echo "${@}" | sed 's/[]\.|$(){}?+*^]/\\&/g'; }

# needSudo
# ------------------------------------------------------
# If a script needs sudo access, call this function which
# requests sudo access and then keeps it alive.
# ------------------------------------------------------
function needSudo() {
  # Update existing sudo time stamp if set, otherwise do nothing.
  sudo -v
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}

# convertsecs
# ------------------------------------------------------
# Convert Seconds to human readable time
#
# To use this, pass a number (seconds) into the function as this:
# print "$(convertsecs $TOTALTIME)"
#
# To compute the time it takes a script to run use tag the start and end times with
#   STARTTIME=$(date +"%s")
#   ENDTIME=$(date +"%s")
#   TOTALTIME=$(($ENDTIME-$STARTTIME))
# ------------------------------------------------------
function convertsecs() {
  ((h=${1}/3600))
  ((m=(${1}%3600)/60))
  ((s=${1}%60))
  printf "%02d:%02d:%02d\n" $h $m $s
}

# -----------------------------------------------------------------------------------------
function pushover() {
  # pushover
  # ------------------------------------------------------
  # Sends notifications view Pushover
  # Requires a file named 'pushover.cfg' be placed in '../etc/'
  #
  # Usage: pushover "Title Goes Here" "Message Goes Here"
  #
  # Credit: http://ryonsherman.blogspot.com/2012/10/shell-script-to-send-pushover.html
  # ------------------------------------------------------

  # Check for config file containing API Keys
  if [ ! -f "${SOURCEPATH}/../etc/pushover.cfg" ]; then
   error "Please locate the pushover.cfg to send notifications to Pushover."
  else
    # Grab variables from the config file
    source "${SOURCEPATH}/../etc/pushover.cfg"

    # Send to Pushover
    PUSHOVERURL="https://api.pushover.net/1/messages.json"
    API_KEY="${PUSHOVER_API_KEY}"
    USER_KEY="${PUSHOVER_USER_KEY}"
    DEVICE=""
    TITLE="${1}"
    MESSAGE="${2}"
    curl \
    -F "token=${API_KEY}" \
    -F "user=${USER_KEY}" \
    -F "device=${DEVICE}" \
    -F "title=${TITLE}" \
    -F "message=${MESSAGE}" \
    "${PUSHOVERURL}" > /dev/null 2>&1
  fi
}
# -----------------------------------------------------------------------------------------
htmlDecode() {
  # Decode HTML characters with sed
  # Usage: htmlDecode <string>
  echo "${1}" | sed -f "${SOURCEPATH}/htmlDecode.sed"
}

# -----------------------------------------------------------------------------------------
htmlEncode() {
  # Encode HTML characters with sed
  # Usage: htmlEncode <string>
  echo "${1}" | sed -f "${SOURCEPATH}/htmlEncode.sed"
}

# -----------------------------------------------------------------------------------------
urlencode() {
  # URL encoding/decoding from: https://gist.github.com/cdown/1163649
  # Usage: urlencode <string>

  local length="${#1}"
  for (( i = 0; i < length; i++ )); do
      local c="${1:i:1}"
      case $c in
          [a-zA-Z0-9.~_-]) printf "%s" "$c" ;;
          *) printf '%%%02X' "'$c"
      esac
  done
}

# -----------------------------------------------------------------------------------------
urldecode() {
    # Usage: urldecode <string>

    local url_encoded="${1//+/ }"
    printf '%b' "${url_encoded//%/\x}"
}

# -----------------------------------------------------------------------------------------
parse_yaml() {
  # Function to parse YAML files and add values to variables. Send it to a temp file and source it
  # https://gist.github.com/DinoChiesa/3e3c3866b51290f31243 which is derived from
  # https://gist.github.com/epiloque/8cf512c6d64641bde388
  #
  # Usage:
  #     $ parse_yaml sample.yml > /some/tempfile
  #
  # parse_yaml accepts a prefix argument so that imported settings all have a common prefix
  # (which will reduce the risk of name-space collisions).
  #
  #     $ parse_yaml sample.yml "CONF_"

    local prefix=$2
    local s
    local w
    local fs
    s='[[:space:]]*'
    w='[a-zA-Z0-9_]*'
    fs="$(echo @|tr @ '\034')"
    sed -ne "s|^\($s\)\($w\)$s:$s\"\(.*\)\"$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s[:-]$s\(.*\)$s\$|\1$fs\2$fs\3|p" "$1" |
    awk -F"$fs" '{
      indent = length($1)/2;
      if (length($2) == 0) { conj[indent]="+";} else {conj[indent]="";}
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
              vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
              printf("%s%s%s%s=(\"%s\")\n", "'"$prefix"'",vn, $2, conj[indent-1],$3);
      }
    }' | sed 's/_=/+=/g'
}

# -----------------------------------------------------------------------------------------
httpStatus() {
  # -----------------------------------
  # Shamelessly taken from: https://gist.github.com/rsvp/1171304
  #
  # Usage:  httpStatus URL [timeout] [--code or --status] [see 4.]
  #                                             ^message with code (default)
  #                                     ^code (numeric only)
  #                           ^in secs (default: 3)
  #                   ^URL without "http://" prefix works fine.
  #
  #  4. curl options: e.g. use -L to follow redirects.
  #
  #  Dependencies: curl
  #
  #         Example:  $ httpStatus bit.ly
  #                   301 Redirection: Moved Permanently
  #
  #         Example: $ httpStatus www.google.com 100 -c
  #                  200
  #
  # -----------------------------------
  local curlops
  local arg4
  local arg5
  local arg6
  local arg7
  local flag
  local timeout
  local url

  saveIFS=${IFS}
  IFS=$' \n\t'

  url=${1}
  timeout=${2:-'3'}
  #            ^in seconds
  flag=${3:-'--status'}
  #    curl options, e.g. -L to follow redirects
  arg4=${4:-''}
  arg5=${5:-''}
  arg6=${6:-''}
  arg7=${7:-''}
  curlops="${arg4} ${arg5} ${arg6} ${arg7}"

  #      __________ get the CODE which is numeric:
  code=`echo $(curl --write-out %{http_code} --silent --connect-timeout ${timeout} \
                  --no-keepalive ${curlops} --output /dev/null  ${url})`

  #      __________ get the STATUS (from code) which is human interpretable:
  case $code in
       000) status="Not responding within ${timeout} seconds" ;;
       100) status="Informational: Continue" ;;
       101) status="Informational: Switching Protocols" ;;
       200) status="Successful: OK within ${timeout} seconds" ;;
       201) status="Successful: Created" ;;
       202) status="Successful: Accepted" ;;
       203) status="Successful: Non-Authoritative Information" ;;
       204) status="Successful: No Content" ;;
       205) status="Successful: Reset Content" ;;
       206) status="Successful: Partial Content" ;;
       300) status="Redirection: Multiple Choices" ;;
       301) status="Redirection: Moved Permanently" ;;
       302) status="Redirection: Found residing temporarily under different URI" ;;
       303) status="Redirection: See Other" ;;
       304) status="Redirection: Not Modified" ;;
       305) status="Redirection: Use Proxy" ;;
       306) status="Redirection: status not defined" ;;
       307) status="Redirection: Temporary Redirect" ;;
       400) status="Client Error: Bad Request" ;;
       401) status="Client Error: Unauthorized" ;;
       402) status="Client Error: Payment Required" ;;
       403) status="Client Error: Forbidden" ;;
       404) status="Client Error: Not Found" ;;
       405) status="Client Error: Method Not Allowed" ;;
       406) status="Client Error: Not Acceptable" ;;
       407) status="Client Error: Proxy Authentication Required" ;;
       408) status="Client Error: Request Timeout within ${timeout} seconds" ;;
       409) status="Client Error: Conflict" ;;
       410) status="Client Error: Gone" ;;
       411) status="Client Error: Length Required" ;;
       412) status="Client Error: Precondition Failed" ;;
       413) status="Client Error: Request Entity Too Large" ;;
       414) status="Client Error: Request-URI Too Long" ;;
       415) status="Client Error: Unsupported Media Type" ;;
       416) status="Client Error: Requested Range Not Satisfiable" ;;
       417) status="Client Error: Expectation Failed" ;;
       500) status="Server Error: Internal Server Error" ;;
       501) status="Server Error: Not Implemented" ;;
       502) status="Server Error: Bad Gateway" ;;
       503) status="Server Error: Service Unavailable" ;;
       504) status="Server Error: Gateway Timeout within ${timeout} seconds" ;;
       505) status="Server Error: HTTP Version Not Supported" ;;
       *)   echo " !!  httpstatus: status not defined." && safeExit ;;
  esac


  # _______________ MAIN
  case ${flag} in
       --status) echo "${code} ${status}" ;;
       -s)       echo "${code} ${status}" ;;
       --code)   echo "${code}"         ;;
       -c)       echo "${code}"         ;;
       *)        echo " !!  httpstatus: bad flag" && safeExit;;
  esac

  IFS="${saveIFS}"
}

# -----------------------------------------------------------------------------------------
function makeCSV() {
  # Creates a new CSV file if one does not already exist.
  # Takes passed arguments and writes them as a header line to the CSV
  # Usage 'makeCSV column1 column2 column3'

  # Set the location and name of the CSV File
  if [ -z "${csvLocation}" ]; then
    csvLocation="${HOME}/Desktop"
  fi
  if [ -z "${csvName}" ]; then
    csvName="$(LC_ALL=C date +%Y-%m-%d)-${FUNCNAME[1]}.csv"
  fi
  csvFile="${csvLocation}/${csvName}"

  # Overwrite existing file? If not overwritten, new content is added
  # to the bottom of the existing file
  if [ -f "${csvFile}" ]; then
    seek_confirmation "${csvFile} already exists. Overwrite?"
    if is_confirmed; then
      rm "${csvFile}"
      writeCSV "$@"
    fi
  fi
}

# -----------------------------------------------------------------------------------------
function writeCSV() {
  # Takes passed arguments and writes them as a comma separated line
  # Usage 'writeCSV column1 column2 column3'

  csvInput=($@)
  saveIFS=$IFS
  IFS=','
  echo "${csvInput[*]}" >> "${csvFile}"
  IFS=$saveIFS

}

# -----------------------------------------------------------------------------------------
function json2yaml() {
  # convert json files to yaml using python and PyYAML
  python -c 'import sys, yaml, json; yaml.safe_dump(json.load(sys.stdin), sys.stdout, default_flow_style=False)' < "$1"
}

# -----------------------------------------------------------------------------------------
function yaml2json() {
  # convert yaml files to json using python and PyYAML
  python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)' < "$1"
}
