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
# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 07-06-2019 -------------------------------------------------------
function MenuInstalarProgramas() {
	e_header "Instalacao programas. Escolhas abaixo : "
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 07-06-2019 -------------------------------------------------------
function MenuMidia() {
	Titulo
	echo -e "${ctm} Menu Midias [ Video e Som ] :                                    ${dlc}"
	echo -e "${ctm} 1 - Instalar Codecs para multimidia.                             ${dlc}"
	echo -e "${ctm} 2 - Instalar VLC.                                                ${dlc}"
	echo -e "${ctm} 3 - Instalar Stream link Twitch GUI.                             ${dlc}"
	echo -e "${ctm} 4 - Instalar Chatty.                                             ${dlc}"
	echo -e "${ctm} 5 - Instalar todos os editores acima.                            ${dlc}"
	echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
	echo -e "${ctm} s - Retorna ao Menu Principal bob.                               ${dlc}"
	echo -e "${ctm} r - Retorna ao Menu instalacao Programas bob.                    ${dlc}"
	echo -e "${ctm} l - retorna ao Menu Instacao Principal bob.                      ${dlc}"
	echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
	echo -ne "${ctr} Digite número disposto acima [1 .. 5]: ${dlc}"; read opt
	case ${opt} in
	1) InstalarCodecs ;;
	2) InstalarVLC ;;
	3) InstalarStreamlinkTwitchGUI ;;
	4) Install Chatty ;;
	5) InstalarCodecs; InstalarVLC; InstalarStreamlinkTwitchGUI; Install Chatty ;;
	s) . 'bob_instalacao.sh'; MenuInstacaoPrincipal ;;
	r) MenuInstalarProgramas ;;
	l) MenuInstacaoPrincipal ;;
	*) echo -e "${ctr} Opção desconhecida. ${dlc}"; MenuMidia ;;
	esac
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 07-06-2019 -------------------------------------------------------
function MenuDesenvolvimento() {
	### ###
	Titulo
	echo -e "${ctm} Menu Desenvolvimento :                                               ${dlc}"
	echo -e "${ctm} 1 - Instalar anjuta, anjuta-extras, python-pip, python3-pip,         ${dlc}"
	echo -e "${ctm}          openjdk-8-jdk, bluefish, gpp, g++, gcc, build-essential,    ${dlc}"
	echo -e "${ctm}          mingw-w64, codeblocks, codeblocks-contrib, kdevelop         ${dlc}"
	echo -e "${ctm} 2 - Instalar Software bluefish.                                      ${dlc}"
	echo -e "${ctm} 3 - Instalar Software JavaEclipse.                                   ${dlc}"
	echo -e "${ctm} 4 - Instalar Software Python [anaconda].   						     ${dlc}"
	echo -e "${ctm} 5 - Instalar Software Glade.                                         ${dlc}"
	echo -e "${ctm} 6 - Instalar Software Androide-Studio.                               ${dlc}"
	echo -e "${ctm} 7 - Instalar todos os editores acima.                                ${dlc}"
	echo -e "${cls}  ----------------------------------------------------------------    ${dlc}"
	echo -e "${ctm} s - Retorna ao Menu Principal Bob.                                   ${dlc}"
	echo -e "${ctm} r - Retorna ao Menu instalacao Principal Bob.       		         ${dlc}"
	echo -e "${ctm} l - Retorna ao Menu instalação Programas Bob.                        ${dlc}"
	echo -e "${cls} ----------------------------------------------------------------     ${dlc}"
	echo -ne "${ctr} Digite número [1 .. 7]: "; read opt
	case $opt in
	1) InstalarDesenvolvimento ;;
	2) Instalarbluefish ;;
	3) InstalarJavaEclipse ;;
	4) CopiladorePython ;;
	5) InstalarGlade ;;
	6) InstalarAndroide ;;
	7) InstalarDesenvolvimento; Instalarbluefish; InstalarJavaEclipse; CopiladorePython; InstalarGlade; InstalarAndroide ;;
	s) . 'bob.sh'; Principal ;;
	r) . 'bob_instalacao.sh'; MenuInstacaoPrincipal ;;
	l) MenuInstalarProgramas ;;
	*) echo -e "${ctr} Opção desconhecida. ${dlc}"; MenuDesenvolvimento ;;
	esac
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 07-06-2019 -------------------------------------------------------
function MenuEditor() {
	Titulo
	echo -e "${ctm} Menu Editores de Texto :                                             ${dlc}"
	echo -e "${ctm} 1 - Instalar Editor de texto Sublime-text3.                          ${dlc}"
	echo -e "${ctm} 2 - Instalar Editor de texto Nvim 0.3.0.                             ${dlc}"
	echo -e "${ctm} 3 - Instalar Editor de texto Visual Studio Code.                     ${dlc}"
	echo -e "${ctm} 4 - Instalar Editor de texto Atom.                                   ${dlc}"
	echo -e "${ctm} 5 - Instalar Editor de texto Geany.                                  ${dlc}"
	echo -e "${ctm} 6 - Instalarf todos os editores acima.                               ${dlc}"
	echo -e "${cls}  ----------------------------------------------------------------    ${dlc}"
	echo -e "${ctm} s - Retorna ao Menu Instalacao Principal.                            ${dlc}"
	echo -e "${ctm} r - Retorna ao menu Menu Programas.                                  ${dlc}"
	echo -e "${ctm} l - Limpa historico.                                                 ${dlc}"
	echo -e "${cls}  ----------------------------------------------------------------    ${dlc}"
	echo -ne "${ctr} Digite número [1 .. 6]: "; read opt
	case $opt in
	1) InstalarSublime ;;
	2) InstalarNvim ;;
	3) InstalarVSCode ;;
	4) InstalarAtom ;;
	5) InstalarGeany ;;
	6)
		InstalarSublime
		InstalarNvim
		InstalarVSCode
		InstalarAtom
		InstalarGeany
		;;
	s)
		. 'bob_instalacao.sh'
		MenuInstacaoPrincipal
		;;
	r) MenuInstalarProgramas ;;
	l) MenuEditor ;;
	*)
		echo -e "${ctr} Opção desconhecida. ${dlc}"
		MenuEditor
		;;
	esac
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 07-06-2019 -------------------------------------------------------
function MenuNetwork() {
	### ###
	Titulo
	echo -e "${ctm} \n Menu Midias [ Video e Som ] :                                     ${dlc}"
	echo -e "${ctm} 1 - Instalar Google Crome.                                           ${dlc}"
	echo -e "${ctm} 2 - Instalar Emulador windows Wine.                                  ${dlc}"
	echo -e "${ctm} 3 - Instalar Terminology.                                            ${dlc}"
	echo -e "${ctm} 4 - Instalar Tor.                                                    ${dlc}"
	echo -e "${ctm} 5 - Instalar todos os editores acima.                                ${dlc}"
	echo -e "${cls}  ----------------------------------------------------------------    ${dlc}"
	echo -e "${ctm} s - Retorna ao Menu Instalacao Principal.                            ${dlc}"
	echo -e "${ctm} r - Retorna ao menu Menu Programas.                                  ${dlc}"
	echo -e "${ctm} l - Limpa historico.                                                 ${dlc}"
	echo -e "${cls}  ----------------------------------------------------------------    ${dlc}"
	echo -ne "${ctr} Digite número disposto acima [1 .. 5]: "
	read opt
	case $opt in
	1) InstalarGoogleCrome ;;
	2) InstalarWine ;;
	3) InstallTerminology ;;
	4) InstalarTor ;;
	5) InstalarGoogleCrome; InstalarWine; InstallTerminology; InstalarTor ;;
	s) . 'bob_instalacao.sh'; MenuInstacaoPrincipal ;;
	r) MenuInstalarProgramas ;;
	l) MenuNetwork ;;
	*) echo -e "${ctr} Opção desconhecida. ${dlc}"; MenuNetwork	;;
	esac
}

# by: Elizeu de Santana / 12-06-2019 -------------------------------------------------------
function InstalarCodecs(){
	### Codecs para multimidia ###
	Titulo
	declare -a pen=("libdvdnav4" "libdvdread4" "gstreamer1.0-plugins-bad" \
                    "gstreamer1.0-plugins-ugly" "ubuntu-restricted-extras")
	# len=${#pen[@]}
	for i in 0 1 2 3 4  ; do
		click[$i]="[ ]"
	done; c=0
	while true ; do
		Titulo
		echo -e "${ctm} 1 - ${click[0]} ${pen[0]} ${dlc}"
		echo -e "${ctm} 2 - ${click[1]} ${pen[1]} ${dlc}"
		echo -e "${ctm} 3 - ${click[2]} ${pen[2]} ${dlc}"
		echo -e "${ctm} 4 - ${click[3]} ${pen[3]} ${dlc}"
		echo -e "${ctm} 5 - ${click[4]} ${pen[4]} ${dlc}"
		echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
        echo -ne "${ctm} (s)air | Número [ 1 .. 5 ] : ${dlc}"; read opt
		if [ "${opt}" = "s" ] ; then
			break
		else
			t=$((opt-1))
			if [ "${click[${t}]}" = "[ ]" ] ; then
				click[${t}]="[x]"
			else
				click[${t}]="[ ]"
			fi
		fi	
	done
	for i in ${click[@]} ; do
		if [ "${click[${c}]}" = "[x]" ] ; then
			echo "Instalando : ${pen[${c}]}"
			if [[ ! $(which ${pen[${c}]} 2>/dev/null) ]]; then
				sudo aptitude install ${pen[${c}]} -y
			else
				echo -e "${ctm} Programa já instalado! ${dlc}"
			fi
		fi
		let $((++c))
	done
	echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
	read
	MenuMidia 						# Retornar ao fluxo
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 07-06-2019 -------------------------------------------------------
function InstalarVLC() {
	Titulo
	echo -e "${ctm} Instalando VLC ... ${dlc}"

	sudo apt install -y vlc

	echo -e "${ctm} Instalado VLC. ${dlc}"
	echo -e "${cls} ---------------------------------------------------------------- ${dlc}"

	MenuMidia # Retornar ao fluxo
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 07-06-2019 -------------------------------------------------------
function InstalarStreamlinkTwitchGUI() {
	### ###
	Titulo
	echo -e "${ctm} Instalando StreamlinkTwitchGUI ...                                           ${dlc}"
	echo -e "${ctm} Click Settings.                                                              ${dlc}"
	echo -e "${ctm} At the Streaming, set Python excutable to /usr/bin/python3.                  ${dlc}"
	echo -e "${ctm} At the Player, set Player preset to VLC media player.                        ${dlc}"
	echo -e "${ctm} At the Chat, set Chat application to Chatty and set Chatty .jar file         ${dlc}"
	echo -e "${ctm} to /opt/chatty/Chatty.jar, and check Automatically open chat of Open chat.   ${dlc}"
	echo -e "${ctm} For applying these settings, click Apply.                                    ${dlc}"
	echo -e "${ctm} Click human icon at the top right and click Sign in.                         ${dlc}"
	echo -e "${ctm} Your default browser opens Twitch login page. Login with twitch account.     ${dlc}"
	echo -e "${ctm} For making Streamlink Twitch GUI to use Twitch account, click Authorize.     ${dlc}"
	echo -e "${ctm} Settings is completed.                                                       ${dlc}"
	echo -e "${ctm} Clicking live streaming program runs VLC and Chatty, and you can watch live  ${dlc}"
	echo -e "${ctm} streaming video and receive/send comment.                                    ${dlc}"
	echo -e "${ctm} 4.1 Watch Twitch with VLC + Streamlink                                       ${dlc}"
	echo -e "${ctm} If you don't need live streaming program list and receiving/sending comment, ${dlc}"
	echo -e "${ctm} you can use VLC + Streamlink.                                                ${dlc}"
	echo -e "${ctm} \n streamlink <URL>                                                          ${dlc}"

	sudo apt install -y streamlink
	U=https://github.com/streamlink/streamlink-twitch-gui
	U=${U}/releases/download/v1.5.0/streamlink-twitch-gui-v1.5.0-linux64.tar.gz
	wget -q ${U} -O /tmp/streamlink-twitch-gui.tar.gz
	if [ "$?" = "0" ]; then
		sudo tar -xzvf /tmp/streamlink-twitch-gui.tar.gz -C /opt
		sudo apt install -y xdg-utils libgconf-2-4
		sudo /opt/streamlink-twitch-gui/add-menuitem.sh
		sudo ln -s /opt/streamlink-twitch-gui/start.sh /usr/bin/streamlink-twitch-gui
	else
		cd /tmp/
		wget https://github.com/streamlink/streamlink-twitch-gui/releases/download/v1.5.0/streamlink-twitch-gui-v1.5.0-linux64.tar.gz --no-check-certificate
		sudo tar -xzvf streamlink-twitch-gui-v1.5.0-linux64.tar.gz -C /opt
		sudo apt install -y xdg-utils libgconf-2-4
		sudo /opt/streamlink-twitch-gui/add-menuitem.sh
		sudo ln -s /opt/streamlink-twitch-gui/start.sh /usr/bin/streamlink-twitch-gui
	fi

	echo -e "${ctm} Instalado StreamlinkTwitchGUI. ${dlc}"
	echo -e "${cls} ---------------------------------------------------------------- ${dlc}"

	MenuMidia # Retornar ao fluxo
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 07-06-2019 -------------------------------------------------------
function InstallChatty() {
	### ###
	sudo apt install -y default-jre
	U=https://github.com/chatty/chatty/releases/download/v0.9.1
	U=${U}/Chatty_0.9.1.zip
	wget -q ${U} -O /tmp/Chatty.zip
	if [ "$?" = "0" ]; then
		sudo unzip /tmp/Chatty.zip -d /opt/chatty
		streamlink-twitch-gui
	else
		cd /tmp/
		wget https://github.com/chatty/chatty/releases/download/v0.9.1/Chatty_0.9.1.zip --no-check-certificate
		sudo unzip Chatty_0.9.1.zip -d /opt/chatty
		streamlink-twitch-gui
	fi
}

# by: Elizeu de Santana / 12-06-2019 -------------------------------------------------------
function InstalarDesenvolvimento(){
	### Programas para desenvolvimento ###
	Titulo
	declare -a pen=("anjuta" "anjuta-extras" "python-pip" "python3-pip" "openjdk-8-jdk" "bluefish" \
					"gpp" "g++" "gcc" "build-essential" "mingw-w64" "codeblocks" "codeblocks-contrib" "kdevelop")
	# len=${#pen[@]}
	for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 ; do
		click[$i]="[ ]"
	done; c=0
	while true ; do
		Titulo
		echo -e "${ctm} 1 - ${click[0]} ${pen[0]} ${dlc}"
		echo -e "${ctm} 2 - ${click[1]} ${pen[1]} ${dlc}"
		echo -e "${ctm} 3 - ${click[2]} ${pen[2]} ${dlc}"
		echo -e "${ctm} 4 - ${click[3]} ${pen[3]} ${dlc}"
		echo -e "${ctm} 5 - ${click[4]} ${pen[4]} ${dlc}"
		echo -e "${ctm} 6 - ${click[5]} ${pen[5]} ${dlc}"
		echo -e "${ctm} 7 - ${click[6]} ${pen[6]} ${dlc}"
		echo -e "${ctm} 8 - ${click[7]} ${pen[7]} ${dlc}"
		echo -e "${ctm} 9 - ${click[8]} ${pen[8]} ${dlc}"
		echo -e "${ctm} 10 - ${click[9]} ${pen[9]} ${dlc}"
		echo -e "${ctm} 11 - ${click[10]} ${pen[10]} ${dlc}"
		echo -e "${ctm} 12 - ${click[11]} ${pen[11]} ${dlc}"
		echo -e "${ctm} 13 - ${click[12]} ${pen[12]} ${dlc}"
		echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
        echo -ne "${ctm} (s)air | Número [ 1 .. 13 ] : ${dlc}"; read opt
		if [ "${opt}" = "s" ] ; then
			break
		else
			t=$((opt-1))
			if [ "${click[${t}]}" = "[ ]" ] ; then
				click[${t}]="[x]"
			else
				click[${t}]="[ ]"
			fi
		fi	
	done
	for i in ${click[@]} ; do
		if [ "${click[${c}]}" = "[x]" ] ; then
			echo "Instalando : ${pen[${c}]}"
			if [[ ! $(which ${pen[${c}]} 2>/dev/null) ]]; then
				sudo aptitude install ${pen[${c}]} -y
			else
				echo -e "${ctr} Programa já instalado! ${dlc}"
			fi
		fi
		let $((++c))
	done
	echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
	read
	MenuDesenvolvimento 						# Retornar ao fluxo
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 07-06-2019 -------------------------------------------------------
function InstalarGlade() {
	### ###
	Titulo
	echo -e "${ctr} Instalando glade ... ${dlc}"

	git clone git://git.gnome.org/glade

	echo -e "${ctr} Instalado glade. ${dlc}"
	echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
	sleep 5

	MenuDesenvolvimento # Retornar ao fluxo
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 07-06-2019 -------------------------------------------------------
function InstalarAndroide() {
	### ###
	Titulo
	echo -e "${ctr} Instalando android-studio ... ${dlc}"

	sudo snap install android-studio --classic

	echo -e "${ctr} Instalado android-studio. ${dlc}"
	echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
	sleep 5

	MenuDesenvolvimento # Retornar ao fluxo
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 07-06-2019 -------------------------------------------------------
function CopiladorePython() {
	### ###
	Titulo
	echo -e "${ctr} Instalando Anaconda. ${dlc}"

	tmpL=" Processo: Instalado Anaconda"
	curl -O https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
	mv Anaconda3-2019.03-Linux-x86_64.sh /tmp
	cd /tmp
	bash Anaconda3-2019.03-Linux-x86_64.sh

	echo -e "${ctr} Instalado Anaconda. ${dlc}"
	echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
	sleep 5

	MenuDesenvolvimento # Retornar ao fluxo
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 07-06-2019 -------------------------------------------------------
function InstalarJavaEclipse() {
	### ###
	Titulo
	echo -e "${ctm} Instalando eclipse. ${dlc}"

	wget http://ftp.jaist.ac.jp/pub/eclipse/technology/epp/downloads/release/2019-03/R/eclipse-java-2019-03-R-linux-gtk-x86_64.tar.gz
	sudo tar -zxvf eclipse-java-2019-*-R-linux-gtk-x86_64.tar.gz -C /usr/
	sudo ln -s /usr/eclipse/eclipse /usr/bin/eclipse

	echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
	sleep 5

	sudo subl /usr/share/applications/eclipse.desktop
	#[Desktop Entry]
	#Encoding=UTF-8
	#Name=Eclipse IDE
	#Comment=Eclipse IDE
	#Exec=/usr/bin/eclipse
	#Icon=/usr/eclipse/icon.xpm
	#Terminal=false
	#Type=Application
	#StartupNotify=false
	#nodejs
	#npm
	#Configure the workspace
	#/home/elizeu/eclipse-workspace

	MenuDesenvolvimento # Retornar ao fluxo
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 07-06-2019 -------------------------------------------------------
function InstalarSublime() {
	### ###
	Titulo
	echo -e "${ctr} Instalando Sublime-text3  [wget]... ${dlc}"

	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	sudo apt install apt-transport-https
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	sudo apt-get update
	sudo apt install sublime-text
	
	# config:----------------------------------
	# https://packagecontrol.io/installation copia/cola (show/console)key
	# ctrl+shift+p - install packet
	# theme ayu-dark
	# query
	# Alingtab
	# anaconda
	# wakatime key(8abf9130-a506-4388-be35-cd525002d176)

	echo -e "${ctr} Instalado Sublime-text3. ${dlc}"
	echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
	sleep 5
	MenuEditor # Retornar ao fluxo
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 07-06-2019 -------------------------------------------------------
function InstalarNvim() {
	### ###
	Titulo
	echo -e "${ctm} Instalando Nvim  [wget]... ${dlc}"

	#unzip neovim-init.vim-master.zip
	#cd neovim-init.vim-master
	#bash ./install.sh

	echo -e "${ctr} [*] Preparando Neovim config diretorio ... ${dlc}"
	mkdir -p ~/.config/nvim

	echo -e "${ctr} [*] App instalando Neovim e dependencias (Python 3 and git), e dependencias para tagbar (exuberant-ctags) ... ${dlc}"
	sudo apt install neovim python3 python3-pip git exuberant-ctags -y

	echo -e "${ctr} [*] Pip instalando virtualenv para containerize Neovim dependencias  ... ${dlc}"
	python3 -m pip install virtualenv
	python3 -m virtualenv -p python3 ~/.config/nvim/env

	echo -e "${ctr} [*] Ativando virtualenv e pip instalando Neovim (for Python plugin support), libraries for async autocompletion support (jedi, psutil, setproctitle), and library for pep8-style formatting (yapf) ... ${dlc}"
	source ~/.config/nvim/env/bin/activate
	pip install neovim==0.2.6 jedi psutil setproctitle yapf
	deactivate

	echo -e "${ctr} [*] Downloading vim-plug, the best minimalistic vim plugin manager ... ${dlc}"
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	
	# (Optional but recommended) Install a nerd font for icons and a beautiful airline bar (https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts) (I'll be using Iosevka for Powerline)
	echo -e "${ctr} [*] Downloading patch font into ~/.local/share/fonts ... ${dlc}"
	curl -fLo ~/.local/share/fonts/Iosevka\ Term\ Nerd\ Font\ Complete.ttf --create-dirs https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Term%20Nerd%20Font%20Complete.ttf

	# (Optional) Alias vim -> nvim
	echo -e "${ctr} [*] Aliasing vim -> nvim, remember to source ~/.bashrc ... ${dlc}"
	echo -e "alias vim='nvim'" >> ~/.bashrc

	# Enter Neovim and install plugins using a temporary init.vim, which avoids warnings about missing colorschemes, functions, etc
	echo -e "${ctr} [*] Running :PlugInstall within nvim ... ${dlc}"
	sed '/call plug#end/q' init.vim > ~/.config/nvim/init.vim
	nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall'
	rm ~/.config/nvim/init.vim

	# Copy init.vim in current working directory to nvim's config location ...
	echo -e "${ctr} [*] Copying init.vim -> ~/.config/nvim/init.vim ${dlc}"
	cp init.vim ~/.config/nvim/

	echo -e "${ctr} [+] Done, welcome to \033[1m\033[92mNeoVim\033[0m! Try it by running: nvim/vim. Want to customize it? Modify ~/.config/nvim/init.vim ${dlc}"


	echo -e "${ctr} Instalado Nvim. ${dlc}"
	echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
	sleep 5
	MenuEditor # Retornar ao fluxo
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 07-06-2019 -------------------------------------------------------
function InstalarVSCode() {
	### ###
	Titulo
	echo -e "${ctm} 1 - Vscode microsoft. ${dlc}"
	echo -e "${ctm} 2 - Vscodium community sem telemetria. ${dlc}"
	echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    echo -ne "${ctm} Número [ 1 or 2 ] : ${dlc}"; read opt
	if [ "${opt}" = "1" ] ; then
		sudo apt install software-properties-common apt-transport-https -y
		wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
		sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
		sudo apt update
		sudo apt install code
	else
		wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
		echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list
		sudo apt update
		sudo apt install codium
	fi
	echo -e "${ctr} Instalado VSCode. ${dlc}"
	echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
	sleep 5
	MenuEditor # Retornar ao fluxo
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 07-06-2019 -------------------------------------------------------
function InstalarAtom() {
	### ###
	Titulo
	echo -e "${ctm} Instalando Atom... ${dlc}"

	sudo add-apt-repository ppa:webupd8team/atom
	sudo apt-get update
	sudo apt-get install atom -y

	echo -e "${ctm} Instalado Atom. ${dlc}"
	echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
	sleep 5
	MenuEditor # Retornar ao fluxo
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 07-06-2019 -------------------------------------------------------
function InstalarGeany() {
	### ###
	Titulo
	echo -e "${ctm} Instalando Geany... ${dlc}"

	sudo apt-get install geany -y

	echo -e "${ctm} Instalado Geany. ${dlc}"
	echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
	sleep 5
	MenuEditor # Retornar ao fluxo
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 07-06-2019 -------------------------------------------------------
function InstalarGoogleCrome() {
	### ###
	Titulo
	echo -e "${ctm} 1 - google chrome stable. ${dlc}"
	echo -e "${ctm} 2 - epiphany browser. ${dlc}"
	echo -e "${ctm} 2 - chromium browser. ${dlc}"
	echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
    echo -ne "${ctm} Número [ 1 2 3 ] : ${dlc}"; read opt
	case ${opt} in
	1)
		cd ~/Downloads
		curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
		sudo dpkg -i google-chrome-stable_current_amd64.deb
		rm ~/Download/google-chrome-stable_current_amd64.deb
		;;
	2)
		sudo apt-get install epiphany-browser links -y
		;;
	3)
		sudo snap install chromium
		;;
	*)
	esac
	echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
	MenuNetwork # Retornar ao fluxo
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 07-06-2019 -------------------------------------------------------
function InstalarWine() {
	### ###
	Titulo
	echo -e "${ctm} Instalando wine playonlinux ... ${dlc}"

	wget -nc https://dl.winehq.org/wine-builds/winehq.key
	sudo apt-key add winehq.key
	sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
	sudo apt update
	sudo apt install winehq-stable
	winecfg
	winetricks

	wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -
	sudo wget http://deb.playonlinux.com/playonlinux_bionic.list -O /etc/apt/sources.list.d/playonlinux.list
	sudo apt-get update
	sudo apt-get install playonlinux
	
	echo -e "${ctm} Instalado wine playonlinux. ${dlc}"
	echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
	MenuNetwork # Retornar ao fluxo
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 07-06-2019 -------------------------------------------------------
function InstallTerminology() {
	### ###
	Titulo
	echo -e "${ctm} Instalando terminology tilix... ${dlc}"

	sudo apt install tilix terminology -y

	echo -e "${ctm} Instalado terminology tilix. ${dlc}"
	echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
	MenuNetwork # Retornar ao fluxo
}

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 07-06-2019 -------------------------------------------------------
function InstalarTor() {
	Titulo
	echo -e "${ctm} Instalando tor torbrowser-launcher ... ${dlc}"

	sudo apt install -y tor torbrowser-launcher

	echo -e "${ctm} Instalado tor torbrowser-launcher. ${dlc}"
	echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
	MenuNetwork # Retornar ao fluxo
}
