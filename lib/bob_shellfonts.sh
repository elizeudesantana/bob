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
if [ -f "${utilsLocation}" ]; then
    source "${utilsLocation}";
else
    e_error "Erro carregando ${utilsLocation}"; Sair;
fi
# -----------------------------------------------------------------------------------------

#. 'bob_util.sh'
# by: Elizeu de Santana / 12-06-2019 -------------------------------------------------------
function MenuInstalacaoFonts() {
	Titulo
	echo -e "${ctm} Menu Instalação de Fonts :											 ${dlc}"
	echo -e "${ctm} 1 - Instalar Fira code Fonts.  										 ${dlc}"
	echo -e "${ctm} 2 - Instalar Powerline Symbols Fonts & fonts-powerline all 2.6-1	 ${dlc}"
	echo -e "${ctm} 3 - Instalar Tweak para configurar ubuntu.							 ${dlc}"
	echo -e "${ctm} 4 - Instalar Nerd Fonts.											 ${dlc}"
	echo -e "${ctm} 5 - Instalar Oh-my-Zsh.												 ${dlc}"
	echo -e "${ctm} 6 - Instalar Gedit & Terminal -> theme Dracula. 				 	 ${dlc}"
	echo -e "${cls} ----------------------------------------------------------------  	 ${dlc}"
	echo -e "${ctm} s - Retorna ao Menu Principal Bob.									 ${dlc}"
	echo -e "${ctm} l - Retorna ao Menu Instalação Bob.									 ${dlc}"
	echo -e "${cls} ----------------------------------------------------------------  	 ${dlc}"
	echo -ne "${ctr} Digite a opção :  ${dlc}";	read opt
	case $opt in
	1) FontFiraCode ;;
	2) InstalarFontsPowerline ;;
	3) InstalarTweak ;;
	4) InstalarNerdFonts ;;
	5) ZSHInstall ;;
	6) InstalarThemeDraculaTerminal ;;
	s) . 'bob.sh'; Principal ;;
	l) . 'bob.instalacao.sh'; MenuInstacaoPrincipal ;;
	*) echo -e "${ctr} Opção desconhecida. ${dlc}";	MenuInstalacaoFonts	;;
	esac
}

# by: Elizeu de Santana / 12-06-2019 -------------------------------------------------------
function InstalarThemeDraculaTerminal(){
	### Com Solarize  Terminal e Gedit ###
	# https://github.com/dracula/gnome-terminal
	git clone https://github.com/GalaticStryder/gnome-terminal-colors-dracula
	cd gnome-terminal-colors-dracula; ./install.sh
	
	wget https://raw.githubusercontent.com/dracula/gedit/master/dracula.xml
	mkdir $HOME/.local/share/gedit/
	mkdir $HOME/.local/share/gedit/styles/
	mv dracula.xml $HOME/.local/share/gedit/styles/
}

# falta wheater
 
# ----------------------------------------------------------------------------------------
													  # function InstalargoogleNotoEmoji()
# ----------------------------------------------------------------------------------------
function InstalargoogleNotoEmoji() {
	fonts_dir="${HOME}/.local/share/fonts"
	if [ ! -d "${fonts_dir}" ]; then
		e_error "Não encontrado diretorio, $fonts_dir $(e_error)"
		mkdir -p "${fonts_dir}"
		e_arrow -d "Configuração criado diretorio, $fonts_dir terminado. $(e_success)"
	else
		e_arrow -d "Configuração diretorio, $fonts_dir terminado. $(e_success)"
	fi
	file_path="${HOME}/.local/share/fonts/NotoEmoji-Regular.ttf"
	file_url="https://noto-website-2.storage.googleapis.com/pkgs/NotoEmoji-unhinted.zip"
	file_local="${notoemojiLocation}"
	if [ ! -e "${file_path}" ]; then
		e_error "Não encontrado font, ${file_path} $(e_error)"
		wget -O "${file_local}" "${file_url}"
		sudo unzip $file_local $fonts_dir
		e_arrow -d "Configuração instalado fonts, google Noto Emoji terminado. $(e_success)"
	else
		e_arrow -d "Configuração existe fonts, google Noto Emoji terminado. $(e_success)"
	fi
}
# ----------------------------------------------------------------------------------------
															# function InstalarNerdFonts()
													  # by: Elizeu de Santana / 17-06-2019 
													  # by: Elizeu de Santana / 12-06-2019 
# ----------------------------------------------------------------------------------------
function InstalarNerdFonts() {
	fonts_dir="${HOME}/.local/share/fonts"
	if [ ! -d "${fonts_dir}" ]; then
		e_error "Não encontrado diretorio, $fonts_dir $(e_error)"
		mkdir -p "${fonts_dir}"
		e_arrow -d "Configuração criado diretorio, $fonts_dir terminado. $(e_success)"
	else
		e_arrow -d "Configuração diretorio, $fonts_dir terminado. $(e_success)"
	fi
	file_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Ubuntu.zip"
	file_local="${nerdfontLocation}"
	file_path="${HOME}/.local/share/fonts/Ubuntu Bold Italic Nerd Font Complete.ttf"
	if [ ! -e "${file_path}" ]; then
		e_error "Não encontrado font, ${file_path} $(e_error)"
		wget -O "${file_local}" "${file_url}"
		sudo unzip $file_local $fonts_dir
		e_arrow -d "Configuração instalado fonts, Nerd Fonts terminado. $(e_success)"
	else
		e_arrow -d "Configuração existe fonts, Nerd Fonts terminado. $(e_success)"
	fi
}
# ----------------------------------------------------------------------------------------
													   # function InstalarFontsPowerline()
													  # by: Elizeu de Santana / 17-06-2019
													  # by: Elizeu de Santana / 12-06-2019
				   									  # by: Elizeu de Santana / 06-06-2019
# ----------------------------------------------------------------------------------------									
function InstalarFontsPowerline() {
	fonts_dir="${HOME}/.local/share/fonts"
	if [ ! -d "${fonts_dir}" ]; then
		e_error "Não encontrado diretorio, $fonts_dir $(e_error)"
		mkdir -p "${fonts_dir}"
		e_arrow -d "Configuração criado diretorio, $fonts_dir terminado. $(e_success)"
	else
		e_arrow -d "Configuração diretorio, $fonts_dir terminado. $(e_success)"
	fi
	file_path[0]="${HOME}/.local/share/fonts/PowerlineSymbols.otf"
	file_path[1]="${HOME}/.local/share/fonts/10-powerline-symbols.conf"
	file_url[0]="https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf"
	file_url[0]="https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf"
	if [ ! -e "${file_path[0]}" ]; then
		e_error "Não encontrado font, ${file_path[0]} $(e_error)"
		wget -O "${file_path[0]}" "${file_url[0]}"
		e_arrow -d "Configuração instalado font, ${file_path[0]} terminado. $(e_success)"
		e_error "Não encontrado font, ${file_path[1]} $(e_error)"
		wget -O "${file_path[1]}" "${file_url[1]}"
		e_arrow -d "Configuração instalado font, ${file_path[1]} terminado. $(e_success)"
	else
		e_arrow -d "Configuração existe font, ${file_path[0]} terminado. $(e_success)"
		e_arrow -d "Configuração existe font, ${file_path[1]} terminado. $(e_success)"
	fi

	#sudo apt-get install fonts-powerline

	# git clone https://github.com/powerline/fonts.git --depth=1
	# cd fonts && ./install.sh
	# cd .. && rm -rf fonts
}
# ----------------------------------------------------------------------------------------
																 # function FontFiraCode()
													  # by: Elizeu de Santana / 17-06-2019
													  # by: Elizeu de Santana / 12-06-2019
# ----------------------------------------------------------------------------------------
function FontFiraCode() {
	# https://github.com/tonsky/FiraCode/releases
	fonts_dir="${HOME}/.local/share/fonts"
	if [ ! -d "${fonts_dir}" ]; then
		e_error "Não encontrado diretorio, $fonts_dir $(e_error)"
		mkdir -p "${fonts_dir}"
		e_arrow -d "Configuração criado diretorio, $fonts_dir terminado. $(e_success)"
	else
		e_arrow -d "Configuração diretorio, $fonts_dir terminado. $(e_success)"
	fi

	for type in Bold Light Medium Regular Retina; do
		file_path="${HOME}/.local/share/fonts/FiraCode-${type}.ttf"
		file_url="https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true"
		if [ ! -e "${file_path}" ]; then
			e_error "$Não encontrado font, ${file_path} $(e_error)"
			wget -O "${file_path}" "${file_url}"
			e_arrow -d "Configuração instalado font, ${file_path} terminado. $(e_success)"
		else
			e_arrow -d "Configuração existe font, ${file_path} terminado. $(e_success)"
		fi
	done
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
function InstalarTweak(){
	### ###
	Titulo
	sudo apt install tweak
	MenuInstalacaoFonts
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 07-06-2019 -------------------------------------------------------
function ZSHInstall() {
	Titulo
	UpdateUpgrade
	sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
	cd ~; sudo rm .zshrc
	sudo cat Bak_zshrc.txt > $HOME/.zshrc
	sudo chsh -s /bin/zsh
	echo -e "${ctr}  Estará disponivel após log-out or reboot do sistema! ${dlc}"
	echo -ne "${ctr}  Reiniciar o sistema (s/n) ? ${dlc}"; read opt
	echo -e "${cls} \n ---------------------------------------------------------------- ${dlc}"
	if [ $opt == "s"]; then
		reboot
	else		
		MenuInstalacaoFonts # Retorna ao fluxo
	fi
}
