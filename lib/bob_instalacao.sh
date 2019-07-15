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

# -----------------------------------------------------------------------------------------
# Prover uma variavel com a pespectiva de localizações do script
# instalacao="/projetos/bob";                                          # Diretorio de Instalação apartir de HOME
# scriptPath_Home="${HOME}";                                           # Diretorio HOME (~)
# scriptPath_Bob="${scriptPath_Home}${instalacao}";                    # Diretrio de Instalação do Bob
# scriptPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";      # Diretorio de instalação do script 
# # -----------------------------------------------------------------------------------------
# if [ $scriptPath != $scriptPath_Bob ] ; then
#     utilsLocation="${scriptPath_Bob}/lib/bob_util.sh";               # Diretorio de localização bob_util.sh
# else
#     utilsLocation="${scriptPath}/lib/bob_util.sh"; 
# fi
# # -----------------------------------------------------------------------------------------
# if [ -f "${utilsLocation}" ]; then
#     source "${utilsLocation}";
# else
#     e_error "Erro carregando ${utilsLocation}"; Sair;
# fi
# # -----------------------------------------------------------------------------------------
# if [ -f "${shellfontsLocation}" ]; then
#     source "${shellfontsLocation}";
# else
#     e_error "Erro carregando ${shellfontsLocation}"; Sair;
# fi
# # -----------------------------------------------------------------------------------------
# if [ -f "${programasLocation}" ]; then
#     source "${programasLocation}";
# else
#     e_error "Erro carregando ${programasLocation}"; Sair;
# fi
# # -----------------------------------------------------------------------------------------
# if [ -f "${servidorLocation}" ]; then
#     source "${servidorLocation}";
# else
#     e_error "Erro carregando ${servidorLocation}"; Sair;
# fi
# # -----------------------------------------------------------------------------------------
# if [ -f "${errosLocation}" ]; then
#     source "${errosLocation}";
# else
#     e_error "Erro carregando ${errosLocation}"; Sair;
# fi
# -----------------------------------------------------------------------------------------
# Função MenuInstacaoPrincipal
# -----------------------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------------------
function MenuInstacaoPrincipal(){
    #e_header "${hi}, seja bem-vindo. As seguintes escolhas estão disponíveis."
    echo
}
# -----------------------------------------------------------------------------------------
# Função Construtor_Snap
# -----------------------------------------------------------------------------------------
# Construtor para o gerenciador apt-get linux ubuntu
# -----------------------------------------------------------------------------------------
function Construtor_Snap(){
	clear
    e_arrow "O ${red}${reset}${blue}   ${reset} instala vários aplicativos, conforme o usuários faz uso do software."
	printf "\n"; snap list; printf "\n";
	e_note "Instalar o snap (${purple}u${reset}${blue})appexplorer-cli, (${purple}m${reset}${blue})ostrar aplicativos."
	e_note "Para instalar o ap(${purple}p${reset}${blue}), digite o nome abaixo."
	e_note "E para habilitar ou (${purple}d${reset}${blue})esabilitar um App."
	read -p "Digite uma das letras entre parenteses, acima : " opt
    if [ ${opt} = "u" ] ; then
    	snap install uappexplorer-cli
    elif [ ${opt} = "m" ] ; then
    	uappexplorer-cli -p 1
    	while true; do
			#clear
			read -p "Digite um número para nova página, (s)air: " opt
			if [ "${opt}" = "s" ] ; then
				break;
			else
				uappexplorer-cli -p ${opt}
			fi
		done
	elif [ ${opt} = "p" ] ; then
		read -p "Digite o nome do App : " opt
		sudo snap install ${opt}
	elif [ ${opt} = "d" ] ; then
		read -p "Para habilitar digite (h) e para desabilitar (d) : " opt
		if [ "${opt}" = "h" ] ; then
			read -p "Digite o nome do App : " opt
			snap enable ${opt}; read;
		elif [ ${opt} = "d" ] ; then
			read -p "Digite o nome do App : " opt
			snap disable ${opt}; read;
		fi
    fi
    Principal
}


# by: Elizeu de Santana / 25-05-2019 -------------------------------------------------------
function InstalarOneDriver() {
	### ###
	wget https://github.com/xybu/onedrive-d-old/archive/future.zip -O onedrive-d.zip
	unzip onedrive-d.zip
	cd onedrive-d-old-future/
	./install.sh --reinstall
	ou
	./install.sh
	#click com o esquerdo vai para o link
	onedrive-pref
	onedrive-d start
	#colque no aplicativos seção
	#atividades / adiciona
}

# by: Elizeu de Santana / 25-05-2019 -------------------------------------------------------
function EnviarGrive() {
	### Não esta funcionando - realizar manuntenção ###
	Titulo
	tmpD="$(date)"
	tmpL=" Processo: Upload de arquivos Backup em Nuvem - Sincronismo."
	echo -e "${ctm} Upload de arquivos Backup em Nuvem - Sincronismo ...  ${dlc}"

	#echo Creating ${GDRIVEDIR}/${TARGETDIR} if needed
	if [ ! -d "${GDRIVEDIR}/${TARGETDIR}" ]; then sudo mkdir ${GDRIVEDIR}/${TARGETDIR}; fi
	echo -e "${ctm} Movendo para ${GDRIVEDIR} ...  ${dlc}"
	cd ${GDRIVEDIR}
	echo -e "${ctm} Inicializando Google Drive Sync  ${dlc}"
	#sudo grive
	google $Driver
	google $Key

	echo -e "${ctm} Copiando para ${BACKUPDIR}/* para ${GDRIVEDIR}/${TARGETDIR}/  ${dlc}"
	sudo cp -R ${BACKUPDIR}/* ${GDRIVEDIR}/${TARGETDIR}/
	echo -e "${ctm} Arquivos para sincronismo :  ${dlc}"
	sudo find ${GDRIVEDIR}/${TARGETDIR}/
	echo -e "Final Google Drive Sync  ${dlc}"
	sudo grive

	printf "\n%s" " Log Instalação: $tmpD" "$tmpL" >>ServidorLog.log

	echo -e "${ctm} Sincronismo pronto.  ${dlc}"
	echo -e "${cls} ----------------------------------------------------------------  ${dlc}"
	sleep 10
	MenuInstacaoPrincipal #retorna ao fluxo
}

# by: Elizeu de Santana / 25-05-2019 -------------------------------------------------------
function InstalarGrive() {
	### Não esta funcionando fazer manutenção  ###
	Titulo
	tmpD="$(date)"
	tmpL=" Processo: Upload de arquivos Backup em Nuvem - grive."
	echo -e "${ctr} Upload de arquivos Backup em Nuvem - grive ...  ${dlc}"

	sudo add-apt-repository ppa:nilarimogard/webupd8 # Repositorios
	sudo apt-get Update                              # Update
	sudo apt-get install grive                       # Instala
	sudo mkdir /mnt/Google-Driver                    # cria diretorios
	cd /mnt/GoogleDrive
	#grive -a
	google $Driver
	goole $Key
	#dar permissão
	printf "\n%s" " Log Instalação: $tmpD" "$tmpL" >>ServidorLog.log

	echo -e "${ctr} Backup pronto.  ${dlc}"
	echo -e "${cls} ----------------------------------------------------------------  ${dlc}"
	sleep 5
	MenuInstacaoPrincipal #retorna ao fluxo
}

# by: Elizeu de Santana / 25-05-2019 -------------------------------------------------------
function BackupCloud() {
    e_header "Upload de arquivos Backup em Nuvem - Compactação."
}

# by: Elizeu de Santana / 25-05-2019 -------------------------------------------------------
function compactarTar() {
	### ###
	tar -cf Backup$(date +%Y-%m-%d).tar $COMPACTARDIR 2>/dev/null
	#sudo mv Backup`date +%Y-%m-%d`.tar $BACKUPDIR
	if [ $? -eq 0 ]; then
		echo -e "${cls} ----------------------------------------------------------------  ${dlc}"
		echo -e "${ctr} Diretorio compactado : $COMPACTARDIR  ${dlc}"
		echo -e "${ctr} Arquivo compactado : Backup$(date +%Y-%m-%d).tar  ${dlc}"
	else
		echo -e "${cls} ----------------------------------------------------------------  ${dlc}"
		echo -e "${ctr} Diretorio $COMPACTARDIR não foi compactado.  ${dlc}"
	fi
	sleep 5
	BackupCloud #Volta ao fluxo
}

# by: Elizeu de Santana / 25-05-2019 -------------------------------------------------------
function compactarGz() {
	### ###
	tar -czf Backup$(date +%Y-%m-%d).tar.gz $COMPACTARDIR 2>/dev/null
	#sudo mv Backup`date +%Y-%m-%d`.tar.gz $BACKUPDIR
	if [ $? -eq 0 ]; then
		echo -e "${cls} ----------------------------------------------------------------  ${dlc}"
		echo -e "${ctr} Diretorio compactado : $COMPACTARDIR  ${dlc}"
		echo -e "${ctr} Arquivo compactado : Backup$(date +%Y-%m-%d).tar  ${dlc}"
	else
		echo -e "${cls} ----------------------------------------------------------------  ${dlc}"
		echo -e "${ctr} Diretorio $COMPACTARDIR não foi compactado.  ${dlc}"
	fi
	sleep 3
	BackupCloud #Volta ao fluxo
}

# by: Elizeu de Santana / 25-05-2019 -------------------------------------------------------
function compactarBz2() {
	### ###
	tar -cjf Backup$(date +%Y-%m-%d).bz2 $COMPACTARDIR 2>/dev/null
	#sudo mv Backup`date +%Y-%m-%d`.bz2 $BACKUPDIR
	if [ $? -eq 0 ]; then
		echo -e "${cls} ----------------------------------------------------------------  ${dlc}"
		echo -e "${ctr} Diretorio compactado : $COMPACTARDIR  														${dlc}"
		echo -e "${ctr} Arquivo compactado : Backup$(date +%Y-%m-%d).tar  									${dlc}"
	else
		echo -e "${cls} ----------------------------------------------------------------  ${dlc}"
		echo -e "${ctr} Diretorio $COMPACTARDIR não foi compactado.  											${dlc}"
	fi
	sleep 3
	BackupCloud #Volta ao fluxo
}

# by: Elizeu de Santana / 25-05-2019 -------------------------------------------------------
function descompactarTar() {
	### ###
	# QTD=$(find $1 -iname "*.rar" | wc -l)
	#    i="1"
	#    while [ $i -le $QTD ];do
	#        ArquivoCompleto=$(ls *.rar | head -$i | tail -1)
	#        unrar x "$ArquivoCompleto"
	#    i=$(($i+1))
	#   done

	tar -xf $CAMINHO
	if [ $? -eq 0 ]; then
		echo -e "${ctr} Arquivo descompactado no diretorio corrente. ${dlc}"
	else
		echo -e "${ctr} Erro! arquivo não foi descompactado ${dlc}"
	fi
	sleep 2
}

# by: Elizeu de Santana / 25-05-2019 -------------------------------------------------------
function descompactarGz() {
	### ###
	tar -xzf $CAMINHO
	if [ $? -eq 0 ]; then
		echo "Arquivo descompactado no diretorio corrente."
	else
		echo "Erro! arquivo não foi descompactado"
	fi
	sleep 2
}

# by: Elizeu de Santana / 25-05-2019 -------------------------------------------------------
function descompactarBz2() {
	### ###
	tar -xjf $CAMINHO
	if [ $? -eq 0 ]; then
		echo "Arquivo descompactado no diretorio corrente."
	else
		echo "Erro! arquivo não foi descompactado"
	fi
	sleep 2
}

# Criado by: Elizeu de Santana / 22-05-2019 ------------------------------------------------
# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function InstalarUtil() {
	### ###
	ScriptTotalHead
	tmpD="$(date)"
	tmpL=" Processo: Instalado Utilitários"
	echo -e "${ctr} \n Instalando utilitários ...  ${dlc}"
	sudo apt install aptitude
	sudo aptitude install psutils bzr i3 python-pip wget curl htop git git-core wmctrl \
		vim-nox zsh zsh-syntax-highlighting byobu ssh hollywood links nmap unzip bmon \
		gnome-tweaks pv calibre -y
	pip install --upgrade pip

	printf "\n%s" " Log Inicialização: $tmpD" "$tmpL" >>ScriptTotal.log
	echo -e "${ctr} \n Instalado utilitarios.!"
	echo -e "${cls} \n ---------------------------------------------------------------- ${dlc}"

	MenuInstacaoPrincipal
}

# by: Elizeu de Santana / 06-06-2019 -------------------------------------------------------
function UpdateUpgrade() {
	notify-send "Insira a senha root!"
	sudo apt-get update && sudo apt-get upgrade
}

