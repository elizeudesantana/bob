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
# * Retorno: Carregado por bob_util.sh
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
if [ -f "${confLocation}" ]; then       ### carregando o arquivo .conf ###
    source "${confLocation}";
    varDebug_conf="Realizado Source no arquivo: ${confLocation}" 
else
    echo "Por favor procure bob_util.sh e adicione referência a este script. Saindo.";
    exit 1;
fi
# -----------------------------------------------------------------------------------------
if [ -f "${coresLocation}" ]; then      ### carregando o arquivo de cores ###
    source "${coresLocation}";
    varDebug_cores="Realizado Source no arquivo: ${coresLocation}" 
else
    echo "Por favor procure bob_util.sh e adicione referência a este script. Saindo.";
    exit 1;
fi

### Titulo inicial ###
# -----------------------------------------------------------------------------------------
# Monta o titulo cabeçalho para todas as paginas
# by: Elizeu de Santana / 24-06-2019 
# ----------------------------------------------------------------------------------------
function Titulo_Inicial(){
    clear
    local signal=$(nmcli -t device wifi | grep '^*' | awk -F':' '{print $6}')  
    tituloAscii "$(figlet 'bob')";
    if [ ${signal} -gt 15 ] ; then #maior que 15
    	if is_linux ; then
	    	if is_ubuntu ; then
		    	echo -e "                                                                 ${green}${reset}${green} ${reset} ${red}${reset}${blue}   ${reset} $(e_success )"
		    else
		    	echo -e "                                                                 ${green}${reset} ${red}${reset}${blue}   ${reset} $(e_success )"
		    fi
	    else
				echo -e "                                                                 ${red}${reset}${blue}   ${reset} $(e_success )"	    	
	    fi
	#elif [ ${signal} -gt 0 ] ; then
	else
		if is_linux ; then
	    	if is_ubuntu ; then
		    	echo -e "                                                                 ${green}${reset}${green} ${reset} ${red}${reset}${blue}   ${reset} $(e_error )"
		    else
		    	echo -e "                                                                 ${green}${reset} ${red}${reset}${blue}   ${reset} $(e_error )"
		    fi
	    else
				echo -e "                                                                 ${red}${reset}${blue}   ${reset} $(e_error )"	    	
	    fi
		error "Sem internet!"
	fi
	Aux_logo
}

# -----------------------------------------------------------------------------------------
function Aux_logo(){
	cat ${climaLocation}
    e_arrow "${red}${reset} http://github.com/elizeudesantana/bob";
    e_arrow "${red}﫸${reset}EliSoftWare - version 2019.01 - MIT License Copyright (c) 2019 Elizeu de Santana";
}

# -----------------------------------------------------------------------------------------
function Sair(){
	read; Titulo_Inicial; printf "\n\n\n"; 
	e_success "  Obrigado pela preferência."
	curl 'qrenco.de/EliSoftWare - version 2019.01 - MIT License Copyright (c) 2019 Elizeu de Santana'
	trap EXIT INT TERM
	exit
}

# by: Elizeu de Santana / 02-06-2019 -------------------------------------------------------
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

# by: Elizeu de Santana / 02-06-2019 -------------------------------------------------------
function set_info(){
	display_info
	cat <<EOF
	$d_title
	$qtd
	Distro: ${d^}
	OS: $d_os
	Kernel Name: $d_kname
	Kernel Version: $d_kversion
	Uptime: $d_uptime
	Shell: ${d_shell^}
	Resolution: $d_res
	Desk: $d_desk
	Font: $d_font
	CPU: $d_cpu
	RAM: $d_mem
	Mem Free: $d_memfree
	Architeture: $d_arch
	Browser default: ${d_browser^}
EOF
}

# by: Elizeu de Santana / 02-06-2019 -------------------------------------------------------
function Logo(){
	### Tela inicial fetch ###
	clear
	display_info
	d=${d,,}

	gentoo=$(jp2a --size=50x25 ubuntu.jpg | pygmentize)
	ubuntu=$(jp2a --size=45x17 ubuntu.jpg) # | pygmentize)
	outra=$(jp2a --size=50x25 ubuntu.jpg | pygmentize)
	arch=$(jp2a --size=50x25 ubuntu.jpg | pygmentize)
	case "$(echo $d)" in
			'gentoo') distro="$gentoo" ;;
			'ubuntu') distro="$ubuntu" ;;
			'arch') distro="$arch" ;;
			*) distro="$outra" ;;
	esac

	# if [[ "$1" ]]; then
	# 		while [[ "$1" ]]; do
	# 				case "$1" in						
	# 						-h|--help) usage && exit 0 ;;
	# 						-v|--version) echo Version 1.0 && exit 0 ;;
	# 						*) echo "Invalid option" && exit 1 ;;							
	# 				esac
	# 				shift
	# 		done
	# else
	paste <(printf "%s" "$distro") <(printf "%s" "$(set_info)") #| lolcat
	# fi
}