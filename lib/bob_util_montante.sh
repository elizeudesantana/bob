#!/bin/bash
############################################################################################
#
# Bob utilities script bash 
#
#                                                                      The MIT License (MIT)
#                                                         Copyright (c) 2019 elizeudesantana
#
version="2019.01"             											                    # Versão do Programa
#
scriptFileVersion="1.0.0"                                                 # Versão do script
#
# History:
# 	0.0.1                                    script version inicial, estrutura de diretório.
#   2019.01      Dividido em diretórios criação de route e tipando de forma MVC (23/06/2019)
#
# Dependências:                                       Nome do arquivo: bob_util_montante.sh
#	function Dependencias()
#
# * Retorno: n/a
# * Data: n/a
#
# by: Elizeu de Santana -------------------------------------------------------------------

# ----------------------------------------------------------------------------------------
                                                             # (array contendo as funções)
# ----------------------------------------------------------------------------------------
array_bob_util_montante=( "Cht" "DiversasZZ" "Com" "Aquarium" );

# # ----------------------------------------------------------------------------------------
#                                                       # FIXME  (array contendo as funções)
# # ----------------------------------------------------------------------------------------
# function ticktick(){
#     ARGV=$@
#     GREP=grep
#     EGREP=egrep

#     # Support {{ 
#     # // The following code is to make sure
#     # // that this runs on various platforms as suggested.
#     # See https://github.com/kristopolous/TickTick/issues/26
#     if [ `uname` == "SunOS" ]; then
#         GREP=ggrep
#         EGREP=gegrep
#     fi
#     # }} End support

#     __tick_error() {
#         echo "TICKTICK PARSING ERROR: "$1
#     }

#     # This is from https://github.com/dominictarr/JSON.sh
#     # See LICENSE for more info. {{{
#     __tick_json_tokenize() {
#         local ESCAPE='(\\[^u[:cntrl:]]|\\u[0-9a-fA-F]{4})'
#         local CHAR='[^[:cntrl:]"\\]'
#         local STRING="\"$CHAR*($ESCAPE$CHAR*)*\""
#         local VARIABLE="\\\$[A-Za-z0-9_]*"
#         local NUMBER='-?(0|[1-9][0-9]*)([.][0-9]*)?([eE][+-]?[0-9]*)?'
#         local KEYWORD='null|false|true'
#         local SPACE='[[:space:]]+'
#         $EGREP -ao "$STRING|$VARIABLE|$NUMBER|$KEYWORD|$SPACE|." --color=never | $EGREP -v "^$SPACE$"  # eat whitespace
#     }

#     __tick_json_parse_array() {
#         local index=0
#         local ary=''

#         read -r Token

#         case "$Token" in
#             ']') ;;
#             *)
#                 while :
#                 do
#                     __tick_json_parse_value "$1" "`printf "%012d" $index`"

#                     (( index++ ))
#                     ary+="$Value" 

#                     read -r Token
#                     case "$Token" in
#                         ']') break ;;
#                         ',') ary+=_ ;;
#                         *) 
#                             __tick_error "Array syntax malformed"
#                             break ;;
#                     esac
#                     read -r Token
#                 done
#                 ;;
#         esac
#     }

#     __tick_json_parse_object() {
#       local key
#       local obj=''
#       read -r Token

#       case "$Token" in
#         '}') ;;
#         *)
#           while :
#           do
#             # The key, it should be valid
#             case "$Token" in
#               '"'*'"'|\$[A-Za-z0-9_]*) key=$Token ;;
#               # If we get here then we aren't on a valid key
#               *) 
#                 __tick_error "Object without a Key"
#                 break
#                 ;;
#             esac

#             # A colon
#             read -r Token

#             # The value
#             read -r Token
#             __tick_json_parse_value "$1" "$key"
#             obj+="$key:$Value"        

#             read -r Token
#             case "$Token" in
#               '}') break ;;
#               ',') obj+=_ ;;
#             esac
#             read -r Token
#           done
#         ;;
#       esac
#     }

#     __tick_json_sanitize_value() {
#       value=""
#       IFS=
#       while read -r -n 1 token; do
#         case "$token" in
#           [\-\\\"\;,=\(\)\[\]{}.\':\ ]) 
#             value+=`printf "%d" \'$token` 
#             ;;
#           *)
#             value+="$token"
#             ;;
#         esac
#       done
#       echo $value
#     }

#     __tick_json_parse_value() {
#       local start=${1/%\"/}
#       local end=${2/#\"/}

#       local jpath="${start:+${start}_}$end"
#       local prej=${jpath/#\"/}
#       prej=${prej/%\"/}

#       prej="`echo $prej | __tick_json_sanitize_value`"
#       [ "$prej" ] && prej="_$prej"

#       case "$Token" in
#         '{') __tick_json_parse_object "$jpath" ;;
#         '[') __tick_json_parse_array  "$jpath" ;;

#         *) 
#           Value=$Token 
#           Path="$Prefix$prej"
#           Path=${Path/#_/}
#           echo __tick_data_${Path// /}=$Value 
#           ;;
#       esac
#     }

#     __tick_json_parse() {
#         read -r Token
#         __tick_json_parse_value
#         read -r Token
#     }
#     # }}} End of code from github

#     # Since the JSON parser is just json parser, and we have a runtime
#     # and assignments built on to this, along with javascript like referencing
#     # there is a two-pass system, just because it was easier to code.
#     #
#     # This one separates out the valid JSON from the runtime library support
#     # and little fo' language that this is coded in.
#     __tick_fun_tokenize_expression() {
#         CHAR='[0-9]*[A-Za-z_$][0-9]*'
#         FUNCTION="(push|pop|shift|items|delete|length)[[:space:]]*\("
#         NUMBER='[0-9]*'
#         STRING="$CHAR($CHAR)*"
#         PAREN="[()]"
#         QUOTE="[\"\'\\]"
#         SPACE='[[:space:]]+'
#         $EGREP -ao "$FUNCTION|$STRING|$QUOTE|$PAREN|$NUMBER|$SPACE|." --color=never |\
#           sed "s/^/S/g;s/$/E/g" # Make sure spaces are respected
#     }

#     __tick_fun_parse_expression() {
      
#       quoteToken=""
#       backslash=0

#       while read -r token; do
#         token=${token/#S/}
#         token=${token/%E/}

#         if [ $done ]; then
#           suffix+="$token"
#         else
#           if [ -z $quoteToken ]; then
#             case "$token" in
#               #
#               # The ( makes sure that you can do key.push = 1, not that you would, but
#               # avoiding having reserved words lowers the barrier to entry.  Try doing
#               # say function debugger() {} in javascript and then run it in firefox. That's
#               # a fun one.
#               #
#               # So, it's probably better to be as lenient as possible when dealing with
#               # syntax like this.
#               #
#               'push('|'pop('|'shift('|'items('|'delete('|'length(') function=$token ;;
#               ')') 
#                 function=${function/%(/}

#                 # For a rational of the method below see: 
#                 # https://github.com/kristopolous/TickTick/wiki/Function-Logic
#                 case $function in
#                   items) echo '${!__tick_data_'"$Prefix"'*}' ;;
#                   delete) echo 'unset __tick_data_'${Prefix/%_/} ;;
#                   pop) echo '"$( __tick_runtime_last ${!__tick_data_'"$Prefix"'*} )"; __tick_runtime_pop ${!__tick_data_'"$Prefix"'*}' ;;
#                   shift) echo '`__tick_runtime_first ${!__tick_data_'"$Prefix"'*}`; __tick_runtime_shift ${!__tick_data_'"$Prefix"'*}' ;;
#                   length) echo '`__tick_runtime_length ${!__tick_data_'"$Prefix"'*}`' ;;
#                   *) echo "__tick_runtime_$function \"$arguments\" __tick_data_$Prefix "'${!__tick_data_'"$Prefix"'*}'
#                 esac
#                 unset function

#                 return
#                 ;;

#               [0-9]*[A-Za-z]*[0-9]*) [ -n "$function" ] && arguments+="$token" || Prefix+="$token" ;;
#               [0-9]*) Prefix+=`printf "%012d" $token` ;;
#               '['|.) Prefix+=_ ;;

#               [\"\'])
#                 quoteToken=$token
#                 ;;
                
#               [\[\]]) ;;
#               =) done=1 ;;
#               # Only respect a space if its in the args.
#               ' ') [ -n "$function" ] && arguments+="$token" ;;
#               *) [ -n "$function" ] && arguments+="$token" || Prefix+="$token" ;;
#             esac
#           else
#             case "$token" in
#               \\)
#                 if (( backslash < 0 )); then
#                   backslash=2 
#                 fi
#                 # The other tokenizer preserves the backslashes, so we will too. 
#                 Prefix+="$token" 
#                 ;;

#               $quoteToken)
#                 if (( backslash < 0 )); then
#                   quoteToken=""
#                 else
#                   Prefix+="$token" 
#                 fi
#                 ;;
#               *) Prefix+="$token" ;;
#             esac
#             (( backslash -- ))
#           fi
#         fi
#       done

#       if [ "$suffix" ]; then
#         echo "$suffix" | __tick_json_tokenize | __tick_json_parse
#       else
#         Prefix="`echo $Prefix | __tick_json_sanitize_value`"
#         echo '${__tick_data_'$Prefix'}'
#       fi
#     }

#     __tick_fun_parse_tickcount_reset() {
#       # If the tick count is 1 then the backtick we encountered was a 
#       # shell code escape. These ticks need to be preserved for the script.
#       if (( ticks == 1 )); then
#         code+='`'
#       fi

#       # This resets the backtick counter so that `some shell code` doesn't
#       # trip up the tokenizer
#       ticks=0
#     }

#     # The purpose of this function is to separate out the Bash code from the
#     # special "tick tick" code.  We do this by hijacking the IFS and reading
#     # in a single character at a time
#     __tick_fun_parse() {
#       IFS=

#       # code oscillates between being bash or tick tick blocks.
#       code=''

#       # By using -n, we are given that a newline will be an empty token. We
#       # can certainly test for that.
#       while read -r -n 1 token; do
#         case "$token" in
#           '`') 

#             # To make sure that we find two sequential backticks, we reset the counter
#             # if it's not a backtick.
#             if (( ++ticks == 2 )); then

#               # Whether we are in the stanza or not is controlled by a different
#               # variable
#               if (( tickFlag == 1 )); then
#                 tickFlag=0
#                 [ "$code" ] && echo -n "`echo $code | __tick_fun_tokenize_expression | __tick_fun_parse_expression`"
#               else
#                 tickFlag=1
#                 echo -n "$code"
#               fi

#               # If we have gotten this deep, then we are toggling between backtick
#               # and bash. So se should unset the code.
#               unset code
#             fi
#             ;;

#           '') 
#             __tick_fun_parse_tickcount_reset

#             # this is a newline. If we are in ticktick, then we want to consume
#             # them for the parser later on. If we are in bash, then we want to
#             # preserve them.  We do this by emitting our buffer and then clearing
#             # it
#             if (( tickFlag == 0 )); then
#               echo "$code"
#               unset code
#             fi

#             ;;

#           *) 
#             __tick_fun_parse_tickcount_reset
            
#             # This is a buffer of the current code, either bash or backtick
#             code+="$token"
#             ;;
#         esac 
#       done
#     }

#     # The code tokenization and interpretation of bash code.  This
#     # can be passed a path to be interpreted or, if that is not passed
#     # it figures out the caller and just does the same thing
#     #
#     # If two arguments are called, then the second acts as a signal to
#     # print the tokenized ticktick code and exit.
#     #
#     # This means in a language with declared arguments the signature
#     # would look like this:
#     #
#     #   __tick_fun_tokenize(path_name, set_to_return_and_not_execute) {
#     #
#     __tick_fun_tokenize() {
#       [ $# -eq "0" ] && __tick_fun_tokenize "$(caller 1 | cut -d ' ' -f 3)"
#       local fname="$1"

#       # This makes sure that when we rerun the code that we are
#       # interpreting, we don't try to interpret it again.
#       export __tick_var_tokenized=1

#       # Using bash's caller function, which is for debugging, we
#       # can find out the name of the program that called us. We 
#       # then cat the calling program and push it through our parser
#       local code=$(cat $fname | __tick_fun_parse)

#       # Before the execution we search to see if we emitted any parsing errors
#       hasError=`echo "$code" | $GREP "TICKTICK PARSING ERROR" | wc -l`

#       if [ "$__tick_var_debug" -o $# -eq 2 ]; then
#         printf "%s\n" "$code"
#         exit 0
#       fi

#       # If there are no errors, then we go ahead
#       if (( hasError == 0 )); then
#         # Take the output and then execute it

#         bash -c "$code" -- $ARGV
#       else
#         echo "Parsing Error Detected, see below"

#         # printf observes the new lines
#         printf "%s\n" "$code"
#         echo "Parsing stopped here."
#       fi

#       exit
#     }

#     ## Runtime {
#     if [ $__tick_var_tokenized ]; then 
#         enable -n source
#         enable -n .
#         source() {
#             source_temp_path=`mktemp`
#             ( __tick_fun_tokenize "$1" "debug" ) > $source_temp_path

#             enable source
#             builtin source "$source_temp_path"
#             enable -n source

#             unlink $source_temp_path
#         }
#         .() {
#             source "$1"
#         }

#         __tick_runtime_length() { echo $#; }
#         __tick_runtime_first() { echo ${!1}; }
#         __tick_runtime_last() { eval 'echo $'${!#}; }
#         __tick_runtime_pop() { eval unset ${!#}; }

#         __tick_runtime_shift() {
#             local left=
#             local right=

#             for (( i = 1; i <= $# + 1; i++ )) ; do
#                 if [ "$left" ]; then
#                   eval "$left=\$$right"
#                 fi
#                 left=$right
#                 right=${!i}
#             done
#             eval unset $left
#         }
#         __tick_runtime_push() {
#             local value="${1/\'/\\\'}"
#             local base=$2
#             local lastarg=${!#}

#             let nextval=${lastarg/$base/}+1
#             nextval=`printf "%012d" $nextval`

#             eval $base$nextval=\'$value\'
#         }

#         tickParse() {
#             eval `echo "$1" | __tick_json_tokenize | __tick_json_parse | tr '\n' ';'`
#         }

#         tickVars() {
#             echo "@ Line `caller | sed s/\ NULL//`:"
#             set | grep ^__tick_data | sed s/__tick_data_/"  "/
#             echo
#         }
#       else 
#           __tick_fun_tokenize
#       fi
# }
# ----------------------------------------------------------------------------------------
                                                                          # ( função Cht )
# ----------------------------------------------------------------------------------------
function Cht(){
    Titulo_Inicial
    echo -ne "Como : " ; read p
    while true ; do
        where="${p}"; shift
        IFS=+ curl "https://cht.sh/$where/ $*"
        echo -e "\n ----------------------------------------------------------------------"
        unset p; echo -ne "Digite uma nova consulta (enter menu) ou (s)air : " ; read p
        if [ "${p}" = "s" ] ; then
            break
        fi
    done
    Principal
}
# -----------------------------------------------------------------------------------------    
                                                                          # ( Constantes )
# -----------------------------------------------------------------------------------------
#
# ----------------------------------------------------------------------------------------
# Cht(){
#     Titulo_Inicial
#     #source ${chtLocation} --help
#     e_arrow "Para voltar ao menu principal (s)!"
#     e_arrow -l "Ou digite o comando qq lang (ex. python file):"; read fResp
#     case $fResp in
#         s)
#             Principal;;
#         *)
#             Titulo_Inicial
#             source ${chtLocation} ${fResp}
#             e_arrow -l "Digite o comando (ex. python file): "; read fResp
#             while true; do
#                 Titulo_Inicial
#                 source ${chtLocation} ${fResp}
#                 e_arrow -l "Digite o comando (ex. python file) ou (s): "; read fResp
#                 if  [ "$fResp" == "s" ] ; then
#                     Principal
#                 fi
#             done
#             ;;
#     esac
# }
# by: Elizeu de Santana / 31-05-2019 -------------------------------------------------------
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
    Titulo_Inicial
    source ${zzfuncaoLocation} zzzz
    echo -e "${ctr} Para descrição detalhada de todas as fuções (t), para voltar ao menu principal (s). ${dlc}"
    echo -ne "${ctr} Ou digite o nome da função: ${dlc}"; read zzfResp
    case $zzfResp in
        t)
            Titulo_Inicial
            source ${zzfuncaoLocation} zzajuda --lista
            echo -ne "${ctr} Digite (s) para sair ou nome da funcão : ${dlc}"; read aFunc
            if  [ "$aFunc" == "s" ] ; then
                Principal
            else
                Titulo_Inicial
                source ${zzfuncaoLocation} ${aFunc} -h
                echo -ne "${ctr} Digite os argumentos para a função zz${aFunc}: ${dlc}"; read argFesc
                
                while true; do
                    echo -ne "${ctr} Aguarde ... ${dlc}";
                    Titulo_Inicial
                    source ${zzfuncaoLocation} ${aFunc} ${argFesc}
                    source ${zzfuncaoLocation} ${aFunc} -h            
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
            Titulo_Inicial
            source ${zzfuncaoLocation} ${zzfResp} -h
            echo -ne "${ctr} Digite os argumentos para a função zz${zzfResp}: ${dlc}"; read argFesc
            
            while true; do
                echo -ne "${ctr} Aguarde ... ${dlc}";
                Titulo_Inicial
                source ${zzfuncaoLocation} ${zzfResp} $argFesc
                source ${zzfuncaoLocation} ${zzfResp} -h            
                echo -ne "${ctr} Digite (s) para sair ou novos argumentos para a função zz${zzfResp}: ${dlc}"; read argFesc
                       
                if  [ "$argFesc" == "s" ] ; then
                    Principal
                fi
            done
            ;;
    esac
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
#------------------------------------------------------

# Non destructive exit for when script exits naturally.
# Usage: Add this function at the end of every script
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
# ----------------------------------------------------------------------------------------
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
