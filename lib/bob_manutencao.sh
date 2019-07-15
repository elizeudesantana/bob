#!/bin/bash
############################################################################################
#
#   Bob utilities script bash 
#
#                                                                      The MIT License (MIT)
#                                                         Copyright (c) 2019 elizeudesantana
#
version="2019.01";                                                      # Versão do Programa
#
scriptFileVersion="1.0.0";                                                # Versão do script
#
# History:
#   1.0.0                                                            Script version inicial.
#   2019.01      Dividido em diretorios criação de route e tipando de forma MVC (23/06/2019)
#
# Dependências:                                                     Nome do arquivo: bob.sh
#   function Dependencias()
#
# * Retorno: n/a
# * Data: 25/06/2019
#
# by: Elizeu de Santana -------------------------------------------------------------------

# -----------------------------------------------------------------------------------------
																	 # (Função Monitoracao)
# -----------------------------------------------------------------------------------------
function Monitoracao(){
	if [ "${1}" = "atop" ] ; then
		if [ -z "$(byobu list-sessions | grep bob)" ] ; then
		    byobu-tmux new-session -d -t bob 
		    byobu-tmux rename-window bob 
		   	byobu-tmux send-keys -t 0 'atop' 'C-m'
		fi
		byobu-tmux attach -t bob
	elif [ "${1}" = "cpu" ] ; then
		if [ -z "$(byobu list-sessions | grep bob)" ] ; then
		    byobu-tmux new-session -d -t bob 
		    byobu-tmux rename-window bob 
		   	byobu-tmux send-keys -t 0 's-tui' 'C-m'
		    byobu split-window -h
		    byobu-tmux send-keys -t 1 'gtop' 'C-m'
		fi
		byobu-tmux attach -t bob
	elif [ "${1}" = "net" ] ; then
		Titulo_Inicial;	printf "\n\n\n\n\n"
		seek_confirmation "${USER}, para monitorar as dependências do trafego de rede em portas é necessario senha sudo, continuar ?" 
        if is_confirmed; then
			if [ -z "$(byobu list-sessions | grep bob)" ] ; then
			    byobu-tmux new-session -d -t bob 
			    byobu-tmux rename-window bob 
			   	byobu-tmux send-keys -t 0 'bmon' 'C-m'
			    byobu split-window -h
			    byobu-tmux send-keys -t 1 'sudo iftop -i wlp4s0' 'C-m'
			    byobu split-window -v
			    byobu-tmux send-keys -t 2 'nload wlp4s0' 'C-m'
			fi
			byobu-tmux attach -t bob
		else
			Principal
		fi
	elif [ "${1}" = "io" ] ; then
		Titulo_Inicial;	printf "\n\n\n\n\n"
		seek_confirmation "${USER}, para monitorar as dependências do trafego de rede em portas é necessario senha sudo, continuar ?" 
        if is_confirmed; then
			if [ -z "$(byobu list-sessions | grep bob)" ] ; then
			    byobu-tmux new-session -d -t bob 
			    byobu-tmux rename-window bob 
			   	byobu-tmux send-keys -t 0 'sudo iotop' 'C-m'
			    byobu split-window -h
			    byobu-tmux send-keys -t 1 'sudo tcpdump -i wlp4s0' 'C-m'
			    byobu split-window -v
			    byobu-tmux send-keys -t 2 'sudo nethogs' 'C-m'
			fi
			byobu-tmux attach -t bob
		else
			Principal
		fi
	elif [ "${1}" = "SO" ] ; then
		if [ -z "$(byobu list-sessions | grep bob)" ] ; then
		    byobu-tmux new-session -d -t bob 
		    byobu-tmux rename-window bob 
		   	byobu-tmux send-keys -t 0 'glances' 'C-m'
		fi
		byobu-tmux attach -t bob
	fi
	#Titulo_Inicial; vnstat; read

	
# tela dividida
# sudo apt install python-pip stress 
# pip install s-tui  
# s-
 # usar byobu vertical
# sudo npm install gtop -g                                                                                                                                       ✘130 at 10:52:02 

#tela dividida
#serviço de minitoração 
#service vnstat status
#vnstat
#net monitora banda
#sudo iftop -i wlp4s0

#sudo apt install iptraf
#sudo iptraf-ng
# monitorar o systema
# glances
}
# -----------------------------------------------------------------------------------------
																		  # Função Latencia
# -----------------------------------------------------------------------------------------
function Latencia(){
	Titulo_Inicial;
	curl http://cheat.sh/latency;
	Principal
}
# -----------------------------------------------------------------------------------------
																	 # Função AbreMonitorix
# -----------------------------------------------------------------------------------------
function AbreMonitorix(){
	### ###
	#python -mwebbrowser http://localhost:8080/monitorix
	#x-www-browser http://localhost:8080/monitorix
	#echo "ERROR: Sem permissão para criar diretorio "
	#$(python p.py)
	which epiphany || Dependencias epiphany; 
	epiphany "http://localhost:8080/monitorix-cgi/monitorix.cgi?mode=localhost&graph=all&when=1day&color=black"
	Principal
	#URL="http://localhost:8080/monitorix"
	#BROWSER="epiphany"
	#[[ -x $BROWSER ]] && exec "$BROWSER" "$URL"
	#path=$(which xdg-open || which gnome-open) && exec "$path" "$URL"
	#echo "Can't find browser"
}
# -----------------------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------------------
function CheckDir(){
	if [ ! -d $dirTrab ] ; then
		mkdir -p $dirTrab >/dev/null 2>&1
		if (($? != 0)) ; then
			echo "ERROR: Sem permissão para criar diretorio ${dirTrab}. Terminando app.
			Por favor crie o diretorio ${dirTrab} e rode novamente o app."
			echo "\t...saindo ..."; read; Manutencao;
		fi
	fi
	Imprime
	if [ -z "$(byobu list-sessions | grep bob)" ] ; then
		    byobu-tmux new-session -d -t bob 
		    byobu-tmux rename-window bob 
		   	byobu-tmux send-keys -t 0 'nvim ${info_arq}' 'C-m'
	fi
	byobu-tmux attach -t bob

}
# -----------------------------------------------------------------------------------------
																		  # ( Função Manut)
# -----------------------------------------------------------------------------------------
function Manut(){
	### Recebe argumento para informações ###
	case $1 in
		get_host) 				
				hostname ;;
		get_OS) 				
				uname -s ;;
		get_OS_level)			
				lsb_release -a ;;
		get_TZ)					
				echo -e "${ctr} /usr/share/zoneinfo/ ${dlc}"
				colorls /usr/share/zoneinfo/
				echo "---------------------------------------------------------------------------------------------------------"
				echo -e "${ctr} /usr/share/zoneinfo/America ${dlc}"
				colorls /usr/share/zoneinfo/America
				echo "---------------------------------------------------------------------------------------------------------"
				echo -e "${ctr} Setpoint para : ${dlc}" $(cat /etc/timezone) ;;
		get_real_mem | get_real_mem_graf )	#5		
				#Mostrar informações básicas do processo e memoria	
				smem #; read
				smem -r #; read
				#Mostrar visualização orientada a bibliotecas	
				smem -m #;  read
				# Mostrar visualização orientada para o usuário	
				smem -u #;  read
				# Mostrar visualização do sistema	
				#smem -R 4G -K / caminho / para / vmlinux -w;  read
				# Mostrar totais e porcentagens	
				smem -t -p #;  read
				# Mostrar colunas diferentes	
				smem -c "${USER} pss" #;  read
				# Ordenar por RSS reverso	
				smem -s rss -r #; read
				# Mostrar processos filtrados por mapeamento	
				smem -M libxml #; read
				# Mostrar mapeamentos filtrados por processo	
				smem -m -P [e] volution 
				# Ler dados do tarball de captura	
				#smem --source capture.tar.gz;  read
				if [ $1 = "get_real_mem_graf" ] ; then
					e_arrow -d "Relatório completo, para verificar (scroll on mouse), pressione qualquer tecla para os gráficos. $(e_success)"; read
					# Mostrar um gráfico de barras rotulado por pid	
					smem --bar pid -c "pss uss" #;  read
					# Mostrar um gráfico de pizza de RSS rotulado por nome	
					smem --pie Uso_memoria -s rss #;  read
				fi
				;;
				#sudo cat /proc/1/smaps
		get_arch)				
				uname -p ;;
		get_devices)		
				echo -e "${ctr} Video VGA :${dlc}"	
				lspci -nnk | grep VGA -A1
				echo "---------------------------------------------------------------------------------------------------------"
				echo -e "${ctr} Audio : ${dlc}"
				lspci -v | grep -A7 -i "audio"
				echo "---------------------------------------------------------------------------------------------------------"
				echo -e "${ctr} Network : ${dlc}"
				lspci -nnk | grep net -A2
				echo "---------------------------------------------------------------------------------------------------------"
				echo -e "${ctr} USB e Webcam : ${dlc}"
				lsusb
				echo "---------------------------------------------------------------------------------------------------------"
				echo -e "${ctr} Todos : ${dlc}"
				lspci ;;
		get_long_devdir_listing) 
				ls -l /dev ;;
		get_defined_disks) 	
				
				sudo fdisk -l ;;
		get_defined_pdisks) 	#10
				Titulo_Inicial;	
				pydf ;;
		get_cdrom)  			
				lsblk
				sudo blkid
				hwinfo --block --short
				sudo parted -l ;;
		get_adapters)			
				sudo lshw -C network ;;
		get_routes)				
				netstat -rn ;;
		get_netstats)			
				netstat -i ;;
		get_printer_info) 	#15	
				epiphany "http://localhost:631/help" 
				;;
				#lpstat -W | tail +3
		get_process_info)		
				ps -ef ;;
		get_video_info)			
				lspci | grep VGA
				lshw -C video ;;
		get_portas_procs)		
				netstat -a ;;
		get_long_sys_config)	
				sudo lshw ;;
		get_installed_filesets)	
				dpkg -l ;;
		check_for_broken_filesets) 
				sudo apt update > tmp ;;
		last_logins)			
				last | head -100 ;;
		*)
				echo -e "${ctr} Opção desconhecida. ${dlc}"; MenuInstalarProgramas ;;
	esac
}
# -----------------------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------------------
# N### Criar o snapshot ###
# -----------------------------------------------------------------------------------------
function Imprime(){
	(
	echo "Gerado por bob sistemas de controle - elisoftware - htttp://github.com/elizeudesantana/bob"
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo "[ $(basename $0) - $(date) ]"
	echo "Sistema :${myhost} "
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo "$(figlet ${myhost})"
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo "System:"; Manut get_host
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo "Time Zone:"; 
	echo "---------------------------------------------------------------------------------------------------------"
	ls /usr/share/zoneinfo/ 
	echo "---------------------------------------------------------------------------------------------------------"
	ls /usr/share/zoneinfo/America
	echo "---------------------------------------------------------------------------------------------------------"
	cat /etc/timezone
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo "Uso Real de memoria (PSS é o mais próximo da realidade de consumo do linux): "
	echo "---------------------------------------------------------------------------------------------------------"
	Manut get_real_mem
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo -n "Tipo de arquitetura da máquina : "; Manut get_arch
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo -n "Sistema Operacional : "; Manut get_OS
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo "Sistema Operacional Version Level:"
	echo "---------------------------------------------------------------------------------------------------------"
	Manut get_OS_level
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo "Aparatus instalados e configurados:"
	echo "---------------------------------------------------------------------------------------------------------"
	Manut get_devices
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo "Lista do diretorio dos arquivos de controle do linux - (/dev) :"
	echo "---------------------------------------------------------------------------------------------------------"
	Manut get_long_devdir_listing
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo "Sistema de discos :"
	echo "---------------------------------------------------------------------------------------------------------"
	#Manut get_defined_pdisks
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo "Sistema de discos detalhados "
	echo "---------------------------------------------------------------------------------------------------------"
	Manut get_defined_disks
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo "System CD-ROM Drives"
	echo "---------------------------------------------------------------------------------------------------------"
	Manut get_cdrom
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo "Defined Adapters in the System"
	echo "---------------------------------------------------------------------------------------------------------"
	Manut get_adapters
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo "Network Routes"
	echo "---------------------------------------------------------------------------------------------------------"
	Manut get_routes
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo "Network Interface Statistics"
	echo "---------------------------------------------------------------------------------------------------------"
	Manut get_netstats
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo "Informação de impressoras"
	echo "---------------------------------------------------------------------------------------------------------"
	Manut get_printer_info
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo "Lista de processos ativos"
	echo "---------------------------------------------------------------------------------------------------------"
	Manut get_process_info
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo "Informação do  driver de video"
	echo "---------------------------------------------------------------------------------------------------------"
	Manut get_video_info
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo " Listagem de todas as portas no processo"
	echo "---------------------------------------------------------------------------------------------------------"
	Manut get_portas_procs
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo "Configuração do sistema - listagem completa"
	echo "---------------------------------------------------------------------------------------------------------"
	Manut get_long_sys_config
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo "Listagem dos pacotes instalados no Sistema"
	echo "---------------------------------------------------------------------------------------------------------"
	Manut get_installed_filesets
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo "Listagem dos pacotes Quebrados no Sistema"
	echo "---------------------------------------------------------------------------------------------------------"
	Manut check_for_broken_filesets
	$(cat tmp)
	echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
	echo "Lista dos últimos 100 users a logar em ${myhost}"
	echo "---------------------------------------------------------------------------------------------------------"
	Manut last_logins
	echo "---------------------------------------------------------------------------------------------------------"
	echo "Report salvo em: ${info_arq}") | $(tee -a ${info_arq})
}