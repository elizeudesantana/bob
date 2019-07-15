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
# scriptPath="$( cd "$( dirname "${BASH_SOURCE_0}" )" && pwd )";      # Diretorio de instalação do script
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
	# 	codecs_dp=( "libdvdnav4" "libdvdread4" "gstreamer1_0_plugins_bad" \
    #         "gstreamer1_0_plugins_ugly" "ubuntu_restricted_extras" );
    #   develop_dp=( "kdevelop" "codeblocks_contrib" "codeblocks" "mingw_w64"\
    #         "build_essential" "gcc" "g++" "gpp" "bluefish_plugins" "bluefish" \
    #         "openjdk_8_jdk" "python3_pip" "python_pip" "anjuta_extra" "anjuta" );
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
	if [ ${1} = "desenvolvimento" ] ; then
		desenvolvimentoNome_0="kdevelop";
		desenvolvimentoDescription_0="integrated development environment for C/C++ and other languages";
		desenvolvimentoversion_0="4:5.2.1-1ubuntu4";
		desenvolvimentoHomepage_0="https://www.kdevelop.org/";
		desenvolvimentoInstall_0=(
			"sudo apt install kdevelop -${Yn}"
			"sudo aptitude install kdevelop -${Yn}"
			"sudo apt-get install kdevelop -${Yn}" );
		# -----------------------------------------------------------------------------------------
		desenvolvimentoNome_1="codeblocks_contrib";
		desenvolvimentoDescription_1="contrib plugins for Code::Blocks IDE";
		desenvolvimentoversion_1="16.01+dfsg-2.1";
		desenvolvimentoHomepage_1="http://codeblocks.org";
		desenvolvimentoInstall_1=(
			"sudo apt install codeblocks-contrib -${Yn}"
			"sudo aptitude install codeblocks-contrib -${Yn}"
			"sudo apt-get install codeblocks-contrib -${Yn}" );
		# -----------------------------------------------------------------------------------------
		desenvolvimentoNome_2="codeblocks";
		desenvolvimentoDescription_2="Code::Blocks integrated development environment (IDE)";
		desenvolvimentoversion_2="16.01+dfsg-2.1";
		desenvolvimentoHomepage_2="http://codeblocks.org";
		desenvolvimentoInstall_2=(
			"sudo apt install codeblocks -${Yn}"
			"sudo aptitude install codeblocks -${Yn}"
			"sudo apt-get install codeblocks -${Yn}" );
		# -----------------------------------------------------------------------------------------
		desenvolvimentoNome_3="mingw_w64";
		desenvolvimentoDescription_3="Development environment targeting 32- and 64-bit Windows";
		desenvolvimentoversion_3="5.0.3-1";
		desenvolvimentoHomepage_3="http://mingw-w64.sf.net";
		desenvolvimentoInstall_3=(
			"sudo apt install mingw-w64 -${Yn}"
			"sudo aptitude install mingw-w64 -${Yn}"
			"sudo apt-get install mingw-w64 -${Yn}" );
		# -----------------------------------------------------------------------------------------
		desenvolvimentoNome_4="build_essential";
		desenvolvimentoDescription_4="Informational list of build-essential packages";
		desenvolvimentoversion_4="12.4ubuntu1";
		desenvolvimentoHomepage_4="https://www.ubuntuupdates.org/build-essential";
		desenvolvimentoInstall_4=(
			"sudo apt install build-essential -${Yn}"
			"sudo aptitude install build-essential -${Yn}"
			"sudo apt-get install build-essential -${Yn}" );
		# -----------------------------------------------------------------------------------------
		desenvolvimentoNome_5="gcc";
		desenvolvimentoDescription_5="GNU C compiler";
		desenvolvimentoversion_5="4:7.4.0-1ubuntu2.3";
		desenvolvimentoHomepage_5="https://www.ubuntuupdates.org/package/core/bionic/main/security/gcc-defaults";
		desenvolvimentoInstall_5=(
			"sudo apt install gcc -${Yn}"
			"sudo aptitude install gcc -${Yn}"
			"sudo apt-get install gcc -${Yn}" );
		# -----------------------------------------------------------------------------------------
		desenvolvimentoNome_6="g_plus_plus";
		desenvolvimentoDescription_6="GNU C++ compiler";
		desenvolvimentoversion_6="4:7.4.0-1ubuntu2.3";
		desenvolvimentoHomepage_6="https://www.ubuntuupdates.org/package/core/bionic/main/security/gcc-defaults";
		desenvolvimentoInstall_6=(
			"sudo apt install g++ -${Yn}"
			"sudo aptitude install g++ -${Yn}"
			"sudo apt-get install g++ -${Yn}" );
		# -----------------------------------------------------------------------------------------
		desenvolvimentoNome_7="gpp";
		desenvolvimentoDescription_7="A general-purpose preprocessor with customizable syntax";
		desenvolvimentoversion_7="2.24-3build1";
		desenvolvimentoHomepage_7="http://www.nothingisreal.com/gpp/";
		desenvolvimentoInstall_7=(
			"sudo apt install gpp -${Yn}"
			"sudo aptitude install gpp -${Yn}"
			"sudo apt-get install gpp -${Yn}" );
		# -----------------------------------------------------------------------------------------
		desenvolvimentoNome_8="bluefish_plugins";
		desenvolvimentoDescription_8="advanced Gtk+ text editor (plugins)";
		desenvolvimentoversion_8="2.2.10-1";
		desenvolvimentoHomepage_8="http://bluefish.openoffice.nl";
		desenvolvimentoInstall_8=(
			"sudo apt install bluefish-plugins -${Yn}"
			"sudo aptitude install bluefish-plugins -${Yn}"
			"sudo apt-get install bluefish-plugins -${Yn}" );
		# -----------------------------------------------------------------------------------------
		desenvolvimentoNome_9="bluefish";
		desenvolvimentoDescription_9="advanced Gtk+ text editor for web and software development";
		desenvolvimentoversion_9="2.2.10-1";
		desenvolvimentoHomepage_9="http://bluefish.openoffice.nl";
		desenvolvimentoInstall_9=(
			"sudo apt install bluefish -${Yn}"
			"sudo aptitude install bluefish -${Yn}"
			"sudo apt-get install bluefish -${Yn}" );
		# -----------------------------------------------------------------------------------------
		desenvolvimentoNome_10="openjdk_8_jdk";
		desenvolvimentoDescription_10="OpenJDK Development Kit (JDK)";
		desenvolvimentoversion_10="8u212-b03-0ubuntu1.18.04.1";
		desenvolvimentoHomepage_10="http://openjdk.java.net/";
		desenvolvimentoInstall_10=(
			"sudo apt install openjdk-8-jdk -${Yn}"
			"sudo aptitude install openjdk-8-jdk -${Yn}"
			"sudo apt-get install openjdk-8-jdk -${Yn}" );
		# -----------------------------------------------------------------------------------------
		desenvolvimentoNome_11="python3_pip";
		desenvolvimentoDescription_11="Python package installer";
		desenvolvimentoversion_11="9.0.1-2";
		desenvolvimentoHomepage_11="https://pip.pypa.io/en/stable/";
		desenvolvimentoInstall_11=(
			"sudo apt install python3-pip -${Yn}"
			"sudo aptitude install python3-pip -${Yn}"
			"sudo apt-get install python3-pip -${Yn}" );
		# -----------------------------------------------------------------------------------------
		desenvolvimentoNome_12="python_pip";
		desenvolvimentoDescription_12="Python package installer";
		desenvolvimentoversion_12="9.0.1-2.3~ubuntu1.18.04.1";
		desenvolvimentoHomepage_12="https://pip.pypa.io/en/stable/";
		desenvolvimentoInstall_12=(
			"sudo apt install python-pip -${Yn}"
			"sudo aptitude install python-pip -${Yn}"
			"sudo apt-get install python-pip -${Yn}" );
		# -----------------------------------------------------------------------------------------
		desenvolvimentoNome_13="anjuta_extra";
		desenvolvimentoDescription_13="plugins and extras for anjuta";
		desenvolvimentoversion_13="3.26.0-3";
		desenvolvimentoHomepage_13="http://www.anjuta.org/";
		desenvolvimentoInstall_13=(
			"sudo apt install anjuta-extra -${Yn}"
			"sudo aptitude install anjuta-extra -${Yn}"
			"sudo apt-get install anjuta-extra -${Yn}" );
		# -----------------------------------------------------------------------------------------
		desenvolvimentoNome_14="anjuta";
		desenvolvimentoDescription_14="GNOME development IDE, for C/C++";
		desenvolvimentoversion_14="2:3.28.0-1";
		desenvolvimentoHomepage_14="http://www.anjuta.org/";
		desenvolvimentoInstall_14=(
			"sudo apt install anjuta -${Yn}"
			"sudo aptitude install anjuta -${Yn}"
			"sudo apt-get install anjuta -${Yn}" );
	# -----------------------------------------------------------------------------------------
	elif [ ${1} = "browsers" ] ; then
		# -----------------------------------------------------------------------------------------
		browsersNome_0="google";
		browsersDescription_0="google chrome stable";
		browsersversion_0="Versão 75.0.3770.90 (Versão oficial) 64 bits";
		browsersHomepage_0="http://www.google.com/";
		browsersInstall_0=(
			"curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
			"sudo dpkg -i google-chrome-stable_current_amd64.deb"
			"rm google-chrome-stable_current_amd64.deb" )
		# -----------------------------------------------------------------------------------------
		browsersNome_1="links";
		browsersDescription_1="Web browser running in both graphics and text mode";
		browsersversion_1="3.28.5-0ubuntu1";
		browsersHomepage_1="http://links.twibright.com/";
		browsersInstall_1=(
			"sudo apt install links2 -${Yn}"
			"sudo aptitude install links2 -${Yn}"
			"sudo apt-get install links2 -${Yn}" )
		# -----------------------------------------------------------------------------------------
		browsersNome_2="chromium";
		browsersDescription_2="Chromium web browser, open-source version of Chrome";
		browsersversion_2="75.0.3770.100";
		browsersHomepage_2="canonical";
		browsersInstall_2=(
			"sudo snap install chromium" );
		# -----------------------------------------------------------------------------------------
		browsersNome_3="epiphany_browser";
		browsersDescription_3="Intuitive GNOME web browser";
		browsersversion_3="3.28.5-0ubuntu1";
		browsersHomepage_3="https://wiki.gnome.org/Apps/Web";
		browsersInstall_3=(
			"sudo apt install epiphany-browser -${Yn}"
			"sudo aptitude install epiphany-browser -${Yn}"
			"sudo apt-get install epiphany-browser -${Yn}" )
		# -----------------------------------------------------------------------------------------
		browsersNome_4="tor";
		browsersDescription_4="anonymizing overlay network for TCP Tor";
		browsersversion_4="0.3.5.8-1~bionic+1";
		browsersHomepage_4="https://www.torproject.org/";
		browsersInstall_4=(
			"sudo apt install tor -${Yn}"
			"sudo aptitude install tor -${Yn}"
			"sudo apt-get install tor -${Yn}" )
		# -----------------------------------------------------------------------------------------
		browsersNome_5="torbrowser_launcher";
		browsersDescription_5="helps download and run the Tor Browser Bundle";
		browsersversion_5="0.2.9-2";
		browsersHomepage_5="https://micahflee.com/torbrowser-launcher/";
		browsersInstall_5=(
			"sudo apt install torbrowser-launcher -${Yn}"
			"sudo aptitude install torbrowser-launcher -${Yn}"
			"sudo apt-get install torbrowser-launcher -${Yn}" )
	# -----------------------------------------------------------------------------------------
	elif [ ${1} = "codecs" ] ; then
		# -----------------------------------------------------------------------------------------
		codecsNome_0="libdvdnav4";
		codecsDescription_0="DVD navigation library";
		codecsversion_0="6.0.0-1";
		codecsHomepage_0="https://dvdnav.mplayerhq.hu/";
		codecsInstall_0=(
			"sudo apt install libdvdnav4 -${Yn}"
			"sudo aptitude install libdvdnav4 -${Yn}"
			"sudo apt-get install libdvdnav4 -${Yn}" );
		# -----------------------------------------------------------------------------------------
		codecsNome_1="libdvdread4";
		codecsDescription_1="library for reading DVDs";
		codecsversion_1="6.0.0-1";
		codecsHomepage_1="https://dvdnav.mplayerhq.hu/";
		codecsInstall_1=(
			"sudo apt install libdvdread4 -${Yn}"
			"sudo aptitude install libdvdread4 -${Yn}"
			"sudo apt-get install libdvdread4 -${Yn}" );
		# -----------------------------------------------------------------------------------------
		codecsNome_2="gstreamer1_0_plugins_bad";
		codecsDescription_2="GStreamer plugins from the bad set";
		codecsversion_2="1.14.4-1ubuntu1~ubuntu18.04.1";
		codecssHomepage_2="https://gstreamer.freedesktop.org";
		codecsInstall_2=(
			"sudo apt install gstreamer1.0-plugins-bad -${Yn}"
			"sudo aptitude install gstreamer1.0-plugins-bad -${Yn}"
			"sudo apt-get install gstreamer1.0-plugins-bad -${Yn}" );
		# -----------------------------------------------------------------------------------------
		codecsNome_3="gstreamer1_0_plugins_ugly";
		codecsDescription_3="GStreamer plugins from the ugly set";
		codecsversion_3="1.14.4-1~ubuntu18.04.1";
		codecsHomepage_3="https://gstreamer.freedesktop.org";
		codecsInstall_3=(
			"sudo apt install gstreamer1.0-plugins-ugly -${Yn}"
			"sudo aptitude install gstreamer1.0-plugins-ugly -${Yn}"
			"sudo apt-get install gstreamer1.0-plugins-ugly -${Yn}" );
		# -----------------------------------------------------------------------------------------
		codecsNome_4="ubuntu_restricted_extras";
		codecsDescription_4="Commonly used media codecs and fonts for Ubuntu";
		codecsversion_4="66";
		codecsHomepage_4="https://www.ubuntuupdates.org/ubuntu-restricted-extras";
		codecsInstall_4=(
			"sudo apt install ubuntu-restricted-extras -${Yn}"
			"sudo aptitude install ubuntu-restricted-extras -${Yn}"
			"sudo apt-get install ubuntu-restricted-extras -${Yn}" );
	# -----------------------------------------------------------------------------------------
	elif [ ${1} = "diversos" ] ; then
		# -----------------------------------------------------------------------------------------
		diversosNome_0="vlc";
		diversosDescription_0="multimedia player and streamer";
		diversosversion_0="3.0.3-1-1ubuntu1 and others";
		diversosHomepage_0="https://www.videolan.org/vlc/index.pt-BR.html";
		diversosInstall_0=(
			"sudo apt install vlc -${Yn}"
			"sudo aptitude install vlc -${Yn}"
			"sudo apt-get install vlc -${Yn}" );
		# -----------------------------------------------------------------------------------------
		diversosNome_1="StreamlinkTwitchGUI";
		diversosDescription_1="Chat application to Chatty";
		diversosversion_1="v1.5.0-linux64";
		diversosHomepage_1="https://streamlink.github.io/streamlink-twitch-gui/";
		diversosInstall_1=(
			"sudo apt install streamlink -${Yn}"
			"URL=https://github.com/streamlink/streamlink-twitch-gui"
			"URL=/releases/download/v1.5.0/streamlink-twitch-gui-v1.5.0-linux64.tar.gz"
			"wget -q  -O /tmp/streamlink-twitch-gui.tar.gz"
			"sudo tar -xzvf /tmp/streamlink-twitch-gui.tar.gz -C /opt"
			"sudo apt install xdg-utils libgconf-2-4 -${Yn}"
			"sudo /opt/streamlink-twitch-gui/add-menuitem.sh"
			"sudo ln -s /opt/streamlink-twitch-gui/start.sh /usr/bin/streamlink-twitch-gui" );
		# -----------------------------------------------------------------------------------------
		diversosNome_2="Chatty_StreamlinkTwitchGUI";
		diversosDescription_2="Twitch Chat Client/multimedia player and streamer";
		diversosversion_2="0.9.1/1.5.0";
		diversosHomepage_2="https://streamlink.github.io/streamlink-twitch-gui/";
		diversosInstall_2=(
			"sudo apt install default-jre -${Yn}"
			"URL=https://github.com/chatty/chatty/releases/download/v0.9.1"
			"URL=/Chatty_0.9.1.zip"
			"wget -q  -O /tmp/Chatty.zip"
			"sudo unzip /tmp/Chatty.zip -d /opt/chatty"
			"sudo apt install streamlink -${Yn}"
			"URL=https://github.com/streamlink/streamlink-twitch-gui"
			"URL=/releases/download/v1.5.0/streamlink-twitch-gui-v1.5.0-linux64.tar.gz"
			"wget -q  -O /tmp/streamlink-twitch-gui.tar.gz"
			"sudo tar -xzvf /tmp/streamlink-twitch-gui.tar.gz -C /opt"
			"sudo apt install xdg-utils libgconf-2-4 -${Yn}"
			"sudo /opt/streamlink-twitch-gui/add-menuitem.sh"
			"sudo ln -s /opt/streamlink-twitch-gui/start.sh /usr/bin/streamlink-twitch-gui" );
		# -----------------------------------------------------------------------------------------
		diversosNome_3="Glade";
		diversosDescription_3="Glade is a RAD tool to enable quick & easy development of user interfaces for the GTK+ toolkit and the GNOME desktop environment.";
		diversosversion_3="3.20.0.1";
		diversosHomepage_3="https://gitlab.gnome.org/GNOME/glade";
		diversosInstall_3=(
			"sudo snap install glade" );
		# -----------------------------------------------------------------------------------------
		diversosNome_4="android_studio";
		diversosDescription_4="Android Studio";
		diversosversion_4="3.20.0.1";
		diversosHomepage_4="https://developer.android.com/studio/install?hl=pt-br";
		diversosInstall_4=(
			"sudo snap install android-studio --classic" );
		# -----------------------------------------------------------------------------------------
		diversosNome_5="Anaconda3";
		diversosDescription_5="Anaconda Enterprise";
		diversosversion_5="Anaconda 2019.03 for Linux Installer";
		diversosHomepage_5="https://www.anaconda.com/distribution/";
		diversosInstall_5=(
			"curl -O https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh"
			"mv Anaconda3-2019.03-Linux-x86_64.sh /tmp"
			"cd /tmp"
			"bash Anaconda3-2019.03-Linux-x86_64.sh" );
		# -----------------------------------------------------------------------------------------
		diversosNome_6="eclipse";
		diversosDescription_6="Eclipse";
		diversosversion_6="1.0.0";
		diversosHomepage_6="https://www.eclipse.org";
		diversosInstall_6=(
			"wget http://ftp.jaist.ac.jp/pub/eclipse/technology/epp/downloads/release/2019-03/R/eclipse-java-2019-03-R-linux-gtk-x86_64.tar.gz"
			"sudo tar -zxvf eclipse-java-2019-*-R-linux-gtk-x86_64.tar.gz -C /usr/"
			"sudo ln -s /usr/eclipse/eclipse /usr/bin/eclipse" );
		# -----------------------------------------------------------------------------------------
		diversosNome_7="sublime_text";
		diversosDescription_7="A sophisticated text editor for code, markup and prose";
		diversosdiversosversion_7="Sublime Text 3 (Build 3207)";
		diversosHomepage_7="https://www.sublimetext.com/";
		diversosInstall_7=(
			"wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -"
			"sudo apt install apt-transport-https"
			"echo 'deb https://download.sublimetext.com/apt/stable/' | sudo tee /etc/apt/sources.list.d/sublime-text.list"
			"sudo apt-get update"
			"sudo apt install sublime-text" );
		# -----------------------------------------------------------------------------------------
		diversosNome_8="VScode";
		diversosDescription_8="Visual Studio Code";
		diversosversion_8="Version 1.36";
		diversosHomepage_8="https://code.visualstudio.com/";
		diversosInstall_8=(
			"sudo apt install software-properties-common apt-transport-https"
			"wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -"
			"sudo add-apt-repository 'deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main'"
			"sudo apt update"
			"sudo apt install code" );
		# -----------------------------------------------------------------------------------------
		diversosNome_9="VSCodium";
		diversosDescription_9="Community-driven, freely-licensed binary distribution of Microsoft’s editor VSCode";
		diversosversion_9="build from source";
		diversosHomepage_9="https://vscodium.com/";
		diversosInstall_9=(
			"wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -"
			"echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list"
			"sudo apt update"
			"sudo apt install codium" );
		# -----------------------------------------------------------------------------------------				
		diversosNome_10="Atom";
		diversosDescription_10="A hackable text editor for the 21st Century";
		diversosversion_10="v1.39.0-beta3 (2019-07-02)";
		diversosHomepage_10="https://atom.io/";
		diversosInstall_10=(
			"sudo add-apt-repository ppa:webupd8team/atom"
			"sudo apt-get update"
			"sudo apt-get install atom"
			"sudo snap install atom" );
		# -----------------------------------------------------------------------------------------				
		diversosNome_11="Geany";
		diversosDescription_11="Geany - The Flyweight IDE";
		diversosversion_11="1.35";
		diversosHomepage_11="https://www.geany.org/";
		diversosInstall_11=(
			"sudo apt install geany -${Yn}"
			"sudo apt-get install geany -${Yn}"
			"sudo aptitude install geany -${Yn}" );
		# -----------------------------------------------------------------------------------------				
		diversosNome_12="Wine";
		diversosDescription_12="wine emulador windows";
		diversosversion_12="3.0.3";
		diversosHomepage_12="https://www.winehq.org/";
		diversosInstall_12=(
			"wget -nc https://dl.winehq.org/wine-builds/winehq.key"
			"sudo apt-key add winehq.key"
			"sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'"
			"sudo apt update"
			"sudo apt install winehq-stable -${Yn}"
			"winecfg"
			"winetricks" );
		# -----------------------------------------------------------------------------------------				
		diversosNome_13="playonlinux";
		diversosDescription_13="Playonlinux para wine";
		diversosversion_13="";
		diversosHomepage_13="";
		diversosInstall_13=(
			"wget -q 'http://deb.playonlinux.com/public.gpg' -O- | sudo apt-key add -"
			"sudo wget http://deb.playonlinux.com/playonlinux_bionic.list -O /etc/apt/sources.list.d/playonlinux.list"
			"sudo apt-get update"
			"sudo apt-get install playonlinux -${Yn}" );
		# -----------------------------------------------------------------------------------------				
		diversosNome_14="tilix";
		diversosDescription_14="Tilix";
		diversosversion_14="";
		diversosHomepage_14="";
		diversosInstall_14=(
			"sudo apt install tilix -${Yn}"
			"sudo aptitude install tilix -${Yn}"
			"sudo apt-get install tilix -${Yn}" );
		# -----------------------------------------------------------------------------------------				
		diversosNome_15="Terminology";
		diversosDescription_15="Terminology";
		diversosversion_15="";
		diversosHomepage_15="";
		diversosInstall_15=(
			"sudo apt install terminology -${Yn}"
			"sudo aptitude install terminology -${Yn}"
			"sudo apt-get install terminology -${Yn}" );
		# -----------------------------------------------------------------------------------------				
		diversosNome_16="Neovim";
		diversosDescription_16="hyperextensible Vim-based text editor";
		diversosversion_16="v0.3.8";
		diversosHomepage_16="https://github.com/neovim/neovim/wiki/Installing-Neovim";
		diversosInstall_16=(
			"mkdir -p ~/.config/nvim"
			"sudo apt install neovim python3 python3-pip git exuberant-ctags"
			"python3 -m pip install virtualenv"
			"python3 -m virtualenv -p python3 ~/.config/nvim/env"
			"source ~/.config/nvim/env/bin/activate"
			"pip install neovim==0.2.6 jedi psutil setproctitle yapf"
			"deactivate"
			"curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
			"echo -e $(alias vim='nvim') >> ~/.bashrc"
			"sed '/call plug#end/q' init.vim > ~/.config/nvim/init.vim"
			"nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall'"
			"rm ~/.config/nvim/init.vim"
			"cp init.vim ~/.config/nvim/" );
	# -----------------------------------------------------------------------------------------
	elif [ ${1} = "outros" ] ; then
		# -----------------------------------------------------------------------------------------				
		Nome_0="xampp";
		Description_0="XAMPP é um servidor independente de plataforma, software livre, que consiste principalmente na base de dados MySQL, o qual foi substituído pelo MariaDB, o servidor web Apache e os interpretadores para linguagens de script: PHP e Perl.";
		version_0="7.3.7";
		Homepage_0="https://www.apachefriends.org/pt_br/index.html";
		Install_0=(
			"wget 'https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/7.3.6/xampp-linux-x64-7.3.6-3-installer.run/download'	-O xampp-installer.run"
			"chmod +x xampp-installer.run"
			"sudo ./xampp-installer.run"
			"echo -e '[Desktop Entry]\n Version=1.0\n Name=xampp\n Exec=gksudo /opt/lampp/manager-linux-x64.run\n Icon=/opt/lampp/icons/world1.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/xampp.desktop"
			"sudo apt-get install gksu" );
		# -----------------------------------------------------------------------------------------				
		Nome_1="aptitude";
		Description_1="";
		version_1="";
		Homepage_1="";
		Install_1=(
			"sudo apt install aptitude -${Yn}" );
		# -----------------------------------------------------------------------------------------				
		Nome_2="byobu";
		Description_2="";
		version_2="";
		Homepage_2="";
		Install_2=(
			"sudo apt install byobu -${Yn}" );
		# -----------------------------------------------------------------------------------------				
		Nome_3="nmcli";
		Description_3="";
		version_3="";
		Homepage_3="";
		Install_3=(
				"sudo apt install nmcli -${Yn}" );
		# -----------------------------------------------------------------------------------------				
		Nome_4="grep";
		Description_4="";
		version_4="";
		Homepage_4="";
		Install_4=(
			"sudo apt install grep -${Yn}" );
		# -----------------------------------------------------------------------------------------				
		Nome_5="awk",
		Description_5="";
		version_5="";
		Homepage_5="";
		Install_5=(	
			"sudo apt install awk -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_6="figlet";
		Description_6="";
		version_6="";
		Homepage_6="";
		Install_6=(		
			"sudo apt install figlet -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_7="tput";
		Description_7="";
		version_7="";
		Homepage_7="";
		Install_7=(
			"sudo apt install tput -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_8="htop";
		Description_8="";
		version_8="";
		Homepage_8="";
		Install_8=(		
			"sudo apt install htop -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_9="irssi";
		Description_9="";
		version_9="";
		Homepage_9="";
		Install_9=(			
			"sudo apt install irssi -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_10="neofetch";
		Description_10="";
		version_10="";
		Homepage_10="";
		Install_10=(			
			"sudo apt install neofetch -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_11="awscli",
		Description_11="";
		version_11="";
		Homepage_11="";
		Install_11=(			
			"sudo apt install awscli -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_12="build-essential";
		Description_12="";
		version_12="";
		Homepage_12="";
		Install_12=(			
			"sudo apt install build-essential -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_13="cmatrix";
		Description_13="";
		version_13="";
		Homepage_13="";
		Install_13=(			
			"sudo apt install cmatrix -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_14="cowsay";
		Description_14="";
		version_14="";
		Homepage_14="";
		Install_14=(			
			"sudo apt install cowsay -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_15="curl";
		Description_15="";
		version_15="";
		Homepage_15="";
		Install_15=(			
			"sudo apt install curl -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_16="docker.io";
		Description_16="";
		version_16="";
		Homepage_16="";
		Install_16=(			
			"sudo apt install docker.io -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_17="docker-compose";
		Description_17="";
		version_17="";
		Homepage_17="";
		Install_17=(			
			"sudo apt install docker-compose -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_18="git-core";
		Description_18="";
		version_18="";
		Homepage_18="";
		Install_18=(			
			"sudo apt install git-core -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_19="groff";
		Description_19="";
		version_19="";
		Homepage_19="";
		Install_19=(			
			"sudo apt install -groff ${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_20="hollywood";
		Description_20="";
		version_20="";
		Homepage_20="";
		Install_20=(			
			"sudo apt install hollywood -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_21="";
		Description_21="";
		version_21="";
		Homepage_21="";
		Install_21=(			
			"sudo apt install  -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_22="id3tool";
		Description_22="";
		version_22="";
		Homepage_22="";
		Install_22=(			
			"sudo apt install id3tool -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_23="imagemagick";
		Description_23="";
		version_23="";
		Homepage_23="";
		Install_23=(			
			"sudo apt install imagemagick -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_24="jq";
		Description_24="";
		version_24="";
		Homepage_24="";
		Install_24=(			
			"sudo apt install -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_25="mercurial";
		Description_25="";
		version_25="";
		Homepage_25="";
		Install_25=(			
			"sudo apt install jq -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_26="python-pip";
		Description_26="";
		version_26="";
		Homepage_26="";
		Install_26=(			
			"sudo apt install python-pip -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_27="nmap";
		Description_27="";
		version_27="";
		Homepage_27="";
		Install_27=(			
			"sudo apt install nmap -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_28="silversearcher-ag";
		Description_28="";
		version_28="";
		Homepage_28="";
		Install_28=(			
			"sudo apt install silversearcher-ag -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_29="thefuck";
		Description_29="";
		version_29="";
		Homepage_29="";
		Install_29=(			
			"sudo apt install thefuck -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_30="sl";
		Description_30="";
		version_30="";
		Homepage_30="";
		Install_30=(			
			"sudo apt install sl -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_31="telnet";
		Description_31="";
		version_31="";
		Homepage_31="";
		Install_31=(			
			"sudo apt install telnet -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_32="tree";
		Description_32="";
		version_32="";
		Homepage_32="";
		Install_32=(			
			"sudo apt install tree -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_33="mysql-workbench",
		Description_33="";
		version_33="";
		Homepage_33="";
		Install_33=(			
			"wget -q http://cdn.mysql.com/Downloads/MySQLGUITools/mysql-workbench-community_8.0.12-1ubuntu18.04_amd64.deb -O mysql-workbench-community.deb"
   			"sudo dpkg -i mysql-workbench-community.deb"
   			"sudo apt -f install" );
		# -----------------------------------------------------------------------------------------						
		Nome_34="postgresql";
		Description_34="";
		version_34="";
		Homepage_34="";
		Install_34=(			
			"sudo apt install postgresql -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_35="postgresql-contrib";
		Description_35="";
		version_35="";
		Homepage_35="";
		Install_35=(			
			"sudo apt install postgresql-contrib -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_36="mysql-server",
		Description_36="";
		version_36="";
		Homepage_36="";
		Install_36=(			
			"sudo apt install mysql-server -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_37="php7.2";
		Description_37="";
		version_37="";
		Homepage_37="";
		Install_37=(			
			"sudo apt install php7.2 -${Yn}"
			"sudo a2enmod php7.2"
    		"sudo systemctl restart apache2"
    		"sudo cp info.php /var/www/html/" );
		# -----------------------------------------------------------------------------------------						
		Nome_38="phppgadmin";
		Description_38="";
		version_38="";
		Homepage_38="";
		Install_38=(			
			"sudo apt install phppgadmin -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_39="php7.2-pgsql";
		Description_39="";
		version_39="";
		Homepage_39="";
		Install_39=(			
			"sudo apt install php7.2-pgsql -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_40="php-gettext";
		Description_40="";
		version_40="";
		Homepage_40="";
		Install_40=(			
			"sudo apt install php-gettext -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_41="libapache2-mod-php7.2";
		Description_41="";
		version_41="";
		Homepage_41="";
		Install_41=(			
			"sudo apt install libapache2-mod-php7.2 -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_42="php7.2-mysql";
		Description_42="";
		version_42="";
		Homepage_42="";
		Install_42=(			
			"sudo apt install php7.2-mysql -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_43="php-common";
		Description_43="";
		version_43="";
		Homepage_43="";
		Install_43=(			
			"sudo apt install php-common -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_44="php7.2-cli";
		Description_44="";
		version_44="";
		Homepage_44="";
		Install_44=(			
			"sudo apt install php7.2-cli -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_45="php7.2-common";
		Description_45="";
		version_45="";
		Homepage_45="";
		Install_45=(			
			"sudo apt install php7.2-common -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_46="php7.2-json";
		Description_46="";
		version_46="";
		Homepage_46="";
		Install_46=(			
			"sudo apt install php7.2-json -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_47="php7.2-readline";
		Description_47="";
		version_47="";
		Homepage_47="";
		Install_47=(			
			"sudo apt install php7.2-readline -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_48="php7.2-opcache";
		Description_48="";
		version_48="";
		Homepage_48="";
		Install_48=(			
			"sudo apt install php7.2-opcache -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_49="libav-tools";
		Description_49="";
		version_49="";
		Homepage_49="";
		Install_49=(			
			"sudo apt install libav-tools -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_50="x11-xserver-utils";
		Description_50="";
		version_50="";
		Homepage_50="";
		Install_50=(			
			"sudo apt install x11-xserver-utils -${Yn}" );
		# -----------------------------------------------------------------------------------------								
		Nome_51="xdotool";
		Description_51="";
		version_51="";
		Homepage_51="";
		Install_51=(			
			"sudo apt install xdotool -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_52="wininfo";
		Description_52="";
		version_52="";
		Homepage_52="";
		Install_52=(			
			"sudo apt install wininfo -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_53="wmctrl";
		Description_53="";
		version_53="";
		Homepage_53="";
		Install_53=(			
			"sudo apt install wmctrl -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_54="python-gobject";
		Description_54="";
		version_54="";
		Homepage_54="";
		Install_54=(			
			"sudo apt install python-gobject -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_55="python-cairo";
		Description_55="";
		version_55="";
		Homepage_55="";
		Install_55=(			
			"sudo apt install python-cairo -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_56="xdg-utils";
		Description_56="";
		version_56="";
		Homepage_56="";
		Install_56=(			
			"sudo apt install xdg-utils -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_57="yad";
		Description_57="";
		version_57="";
		Homepage_57="";
		Install_57=(			
			"sudo apt install yad -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_58="silentcast";
		Description_58="";
		version_58="";
		Homepage_58="";
		Install_58=(			
			"sudo apt install silentcast -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_59="vim";
		Description_59="";
		version_59="";
		Homepage_59="";
		Install_59=(			
			"sudo apt install vim -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_60="handbrake-cli";
		Description_60="";
		version_60="";
		Homepage_60="";
		Install_60=(			
			"sudo apt install handbrake-cli -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_61="rvm";
		Description_61="";
		version_61="";
		Homepage_61="";
		Install_61=(			
			"sudo apt install rvm -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_62="autoconf";
		Description_62="";
		version_62="";
		Homepage_62="";
		Install_62=(			
			"sudo apt install autoconf -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_63="bison";
		Description_63="";
		version_63="";
		Homepage_63="";
		Install_63=(			
			"sudo apt install bison -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_64="build-essential";
		Description_64="";
		version_64="";
		Homepage_64="";
		Install_64=(			
			"sudo apt install build-essential -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_65="libssl-dev";
		Description_65="";
		version_65="";
		Homepage_65="";
		Install_65=(			
			"sudo apt install libssl-dev -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_66="libyaml-dev";
		Description_66="";
		version_66="";
		Homepage_66="";
		Install_66=(			
			"sudo apt install libyaml-dev -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_67="libreadline6-dev";
		Description_67="";
		version_67="";
		Homepage_67="";
		Install_67=(			
			"sudo apt install libreadline6-dev -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_68="libncurses5-dev";
		Description_68="";
		version_68="";
		Homepage_68="";
		Install_68=(			
			"sudo apt install libncurses5-dev -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_69="libffi-dev";
		Description_69="";
		version_69="";
		Homepage_69="";
		Install_69=(			
			"sudo apt install libffi-dev -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_70="libgdbm3";
		Description_70="";
		version_70="";
		Homepage_70="";
		Install_70=(			
			"sudo apt install libgdbm3 -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_71="libgdbm-dev";
		Description_71="";
		version_71="";
		Homepage_71="";
		Install_71=(			
			"sudo apt install libgdbm-dev -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_72="zlib1g-dev";
		Description_72="";
		version_72="";
		Homepage_72="";
		Install_72=(		
			"sudo apt install zlib1g-dev -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_73="ansible";
		Description_73="";
		version_73="";
		Homepage_73="";
		Install_73=(			
			"sudo apt install ansible -${Yn}" );
		# -----------------------------------------------------------------------------------------						
		Nome_74="tmux-xpanes";
		Description_74="";
		version_74="";
		Homepage_74="";
		Install_74=(			
			"sudo apt install tmux-xpanes -${Yn}" );
		# -----------------------------------------------------------------------------------------								
	# # skins
	# # https://www.videolan.org/vlc/download-skins2-go.php?url=vlc-skins.zip
	# # ~/.local/share/vlc/skins2

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

	# # 	cd /tmp/
	# # 	URL="https://github.com/streamlink/streamlink-twitch-gui/releases/download/v1.5.0/streamlink-twitch-gui-v1.5.0-linux64.tar.gz"
	# # 	wget ${URL} --no-check-certificate
	# # 	sudo tar -xzvf streamlink-twitch-gui-v1.5.0-linux64.tar.gz -C /opt
	# # 	sudo apt install -y xdg-utils libgconf-2-4
	# # 	sudo /opt/streamlink-twitch-gui/add-menuitem.sh
	# # 	sudo ln -s /opt/streamlink-twitch-gui/start.sh /usr/bin/streamlink-twitch-gui

	# # cd /tmp/
	# # wget https://github.com/chatty/chatty/releases/download/v0.9.1/Chatty_0.9.1.zip --no-check-certificate
	# # sudo unzip Chatty_0.9.1.zip -d /opt/chatty
	# # streamlink-twitch-gui

	# #sudo subl /usr/share/applications/eclipse.desktop
	# #[Desktop Entry]
	# #Encoding=UTF-8
	# #Name=Eclipse IDE
	# #Comment=Eclipse IDE
	# #Exec=/usr/bin/eclipse
	# #Icon=/usr/eclipse/icon.xpm
	# #Terminal=false
	# #Type=Application
	# #StartupNotify=false
	# #nodejs
	# #npm
	# #Configure the workspace
	# #/home/elizeu/eclipse-workspace

	# # config:----------------------------------
	# # https://packagecontrol.io/installation copia/cola (show/console)key
	# # ctrl+shift+p - install packet
	# # theme ayu-dark
	# # query
	# # Alingtab
	# # anaconda
	# # wakatime key(8abf9130-a506-4388-be35-cd525002d176)
	# "comandos_8"	: "curl -fLo ~/.local/share/fonts/Iosevka\ Term\ Nerd\ Font\ Complete.ttf --create-dirs https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Term%20Nerd%20Font%20Complete.ttf",
	# #unzip neovim-init.vim-master.zip
	# #cd neovim-init.vim-master
	# #bash ./install.sh

	fi
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
		echo -e "${ctm} 1 - ${click_0} ${pen_0} ${dlc}"
		echo -e "${ctm} 2 - ${click_1} ${pen_1} ${dlc}"
		echo -e "${ctm} 3 - ${click_2} ${pen_2} ${dlc}"
		echo -e "${ctm} 4 - ${click_3} ${pen_3} ${dlc}"
		echo -e "${ctm} 5 - ${click_4} ${pen_4} ${dlc}"
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
