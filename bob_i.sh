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
# 	1.0.0    script version inicial, [tela 1], configura screen e supre dependêncas.
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
instalacao="/projetos/bob";                                    # Instalação apartir de HOME
scriptPath_Home="${HOME}";                                             # Diretorio HOME (~)
scriptPath_Bob="${scriptPath_Home}${instalacao}";                       # Instalação do Bob
scriptPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";      # Instalação do script 
# -----------------------------------------------------------------------------------------
if [ $scriptPath != $scriptPath_Bob ] ; then
    utilsLocation="${scriptPath_Bob}/lib/bob_util.sh";  		
else
    utilsLocation="${scriptPath}/lib/bob_util.sh"; 
fi
# -----------------------------------------------------------------------------------------
if [ -f "${utilsLocation}" ]; then
    source "${utilsLocation}"; Location; source "${coresLocation}";
else
    e_error "Erro carregando ${utilsLocation}";
fi
# -----------------------------------------------------------------------------------------
declare dp;		  															     # dependências
readonly -A _bob_=(															   # informação
	[name]='Bob' 
	[keywords]='Shell Script Complet'
	[description]='Pau para toda obra!.'
	[version]='2019.01'
	[language]='shellscript'
	[shell]=${SHELL}
	[shell_version]=${BASH_VERSION}
	[author]='Elizeu de Santana'
	[email]='elizeudesantana@hotmail.com'
	[wiki]='https://github.com/bob/wiki'
	[github]='https://github.com/bob'
	[packages]='curl 7.0, getopt 2.0, jq 1.5, byobu, figlet, aptitude, neofetch, tput, htop,
		irssi'
)
# -----------------------------------------------------------------------------------------
fonts_bob=( "FontFiraCode" "PowerlineSymbols" "NerdFonts" "NotoEmoji")
# -----------------------------------------------------------------------------------------
quiet=false; printLog=false; verbose=false; force=false; strict=false; debug=false; args=() 
# -----------------------------------------------------------------------------------------
																		# Função Instalador
# -----------------------------------------------------------------------------------------
function __Instalador(){
    which yad || sudo apt install yad -y; source "${utilsLocation}"; Class_Bob;
    __dialogo "formularios" # instalador"; clear;
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
		#source "${utilsLocation}"; 
		Bob_dp $1;
	fi
    unset -->dp; Verifica_dp;
}
# -----------------------------------------------------------------------------------------
																   # Verifica dependências.
# -----------------------------------------------------------------------------------------																	
function Verifica_dp(){
	x=0;
	while read _pkg_ _ver_; do
		if command -v $_pkg_ &>/dev/null; then
			if [[ $($_pkg_ --version 2>&1) =~ [0-9]+\.[0-9]+ ]]; then
				if ! awk 'BEGIN { exit ARGV[1] < ARGV[2] }' $BASH_REMATCH $_ver_; then
					printf "%s: erro: requer o pacote '%s %s' ou superior.\n" ${_bob_[name]} $_pkg_ $_ver_ 1>&2
					exit 1; bob_i_dp=("" "");
				fi
			else
				printf "%s: erro: '%s' não foi possível obter a versão.\n" ${_bob_[name]} $_pkg_ 1>&2
				#$_pkg_ -v
			fi
		else
			printf "%s: erro: '%s' o pacote requerido está ausente.\n" ${_bob_[name]} $_pkg_ 1>&2
			dp[$x]=($_pkg_);
			((x=$x+1))
		fi
	done <<< "${_bob_[packages]//,/$'\n'}"
	if [ -z $tmp ] ; then
		__Instalador $-->dp;	
	else
		echo "$-->dp"
	fi
}
Verifica_dp



# Set Temp Directorio
# ----------------------------------------------------------------------------------------
# Criando temp directorio com três números rândomicos process ID
# Este directorio é removido automaticamente ao sair.
# ----------------------------------------------------------------------------------------
tmpDir="/tmp/${scriptName}.$RANDOM.$RANDOM.$RANDOM.$$"
(umask 077 && mkdir "${tmpDir}") || {
  die "Não foi possivel criar arquivo no diretorio! Saindo."
}


# ----------------------------------------------------------------------------------------
# Print usage  - REVISAR		Usar HELP
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
	int_x=( "${bobLocation}" "${pythonLocation}" "${instalacaoLocation}" "${shellfontsLocation}" 
		"${programasLocation}" "${servidorLocation}" "${errosLocation}" "${textoLocation}" 
		"${chtLocation}" "${financeiroLocation}" "${financeiroBDLocation}" "${bancodadosLocation}" 
		"${manutencaoLocation}"	"${utilsLocation}" "${zzfuncaoLocation}" )
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
# ----------------------------------------------------------------------------------------
													  		  # (ColorSchemeGnomeTerminal)
														 #https://github.com/Mayccoll/Gogh
# ----------------------------------------------------------------------------------------
function ColorSchemeGnomeTerminal(){
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
# ----------------------------------------------------------------------------------------
																	       #( mainScript )
# ----------------------------------------------------------------------------------------
							  ### Função Principal, inicio do software. versao 2019.01 ###
													  # by: Elizeu de Santana / 16-06-2019 
# ----------------------------------------------------------------------------------------
function mainScript(){
	_Clima_ -t; Integridade; Dependencias_fonts; ColorSchemeGnomeTerminal;
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
# -----------------------------------------------------------------------------------------
                                                              #(Chamada a função Principal)
# -----------------------------------------------------------------------------------------
mainScript
# ----------------------------------------THE END------------------------------------------    

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