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
# * Funções escritas neste script:
# "tituloAscii"
# "e_header"   
# "e_arrow"    
# "e_success"  
# "e_error"    
# "e_warning"  
# "e_underline"
# "e_bold"     
# "e_note"     
# "seek_confirmation"
# "seek_confirmation_head"  
# "is_confirmed"            
# "_alert"                  
# "die"                     
# "error"                   
# "warning"                 
# "notice"                  
# "info"                    
# "debug"                   
# "success"
# "input"
# "header"
# "verbose"
# "fromhex"
# "tohex"
# "CorRGB" 
# by: Elizeu de Santana -------------------------------------------------------------------

# Antes de config 24/06/2019, implemntar o arquivo config que mudara esta configuração
# Constantes ------------------------------------------------------------------------------
function All_cores_tput(){	
	for c in {0..255}; do 
		tput setaf $c; 
		tput setaf $c | cat -v; 
		echo =$c; 
	done 
	read  
}
bold=$(tput bold); 
underline=$(tput sgr 0 1); 
reset=$(tput sgr0);
purple=$(tput setaf 171); 
red=$(tput setaf 1); 
green=$(tput setaf 76);
tan=$(tput setaf 3); 
blue=$(tput setaf 38);

# -----------------------------------------------------------------------------------------
function tituloAscii() {
	printf "${bold}${blue} %s${reset}\n" "$@"
}

# -----------------------------------------------------------------------------------------
# Função titulo_menu
# -----------------------------------------------------------------------------------------
# retorna o comprimento, conforme horas do dia.
# 0="Bom dia"              
# 1="Boa tarde"
# 2="Boa noite"
# -----------------------------------------------------------------------------------------
function titulo_menu() {  # sai de 24 para 12 - chaman do no ponteiro., ou seja, memoria
	if (("$hourstamp" >= "06")) && (("$hourstamp" < "13")) ; then
		if (("$hourstamp" >= "06")) && (("$hourstamp" < "07")) ; then
			r=""
		elif (("$hourstamp" >= "07")) && (("$hourstamp" < "08")) ; then
			r=""
		elif (("$hourstamp" >= "08")) && (("$hourstamp" < "09")) ; then
			r=""
		elif (("$hourstamp" >= "09")) && (("$hourstamp" < "10")) ; then
			r=""
		elif (("$hourstamp" >= "10")) && (("$hourstamp" < "11")) ; then
			r=""
		elif (("$hourstamp" >= "11")) && (("$hourstamp" < "12")) ; then
			r=""
		#elif (("$hourstamp" >= "12")) && (("$hourstamp" < "13")) ; then
		#	r=""			
		fi
        hi="${r}: Bom dia, "
    elif (("$hourstamp" >= "13")) && (("$hourstamp" < "18")) ; then
		if (("$hourstamp" >= "13")) && (("$hourstamp" < "14")) ; then
			r=""
		elif (("$hourstamp" >= "14")) && (("$hourstamp" < "15")) ; then
			r=""
		elif (("$hourstamp" >= "15")) && (("$hourstamp" < "16")) ; then
			r=""
		elif (("$hourstamp" >= "16")) && (("$hourstamp" < "17")) ; then
			r=""
		elif (("$hourstamp" >= "17")) && (("$hourstamp" < "18")) ; then
			r=""
		elif (("$hourstamp" >= "18")) && (("$hourstamp" < "19")) ; then
			r=""
		fi    	
        hi="${r}: Bom tarde, "      
    else
		if (("$hourstamp" >= "19")) && (("$hourstamp" < "20")) ; then
			r=""
		elif (("$hourstamp" >= "20")) && (("$hourstamp" < "21")) ; then
			r=""
		elif (("$hourstamp" >= "21")) && (("$hourstamp" < "22")) ; then
			r=""
		elif (("$hourstamp" >= "22")) && (("$hourstamp" < "23")) ; then
			r=""
		elif (("$hourstamp" >= "23")) && (("$hourstamp" < "24")) ; then
			r=""
		elif (("$hourstamp" >= "24")) && (("$hourstamp" < "01")) ; then
			r=""    	
		elif (("$hourstamp" >= "01")) && (("$hourstamp" < "02")) ; then
			r=""
		elif (("$hourstamp" >= "02")) && (("$hourstamp" < "03")) ; then
			r=""
		elif (("$hourstamp" >= "03")) && (("$hourstamp" < "04")) ; then
			r=""
		elif (("$hourstamp" >= "04")) && (("$hourstamp" < "05")) ; then
			r=""
		elif (("$hourstamp" >= "05")) && (("$hourstamp" < "06")) ; then
			r=""
		fi
		hi="${r}: Bom noite, "
    fi
	printf "⏻ ${bold}${purple}${hi}%1${reset}\n" "$@"
}
# -----------------------------------------------------------------------------------------
function e_header() {
	printf "⏻ ${bold}${purple}%s${reset}\n" "$@"
}

# -----------------------------------------------------------------------------------------
function e_arrow() { 
	if [ "${1}" = "-d" ] ; then
		printf " ${2}\n"
	elif [ "$1" = "-l" ] ; then
		printf " ${2}"
	else
		printf "${green}➜${reset} $1\n"	
	fi
}

# -----------------------------------------------------------------------------------------
function e_success() { 
	printf "${green}✔ %s${reset}\n" "$@" 
}

# -----------------------------------------------------------------------------------------
function e_error() { 
	printf "${red}✖ %s${reset}\n" "$@" 
}

# -----------------------------------------------------------------------------------------
function e_warning() { 
	printf "${tan}➜ %s${reset}\n" "$@"
}

# -----------------------------------------------------------------------------------------
function e_underline() { 
	printf "${underline}${bold}%s${reset}\n" "$@"
}

# -----------------------------------------------------------------------------------------
function e_bold() { 
	printf "${bold}%s${reset}\n" "$@"
}

# -----------------------------------------------------------------------------------------
function e_note() { 
	if [ "$1" = "-c" ] ; then
		printf "${blue}       $2${reset}\n" "$@"
	else
		printf "${underline}${bold}${blue}Note:${reset}  ${blue}%s${reset}\n" "$@"
	fi
}

# -----------------------------------------------------------------------------------------
function seek_confirmation() {
  	printf "${blue}➜ $@${reset}"; read -p " (s/n) " -n 1; printf "\n"
}

# -----------------------------------------------------------------------------------------
function seek_confirmation_head() {
  	printf "\n${underline}${bold}$@${reset}"; read -p "${underline}${bold} (s/n)${reset} " -n 1; printf "\n"
}

# -----------------------------------------------------------------------------------------
function is_confirmed() {
if [[ "$REPLY" =~ ^[Ss]$ ]]; then
 	return 0
fi
	return 1
}

# -----------------------------------------------------------------------------------------
function _alert() {
	if [ "${1}" = "emergency" ]; then
		local color="${bold}${red}"
	fi
	if [ "${1}" = "error" ]; then local color="${bold}${red}"; fi
	if [ "${1}" = "warning" ]; then local color="${red}"; fi
	if [ "${1}" = "success" ]; then local color="${green}"; fi
	if [ "${1}" = "debug" ]; then local color="${purple}"; fi
	if [ "${1}" = "header" ]; then local color="${bold}""${tan}"; fi
	if [ "${1}" = "input" ]; then local color="${bold}"; printLog="false"; fi
	if [ "${1}" = "info" ] || [ "${1}" = "notice" ]; then local color=""; fi
	# Don't use colors on pipes or non-recognized terminals
	if [[ "${TERM}" != "xterm"* ]] || [ -t 1 ]; then color=""; reset=""; fi

	# Print to $logFile
	if [[ ${printLog} = "true" ]] || [ "${printLog}" == "1" ]; then
		echo -e "$(date +"%m-%d-%Y %r") $(printf "[%9s]" "${1}") ${_message}" >> "${logFile}";
	fi

	# Print to console when script is not 'quiet'
	if [[ "${quiet}" = "true" ]] || [ "${quiet}" == "1" ]; then
		return
	else
		echo -e "$(date +"%r") ${color}$(printf "[%9s]" "${1}") ${_message}${reset}";
	fi
}

# -----------------------------------------------------------------------------------------
function die ()       { local _message="${*} Exiting."; echo "$(_alert emergency)"; safeExit;}
function error ()     { local _message="${*}"; echo "$(_alert error)"; }
function warning ()   { local _message="${*}"; echo "$(_alert warning)"; }
function notice ()    { local _message="${*}"; echo "$(_alert notice)"; }
function info ()      { local _message="${*}"; echo "$(_alert info)"; }
function debug ()     { local _message="${*}"; echo "$(_alert debug)"; }
function success ()   { local _message="${*}"; echo "$(_alert success)"; }
function input()      { local _message="${*}"; echo -n "$(_alert input)"; }
function header()     { local _message="========== ${*} ==========  "; echo "$(_alert header)"; }

# Log messages when verbose is set to "true"
# -----------------------------------------------------------------------------------------
function verbose() {
  if [[ "${verbose}" = "true" ]] || [ "${verbose}" == "1" ]; then
    debug "$@"
  fi
}

# fromhex 00fc7b out 048
# -----------------------------------------------------------------------------------------
function fromhex(){ 
    hex=${1#"#"}
    r=$(printf '0x%0.2s' "$hex")
    g=$(printf '0x%0.2s' ${hex#??})
    b=$(printf '0x%0.2s' ${hex#????})
    printf '%03d' "$(( (r<75?0:(r-35)/40)*6*6 + 
                       (g<75?0:(g-35)/40)*6   +
                       (b<75?0:(b-35)/40)     + 16 ))"
}

### input must be a number in range 0-255.
# -----------------------------------------------------------------------------------------
function tohex(){
    dec=$(($1%256))   
    if [ "$dec" -lt "16" ]; then
        bas=$(( dec%16 ))
        mul=128
        [ "$bas" -eq "7" ] && mul=192
        [ "$bas" -eq "8" ] && bas=7
        [ "$bas" -gt "8" ] && mul=255
        a="$((  (bas&1)    *mul ))"
        b="$(( ((bas&2)>>1)*mul ))" 
        c="$(( ((bas&4)>>2)*mul ))"
        printf 'dec= %3s basic= #%02x%02x%02x\n' "$dec" "$a" "$b" "$c"
    elif [ "$dec" -gt 15 ] && [ "$dec" -lt 232 ]; then
        b=$(( (dec-16)%6  )); b=$(( b==0?0: b*40 + 55 ))
        g=$(( (dec-16)/6%6)); g=$(( g==0?0: g*40 + 55 ))
        r=$(( (dec-16)/36 )); r=$(( r==0?0: r*40 + 55 ))
        printf 'dec= %3s color= #%02x%02x%02x\n' "$dec" "$r" "$g" "$b"
    else
        gray=$(( (dec-232)*10+8 ))
        printf 'dec= %3s  gray= #%02x%02x%02x\n' "$dec" "$gray" "$gray" "$gray"
    fi
}

# -----------------------------------------------------------------------------------------
function CorRGB(){
	for i in $(seq 0 255); do
	    tohex ${i}
	done
}
