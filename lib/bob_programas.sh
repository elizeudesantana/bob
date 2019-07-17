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
# instalacao="/Projetos/bob";                                          # Diretorio de Instalação apartir de HOME
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
# -----------------------------------------------------------------------------------------

# by: Elizeu de Santana / 21-05-2019 -------------------------------------------------------
# by: Elizeu de Santana / 07-06-2019 -------------------------------------------------------
function MenuInstalarProgramas() {
	e_header "Instalacao programas. Escolhas abaixo : "
}
# -----------------------------------------------------------------------------------------
													             # ( function Depen_Jason )
# -----------------------------------------------------------------------------------------
function ___Dependencia(){	
	local Yn="y"
	# -----------------------------------------------------------------------------------------
	# 	codecs_dp=( "libdvdnav4" "libdvdread4" "gstreamer1[0]_plugins_bad" \
    #         "gstreamer1[0]_plugins_ugly" "ubuntu_restricted_extras" );
    #   develop_dp=( "kdevelop" "codeblocks_contrib" "codeblocks" "mingw_w64"\
    #         "build_essential" "gcc" "g++" "gpp" "bluefish_plugins" "bluefish" \
    #         "openjdk[8]_jdk" "python3_pip" "python_pip" "anjuta_extra" "anjuta" );
    #   browser_dp=( "google" "links" "chromium" "epiphany_browser" "tor" \
    #         "torbrowser_launcher" );
    #   diversos_dp=( "tilix" "terminology" "playonlinux" "wine" "geany" "atom" \
    #         "codium" "Neovim" "code" "sublime_text" "eclipse" "Anaconda3" \
    #         "android_studio" "Glade" "Chatty_StreamlinkTwitchGUI" "StreamlinkTwitchGUI" \
    #         "vlc");
	#   outros_dp=( "libgdbm-dev" "tmux-xpanes" "ansible" "zlib1g-dev" "libgdbm3" "libffi-dev" 
	# 	"libncurses5-dev" "libreadline6-dev" "libyaml-dev" "libssl-dev" "build-essential" 
	# 	"bison" "autoconf" "rvm" "handbrake-cli" "vim" "silentcast" "yad" "xdg-utils" 
	# 	"python-cairo" "python-gobject"	"wmctrl" "wininfo" "xdotool" "x11-xserver-utils" 
	# 	"libav-tools" "php7.2-opcache" "php7.2-readline" "php7.2-json" "php7.2-common" 
	# 	"php7.2-cli" "php-common" "php7.2-mysql" "libapache2-mod-php7.2" "php-gettext" 
	# 	"php7.2-pgsql" "phppgadmin" "php7.2" "mysql-server" "postgresql-contrib" "postgresql"
	# 	"mysql-workbench" "tree"  "telnet" "sl" "thefuck" "silversearcher-ag" "nmap" "python-pip"
	# 	"mercurial" "jq" "imagemagick" "id3tool" "hollywood" "groff" "git-core" "docker-compose"
	# 	"docker.io" "curl" "cowsay" "cmatrix" "build-essential" "awscli" "neofetch" "irssi" "htop"
	# 	"tput" "figlet" "awk" "grep" "nmcli" "byobu" "aptitude" "xampp" )
	# -----------------------------------------------------------------------------------------
	desenvolvimentoNome[0]="kdevelop";
	desenvolvimentoDescription[0]="integrated development environment for C/C++ and other languages";
	desenvolvimentoversion[0]="4:5.2.1-1ubuntu4";
	desenvolvimentoHomepage[0]="https://www.kdevelop.org/";
	desenvolvimentoInstall[0]="sudo apt install kdevelop -${Yn}";
	# -----------------------------------------------------------------------------------------
	desenvolvimentoNome[1]="codeblocks_contrib";
	desenvolvimentoDescription[1]="contrib plugins for Code::Blocks IDE";
	desenvolvimentoversion[1]="16.01+dfsg-2.1";
	desenvolvimentoHomepage[1]="http://codeblocks.org";
	desenvolvimentoInstall[1]="sudo apt install codeblocks-contrib -${Yn}";
	# -----------------------------------------------------------------------------------------
	desenvolvimentoNome[2]="codeblocks";
	desenvolvimentoDescription[2]="Code::Blocks integrated development environment (IDE)";
	desenvolvimentoversion[2]="16.01+dfsg-2.1";
	desenvolvimentoHomepage[2]="http://codeblocks.org";
	desenvolvimentoInstall[2]="sudo apt install codeblocks -${Yn}";
	# -----------------------------------------------------------------------------------------
	desenvolvimentoNome[3]="mingw_w64";
	desenvolvimentoDescription[3]="Development environment targeting 32- and 64-bit Windows";
	desenvolvimentoversion[3]="5.0.3-1";
	desenvolvimentoHomepage[3]="http://mingw-w64.sf.net";
	desenvolvimentoInstall[3]="sudo apt install mingw-w64 -${Yn}";
	# -----------------------------------------------------------------------------------------
	desenvolvimentoNome[4]="build_essential";
	desenvolvimentoDescription[4]="Informational list of build-essential packages";
	desenvolvimentoversion[4]="12.4ubuntu1";
	desenvolvimentoHomepage[4]="https://www.ubuntuupdates.org/build-essential";
	desenvolvimentoInstall[4]="sudo apt install build-essential -${Yn}";
	# -----------------------------------------------------------------------------------------
	desenvolvimentoNome[5]="gcc";
	desenvolvimentoDescription[5]="GNU C compiler";
	desenvolvimentoversion[5]="4:7.4.0-1ubuntu2.3";
	desenvolvimentoHomepage[5]="https://www.ubuntuupdates.org/package/core/bionic/main/security/gcc-defaults";
	desenvolvimentoInstall[5]="sudo apt install gcc -${Yn}";
	# -----------------------------------------------------------------------------------------
	desenvolvimentoNome[6]="g_plus_plus";
	desenvolvimentoDescription[6]="GNU C++ compiler";
	desenvolvimentoversion[6]="4:7.4.0-1ubuntu2.3";
	desenvolvimentoHomepage[6]="https://www.ubuntuupdates.org/package/core/bionic/main/security/gcc-defaults";
	desenvolvimentoInstall[6]="sudo apt install g++ -${Yn}";
	# -----------------------------------------------------------------------------------------
	desenvolvimentoNome[7]="gpp";
	desenvolvimentoDescription[7]="A general-purpose preprocessor with customizable syntax";
	desenvolvimentoversion[7]="2.24-3build1";
	desenvolvimentoHomepage[7]="http://www.nothingisreal.com/gpp/";
	desenvolvimentoInstall[7]="sudo apt install gpp -${Yn}";
	# -----------------------------------------------------------------------------------------
	desenvolvimentoNome[8]="bluefish_plugins";
	desenvolvimentoDescription[8]="advanced Gtk+ text editor (plugins)";
	desenvolvimentoversion[8]="2.2.10-1";
	desenvolvimentoHomepage[8]="http://bluefish.openoffice.nl";
	desenvolvimentoInstall[8]="sudo apt install bluefish-plugins -${Yn}";
	# -----------------------------------------------------------------------------------------
	desenvolvimentoNome[9]="bluefish";
	desenvolvimentoDescription[9]="advanced Gtk+ text editor for web and software development";
	desenvolvimentoversion[9]="2.2.10-1";
	desenvolvimentoHomepage[9]="http://bluefish.openoffice.nl";
	desenvolvimentoInstall[9]="sudo apt install bluefish -${Yn}";
	# -----------------------------------------------------------------------------------------
	desenvolvimentoNome[10]="openjdk[8]_jdk";
	desenvolvimentoDescription[10]="OpenJDK Development Kit (JDK)";
	desenvolvimentoversion[10]="8u212-b03-0ubuntu1.18.04.1";
	desenvolvimentoHomepage[10]="http://openjdk.java.net/";
	desenvolvimentoInstall[10]="sudo apt install openjdk-8-jdk -${Yn}";
	# -----------------------------------------------------------------------------------------
	desenvolvimentoNome[11]="python3";
	desenvolvimentoDescription[11]="Python package installer";
	desenvolvimentoversion[11]="9.0.1-2";
	desenvolvimentoHomepage[11]="https://pip.pypa.io/en/stable/";
	desenvolvimentoInstall_11=( 														        # python 3 & pip
		"sudo apt install python3 -${Yn}"
		"sudo apt install python3-pip -${Yn}" );
	desenvolvimentoInstall_11A=(  														   # python3, pip & venv
		"python3 -V"
		"apt list --installed | grep python"
		"sudo apt-get upgrade python3"
		"sudo apt install python3-pip -${Yn}"
		"sudo apt install python3-venv -${Yn}" );
	desenvolvimentoInstall_11B=(  														  # python 3.7.4 tarball
		"wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tar.xz" 			   # tarball a  ser copilado
		"Ned Deily (key ids: AA65421D, 6F5E1540, and Apple Developer ID DJ3H93M7VJ)" 	         # chave publica
		"sudo apt-get install dirmngr" 													# evitar ataques hackers
		"gpg --recv-key AA65421D" 														 # baixa a chave publica
		"wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tar.xz.asc" 			# chave para verificação
		"gpg --verify Python-3.7.4.tar.xz.asc" 													   # verificação
		"sudo cp ~/Download/Python-3.7.4.tar.xz /usr/src/"
		"cd /usr/src"
		"sudo tar -xf Python-3.7.4.tar.xz"
																		# bibliotecas necessarias para copilação
		"sudo apt-get install build-essential checkinstall zlib1g zlib1g-dev openssl" 
		"sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev 
			libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev"
		"sudo apt-get install blt-dev docutils-common libbluetooth-dev libdb-dev 
			libdb5.3-dev libffi-dev libmpdec-dev libxss-dev net-tools 
			python-babel-localedata python3-alabaster python3-babel python3-docutils 
			python3-imagesize python3-jinja2 python3-markupsafe python3-pygments 
			python3-roman python3-sphinx python3-tz sphinx-common cl-dev tcl8.6-dev 
			time tk8.6-blt2.5 tk8.6-dev x11proto-scrnsaver-dev xvfb"
		"cd Python-3.7.4"
		"sudo ./configure"
		"sudo make altinstall" 								# instalar sem retirar a versão anterior do systema
		"sudo python3.7 -m pip install requests" );											    # pip e modulos
	desenvolvimentoInstall_11C=( 
		"sudo pip3 install nltk" 														     # Instalar pacotes
		"sudo pip3 install pint"
		"sudo pip3 install pymongo"
		"sudo pip3 install pyyaml"
		"sudo pip3 install plac"
		"sudo pip3 install cymem"
		"sudo pip3 install preshed"
		"sudo pip3 install srsly"
		"sudo pip3 install tqdm"
		"sudo pip3 install numpy"
		"sudo pip3 install blis"
		"sudo pip3 install wasabi"
		"sudo pip3 install murmurhash"
		"sudo pip3 install thinc"
		"sudo pip3 install spacy"
		"sudo pip3 install sqlalchemy"
		"sudo pip3 install pyhton-dateutil"
		"sudo pip3 install mathparse"
		"sudo pip3 install chatterbot"
		"sudo pip3 install chatterbot_corpus"
		"sudo pip3 install tweepy" );
	# -----------------------------------------------------------------------------------------
	desenvolvimentoNome[12]="python_pip";
	desenvolvimentoDescription[12]="Python package installer";
	desenvolvimentoversion[12]="9.0.1-2.3~ubuntu1.18.04.1";
	desenvolvimentoHomepage[12]="https://pip.pypa.io/en/stable/";
	desenvolvimentoInstall[12]="sudo apt install python-pip -${Yn}";
	# -----------------------------------------------------------------------------------------
	desenvolvimentoNome[13]="anjuta_extra";
	desenvolvimentoDescription[13]="plugins and extras for anjuta";
	desenvolvimentoversion[13]="3.26.0-3";
	desenvolvimentoHomepage[13]="http://www.anjuta.org/";
	desenvolvimentoInstall[13]="sudo apt install anjuta-extra -${Yn}";
	# -----------------------------------------------------------------------------------------
	desenvolvimentoNome[14]="anjuta";
	desenvolvimentoDescription[14]="GNOME development IDE, for C/C++";
	desenvolvimentoversion[14]="2:3.28.0-1";
	desenvolvimentoHomepage[14]="http://www.anjuta.org/";
	desenvolvimentoInstall[14]="sudo apt install anjuta -${Yn}";
	# -----------------------------------------------------------------------------------------
	browsersNome[0]="google";
	browsersDescription[0]="google chrome stable";
	browsersversion[0]="Versão 75.0.3770.90 (Versão oficial) 64 bits";
	browsersHomepage[0]="http://www.google.com/";
	browsersInstall[0]="curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
		sudo dpkg -i google-chrome-stable_current_amd64.deb && \
		rm google-chrome-stable_current_amd64.deb";
	# -----------------------------------------------------------------------------------------
	browsersNome[1]="links";
	browsersDescription[1]="Web browser running in both graphics and text mode";
	browsersversion[1]="3.28.5-0ubuntu1";
	browsersHomepage[1]="http://links.twibright.com/";
	browsersInstall[1]="sudo apt install links2 -${Yn}";
	# -----------------------------------------------------------------------------------------
	browsersNome[2]="chromium";
	browsersDescription[2]="Chromium web browser, open-source version of Chrome";
	browsersversion[2]="75.0.3770.100";
	browsersHomepage[2]="canonical";
	browsersInstall[2]="sudo snap install chromium";
	# -----------------------------------------------------------------------------------------
	browsersNome[3]="epiphany_browser";
	browsersDescription[3]="Intuitive GNOME web browser";
	browsersversion[3]="3.28.5-0ubuntu1";
	browsersHomepage[3]="https://wiki.gnome.org/Apps/Web";
	browsersInstall[3]="sudo apt install epiphany-browser -${Yn}";
	# -----------------------------------------------------------------------------------------
	browsersNome[4]="tor";
	browsersDescription[4]="anonymizing overlay network for TCP Tor";
	browsersversion[4]="0.3.5.8-1~bionic+1";
	browsersHomepage[4]="https://www.torproject.org/";
	browsersInstall[4]="sudo apt install tor -${Yn}";
	# -----------------------------------------------------------------------------------------
	browsersNome[5]="torbrowser_launcher";
	browsersDescription[5]="helps download and run the Tor Browser Bundle";
	browsersversion[5]="0.2.9-2";
	browsersHomepage[5]="https://micahflee.com/torbrowser-launcher/";
	browsersInstall[5]="sudo apt install torbrowser-launcher -${Yn}";
	# -----------------------------------------------------------------------------------------
	codecsNome[0]="libdvdnav4";
	codecsDescription[0]="DVD navigation library";
	codecsversion[0]="6.0.0-1";
	codecsHomepage[0]="https://dvdnav.mplayerhq.hu/";
	codecsInstall[0]="sudo apt install libdvdnav4 -${Yn}";
	# -----------------------------------------------------------------------------------------
	codecsNome[1]="libdvdread4";
	codecsDescription[1]="library for reading DVDs";
	codecsversion[1]="6.0.0-1";
	codecsHomepage[1]="https://dvdnav.mplayerhq.hu/";
	codecsInstall[1]="sudo apt install libdvdread4 -${Yn}";
	# -----------------------------------------------------------------------------------------
	codecsNome[2]="gstreamer1[0]_plugins_bad";
	codecsDescription[2]="GStreamer plugins from the bad set";
	codecsversion[2]="1.14.4-1ubuntu1~ubuntu18.04.1";
	codecssHomepage[2]="https://gstreamer.freedesktop.org";
	codecsInstall[2]="sudo apt install gstreamer1.0-plugins-bad -${Yn}";
	# -----------------------------------------------------------------------------------------
	codecsNome[3]="gstreamer1[0]_plugins_ugly";
	codecsDescription[3]="GStreamer plugins from the ugly set";
	codecsversion[3]="1.14.4-1~ubuntu18.04.1";
	codecsHomepage[3]="https://gstreamer.freedesktop.org";
	codecsInstall[3]="sudo apt install gstreamer1.0-plugins-ugly -${Yn}";
	# -----------------------------------------------------------------------------------------
	codecsNome[4]="ubuntu_restricted_extras";
	codecsDescription[4]="Commonly used media codecs and fonts for Ubuntu";
	codecsversion[4]="66";
	codecsHomepage[4]="https://www.ubuntuupdates.org/ubuntu-restricted-extras";
	codecsInstall[4]="sudo apt install ubuntu-restricted-extras -${Yn}";
	# -----------------------------------------------------------------------------------------
	diversosNome[0]="vlc";
	diversosDescription[0]="multimedia player and streamer";
	diversosversion[0]="3.0.3-1-1ubuntu1 and others";
	diversosHomepage[0]="https://www.videolan.org/vlc/index.pt-BR.html";
	diversosInstall[0]="sudo apt install vlc -${Yn}";
	# skins
	# https://www.videolan.org/vlc/download-skins2-go.php?url=vlc-skins.zip
	# ~/.local/share/vlc/skins2
	# -----------------------------------------------------------------------------------------
	diversosNome[1]="StreamlinkTwitchGUI";
	diversosDescription[1]="Chat application to Chatty";
	diversosversion[1]="v1.5.0-linux64";
	diversosHomepage[1]="https://streamlink.github.io/streamlink-twitch-gui/";
	diversosInstall[1]="sudo apt install streamlink -${Yn} && \
		URL=https://github.com/streamlink/streamlink-twitch-gui && \
		URL=/releases/download/v1.5.0/streamlink-twitch-gui-v1.5.0-linux64.tar.gz && \
		wget -q -O /tmp/streamlink-twitch-gui.tar.gz && \
		sudo tar -xzvf /tmp/streamlink-twitch-gui.tar.gz -C /opt && \
		sudo apt install xdg-utils libgconf-2-4 -${Yn} && \
		sudo /opt/streamlink-twitch-gui/add-menuitem.sh && \
		sudo ln -s /opt/streamlink-twitch-gui/start.sh /usr/bin/streamlink-twitch-gui";

	# At the Streaming, set Python excutable to /usr/bin/python3.
	# At the Player, set Player preset to VLC media player.
	# At the Chat, set Chat application to Chatty and set Chatty .jar file
	# to /opt/chatty/Chatty.jar, and check Automatically open chat of Open chat.
	# For applying these settings, click Apply.
	# Click human icon at the top right and click Sign in.
	# Your default browser opens Twitch login page. Login with twitch account.
	# For making Streamlink Twitch GUI to use Twitch account, click Authorize.
	# Settings is completed.
	# Clicking live streaming program runs VLC and Chatty, and you can watch live
	# streaming video and receive/send comment.
	# 4.1 Watch Twitch with VLC + Streamlink
	# If you don't need live streaming program list and receiving/sending comment,
	# you can use VLC + Streamlink."

	# 	cd /tmp/
	# 	URL="https://github.com/streamlink/streamlink-twitch-gui/releases/download/v1.5.0/streamlink-twitch-gui-v1.5.0-linux64.tar.gz"
	# 	wget ${URL} --no-check-certificate
	# 	sudo tar -xzvf streamlink-twitch-gui-v1.5.0-linux64.tar.gz -C /opt
	# 	sudo apt install -y xdg-utils libgconf-2-4
	# 	sudo /opt/streamlink-twitch-gui/add-menuitem.sh
	# 	sudo ln -s /opt/streamlink-twitch-gui/start.sh /usr/bin/streamlink-twitch-gui

	# cd /tmp/
	# wget https://github.com/chatty/chatty/releases/download/v0.9.1/Chatty[0].9.1.zip --no-check-certificate
	# sudo unzip Chatty[0].9.1.zip -d /opt/chatty
	# streamlink-twitch-gui
	# -----------------------------------------------------------------------------------------
	diversosNome[2]="Chatty_StreamlinkTwitchGUI";
	diversosDescription[2]="Twitch Chat Client/multimedia player and streamer";
	diversosversion[2]="0.9.1/1.5.0";
	diversosHomepage[2]="https://streamlink.github.io/streamlink-twitch-gui/";
	diversosInstall[2]="sudo apt install default-jre -${Yn} && \
		URL=https://github.com/chatty/chatty/releases/download/v0.9.1  && \
		URL=/Chatty[0].9.1.zip && \
		wget -q -O /tmp/Chatty.zip && \
		sudo unzip /tmp/Chatty.zip -d /opt/chatty && \
		sudo apt install streamlink -${Yn} && \
		URL=https://github.com/streamlink/streamlink-twitch-gui && \
		URL=/releases/download/v1.5.0/streamlink-twitch-gui-v1.5.0-linux64.tar.gz && \
		wget -q -O /tmp/streamlink-twitch-gui.tar.gz && \
		sudo tar -xzvf /tmp/streamlink-twitch-gui.tar.gz -C /opt && \
		sudo apt install xdg-utils libgconf-2-4 -${Yn} && \
		sudo /opt/streamlink-twitch-gui/add-menuitem.sh && \
		sudo ln -s /opt/streamlink-twitch-gui/start.sh /usr/bin/streamlink-twitch-gui";
	# -----------------------------------------------------------------------------------------
	diversosNome[3]="Glade";
	diversosDescription[3]="Glade is a RAD tool to enable quick & easy development of user interfaces for the GTK+ toolkit and the GNOME desktop environment.";
	diversosversion[3]="3.20.0.1";
	diversosHomepage[3]="https://gitlab.gnome.org/GNOME/glade";
	diversosInstall[3]="sudo snap install glade";
	# -----------------------------------------------------------------------------------------
	diversosNome[4]="android_studio";
	diversosDescription[4]="Android Studio";
	diversosversion[4]="3.20.0.1";
	diversosHomepage[4]="https://developer.android.com/studio/install?hl=pt-br";
	diversosInstall[4]="sudo snap install android-studio --classic";
	# -----------------------------------------------------------------------------------------
	diversosNome[5]="Anaconda3";
	diversosDescription[5]="Anaconda Enterprise";
	diversosversion[5]="Anaconda 2019.03 for Linux Installer";
	diversosHomepage[5]="https://www.anaconda.com/distribution/";
	diversosInstall[5]="curl -O https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86[64].sh && \
		mv Anaconda3-2019.03-Linux-x86[64].sh /tmp && \
		cd /tmp && \
		bash Anaconda3-2019.03-Linux-x86[64].sh";
	# -----------------------------------------------------------------------------------------
	diversosNome[6]="eclipse";
	diversosDescription[6]="Eclipse";
	diversosversion[6]="1.0.0";
	diversosHomepage[6]="https://www.eclipse.org";
	diversosInstall[6]="wget http://ftp.jaist.ac.jp/pub/eclipse/technology/epp/downloads/release/2019-03/R/eclipse-java-2019-03-R-linux-gtk-x86[64].tar.gz && \
		sudo tar -zxvf eclipse-java-2019-*-R-linux-gtk-x86[64].tar.gz -C /usr/ && \
		sudo ln -s /usr/eclipse/eclipse /usr/bin/eclipse";

	#sudo subl /usr/share/applications/eclipse.desktop
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
	# -----------------------------------------------------------------------------------------
	diversosNome[7]="sublime_text";
	diversosDescription[7]="A sophisticated text editor for code, markup and prose";
	diversosdiversosversion[7]="Sublime Text 3 (Build 3207)";
	diversosHomepage[7]="https://www.sublimetext.com/";
	diversosInstall[7]="wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - && \
		sudo apt install apt-transport-https && \
		echo 'deb https://download.sublimetext.com/apt/stable/' | sudo tee /etc/apt/sources.list.d/sublime-text.list && \
		sudo apt-get update && \
		sudo apt install sublime-text";
	# config:----------------------------------
	# https://packagecontrol.io/installation copia/cola (show/console)key
	# ctrl+shift+p - install packet
	# theme ayu-dark
	# query
	# Alingtab
	# anaconda
	# wakatime key(8abf9130-a506-4388-be35-cd525002d176)
	# -----------------------------------------------------------------------------------------
	diversosNome[8]="vscode";
	diversosDescription[8]="Visual Studio Code";
	diversosversion[8]="Version 1.36";
	diversosHomepage[8]="https://code.visualstudio.com/";
	diversosInstall[8]="sudo apt install software-properties-common apt-transport-https && \
		wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add - && \
		sudo add-apt-repository 'deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main' && \
		sudo apt update && \
		sudo apt install code";
	# -----------------------------------------------------------------------------------------
	diversosNome[9]="vscodium";
	diversosDescription[9]="Community-driven, freely-licensed binary distribution of Microsoft’s editor VSCode";
	diversosversion[9]="build from source";
	diversosHomepage[9]="https://vscodium.com/";
	diversosInstall[9]="wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add - && \
		echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list && \
		sudo apt update && \
		sudo apt install codium";
	# -----------------------------------------------------------------------------------------				
	diversosNome[10]="Atom";
	diversosDescription[10]="A hackable text editor for the 21st Century";
	diversosversion[10]="v1.39.0-beta3 (2019-07-02)";
	diversosHomepage[10]="https://atom.io/";
	diversosInstall[10]="sudo add-apt-repository ppa:webupd8team/atom && \
		sudo apt-get update && \
		sudo apt-get install atom && \
		sudo snap install atom";
	# -----------------------------------------------------------------------------------------				
	diversosNome[11]="Geany";
	diversosDescription[11]="Geany - The Flyweight IDE";
	diversosversion[11]="1.35";
	diversosHomepage[11]="https://www.geany.org/";
	diversosInstall_11="sudo apt install geany -${Yn} && \
		sudo apt-get install geany -${Yn} && \
		sudo aptitude install geany -${Yn}";
	# -----------------------------------------------------------------------------------------				
	diversosNome[12]="Wine";
	diversosDescription[12]="wine emulador windows";
	diversosversion[12]="3.0.3";
	diversosHomepage[12]="https://www.winehq.org/";
	diversosInstall[12]="wget -nc https://dl.winehq.org/wine-builds/winehq.key && \
		sudo apt-key add winehq.key && \
		sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' && \
		sudo apt update && \
		sudo apt install winehq-stable -${Yn} && \
		winecfg && \
		winetricks";
	# -----------------------------------------------------------------------------------------				
	diversosNome[13]="playonlinux";
	diversosDescription[13]="Playonlinux para wine";
	diversosversion[13]="";
	diversosHomepage[13]="";
	diversosInstall[13]="wget -q 'http://deb.playonlinux.com/public.gpg' -O- | sudo apt-key add - && \
		sudo wget http://deb.playonlinux.com/playonlinux_bionic.list -O /etc/apt/sources.list.d/playonlinux.list && \
		sudo apt-get update && \
		sudo apt-get install playonlinux -${Yn}";
	# -----------------------------------------------------------------------------------------				
	diversosNome[14]="tilix";
	diversosDescription[14]="Tilix";
	diversosversion[14]="";
	diversosHomepage[14]="";
	diversosInstall[14]="sudo apt install tilix -${Yn} && \
		sudo aptitude install tilix -${Yn} && \
		sudo apt-get install tilix -${Yn}";
	# -----------------------------------------------------------------------------------------				
	diversosNome[15]="Terminology";
	diversosDescription[15]="Terminology";
	diversosversion[15]="";
	diversosHomepage[15]="";
	diversosInstall[15]="sudo apt install terminology -${Yn} && \
		sudo aptitude install terminology -${Yn} && \
		sudo apt-get install terminology -${Yn}";
	# -----------------------------------------------------------------------------------------				
	diversosNome[16]="Neovim";
	diversosDescription[16]="hyperextensible Vim-based text editor";
	diversosversion[16]="v0.3.8";
	diversosHomepage[16]="https://github.com/neovim/neovim/wiki/Installing-Neovim";
	diversosInstall[16]="mkdir -p ~/.config/nvim && \
		sudo apt install neovim python3 python3-pip git exuberant-ctags && \
		python3 -m pip install virtualenv && \
		python3 -m virtualenv -p python3 ~/.config/nvim/env && \
		source ~/.config/nvim/env/bin/activate && \
		pip install neovim==0.2.6 jedi psutil setproctitle yapf && \
		deactivate && \
		curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
		echo -e $(alias vim='nvim') >> ~/.bashrc && \
		sed '/call plug#end/q' init.vim > ~/.config/nvim/init.vim && \
		nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall' && \
		rm ~/.config/nvim/init.vim && \
		cp init.vim ~/.config/nvim/";

	# "comandos[8]"	: "curl -fLo ~/.local/share/fonts/Iosevka\ Term\ Nerd\ Font\ Complete.ttf --create-dirs https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Term%20Nerd%20Font%20Complete.ttf",
	# #unzip neovim-init.vim-master.zip
	# #cd neovim-init.vim-master
	# #bash ./install.sh
	# -----------------------------------------------------------------------------------------
	Nome[0]="xampp";
	Description[0]="XAMPP é um servidor independente de plataforma, software livre, que consiste principalmente na base de dados MySQL, o qual foi substituído pelo MariaDB, o servidor web Apache e os interpretadores para linguagens de script: PHP e Perl.";
	version[0]="7.3.7";
	Homepage[0]="https://www.apachefriends.org/pt_br/index.html";
	Install[0]="wget 'https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/7.3.6/xampp-linux-x64-7.3.6-3-installer.run/download'	-O xampp-installer.run && \
		chmod +x xampp-installer.run && \
		sudo ./xampp-installer.run && \
		echo -e '[Desktop Entry]\n Version=1.0\n Name=xampp\n Exec=gksudo /opt/lampp/manager-linux-x64.run\n Icon=/opt/lampp/icons/world1.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/xampp.desktop && \
		sudo apt-get install gksu";
	# -----------------------------------------------------------------------------------------				
	Nome[1]="aptitude";
	Description[1]="";
	version[1]="";
	Homepage[1]="";
	Install[1]="sudo apt install aptitude -${Yn}";
	# -----------------------------------------------------------------------------------------				
	Nome[2]="byobu";
	Description[2]="";
	version[2]="";
	Homepage[2]="";
	Install[2]="sudo apt install byobu -${Yn}";
	# -----------------------------------------------------------------------------------------				
	Nome[3]="nmcli";
	Description[3]="";
	version[3]="";
	Homepage[3]="";
	Install[3]="sudo apt install nmcli -${Yn}";
	# -----------------------------------------------------------------------------------------				
	Nome[4]="grep";
	Description[4]="";
	version[4]="";
	Homepage[4]="";
	Install[4]="sudo apt install grep -${Yn}";
	# -----------------------------------------------------------------------------------------				
	Nome[5]="awk",
	Description[5]="";
	version[5]="";
	Homepage[5]="";
	Install[5]="sudo apt install awk -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[6]="figlet";
	Description[6]="";
	version[6]="";
	Homepage[6]="";
	Install[6]="sudo apt install figlet -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[7]="tput";
	Description[7]="";
	version[7]="";
	Homepage[7]="";
	Install[7]="sudo apt install tput -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[8]="htop";
	Description[8]="";
	version[8]="";
	Homepage[8]="";
	Install[8]="sudo apt install htop -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[9]="irssi";
	Description[9]="";
	version[9]="";
	Homepage[9]="";
	Install[9]="sudo apt install irssi -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[10]="neofetch";
	Description[10]="";
	version[10]="";
	Homepage[10]="";
	Install[10]="sudo apt install neofetch -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[11]="awscli",
	Description[11]="";
	version[11]="";
	Homepage[11]="";
	Install[11]="sudo apt install awscli -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[12]="build-essential";
	Description[12]="";
	version[12]="";
	Homepage[12]="";
	Install[12]="sudo apt install build-essential -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[13]="cmatrix";
	Description[13]="";
	version[13]="";
	Homepage[13]="";
	Install[13]="sudo apt install cmatrix -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[14]="cowsay";
	Description[14]="";
	version[14]="";
	Homepage[14]="";
	Install[14]="sudo apt install cowsay -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[15]="curl";
	Description[15]="";
	version[15]="";
	Homepage[15]="";
	Install[15]="sudo apt install curl -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[16]="docker.io";
	Description[16]="";
	version[16]="";
	Homepage[16]="";
	Install[16]="sudo apt install docker.io -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[17]="docker-compose";
	Description[17]="";
	version[17]="";
	Homepage[17]="";
	Install[17]="sudo apt install docker-compose -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[18]="git-core";
	Description[18]="";
	version[18]="";
	Homepage[18]="";
	Install[18]="sudo apt install git-core -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[19]="groff";
	Description[19]="";
	version[19]="";
	Homepage[19]="";
	Install[19]="sudo apt install -groff ${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[20]="hollywood";
	Description[20]="";
	version[20]="";
	Homepage[20]="";
	Install[20]="sudo apt install hollywood -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[21]="nasm";
	Description[21]="The Netwide Assembler, NASM, is an 80x86 and x86-64 assembler designed for portability and modularity.";
	version[21]="2.14.02";
	Homepage[21]="https://www.nasm.us/";
	Install[21]="sudo apt install nasm  -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[22]="id3tool";
	Description[22]="";
	version[22]="";
	Homepage[22]="";
	Install[22]="sudo apt install id3tool -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[23]="imagemagick";
	Description[23]="";
	version[23]="";
	Homepage[23]="";
	Install[23]="sudo apt install imagemagick -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[24]="jq";
	Description[24]="";
	version[24]="";
	Homepage[24]="";
	Install[24]="sudo apt install jq -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[25]="mercurial";
	Description[25]="";
	version[25]="";
	Homepage[25]="";
	Install[25]="sudo apt install jq -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[26]="python-pip";
	Description[26]="";
	version[26]="";
	Homepage[26]="";
	Install[26]="sudo apt install python-pip -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[27]="nmap";
	Description[27]="";
	version[27]="";
	Homepage[27]="";
	Install[27]="sudo apt install nmap -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[28]="silversearcher-ag";
	Description[28]="";
	version[28]="";
	Homepage[28]="";
	Install[28]="sudo apt install silversearcher-ag -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[29]="thefuck";
	Description[29]="";
	version[29]="";
	Homepage[29]="";
	Install[29]="sudo apt install thefuck -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[30]="sl";
	Description[30]="";
	version[30]="";
	Homepage[30]="";
	Install[30]="sudo apt install sl -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[31]="telnet";
	Description[31]="";
	version[31]="";
	Homepage[31]="";
	Install[31]="sudo apt install telnet -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[32]="tree";
	Description[32]="";
	version[32]="";
	Homepage[32]="";
	Install[32]="sudo apt install tree -${Yn}";
	# -----------------------------------------------------------------------------------------						
	# Nome[[33]="mysql-workbench",
	# Description[[33]="";
	# version[[33]="";
	# Homepage[[33]="";
	# Install[[33]="wget -q http://cdn.mysql.com/Downloads/MySQLGUITools/mysql-workbench-community[8].0.12-1ubuntu18.04_amd64.deb -O mysql-workbench-community.deb && \
#  			sudo dpkg -i mysql-workbench-community.deb && \
#  			sudo apt -f install";
	# -----------------------------------------------------------------------------------------						
	Nome[34]="postgresql";
	Description[34]="";
	version[34]="";
	Homepage[34]="";
	Install[34]="sudo apt install postgresql -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[35]="postgresql-contrib";
	Description[35]="";
	version[35]="";
	Homepage[35]="";
	Install[35]="sudo apt install postgresql-contrib -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[36]="mysql-server",
	Description[36]="";
	version[36]="";
	Homepage[36]="";
	Install[36]="sudo apt install mysql-server -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[37]="php7.2";
	Description[37]="";
	version[37]="";
	Homepage[37]="";
	Install[37]="sudo apt install php7.2 -${Yn} && \
		sudo a2enmod php7.2 && \
		sudo systemctl restart apache2 && \
		sudo cp info.php /var/www/html/";
	# -----------------------------------------------------------------------------------------						
	Nome[38]="phppgadmin";
	Description[38]="";
	version[38]="";
	Homepage[38]="";
	Install[38]="sudo apt install phppgadmin -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[39]="php7.2-pgsql";
	Description[39]="";
	version[39]="";
	Homepage[39]="";
	Install[39]="sudo apt install php7.2-pgsql -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[40]="php-gettext";
	Description[40]="";
	version[40]="";
	Homepage[40]="";
	Install[40]="sudo apt install php-gettext -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[41]="libapache2-mod-php7.2";
	Description[41]="";
	version[41]="";
	Homepage[41]="";
	Install[41]="sudo apt install libapache2-mod-php7.2 -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[42]="php7.2-mysql";
	Description[42]="";
	version[42]="";
	Homepage[42]="";
	Install[42]="sudo apt install php7.2-mysql -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[43]="php-common";
	Description[43]="";
	version[43]="";
	Homepage[43]="";
	Install[43]="sudo apt install php-common -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[44]="php7.2-cli";
	Description[44]="";
	version[44]="";
	Homepage[44]="";
	Install[44]="sudo apt install php7.2-cli -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[45]="php7.2-common";
	Description[45]="";
	version[45]="";
	Homepage[45]="";
	Install[45]="sudo apt install php7.2-common -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[46]="php7.2-json";
	Description[46]="";
	version[46]="";
	Homepage[46]="";
	Install[46]="sudo apt install php7.2-json -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[47]="php7.2-readline";
	Description[47]="";
	version[47]="";
	Homepage[47]="";
	Install[47]="sudo apt install php7.2-readline -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[48]="php7.2-opcache";
	Description[48]="";
	version[48]="";
	Homepage[48]="";
	Install[48]="sudo apt install php7.2-opcache -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[49]="libav-tools";
	Description[49]="";
	version[49]="";
	Homepage[49]="";
	Install[49]="sudo apt install libav-tools -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[50]="x11-xserver-utils";
	Description[50]="";
	version[50]="";
	Homepage[50]="";
	Install[50]="sudo apt install x11-xserver-utils -${Yn}";
	# -----------------------------------------------------------------------------------------								
	Nome[51]="xdotool";
	Description[51]="";
	version[51]="";
	Homepage[51]="";
	Install[51]="sudo apt install xdotool -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[52]="wininfo";
	Description[52]="";
	version[52]="";
	Homepage[52]="";
	Install[52]="sudo apt install wininfo -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[53]="wmctrl";
	Description[53]="";
	version[53]="";
	Homepage[53]="";
	Install[53]="sudo apt install wmctrl -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[54]="python-gobject";
	Description[54]="";
	version[54]="";
	Homepage[54]="";
	Install[54]="sudo apt install python-gobject -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[55]="python-cairo";
	Description[55]="";
	version[55]="";
	Homepage[55]="";
	Install[55]="sudo apt install python-cairo -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[56]="xdg-utils";
	Description[56]="";
	version[56]="";
	Homepage[56]="";
	Install[56]="sudo apt install xdg-utils -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[57]="yad";
	Description[57]="";
	version[57]="";
	Homepage[57]="";
	Install[57]="sudo apt install yad -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[58]="silentcast";
	Description[58]="";
	version[58]="";
	Homepage[58]="";
	Install[58]="sudo apt install silentcast -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[59]="vim";
	Description[59]="";
	version[59]="";
	Homepage[59]="";
	Install[59]="sudo apt install vim -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[60]="handbrake-cli";
	Description[60]="";
	version[60]="";
	Homepage[60]="";
	Install[60]="sudo apt install handbrake-cli -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[61]="rvm";
	Description[61]="";
	version[61]="";
	Homepage[61]="";
	Install[61]="sudo apt install rvm -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[62]="autoconf";
	Description[62]="";
	version[62]="";
	Homepage[62]="";
	Install[62]="sudo apt install autoconf -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[63]="bison";
	Description[63]="";
	version[63]="";
	Homepage[63]="";
	Install[63]="sudo apt install bison -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[64]="build-essential";
	Description[64]="";
	version[64]="";
	Homepage[64]="";
	Install[64]="sudo apt install build-essential -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[65]="libssl-dev";
	Description[65]="";
	version[65]="";
	Homepage[65]="";
	Install[65]="sudo apt install libssl-dev -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[66]="libyaml-dev";
	Description[66]="";
	version[66]="";
	Homepage[66]="";
	Install[66]="sudo apt install libyaml-dev -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[67]="libreadline6-dev";
	Description[67]="";
	version[67]="";
	Homepage[67]="";
	Install[67]="sudo apt install libreadline6-dev -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[68]="libncurses5-dev";
	Description[68]="";
	version[68]="";
	Homepage[68]="";
	Install[68]="sudo apt install libncurses5-dev -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[69]="libffi-dev";
	Description[69]="";
	version[69]="";
	Homepage[69]="";
	Install[69]="sudo apt install libffi-dev -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[70]="libgdbm3";
	Description[70]="";
	version[70]="";
	Homepage[70]="";
	Install[70]="sudo apt install libgdbm3 -${Yn}";
	# -----------------------------------------------------------------------------------------						
	# Nome[[71]="libgdbm-dev";
	# Description[[71]="";
	# version[[71]="";
	# Homepage[[71]="";
	# Install[[71]="sudo apt install libgdbm-dev -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[72]="zlib1g-dev";
	Description[72]="";
	version[72]="";
	Homepage[72]="";
	Install[72]="sudo apt install zlib1g-dev -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[73]="ansible";
	Description[73]="";
	version[73]="";
	Homepage[73]="";
	Install[73]="sudo apt install ansible -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[74]="tmux-xpanes";
	Description[74]="";
	version[74]="";
	Homepage[74]="";
	Install[74]="sudo apt install tmux-xpanes -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[75]="gource";
	Description[75]="Software projects are displayed by Gource as an animated tree with the root directory of the project at its centre.";
	version[75]="0.49";
	Homepage[75]="https://gource.io/";
	Install[75]="sudo apt-get install gource -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[76]="npm";
	Description[76]="O npm é um gerenciador de pacotes para a linguagem de programação JavaScript. Node.js";
	version[76]="6.9.0";
	Homepage[76]="https://npm.org";
	Install[76]="sudo apt install npm -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[77]="ffmpeg";
	Description[77]="player";
	version[77]="3.4.6-0ubuntu0.18.04.1 Copyright (c) 2000-2019 the FFmpeg developers";
	Homepage[77]="https://gource.io/";
	Install[77]="sudo apt-get install ffmpeg -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[78]="sublime-merge";
	Description[78]="git";
	version[78]="git";
	Homepage[78]="https://sublime-merge.com/";
	Install[78]="wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - && \
		sudo apt-get install apt-transport-https && \
		echo 'deb https://download.sublimetext.com/ apt/stable/' | sudo tee /etc/apt/sources.list.d/sublime-text.list && \
		sudo apt-get update && \
		sudo apt-get install sublime-merge";
	# -----------------------------------------------------------------------------------------						
	Nome[79]="boxes";
	Description[79]="ascii";
	version[79]="";
	Homepage[79]="";
	Install[79]="sudo apt install boxes -${Yn}";
	# -----------------------------------------------------------------------------------------								
	
}


# ----------------------------------------------------------------------------------------
																	       # Dependncias__
# ----------------------------------------------------------------------------------------
function Dependencias(){
    # -----------------------------------------------------------------------------------------    
                                                                               # [ Constantes ]
    # -----------------------------------------------------------------------------------------    
    release_name=$(lsb_release -c | awk '{print $2}')
    installers_path="$DOTFILES/caches/installers"
    declare -a apt_depens=()
    declare -a apt_keys=()
    declare -a apt_source_files=()
    declare -a apt_source_texts=()
    declare -a deb_installed=()
    declare -a deb_sources=()
    # -----------------------------------------------------------------------------------------    
                                                                                  # [ Funções ]
                                                             # Auxiliar para instalações de ppa                                                                              
    # -----------------------------------------------------------------------------------------    
    function add_ppa() {
      apt_source_texts+=($1)
      IFS=':/' eval 'local parts=($1)'
      apt_source_files+=("${parts[1]}-ubuntu-${parts[2]}-$release_name")
    }
    # -----------------------------------------------------------------------------------------    
                                                                                    # [ ppa's ]
    # -----------------------------------------------------------------------------------------    
    # https://github.com/neovim/neovim/wiki/Installing-Neovim
    add_ppa ppa:neovim-ppa/stable
    # https://launchpad.net/~stebbins/+archive/ubuntu/handbrake-releases
    add_ppa ppa:stebbins/handbrake-releases
    # https://github.com/rvm/ubuntu_rvm
    add_ppa ppa:rael-gc/rvm
    # https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-16-04
    add_ppa ppa:ansible/ansible
    # http://tipsonubuntu.com/2016/09/13/vim-8-0-released-install-ubuntu-16-04/
    add_ppa ppa:jonathonf/vim
    # https://launchpad.net/~hnakamur/+archive/ubuntu/tmux
    add_ppa ppa:hnakamur/tmux
    # https://github.com/greymd/tmux-xpanes   BOM
    add_ppa ppa:greymd/tmux-xpanes
    if is_ubuntu_desktop; then
        add_ppa ppa:fossfreedom/arc-gtk-theme-daily
        # https://www.techrepublic.com/article/how-to-connect-a-linux-machine-to-google-cloud-print/
        # sudo /usr/share/cloudprint-cups/setupcloudprint.py  
        add_ppa ppa:simon-cadman/niftyrepo
        # https://github.com/tagplus5/vscode-ppa
        apt_keys+=(https://tagplus5./.io/vscode-ppa/ubuntu/gpg.key)
        apt_source_files+=(vscode.list)
        apt_source_texts+=("deb https://tagplus5.github.io/vscode-ppa/ubuntu ./")
        # https://www.ubuntuupdates.org/ppa/google_chrome
        apt_keys+=(https://dl-ssl.google.com/linux/linux_signing_key.pub)
        apt_source_files+=(google-chrome)
        apt_source_texts+=("deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main")
        # https://www.charlesproxy.com/documentation/installation/apt-repository/
        apt_keys+=(https://www.charlesproxy.com/packages/apt/PublicKey)
        apt_source_files+=(charles)
        apt_source_texts+=("deb https://www.charlesproxy.com/packages/apt/ charles-proxy3 main")
        # https://github.com/aluxian/Messenger-for-Desktop#linux
        apt_keys+=('--keyserver pool.sks-keyservers.net --recv 6DDA23616E3FE905FFDA152AE61DA9241537994D')
        apt_source_files+=(aluxian)
        apt_source_texts+=("deb https://dl.bintray.com/aluxian/deb/ beta main")
        # https://www.spotify.com/us/download/linux/
        apt_keys+=('--keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886')
        apt_source_files+=(spotify)
        apt_source_texts+=("deb http://repository.spotify.com stable non-free")
        # https://tecadmin.net/install-oracle-virtualbox-on-ubuntu/
        apt_keys+=(https://www.virtualbox.org/download/oracle_vbox_2016.asc)
        apt_source_files+=(virtualbox)
        apt_source_texts+=("deb http://download.virtualbox.org/virtualbox/debian $release_name contrib")
        # https://www.skype.com/en/download-skype/skype-for-linux/
        # https://community.skype.com/t5/Linux/Skype-for-Linux-Beta-signatures-couldn-t-be-verified-because-the/td-p/4645756
        apt_keys+=(https://repo.skype.com/data/SKYPE-GPG-KEY)
        apt_source_files+=(skype-stable)
        apt_source_texts+=("deb https://repo.skype.com/deb stable main")
        # http://askubuntu.com/a/190674
        add_ppa ppa:webupd8team/java
        # https://github.com/colinkeenan/silentcast/#ubuntu
        # https://github.com/colinkeenan/silentcast/#ubuntu-linux-full-install
        add_ppa ppa:sethj/silentcast
        add_ppa ppa:webupd8team/y-ppa-manager
        # https://be5invis.github.io/Iosevka/
        # https://launchpad.net/~laurent-boulard/+archive/ubuntu/fonts
        add_ppa ppa:laurent-boulard/fonts
        # https://launchpad.net/grub-customizer
        add_ppa ppa:danielrichter2007/grub-customizer
    fi
    # -----------------------------------------------------------------------------------------    
                                                                                  # [ Array's ]
    # -----------------------------------------------------------------------------------------    
    apt_depens=( "aptitude" "byobu" "nmcli" "grep" "awk" "figlet" "tput" "htop" "irssi" "neofetch"
             "awscli" "build-essential" "cmatrix" "cowsay" "curl" "docker.io" "docker-compose"
             "git-core" "groff" "hollywood" "htop" "id3tool" "imagemagick" "jq" "mercurial"
             "nmap" "postgresql" "python-pip" "silversearcher-ag" "sl" "telnet" "thefuck"
             "tree" );
    apt_depens+=( "postgresql" "postgresql-contrib" "mysql-server" "php7.2" "phppgadmin" "php7.2-pgsql")
    apt_depens+=( "phpmyadmin" "php-mbstring" "php-gettext" "mysql-workbench")

    apt_depens+=( "libapache2-mod-php7.2" "php7.2-mysql" "php-common" "php7.2-cli" 
            "php7.2-common" "php7.2-json" "php7.2-opcache" "php7.2-readline" "libav-tools" 
            "x11-xserver-utils" "xdotool" "wininfo" "wmctrl" "python-gobject" 
            "python-cairo" "xdg-utils" "yad" "silentcast" "vim" "neovim" "handbrake-cli" "rvm" );
    # https://github.com/rbenv/ruby-build/wiki
    apt_depens+=( "autoconf" "bison" "build-essential" "libssl-dev" "libyaml-dev" "libreadline6-dev"
            "libncurses5-dev" "libffi-dev" "libgdbm3" "libgdbm-dev" "zlib1g-dev" "ansible" "vim" 
            "tmux-xpanes" )
    if is_ubuntu_desktop; then
        apt_depens+=( "vim-gnome" );
        apt_depens+=( "handbrake-gtk" );
        # http://www.omgubuntu.co.uk/2016/06/install-latest-arc-gtk-theme-ubuntu-16-04
        # apt_keys+=(http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key)
        # apt_source_files+=(arc-theme)
        # apt_source_texts+=("deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /")
        # apt_depens+=(arc-theme)
        apt_depens+=( "arc-theme" );
        apt_depens+=( "cupscloudprint" );
        apt_depens+=( "code code-insiders" );
        apt_depens+=( "google-chrome-stable" );
        apt_depens+=( "charles-proxy" );
        apt_depens+=( "messengerfordesktop" );
        apt_depens+=( "spotify-client" );
        apt_depens+=( "virtualbox-5.1" );
        apt_depens+=( "skypeforlinux" );
        apt_depens+=( "oracle-java8-installer" );
        function preinstall_oracle-java8-installer() {
            echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
            echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
        }
        apt_depens+=( "libav-tools" "x11-xserver-utils" "xdotool" "wininfo" "wmctrl" "python-gobject" 
                    "python-cairo" "xdg-utils" "yad" "silentcast" );
        apt_depens+=( "adb fastboot" )
        apt_depens+=( "chromium-browser" "fonts-mplus" "gnome-tweak-tool" "k4dirstat" "rofi"
                    "network-manager-openconnect" "network-manager-openconnect-gnome" "openssh-server"
                    "shutter" "unity-tweak-tool" "vlc" "xclip" "zenmap" );
        # Manage online accounts via "gnome-control-center" in launcher
        apt_depens+=( "gnome-control-center" "gnome-online-accounts" );
        # https://github.com/mitchellh/vagrant/issues/7411
        deb_installed+=(/usr/bin/vagrant)
        deb_sources+=(https://releases.hashicorp.com/vagrant/1.9.2/vagrant_1.9.2_x86_64.deb)
        # https://github.com/vagrant-libvirt/vagrant-libvirt/issues/575
        # apt_depens+=(vagrant)
        # function postinstall_vagrant() {
        #   sudo sed -i'' "s/Specification.all = nil/Specification.reset/" /usr/lib/ruby/vendor_ruby/vagrant/bundler.rb
        # }
        apt_depens+=( "fonts-iosevka" );
        apt_depens+=( "grub-customizer" );

        # https://support.gitkraken.com/how-to-install
        deb_installed+=(/usr/bin/gitkraken)
        deb_sources+=(https://release.gitkraken.com/linux/gitkraken-amd64.deb)

        # http://www.get-notes.com/linux-download-debian-ubuntu
        apt_depens+=( "libqt5concurrent5" );
        deb_installed+=(/usr/bin/notes)
        deb_sources+=("https://github.com/nuttyartist/notes/releases/download/v1.0.0/notes_1.0.0_amd64-$release_name.deb")

        # https://www.dropbox.com/install-linux
        apt_depens+=("python-gtk2" "python-gpgme" );
        deb_installed+=(/usr/bin/dropbox)
        deb_sources+=("https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb")

        # http://askubuntu.com/a/852727
        apt_depens+=( "cabextract" );
        deb_installed+=(/usr/share/fonts/truetype/msttcorefonts)
        deb_sources+=(deb_source_msttcorefonts)
        function deb_source_msttcorefonts() {
            echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
            echo http://ftp.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.6_all.deb
        }

        # https://slack.com/downloads/instructions/linux
        deb_installed+=(/usr/bin/slack)
        deb_sources+=(https://downloads.slack-edge.com/linux_releases/slack-desktop-2.5.2-amd64.deb)

        # https://discordapp.com/download
        deb_installed+=(/usr/bin/discord)
        deb_sources+=("https://discordapp.com/api/download?platform=linux&format=deb")

        # http://askubuntu.com/questions/854480/how-to-install-the-steam-client/854481#854481
        apt_depens+=(python-apt)
        deb_installed+=(/usr/bin/steam)
        deb_sources+=(deb_source_steam)
        function deb_source_steam() {
            local steam_root steam_file
            steam_root=http://repo.steampowered.com/steam/pool/steam/s/steam/
            steam_file="$(wget -q -O- "$steam_root?C=M;O=D" | sed -En '/steam-launcher/{s/.*href="([^"]+)".*/\1/;p;q;}')"
            echo "$steam_root$steam_file"
        }
        # https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=772598
        # apt_depens+=(steam)
        # function preinstall_steam() {
        #   echo steam steam/question select I AGREE | sudo debconf-set-selections
        #   echo steam steam/license note | sudo debconf-set-selections
        # }
    fi

    function other_stuff() {
        # Install Git Extras
        if [[ ! "$(type -P git-extras)" ]]; then
            e_header "Installing Git Extras"
            (
                cd $DOTFILES/vendor/git-extras &&
                sudo make install
            )
        fi
        # Install misc bins from zip file.
        #install_from_zip ngrok 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip'
        #install_from_zip terraform 'https://releases.hashicorp.com/terraform/0.9.2/terraform_0.9.2_linux_amd64.zip'
    }

    if (( ${#apt_depens[@]} > 0 )); then
        e_header "Instalando APT pacotes (${#apt_depens[@]})"; i=0;
        for package in "${apt_depens[@]}"; do
            printf "$(e_arrow " ${i}-$apt_source_texts")\t"
            printf "$(e_arrow " ${i}-$package")\t"
            ((i=$i+1))
        done
        printf "\n\n"; e_header "Instalando PPA pacotes (${#apt_source_texts[@]})"; i=0;
        for package in "${apt_source_texts[@]}"; do
            printf "$(e_arrow " ${i}-$apt_source_texts")\t"
            ((i=$i+1))
        done
    fi
    read
    ####################
    # ACTUALLY DO THINGS
    ####################

    # Add APT keys.
    keys_cache=$DOTFILES/caches/init/apt_keys
    IFS=$'\n' GLOBIGNORE='*' command eval 'setdiff_cur=($(<$keys_cache))'
    setdiff_new=("${apt_keys[@]}"); setdiff; apt_keys=("${setdiff_out[@]}")
    unset setdiff_new setdiff_cur setdiff_out

    if (( ${#apt_keys[@]} > 0 )); then
        e_header "Adding APT keys (${#apt_keys[@]})"
        for key in "${apt_keys[@]}"; do
            e_arrow "$key"
            if [[ "$key" =~ -- ]]; then
                sudo apt-key adv $key
            else
                wget -qO- $key | sudo apt-key add -
            fi && \
            echo "$key" >> $keys_cache
        done
    fi

    # Add APT sources.
    function __temp() { [[ ! -e /etc/apt/sources.list.d/$1.list ]]; }
    source_i=($(array_filter_i apt_source_files __temp))

    if (( ${#source_i[@]} > 0 )); then
        e_header "Adding APT sources (${#source_i[@]})"
        for i in "${source_i[@]}"; do
            source_file=${apt_source_files[i]}
            source_text=${apt_source_texts[i]}
            if [[ "$source_text" =~ ppa: ]]; then
                e_arrow "$source_text"
                sudo add-apt-repository -y $source_text
            else
                e_arrow "$source_file"
                sudo sh -c "echo '$source_text' > /etc/apt/sources.list.d/$source_file.list"
            fi
        done
    fi

    # Update APT.
    e_header "Updating APT"
    sudo apt-get -qq update

    # Only do a dist-upgrade on initial install, otherwise do an upgrade.
    e_header "Upgrading APT"
    if is_dotfiles_bin; then
        sudo apt-get -qy upgrade
    else
        sudo apt-get -qy dist-upgrade
    fi

    # Install APT packages.
    installed_apt_depens="$(dpkg --get-selections | grep -v deinstall | awk 'BEGIN{FS="[\t:]"}{print $1}' | uniq)"
    apt_depens=($(setdiff "${apt_depens[*]}" "$installed_apt_depens"))

    if (( ${#apt_depens[@]} > 0 )); then
        e_header "Instalando APT pacotes (${#apt_depens[@]})"
        for package in "${apt_depens[@]}"; do
            e_arrow "$package"
            [[ "$(type -t preinstall_$package)" == function ]] && preinstall_$package
            sudo apt-get -qq install "$package" && \
            [[ "$(type -t postinstall_$package)" == function ]] && postinstall_$package
        done
    fi

    # Install debs via dpkg
    function __temp() { [[ ! -e "$1" ]]; }
    deb_installed_i=($(array_filter_i deb_installed __temp))

    if (( ${#deb_installed_i[@]} > 0 )); then
        mkdir -p "$installers_path"
        e_header "Installing debs (${#deb_installed_i[@]})"
        for i in "${deb_installed_i[@]}"; do
            e_arrow "${deb_installed[i]}"
            deb="${deb_sources[i]}"
            [[ "$(type -t "$deb")" == function ]] && deb="$($deb)"
            installer_file="$installers_path/$(echo "$deb" | sed 's#.*/##')"
            wget -O "$installer_file" "$deb"
            sudo dpkg -i "$installer_file"
        done
    fi

    # install bins from zip file
    function install_from_zip() {
        local name=$1 url=$2 bins b zip tmp
        shift 2; bins=("$@"); [[ "${#bins[@]}" == 0 ]] && bins=($name)
        if [[ ! "$(which $name)" ]]; then
            mkdir -p "$installers_path"
            e_header "Installing $name"
            zip="$installers_path/$(echo "$url" | sed 's#.*/##')"
            wget -O "$zip" "$url"
            tmp=$(mktemp -d)
            unzip "$zip" -d "$tmp"
            for b in "${bins[@]}"; do
              sudo cp "$tmp/$b" "/usr/local/bin/$(basename $b)"
            done
            rm -rf $tmp
        fi
    } 

    # Run anything else that may need to be run.
    type -t other_stuff >/dev/null && other_stuff
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
