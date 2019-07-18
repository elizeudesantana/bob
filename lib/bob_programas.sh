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
	Nome[0]="kdevelop";
	Description[0]="integrated development environment for C/C++ and other languages";
	version[0]="4:5.2.1-1ubuntu4";
	Homepage[0]="https://www.kdevelop.org/";
	Install[0]="sudo apt install kdevelop -${Yn}";
	# -----------------------------------------------------------------------------------------
	Nome[1]="codeblocks_contrib";
	Description[1]="contrib plugins for Code::Blocks IDE";
	version[1]="16.01+dfsg-2.1";
	Homepage[1]="http://codeblocks.org";
	Install[1]="sudo apt install codeblocks-contrib -${Yn}";
	# -----------------------------------------------------------------------------------------
	Nome[2]="codeblocks";
	Description[2]="Code::Blocks integrated development environment (IDE)";
	version[2]="16.01+dfsg-2.1";
	Homepage[2]="http://codeblocks.org";
	Install[2]="sudo apt install codeblocks -${Yn}";
	# -----------------------------------------------------------------------------------------
	Nome[3]="mingw_w64";
	Description[3]="Development environment targeting 32- and 64-bit Windows";
	version[3]="5.0.3-1";
	Homepage[3]="http://mingw-w64.sf.net";
	Install[3]="sudo apt install mingw-w64 -${Yn}";
	# -----------------------------------------------------------------------------------------
	Nome[4]="build_essential";
	Description[4]="Informational list of build-essential packages";
	version[4]="12.4ubuntu1";
	Homepage[4]="https://www.ubuntuupdates.org/build-essential";
	Install[4]="sudo apt install build-essential -${Yn}";
	# -----------------------------------------------------------------------------------------
	Nome[5]="gcc";
	Description[5]="GNU C compiler";
	version[5]="4:7.4.0-1ubuntu2.3";
	Homepage[5]="https://www.ubuntuupdates.org/package/core/bionic/main/security/gcc-defaults";
	Install[5]="sudo apt install gcc -${Yn}";
	# -----------------------------------------------------------------------------------------
	Nome[6]="g_plus_plus";
	Description[6]="GNU C++ compiler";
	version[6]="4:7.4.0-1ubuntu2.3";
	Homepage[6]="https://www.ubuntuupdates.org/package/core/bionic/main/security/gcc-defaults";
	Install[6]="sudo apt install g++ -${Yn}";
	# -----------------------------------------------------------------------------------------
	Nome[7]="gpp";
	Description[7]="A general-purpose preprocessor with customizable syntax";
	version[7]="2.24-3build1";
	Homepage[7]="http://www.nothingisreal.com/gpp/";
	Install[7]="sudo apt install gpp -${Yn}";
	# -----------------------------------------------------------------------------------------
	Nome[8]="bluefish_plugins";
	Description[8]="advanced Gtk+ text editor (plugins)";
	version[8]="2.2.10-1";
	Homepage[8]="http://bluefish.openoffice.nl";
	Install[8]="sudo apt install bluefish-plugins -${Yn}";
	# -----------------------------------------------------------------------------------------
	Nome[9]="bluefish";
	Description[9]="advanced Gtk+ text editor for web and software development";
	version[9]="2.2.10-1";
	Homepage[9]="http://bluefish.openoffice.nl";
	Install[9]="sudo apt install bluefish -${Yn}";
	# -----------------------------------------------------------------------------------------
	Nome[10]="openjdk[8]_jdk";
	Description[10]="OpenJDK Development Kit (JDK)";
	version[10]="8u212-b03-0ubuntu1.18.04.1";
	Homepage[10]="http://openjdk.java.net/";
	Install[10]="sudo apt install openjdk-8-jdk -${Yn}";
	# -----------------------------------------------------------------------------------------
	Nome[11]="python3";
	Description[11]="Python package installer";
	version[11]="9.0.1-2";
	Homepage[11]="https://pip.pypa.io/en/stable/";
	Install_11=( 														        # python 3 & pip
		"sudo apt install python3 -${Yn}"
		"sudo apt install python3-pip -${Yn}" );
	Install_11A=(  														   # python3, pip & venv
		"python3 -V"
		"apt list --installed | grep python"
		"sudo apt-get upgrade python3"
		"sudo apt install python3-pip -${Yn}"
		"sudo apt install python3-venv -${Yn}" );
	Install_11B=(  														  # python 3.7.4 tarball
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
	Install_11C=( 
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
	Nome[12]="python_pip";
	Description[12]="Python package installer";
	version[12]="9.0.1-2.3~ubuntu1.18.04.1";
	Homepage[12]="https://pip.pypa.io/en/stable/";
	Install[12]="sudo apt install python-pip -${Yn}";
	# -----------------------------------------------------------------------------------------
	Nome[13]="anjuta_extra";
	Description[13]="plugins and extras for anjuta";
	version[13]="3.26.0-3";
	Homepage[13]="http://www.anjuta.org/";
	Install[13]="sudo apt install anjuta-extra -${Yn}";
	# -----------------------------------------------------------------------------------------
	Nome[14]="anjuta";
	Description[14]="GNOME development IDE, for C/C++";
	version[14]="2:3.28.0-1";
	Homepage[14]="http://www.anjuta.org/";
	Install[14]="sudo apt install anjuta -${Yn}";
	# -----------------------------------------------------------------------------------------
	Nome[15]="google";
	Description[15]="google chrome stable";
	version[15]="Versão 75.0.3770.90 (Versão oficial) 64 bits";
	Homepage[15]="http://www.google.com/";
	Install[15]="curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
		sudo dpkg -i google-chrome-stable_current_amd64.deb && \
		rm google-chrome-stable_current_amd64.deb";
	# -----------------------------------------------------------------------------------------
	Nome[16]="links";
	Description[16]="Web browser running in both graphics and text mode";
	version[16]="3.28.5-0ubuntu1";
	Homepage[16]="http://links.twibright.com/";
	Install[16]="sudo apt install links2 -${Yn}";
	# -----------------------------------------------------------------------------------------
	Nome[17]="chromium";
	Description[17]="Chromium web browser, open-source version of Chrome";
	version[17]="75.0.3770.100";
	Homepage[17]="canonical";
	Install[17]="sudo snap install chromium";
	# -----------------------------------------------------------------------------------------
	Nome[18]="epiphany_browser";
	Description[18]="Intuitive GNOME web browser";
	version[18]="3.28.5-0ubuntu1";
	Homepage[18]="https://wiki.gnome.org/Apps/Web";
	Install[18]="sudo apt install epiphany-browser -${Yn}";
	# -----------------------------------------------------------------------------------------
	Nome[19]="tor";
	Description[19]="anonymizing overlay network for TCP Tor";
	version[19]="0.3.5.8-1~bionic+1";
	Homepage[19]="https://www.torproject.org/";
	Install[19]="sudo apt install tor -${Yn}";
	# -----------------------------------------------------------------------------------------
	Nome[20]="torbrowser_launcher";
	Description[20]="helps download and run the Tor Browser Bundle";
	version[20]="0.2.9-2";
	Homepage[20]="https://micahflee.com/torbrowser-launcher/";
	Install[20]="sudo apt install torbrowser-launcher -${Yn}";
	# -----------------------------------------------------------------------------------------
	Nome[21]="libdvdnav4";
	Description[21]="DVD navigation library";
	version[21]="6.0.0-1";
	Homepage[21]="https://dvdnav.mplayerhq.hu/";
	Install[21]="sudo apt install libdvdnav4 -${Yn}";
	# -----------------------------------------------------------------------------------------
	Nome[22]="libdvdread4";
	Description[22]="library for reading DVDs";
	version[22]="6.0.0-1";
	Homepage[22]="https://dvdnav.mplayerhq.hu/";
	Install[22]="sudo apt install libdvdread4 -${Yn}";
	# -----------------------------------------------------------------------------------------
	Nome[23]="gstreamer1[0]_plugins_bad";
	Description[23]="GStreamer plugins from the bad set";
	version[23]="1.14.4-1ubuntu1~ubuntu18.04.1";
	Homepage[23]="https://gstreamer.freedesktop.org";
	Install[23]="sudo apt install gstreamer1.0-plugins-bad -${Yn}";
	# -----------------------------------------------------------------------------------------
	Nome[24]="gstreamer1[0]_plugins_ugly";
	Description[24]="GStreamer plugins from the ugly set";
	version[24]="1.14.4-1~ubuntu18.04.1";
	Homepage[24]="https://gstreamer.freedesktop.org";
	Install[24]="sudo apt install gstreamer1.0-plugins-ugly -${Yn}";
	# -----------------------------------------------------------------------------------------
	Nome[25]="ubuntu_restricted_extras";
	Description[25]="Commonly used media codecs and fonts for Ubuntu";
	version[25]="66";
	Homepage[25]="https://www.ubuntuupdates.org/ubuntu-restricted-extras";
	Install[25]="sudo apt install ubuntu-restricted-extras -${Yn}";
	# -----------------------------------------------------------------------------------------
	Nome[26]="vlc";
	Description[26]="multimedia player and streamer";
	version[26]="3.0.3-1-1ubuntu1 and others";
	Homepage[26]="https://www.videolan.org/vlc/index.pt-BR.html";
	Install[26]="sudo apt install vlc -${Yn}";
	# skins
	# https://www.videolan.org/vlc/download-skins2-go.php?url=vlc-skins.zip
	# ~/.local/share/vlc/skins2
	# -----------------------------------------------------------------------------------------
	Nome[27]="StreamlinkTwitchGUI";
	Description[27]="Chat application to Chatty";
	version[27]="v1.5.0-linux64";
	Homepage[27]="https://streamlink.github.io/streamlink-twitch-gui/";
	Install[27]="sudo apt install streamlink -${Yn} && \
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
	Nome[28]="Chatty_StreamlinkTwitchGUI";
	Description[28]="Twitch Chat Client/multimedia player and streamer";
	version[28]="0.9.1/1.5.0";
	Homepage[28]="https://streamlink.github.io/streamlink-twitch-gui/";
	Install[28]="sudo apt install default-jre -${Yn} && \
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
	Nome[29]="Glade";
	Description[29]="Glade is a RAD tool to enable quick & easy development of user interfaces for the GTK+ toolkit and the GNOME desktop environment.";
	version[29]="3.20.0.1";
	Homepage[29]="https://gitlab.gnome.org/GNOME/glade";
	Install[29]="sudo snap install glade";
	# -----------------------------------------------------------------------------------------
	Nome[30]="android_studio";
	Description[30]="Android Studio";
	version[30]="3.20.0.1";
	Homepage[30]="https://developer.android.com/studio/install?hl=pt-br";
	Install[30]="sudo snap install android-studio --classic";
	# -----------------------------------------------------------------------------------------
	Nome[31]="Anaconda3";
	Description[31]="Anaconda Enterprise";
	version[31]="Anaconda 2019.03 for Linux Installer";
	Homepage[31]="https://www.anaconda.com/distribution/";
	Install[31]="curl -O https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86[64].sh && \
		mv Anaconda3-2019.03-Linux-x86[64].sh /tmp && \
		cd /tmp && \
		bash Anaconda3-2019.03-Linux-x86[64].sh";
	# -----------------------------------------------------------------------------------------
	Nome[32]="eclipse";
	Description[32]="Eclipse";
	version[32]="1.0.0";
	Homepage[32]="https://www.eclipse.org";
	Install[32]="wget http://ftp.jaist.ac.jp/pub/eclipse/technology/epp/downloads/release/2019-03/R/eclipse-java-2019-03-R-linux-gtk-x86[64].tar.gz && \
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
	Nome[33]="sublime_text";
	Description[33]="A sophisticated text editor for code, markup and prose";
	diversosversion[33]="Sublime Text 3 (Build 3207)";
	Homepage[33]="https://www.sublimetext.com/";
	Install[33]="wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - && \
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
	Nome[34]="vscode";
	Description[34]="Visual Studio Code";
	version[34]="Version 1.36";
	Homepage[34]="https://code.visualstudio.com/";
	Install[34]="sudo apt install software-properties-common apt-transport-https && \
		wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add - && \
		sudo add-apt-repository 'deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main' && \
		sudo apt update && \
		sudo apt install code";
	# -----------------------------------------------------------------------------------------
	Nome[35]="vscodium";
	Description[35]="Community-driven, freely-licensed binary distribution of Microsoft’s editor VSCode";
	version[35]="build from source";
	Homepage[35]="https://vscodium.com/";
	Install[35]="wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add - && \
		echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list && \
		sudo apt update && \
		sudo apt install codium";
	# -----------------------------------------------------------------------------------------				
	Nome[36]="Atom";
	Description[36]="A hackable text editor for the 21st Century";
	version[36]="v1.39.0-beta3 (2019-07-02)";
	Homepage[36]="https://atom.io/";
	Install[36]="sudo add-apt-repository ppa:webupd8team/atom && \
		sudo apt-get update && \
		sudo apt-get install atom && \
		sudo snap install atom";
	# -----------------------------------------------------------------------------------------				
	Nome[37]="Geany";
	Description[37]="Geany - The Flyweight IDE";
	version[37]="1.35";
	Homepage[37]="https://www.geany.org/";
	Install[37]="sudo apt install geany -${Yn} && \
		sudo apt-get install geany -${Yn} && \
		sudo aptitude install geany -${Yn}";
	# -----------------------------------------------------------------------------------------				
	Nome[38]="Wine";
	Description[38]="wine emulador windows";
	version[38]="3.0.3";
	Homepage[38]="https://www.winehq.org/";
	Install[38]="wget -nc https://dl.winehq.org/wine-builds/winehq.key && \
		sudo apt-key add winehq.key && \
		sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' && \
		sudo apt update && \
		sudo apt install winehq-stable -${Yn} && \
		winecfg && \
		winetricks";
	# -----------------------------------------------------------------------------------------				
	Nome[39]="playonlinux";
	Description[39]="Playonlinux para wine";
	version[39]="";
	Homepage[39]="";
	Install[39]="wget -q 'http://deb.playonlinux.com/public.gpg' -O- | sudo apt-key add - && \
		sudo wget http://deb.playonlinux.com/playonlinux_bionic.list -O /etc/apt/sources.list.d/playonlinux.list && \
		sudo apt-get update && \
		sudo apt-get install playonlinux -${Yn}";
	# -----------------------------------------------------------------------------------------				
	Nome[40]="tilix";
	Description[40]="Tilix";
	version[40]="";
	Homepage[40]="";
	Install[40]="sudo apt install tilix -${Yn} && \
		sudo aptitude install tilix -${Yn} && \
		sudo apt-get install tilix -${Yn}";
	# -----------------------------------------------------------------------------------------				
	Nome[41]="Terminology";
	Description[41]="Terminology";
	version[41]="";
	Homepage[41]="";
	Install[41]="sudo apt install terminology -${Yn} && \
		sudo aptitude install terminology -${Yn} && \
		sudo apt-get install terminology -${Yn}";
	# -----------------------------------------------------------------------------------------				
	Nome[42]="Neovim";
	Description[42]="hyperextensible Vim-based text editor";
	version[42]="v0.3.8";
	Homepage[42]="https://github.com/neovim/neovim/wiki/Installing-Neovim";
	Install[42]="mkdir -p ~/.config/nvim && \
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
	Nome[43]="xampp";
	Description[43]="XAMPP é um servidor independente de plataforma, software livre, que consiste principalmente na base de dados MySQL, o qual foi substituído pelo MariaDB, o servidor web Apache e os interpretadores para linguagens de script: PHP e Perl.";
	version[43]="7.3.7";
	Homepage[43]="https://www.apachefriends.org/pt_br/index.html";
	Install[43]="wget 'https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/7.3.6/xampp-linux-x64-7.3.6-3-installer.run/download'	-O xampp-installer.run && \
		chmod +x xampp-installer.run && \
		sudo ./xampp-installer.run && \
		echo -e '[Desktop Entry]\n Version=1.0\n Name=xampp\n Exec=gksudo /opt/lampp/manager-linux-x64.run\n Icon=/opt/lampp/icons/world1.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/xampp.desktop && \
		sudo apt-get install gksu";
	# -----------------------------------------------------------------------------------------				
	Nome[44]="aptitude";
	Description[44]="";
	version[44]="";
	Homepage[44]="";
	Install[44]="sudo apt install aptitude -${Yn}";
	# -----------------------------------------------------------------------------------------				
	Nome[45]="byobu";
	Description[45]="";
	version[45]="";
	Homepage[45]="";
	Install[45]="sudo apt install byobu -${Yn}";
	# -----------------------------------------------------------------------------------------				
	Nome[46]="nmcli";
	Description[46]="";
	version[46]="";
	Homepage[46]="";
	Install[46]="sudo apt install nmcli -${Yn}";
	# -----------------------------------------------------------------------------------------				
	Nome[47]="grep";
	Description[47]="";
	version[47]="";
	Homepage[47]="";
	Install[47]="sudo apt install grep -${Yn}";
	# -----------------------------------------------------------------------------------------				
	Nome[48]="awk",
	Description[48]="";
	version[48]="";
	Homepage[48]="";
	Install[48]="sudo apt install awk -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[49]="figlet";
	Description[49]="";
	version[49]="";
	Homepage[49]="";
	Install[49]="sudo apt install figlet -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[50]="tput";
	Description[50]="";
	version[50]="";
	Homepage[50]="";
	Install[50]="sudo apt install tput -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[51]="htop";
	Description[51]="";
	version[51]="";
	Homepage[51]="";
	Install[51]="sudo apt install htop -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[52]="irssi";
	Description[52]="";
	version[52]="";
	Homepage[52]="";
	Install[52]="sudo apt install irssi -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[53]="neofetch";
	Description[53]="";
	version[53]="";
	Homepage[53]="";
	Install[53]="sudo apt install neofetch -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[54]="awscli",
	Description[54]="";
	version[54]="";
	Homepage[54]="";
	Install[54]="sudo apt install awscli -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[55]="build-essential";
	Description[55]="";
	version[55]="";
	Homepage[55]="";
	Install[55]="sudo apt install build-essential -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[56]="cmatrix";
	Description[56]="";
	version[56]="";
	Homepage[56]="";
	Install[56]="sudo apt install cmatrix -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[57]="cowsay";
	Description[57]="";
	version[57]="";
	Homepage[57]="";
	Install[57]="sudo apt install cowsay -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[58]="curl";
	Description[58]="";
	version[58]="";
	Homepage[58]="";
	Install[58]="sudo apt install curl -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[59]="docker.io";
	Description[59]="";
	version[59]="";
	Homepage[59]="";
	Install[59]="sudo apt install docker.io -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[60]="docker-compose";
	Description[60]="";
	version[60]="";
	Homepage[60]="";
	Install[60]="sudo apt install docker-compose -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[61]="git-core";
	Description[61]="";
	version[61]="";
	Homepage[61]="";
	Install[61]="sudo apt install git-core -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[62]="groff";
	Description[62]="";
	version[62]="";
	Homepage[62]="";
	Install[62]="sudo apt install -groff ${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[63]="hollywood";
	Description[63]="";
	version[63]="";
	Homepage[63]="";
	Install[63]="sudo apt install hollywood -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[64]="nasm";
	Description[64]="The Netwide Assembler, NASM, is an 80x86 and x86-64 assembler designed for portability and modularity.";
	version[64]="2.14.02";
	Homepage[64]="https://www.nasm.us/";
	Install[64]="sudo apt install nasm  -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[65]="id3tool";
	Description[65]="";
	version[65]="";
	Homepage[65]="";
	Install[65]="sudo apt install id3tool -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[66]="imagemagick";
	Description[66]="";
	version[66]="";
	Homepage[66]="";
	Install[66]="sudo apt install imagemagick -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[67]="jq";
	Description[67]="";
	version[67]="";
	Homepage[67]="";
	Install[67]="sudo apt install jq -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[68]="mercurial";
	Description[68]="";
	version[68]="";
	Homepage[68]="";
	Install[68]="sudo apt install jq -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[69]="python-pip";
	Description[69]="";
	version[69]="";
	Homepage[69]="";
	Install[69]="sudo apt install python-pip -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[70]="nmap";
	Description[70]="";
	version[70]="";
	Homepage[70]="";
	Install[70]="sudo apt install nmap -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[71]="silversearcher-ag";
	Description[71]="";
	version[71]="";
	Homepage[71]="";
	Install[71]="sudo apt install silversearcher-ag -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[72]="thefuck";
	Description[72]="";
	version[72]="";
	Homepage[72]="";
	Install[72]="sudo apt install thefuck -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[73]="sl";
	Description[73]="";
	version[73]="";
	Homepage[73]="";
	Install[73]="sudo apt install sl -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[74]="telnet";
	Description[74]="";
	version[74]="";
	Homepage[74]="";
	Install[74]="sudo apt install telnet -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[75]="tree";
	Description[75]="";
	version[75]="";
	Homepage[75]="";
	Install[75]="sudo apt install tree -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[76]="mysql-workbench",
	Description[76]="";
	version[76]="";
	Homepage[76]="";
	Install[76]="wget -q http://cdn.mysql.com/Downloads/MySQLGUITools/mysql-workbench-community[8].0.12-1ubuntu18.04_amd64.deb -O mysql-workbench-community.deb && \
 			sudo dpkg -i mysql-workbench-community.deb && \
 			sudo apt -f install";
	# -----------------------------------------------------------------------------------------						
	Nome[77]="postgresql";
	Description[77]="";
	version[77]="";
	Homepage[77]="";
	Install[77]="sudo apt install postgresql -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[78]="postgresql-contrib";
	Description[78]="";
	version[78]="";
	Homepage[78]="";
	Install[78]="sudo apt install postgresql-contrib -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[79]="mysql-server",
	Description[79]="";
	version[79]="";
	Homepage[79]="";
	Install[79]="sudo apt install mysql-server -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[80]="php7.2";
	Description[80]="";
	version[80]="";
	Homepage[80]="";
	Install[80]="sudo apt install php7.2 -${Yn} && \
		sudo a2enmod php7.2 && \
		sudo systemctl restart apache2 && \
		sudo cp info.php /var/www/html/";
	# -----------------------------------------------------------------------------------------						
	Nome[81]="phppgadmin";
	Description[81]="";
	version[81]="";
	Homepage[81]="";
	Install[81]="sudo apt install phppgadmin -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[82]="php7.2-pgsql";
	Description[82]="";
	version[82]="";
	Homepage[82]="";
	Install[82]="sudo apt install php7.2-pgsql -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[83]="php-gettext";
	Description[83]="";
	version[83]="";
	Homepage[83]="";
	Install[83]="sudo apt install php-gettext -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[84]="libapache2-mod-php7.2";
	Description[84]="";
	version[84]="";
	Homepage[84]="";
	Install[84]="sudo apt install libapache2-mod-php7.2 -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[85]="php7.2-mysql";
	Description[85]="";
	version[85]="";
	Homepage[85]="";
	Install[85]="sudo apt install php7.2-mysql -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[86]="php-common";
	Description[86]="";
	version[86]="";
	Homepage[86]="";
	Install[86]="sudo apt install php-common -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[87]="php7.2-cli";
	Description[87]="";
	version[87]="";
	Homepage[87]="";
	Install[87]="sudo apt install php7.2-cli -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[88]="php7.2-common";
	Description[88]="";
	version[88]="";
	Homepage[88]="";
	Install[88]="sudo apt install php7.2-common -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[89]="php7.2-json";
	Description[89]="";
	version[89]="";
	Homepage[89]="";
	Install[89]="sudo apt install php7.2-json -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[90]="php7.2-readline";
	Description[90]="";
	version[90]="";
	Homepage[90]="";
	Install[90]="sudo apt install php7.2-readline -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[91]="php7.2-opcache";
	Description[91]="";
	version[91]="";
	Homepage[91]="";
	Install[91]="sudo apt install php7.2-opcache -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[92]="libav-tools";
	Description[92]="";
	version[92]="";
	Homepage[92]="";
	Install[92]="sudo apt install libav-tools -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[93]="x11-xserver-utils";
	Description[93]="";
	version[93]="";
	Homepage[93]="";
	Install[93]="sudo apt install x11-xserver-utils -${Yn}";
	# -----------------------------------------------------------------------------------------								
	Nome[94]="xdotool";
	Description[94]="";
	version[94]="";
	Homepage[94]="";
	Install[94]="sudo apt install xdotool -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[95]="wininfo";
	Description[95]="";
	version[95]="";
	Homepage[95]="";
	Install[95]="sudo apt install wininfo -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[96]="wmctrl";
	Description[96]="";
	version[96]="";
	Homepage[96]="";
	Install[96]="sudo apt install wmctrl -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[97]="python-gobject";
	Description[97]="";
	version[97]="";
	Homepage[97]="";
	Install[97]="sudo apt install python-gobject -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[98]="python-cairo";
	Description[98]="";
	version[98]="";
	Homepage[98]="";
	Install[98]="sudo apt install python-cairo -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[99]="xdg-utils";
	Description[99]="";
	version[99]="";
	Homepage[99]="";
	Install[99]="sudo apt install xdg-utils -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[100]="yad";
	Description[100]="";
	version[100]="";
	Homepage[100]="";
	Install[100]="sudo apt install yad -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[101]="silentcast";
	Description[101]="";
	version[101]="";
	Homepage[101]="";
	Install[101]="sudo apt install silentcast -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[102]="vim";
	Description[102]="";
	version[102]="";
	Homepage[102]="";
	Install[102]="sudo apt install vim -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[103]="handbrake-cli";
	Description[103]="";
	version[103]="";
	Homepage[103]="";
	Install[103]="sudo apt install handbrake-cli -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[104]="rvm";
	Description[104]="";
	version[104]="";
	Homepage[104]="";
	Install[104]="sudo apt install rvm -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[105]="autoconf";
	Description[105]="";
	version[105]="";
	Homepage[105]="";
	Install[105]="sudo apt install autoconf -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[106]="bison";
	Description[106]="";
	version[106]="";
	Homepage[106]="";
	Install[106]="sudo apt install bison -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[107]="build-essential";
	Description[107]="";
	version[107]="";
	Homepage[107]="";
	Install[107]="sudo apt install build-essential -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[108]="libssl-dev";
	Description[108]="";
	version[108]="";
	Homepage[108]="";
	Install[108]="sudo apt install libssl-dev -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[109]="libyaml-dev";
	Description[109]="";
	version[109]="";
	Homepage[109]="";
	Install[109]="sudo apt install libyaml-dev -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[110]="libreadline6-dev";
	Description[110]="";
	version[110]="";
	Homepage[110]="";
	Install[110]="sudo apt install libreadline6-dev -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[111]="libncurses5-dev";
	Description[111]="";
	version[111]="";
	Homepage[111]="";
	Install[111]="sudo apt install libncurses5-dev -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[112]="libffi-dev";
	Description[112]="";
	version[112]="";
	Homepage[112]="";
	Install[112]="sudo apt install libffi-dev -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[113]="libgdbm3";
	Description[113]="";
	version[113]="";
	Homepage[113]="";
	Install[113]="sudo apt install libgdbm3 -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[114]="libgdbm-dev";
	Description[114]="";
	version[114]="";
	Homepage[114]="";
	Install[114]="sudo apt install libgdbm-dev -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[115]="zlib1g-dev";
	Description[115]="";
	version[115]="";
	Homepage[115]="";
	Install[115]="sudo apt install zlib1g-dev -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[116]="ansible";
	Description[116]="";
	version[116]="";
	Homepage[116]="";
	Install[116]="sudo apt install ansible -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[117]="tmux-xpanes";
	Description[117]="";
	version[117]="";
	Homepage[117]="";
	Install[117]="sudo apt install tmux-xpanes -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[118]="gource";
	Description[118]="Software projects are displayed by Gource as an animated tree with the root directory of the project at its centre.";
	version[118]="0.49";
	Homepage[118]="https://gource.io/";
	Install[118]="sudo apt-get install gource -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[119]="npm";
	Description[119]="O npm é um gerenciador de pacotes para a linguagem de programação JavaScript. Node.js";
	version[119]="6.9.0";
	Homepage[119]="https://npm.org";
	Install[119]="sudo apt install npm -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[120]="ffmpeg";
	Description[120]="player";
	version[120]="3.4.6-0ubuntu0.18.04.1 Copyright (c) 2000-2019 the FFmpeg developers";
	Homepage[120]="https://gource.io/";
	Install[120]="sudo apt-get install ffmpeg -${Yn}";
	# -----------------------------------------------------------------------------------------						
	Nome[121]="sublime-merge";
	Description[121]="git";
	version[121]="git";
	Homepage[121]="https://sublime-merge.com/";
	Install[121]="wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - && \
		sudo apt-get install apt-transport-https && \
		echo 'deb https://download.sublimetext.com/ apt/stable/' | sudo tee /etc/apt/sources.list.d/sublime-text.list && \
		sudo apt-get update && \
		sudo apt-get install sublime-merge";
	# -----------------------------------------------------------------------------------------						
	Nome[122]="boxes";
	Description[122]="ascii";
	version[122]="";
	Homepage[122]="";
	Install[122]="sudo apt install boxes -${Yn}";
	# -----------------------------------------------------------------------------------------								
	Nome[123]="tasksel";
	Description[123]="Mostra todos os grupos possiveis para seu perfil e instala se requerido.";
	version[123]="";
	Homepage[123]="";
	Install[123]="sudo apt install tasksel -${Yn} &&
		sudo tasksel --list-tasks";
	# -----------------------------------------------------------------------------------------								
	Nome[124]="synaptics";
	Description[124]="Instalador de programas";
	version[124]="";
	Homepage[124]="";
	Install[124]="sudo apt install synaptics -${Yn}";
	# -----------------------------------------------------------------------------------------								
	Nome[124]="KDE";
	Description[124]="Session KDE";
	version[124]="5.12";
	Homepage[124]="";
	Install[124]="sudo tasksel install kubuntu-desktop -${Yn}";
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

