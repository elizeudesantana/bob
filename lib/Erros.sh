#!/bin/bash
############################################################################################
#
# Bob utilities script bash 
#
version="2019.01"               # Sets version variable
#
scriptFileVersion="1.0.0"
#
# History:
#   1.0.0  script version inicial, estrutura de diretorio.
#   2019.01  Dividido em diretorios criação de route e tipando de forma MVC (23/06/2019)
#
# Dependências:
#   function Dependencias()
#
# * Retorno: n/a
# * Data: n/a
#
# by: Elizeu de Santana -------------------------------------------------------------------

instalacao="/Projetos/bob/"                                         # Diretorio de Instalação apartir de HOME
scriptPath_Home="${HOME}";                                          # Diretorio HOME (~)
scriptPath_Bob="${scriptPath_Home}${instalacao}";                   # Diretrio de Instalação do Bob
scriptPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"      # Diretorio de instalação do script 
if [ $scriptPath != $scriptPath_Bob ] ; then
    utilsLocation="${scriptPath_Bob}/lib/bob_util.sh"               # Diretorio de localização bob_util.sh
    confLocation="${scriptPath_Bob}/doc/bob.conf"                   # Diretorio de localização bob.conf
    enderecoRelativo_lib="${scriptPath_Bob}/bin/"                   # Estrutura de diretorio bin
    enderecoRelativo_lib="${scriptPath_Bob}/lib/"                   # Estrutura de diretorio lib
    enderecoRelativo_lib="${scriptPath_Bob}/lib/view"               # Estrutura de diretorio lib/view
    enderecoRelativo_doc="${scriptPath_Bob}/doc/"                   # Estrutura de diretorio doc
else
    utilsLocation="${scriptPath}/lib/bob_util.sh" 
    confLocation="${scriptPath}/doc/bob.conf"
    enderecoRelativo_lib="${scriptPath}/bin/"                       # Estrutura de diretorio lib
    enderecoRelativo_lib="${scriptPath}/lib/"                       # Estrutura de diretorio lib
    enderecoRelativo_lib="${scriptPath}/lib/view"                   # Estrutura de diretorio lib/view
    enderecoRelativo_doc="${scriptPath}/doc/"                       # Estrutura de diretorio doc
fi
# if [ -f "${utilsLocation}" ]; then
#     source "${utilsLocation}"
# else
#     echo "Por favor procure bob_util.sh e adicione referência a este script. Saindo."
#     exit 1
# fi
# MenuErros ######################################################
#                     ScriptTotal.sh
# by: Elizeu de Santana 
# 23-05-2019  -  Tratamento de ERRO 
MenuErros(){
	
	echo -e "$Cyan \n Menu Menu Erros :																	$Color_Off"
	echo -e "$Cyan 1 - Erro [13]: Trava /var/lib/dpkg/lock-frontend - open (13: Permissão negada)   	$Color_Off"
	echo -e "$Cyan 2 - Erro [xx]: erro libdvd (relativo a sincronicidade entre time local e bios)		$Color_Off"
	echo -e "$Red \n ---------------------------------------------------------------- 					$Color_Off"
    echo -e "$Cyan 3 - Retorna ao menu Principal.                                       $Color_Off"
	echo -e "$Cyan 4 - Limpa historico. 																$Color_Off"
	echo -e "$Red  ---------------------------------------------------------------- 					$Color_Off"
	echo -e "$Cyan Historico : 																			$Color_Off"
	tail -n 6 ErrosLog.log
	echo -e "$Yellow \n Digite número disposto acima [1 .. 23]: ";read MenuErros_Esc
	case $MenuErros_Esc in
		1)	
			ErroTrava;;	
		2)
			Errlibdvd;;
		3)
            . 'ScriptTotal.sh'
            Principal;;
		4)	rm ErrosLog.log;;  
		*)"Opção desconhecida." ; echo ; MenuErros ;;
	esac
}

# by: Elizeu de Santana / 23-05-2019  -  Tratamento de ERRO
ErroTrava(){
	ScriptTotalHead
	tmpD="$(date)"
	tmpL=" Processo: systemctl [1] ou Deletando arquivivo lock [2]"

	echo -e "$Cyan Pode ser feito de duas maneiras pelo systemctl [1] ou Deletando arquivivo lock [2]. Preferência: $Color_Off"
	read ErroTravaEsc
	if [ $ErroTravaEsc == 1 ] ; then
		sudo systemctl mask apt-daily.service
		sudo systemctl mask apt-daily.timer
		sudo systemctl mask apt-daily-upgrade.service
		sudo systemctl mask apt-daily-upgrade.timer
	else
		ps aux | grep -i apt-get
		killall -9 apt-get
		sudo rm -fv /var/lib/apt/lists/*
		sudo rm /var/lib/dpkg/lock
		sudo rm /var/cache/apt/archives/lock
		sudo apt-get update
		sudo dpkg --configure -a
	fi
	
	printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> ErrosLog.log
    
    echo -e "$Cyan Processo: systemctl [1] ou Deletando arquivivo lock [2]. $Color_Off"
	echo -e "$Red ---------------------------------------------------------------- $Color_Off"
	sleep 5
	MenuErros              # Retornar ao fluxo
}


# by: Elizeu de Santana / 23-05-2019  -  Tratamento de ERRO
# erro libdvd (relativo a sincronicidade entre time local e bios)
Errlibdvd(){
	ScriptTotalHead
	tmpD="$(date)"
	tmpL=" Processo: dpkg-reconfigure libdvd-pkg"
	echo -e "$Cyan Execuntando dpkg-reconfigure libdvd-pkg: $Color_Off"

	sudo dpkg-reconfigure libdvd-pkg #\n
    printf  "\n%s" " Log Instalação: $tmpD" "$tmpL" >> ErrosLog.log
    
    echo -e "$Cyan dpkg-reconfigure libdvd-pkg pronto. $Color_Off"
	echo -e "$Red ---------------------------------------------------------------- $Color_Off"
	sleep 5
	MenuErros              # Retornar ao fluxo
}

#mostrar ppa's
#grep -RoPish "ppa.launchpad.net/[^/]+/[^/ ]+" /etc/apt | sort -u | sed -r 's/\.[^/]+\//:/'
# remover aplicativo quebrado!!!!
#sudo dpkg --remove --force-remove-reinstreq mysql-community-server-core-dbgsym

