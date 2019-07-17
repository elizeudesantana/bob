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
										   # Monta o titulo cabeçalho para todas as paginas
													   # by: Elizeu de Santana / 24-06-2019 
# -----------------------------------------------------------------------------------------
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
    e_arrow "${red} ${reset}  http://github.com/elizeudesantana/bob";
    e_arrow "${red} ${reset}  EliSoftWare - version 2019.01 - MIT License Copyright (c) 2019 Elizeu de Santana";
}

# -----------------------------------------------------------------------------------------
function Sair(){
	Titulo_Inicial; printf "\n\n\n"; 
	e_success "${green}  ${reset}Obrigado pela preferência."
	curl 'qrenco.de/EliSoftWare - version 2019.01 - MIT License Copyright (c) 2019 Elizeu de Santana'
	trap EXIT INT TERM
	exit
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
	paste <(printf "%s" "$distro") <(printf "%s" "$(set_info)") #| lolcat
}