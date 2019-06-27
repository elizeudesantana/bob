#!/bin/bash
############################################################################################
#
#   Bob utilities script bash 
#
version="2019.01";               									# Versão do Programa
#
scriptFileVersion="1.0.0"; 											# Versão do script
#
# History:
# 	0.0.1  script version inicial, [tela 1], configura screen e supre dependêncas.
# 	0.0.2  Dependência de fonts
#	0.0.5  Color Scheme Gnome Terminal- fundamentado no gogh
#   0.0.6  Screen e glypcons
#   0.0.7  Teermino
#   0.0.8  Integridade
#   2019.01  Dividido em diretorios criação de route e tipando de forma MVC (23/06/2019)
#
# Dependências:
#	function Dependencias()
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
if [ $scriptPath != $scriptPath_Bob ] ; then
    utilsLocation="${scriptPath_Bob}/lib/bob_util.sh";               # Diretorio de localização bob_util.sh
else
    utilsLocation="${scriptPath}/lib/bob_util.sh"; 
fi
if [ -f "${utilsLocation}" ]; then
	source "${utilsLocation}";
else
    echo "Por favor procure bob_util.sh e adicione referência a este script. Saindo.";
    exit 1;
fi

# setpoint ------------------------------------------------------------------------------
fonts_bob=( "FontFiraCode" "PowerlineSymbols" "NerdFonts" "NotoEmoji")
deps=( "aptitude" "byobu" "nmcli" "grep" "awk" "figlet" "tput" "htop" "irssi" "neofetch" )

quiet=false; printLog=false; verbose=false; force=false; strict=false; debug=false; args=() # Set Flags

# Set Temp Directorio
# ----------------------------------------------------------------------------------------
# Criando temp directorio com três números rândomicos process ID
# Este directorio é removido automaticamente ao sair.
# ----------------------------------------------------------------------------------------
tmpDir="/tmp/${scriptName}.$RANDOM.$RANDOM.$RANDOM.$$"
(umask 077 && mkdir "${tmpDir}") || {
  die "Não foi possivel criar arquivo no diretorio! Saindo."
}

# Logging
# ----------------------------------------------------------------------------------------
# Log is only used when the '-l' flag is set.
# Save to Desktop use: $HOME/Desktop/${scriptBasename}.log
# Save to standard user log location use: $HOME/Library/Logs/${scriptBasename}.log
# ----------------------------------------------------------------------------------------
logFile="${enderecoRelativo_doc}/${scriptBasename}.log"

# ----------------------------------------------------------------------------------------
# Print usage  - REVISAR
# # ----------------------------------------------------------------------------------------
# usage() {
#   echo -n "${scriptName} [OPTION]... [FILE]...

# This is a script template.  Edit this description to print help to users.

#  ${bold}Options:${reset}
#   -c, --clima       Clima tempo digite a cidade ./bob_i -c 'guaratiba'
#   -p, --password    User password
#   --force           Skip all user interaction.  Implied 'Yes' to all actions.
#   -q, --quiet       Quiet (no output)
#   -l, --log         Print log to file
#   -s, --strict      Exit script with null variables.  i.e 'set -o nounset'
#   -v, --verbose     Output more information. (Items echoed to 'verbose')
#   -d, --debug       Runs script in BASH debug mode #(set -x)
#   -h, --help        Display this help and exit
#   --version         Output version information and exit
# "
# }

# Dependencias Function
# ----------------------------------------------------------------------------------------
# Instala dependencias necessarias, para o software rodar. 
# ----------------------------------------------------------------------------------------
function Dependencias() {
	Titulo_Inicial; printf "\n\n\n\n"
	
	e_arrow "Iniciando configuração dependências. $(e_success)"
	for i in ${deps[@]}; do
		if [[ ! $(which $i 2>/dev/null) ]]; then
			seek_confirmation "${USER}, existe a seguinte dependência  ${i}, permite a manutenção do sistema ?" 
			if is_confirmed; then
				e_arrow -d "Instalando : $i."
            	if [ ${i} = "aptitude" ] ; then
            		sudo apt install ${i}
            	else
            		sudo aptitude install ${i}
            	fi
			else
			   	e_error "Sem a manutenção do sistema, não é possível a execução ${lgt}, supra as dependências e execute novamente."
			   	Sair
			fi
		fi
		e_arrow -d "Configuração dependência ${i} terminada. $(e_success)"
	done; sleep 1
}


# Dependencias_fonts
# ----------------------------------------------------------------------------------------
# Verifica  Integridade dos arquivos que compõe o sistema 
# by: Elizeu de Santana / 17-06-2019 
# ----------------------------------------------------------------------------------------
function Dependencias_fonts(){
	Titulo_Inicial; printf "\n\n\n\n"; source "${shellfontsLocation}";
	
	e_arrow "Iniciando configuração de fonts. $(e_success)"
	for i in ${fonts_bob[@]}; do
		e_arrow -d "Configurando font ${i}. $(e_success)"
		if [ "${i}" = "FontFiraCode" ]; then
			FontFiraCode
		elif [ "${i}" = "PowerlineSymbols" ]; then
			InstalarFontsPowerline
		elif [ "${i}" = "NerdFonts" ]; then
			InstalarNerdFonts
		elif [ "${i}" = "NotoEmoji" ]; then
			InstalargoogleNotoEmoji
		fi
		e_arrow -d "Configuração da font ${i} terminada. $(e_success)"
	done
	fc-cache -vf "${fontsLocation}"; 
	sleep 1
}


#
# ----------------------------------------------------------------------------------------
# Verifica  Integridade dos arquivos que compõe o sistema 
# by: Elizeu de Santana / 17-06-2019
# ----------------------------------------------------------------------------------------
function Integridade(){	
	Titulo_Inicial; printf "\n\n\n\n"
	int_x=( "${bobLocation}" "${pythonLocation}" "${instalacaoLocation}" "${shellfontsLocation}" "${programasLocation}" \
		"${servidorLocation}" "${errosLocation}" "${textoLocation}" "${chtLocation}" "${financeiroLocation}" \
		"${financeiroBDLocation}" "${bancodadosLocation}" "${manutencaoLocation}"	"${utilsLocation}" \
		"${zzfuncaoLocation}" )
	local contagem=0; 	e_arrow "Iniciando configuração Integridade. $(e_success)"
	for i in ${int_x[@]}; do
		if [ -f "${i}" ]; then
			let $((contagem=contagem+1))
		else
			e_error "Integridade comprometida !!! Arquivo ${i} ausente."; read
			Sair
		fi
		e_arrow -d "Configuração Integridade ${i} terminada. $(e_success)"
	done; sleep 1
}



#
# ----------------------------------------------------------------------------------------
# by: Elizeu de Santana / 17-06-2019 
# ----------------------------------------------------------------------------------------
function ColorSchemeGnomeTerminal(){
	#https://github.com/Mayccoll/Gogh
	Titulo_Inicial; printf "\n\n\n\n"
	seek_confirmation "Iniciando Configuração screen, gostaria de trocar o Color Scheme Gnome Terminal ?"
	if is_confirmed; then
		if [[ ! $(which gogh 2>/dev/null) ]]; then
			sudo wget -O /usr/local/bin/gogh https://git.io/vQgMr && sudo chmod +x /usr/local/bin/gogh
			#bash -c  "$(wget -qO- https://git.io/vQgMr)"
			gogh
			e_arrow "Configuração screen style terminal pronta, click esquerdo / perfil escolha. $(e_success)"
		fi
	else
		e_arrow "Configuração screen style terminal pronta. $(e_success)"
	fi
}


#
# mainScript
# ----------------------------------------------------------------------------------------
# by: Elizeu de Santana / 16-06-2019 
# ----------------------------------------------------------------------------------------
function mainScript(){
	### Função Principal, inicio do software. versao 2019.01 ###
	ClimaTempo; Integridade; Dependencias_fonts; Dependencias; ColorSchemeGnomeTerminal;
	Titulo_Inicial; printf "\n\n\n\n"; neofetch
	e_arrow "Configuração inicial terminada. $(e_success)"
	seek_confirmation "Iniciando Configuração screen, gostaria de monitorar o sistema ?"
	if is_confirmed; then
		if [ -z "$(byobu list-sessions | grep bob)" ] ; then
		    byobu-tmux new-session -d -t bob 
		    byobu-tmux rename-window bob 
		   	byobu-tmux send-keys -t 0 '${bobLocation}' 'C-m'
		    byobu split-window -h
		    byobu-tmux send-keys -t 1 'htop' 'C-m'
		fi
		e_arrow "Configuração screen monitoração terminada. $(e_success)"
		seek_confirmation "Iniciando Configuração screen, gostaria de conversar (baixar mp3, livros, etc.) ?"
		if is_confirmed; then
		    byobu split-window -v
		    byobu-tmux send-keys -t 2 'irssi' 'C-m'
		fi
		byobu-tmux attach -t bob
	else
		e_arrow "Configuração screen monitoração terminada. $(e_success)"
		seek_confirmation "Iniciando Configuração screen, gostaria de conversar (baixar mp3, livros, etc.) ?"
		if is_confirmed; then
			if [ -z "$(byobu list-sessions | grep bob)" ] ; then
			    byobu-tmux new-session -d -t bob 
			    byobu-tmux rename-window bob 
			   	byobu-tmux send-keys -t 0 '${bobLocation}' 'C-m'
			    byobu split-window -v
			    byobu-tmux send-keys -t 1 'irssi' 'C-m'
			fi
			byobu-tmux attach -t bob
		else
			e_arrow "Configuração screen conversa terminada. $(e_success)"
		fi
	fi
	e_arrow "Configuração screen terminada. $(e_success)"
	seek_confirmation "gostaria de iniciar o bob ?"
	if is_confirmed; then
		source "${bobLocation}"; #Principal;
	else 
	   	e_error "${lgt}, obrigado pela preferência."
	   	Sair
	fi
	Sair
}

### DEBUG #################################################################################
# -----------------------------------------------------------------------------------------
function debugPath(){               	### PATH ###
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
}

function deb(){
    echo -e "\nDebug Path pespectiva bob_i:"; debugPath; 
    echo -e "\nDebug Path pespectiva bob_util:"; debugPath_bob_util;
}
### END DEBUG #############################################################################
mainScript
# Iterate over options breaking -ab into -a -b when needed and --foo=bar into
# --foo bar
# optstring=h
# unset options
# while (($#)); do
#   	case $1 in
#     	# If option is of type -ab
#     	-[!-]?*)
#       		# Loop over each character starting with the second
#       		for ((i=1; i < ${#1}; i++)); do
# 	        	c=${1:i:1}

# 	        	# Add current char to options
# 	        	options+=("-$c")

# 	        	# If option takes a required argument, and it's not the last char make
# 	        	# the rest of the string its argument
# 	        	if [[ $optstring = *"$c:"* && ${1:i+1} ]]; then
# 	          		options+=("${1:i+1}")
# 	          		break
# 	        	fi
#       		done
#       	;;

#     	# If option is of type --foo=bar
#     	--?*=*) options+=("${1%%=*}" "${1#*=}") ;;
#     	# add --endopts for --
#     	--) options+=(--endopts) ;;
#     	# Otherwise, nothing special
#     	*) options+=("$1") ;;
#   	esac
#   	shift
# done
# set -- "${options[@]}"
# unset options

# Print help if no arguments were passed.
# Uncomment to force arguments when invoking the script
# [[ $# -eq 0 ]] && set -- "--help"

# # Read the options and set stuff
# while [[ $1 = -?* ]]; do
#   	case $1 in
# 	    -h|--help) usage >&2; safeExit ;;
# 	    --version) echo "$(basename $0) ${version}"; safeExit ;;
# 	    -c|--clima) shift; 
# 			if [ "${1}" = "-d" ] ; then
# 				ClimaTempo -d ${2}; mainScript 
# 			else
# 				ClimaTempo -c ${2}; mainScript 
# 			fi ;;
# 	    #-p|--password) shift; echo "Enter Pass: "; stty -echo; read PASS; stty echo;
# 	    #  echo ;;
# 	    -v|--verbose) verbose=true ;;
# 	    -l|--log) printLog=true ;;
# 	    -q|--quiet) quiet=true ;;
# 	    -s|--strict) strict=true;;
# 	    -d|--debug) deb; mainScript ;;
# 	    --force) force=true ;;
# 	    --endopts) shift; break ;;
# 	    *) die "invalida optção: '$1'." ;;
#   	esac
#   	shift
# done


#args+=("$@")  							# Store the remaining part as arguments.
#trap trapCleanup EXIT INT TERM 			# Trap bad exits with your cleanup function
#IFS=$'\n\t' 							# Set IFS to preferred implementation
#set -o errexit 							# Exit on error. Append '||true' when you run the script if you 
#if ${strict}; then set -o nounset ; fi 	# Exit on empty variable

# Bash will remember & return the highest exitcode in a chain of pipes.
# This way you can catch the error in case mysqldump fails in `mysqldump |gzip`, for example.
#set -o pipefail


# Exit cleanlyd
#safeExit