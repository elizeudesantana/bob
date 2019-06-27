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
if [ -f "${shellfontsLocation}" ]; then
    source "${shellfontsLocation}";
else
    e_error "Erro carregando ${shellfontsLocation}"; Sair;
fi
# -----------------------------------------------------------------------------------------
if [ -f "${programasLocation}" ]; then
    source "${programasLocation}";
else
    e_error "Erro carregando ${programasLocation}"; Sair;
fi
# -----------------------------------------------------------------------------------------
if [ -f "${servidorLocation}" ]; then
    source "${servidorLocation}";
else
    e_error "Erro carregando ${servidorLocation}"; Sair;
fi
# -----------------------------------------------------------------------------------------
if [ -f "${errosLocation}" ]; then
    source "${errosLocation}";
else
    e_error "Erro carregando ${errosLocation}"; Sair;
fi
# -----------------------------------------------------------------------------------------
# Função MenuInstacaoPrincipal
# -----------------------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------------------
function MenuInstacaoPrincipal(){
    e_header "${hi}, seja bem-vindo. As seguintes escolhas estão disponíveis."
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
# -----------------------------------------------------------------------------------------
# Função Construtor_Apt_Get
# -----------------------------------------------------------------------------------------
# Construtor para o gerenciador apt-get linux ubuntu
# -----------------------------------------------------------------------------------------
function Construtor_Apt_Get(){
	# Ubuntu-only stuff. Abort if not Ubuntu.
	is_ubuntu || return 1

	clear
    e_arrow "O ${red}${reset}${blue}   ${reset} instala vários aplicativos, conforme o usuários faz uso do software."
	printf "\n"; apt-cache stats; printf "\n";
    e_note "Você pode ter a lista de todos os pacotes (${purple}i${reset}${blue})nstalados ou uma (${purple}l${reset}${blue})ista de todos os"
    e_note -c "pacotes disponiveis para instalação no aplicativo gerênciador de pacotes, ainda"
    e_note -c "pode pesquisar por um pacote (${purple}e${reset}${blue})specífico, bastando digitar o nome do aplicativo"
    e_note -c "abaixo, contendo dependências e informações diversas, pode ainda pesquisar por pacotes"
    e_note -c "(${purple}q${reset}${blue})uebrados. Ou mesmo (${purple}a${reset}${blue})tualizar com update e fazer upgrade. O (${purple}h${reset}${blue})olding de pacotes" 
    e_note -c "significa que ele não pode ser atualizado até você voltar a usá-lo novamente."
    e_note -c "Aqui (${purple}u${reset}${blue})nhold. Se quizer editar o arquivo de o(${purple}r${reset}${blue})igem, sera mostrado uma"
    e_note -c "lista com os editores disponiveis aconselhamos o uso do indicado pela seta. Gostaria" 
    e_note -c "de usar o au(${purple}t${reset}${blue})oremove + purge. E re(${purple}m${reset}${blue})over e purgar, digite o nome abaixo."
    e_note -c "E se deseja i(${purple}n${reset}${blue})stalar. Descubra todo o pacote Debian que pode"
    e_note -c "ser usado para detecção de intru(${purple}s${reset}${blue})ão. Descubra todos os pacotes sni(${purple}f${reset}${blue})fer."
    e_note -c "E por último, tudo em um só lu(${purple}g${reset}${blue})ar aptitude."
    read -p "Digite uma das letras entre parenteses, acima : " opt
    if [ ${opt} = "i" ] ; then
    	apt list --installed; 
    	seek_confirmation "Gostaria de mais detalhes."
    	if is_confirmed; then
    		dpkg -l; 
    	fi
    	read; 
    elif [ ${opt} = "g" ] ; then
    	aptitude
    elif [ ${opt} = "f" ] ; then
    	apt-cache search sniffer; read;
    elif [ ${opt} = "s" ] ; then
    	apt-cache search "Intrusion Detection"; read;
    elif [ ${opt} = "m" ] ; then
    	read -p "Digite o nome do pacote, para remover e purgar : " pac
    	sudo apt remove ${pac};
    	sudo apt purge ${pac}; read;
    elif [ ${opt} = "n" ] ; then
    	read -p "Digite o nome do pacote, para instalar : " pac
    	sudo apt install ${pac}; read;
    elif [ ${opt} = "l" ] ; then
    	apt-cache pkgnames | more; read; 
    elif [ ${opt} = "t" ] ; then
    	sudo apt --purge autoremove
    elif [ ${opt} = "r" ] ; then
    	#sudo apt edit-sources
    	nano /etc/apt/sources.list
    elif [ ${opt} = "h" ] ; then
    	read -p "Digite o nome do pacote, para holding : " pac
    	apt hold ${pac}; read;
    elif [ ${opt} = "u" ] ; then
    	read -p "Digite o nome do pacote, para unholding : " pac
    	apt unhold ${pac}; read;
    elif [ ${opt} = "a" ] ; then
    	sudo apt update && sudo apt upgrade; read
    elif [ ${opt} = "e" ] ; then
    	read -p "Digite o nome do pacote, para pesquisar : " pac
    	apt-cache search ${pac}; read;
    	apt-cache pkgnames ${pac}; read;
    	apt-cache show ${pac}; read;
    	apt-cache showpkg ${pac}; read; 
    	apt depends ${pac}; read; 
    elif [ ${opt} = "q" ] ; then # pacotes quebrados
    	sudo apt-get check 					
    	seek_confirmation "Instalar dependências ?"
    	if is_confirmed; then
    		read -p "Digite o nome do pacote, para instalar dependências : " pac
    		which ${pac}; printf "\n"; seek_confirmation "Instalar dependências ?"
    		if is_confirmed; then
            	printf "\n"; sudo apt-get build-dep $pac
            else
            	e_arrow -d "Retornando ao menu principal."; 
            fi
        fi
    fi
    Principal


	apt_keys=()
	apt_source_files=()
	apt_source_texts=()
	apt_packages=()
	deb_installed=()
	deb_sources=()

	installers_path="$DOTFILES/caches/installers"

	# Ubuntu distro release name, eg. "xenial"
	release_name=$(lsb_release -c | awk '{print $2}')

	function add_ppa() {
	  apt_source_texts+=($1)
	  IFS=':/' eval 'local parts=($1)'
	  apt_source_files+=("${parts[1]}-ubuntu-${parts[2]}-$release_name")
	}

	#############################
	# WHAT DO WE NEED TO INSTALL?
	#############################

	# Misc.
	apt_packages+=(
	  awscli
	  build-essential
	  cmatrix
	  cowsay
	  curl
	  docker.io
	  docker-compose
	  git-core
	  groff
	  hollywood
	  htop
	  id3tool
	  imagemagick
	  jq
	  mercurial
	  nmap
	  postgresql
	  python-pip
	  silversearcher-ag
	  sl
	  telnet
	  thefuck
	  tree
	)

	apt_packages+=(vim)
	is_ubuntu_desktop && apt_packages+=(vim-gnome)

	# https://github.com/neovim/neovim/wiki/Installing-Neovim
	add_ppa ppa:neovim-ppa/stable
	apt_packages+=(neovim)

	# https://launchpad.net/~stebbins/+archive/ubuntu/handbrake-releases
	add_ppa ppa:stebbins/handbrake-releases
	apt_packages+=(handbrake-cli)
	is_ubuntu_desktop && apt_packages+=(handbrake-gtk)

	# https://github.com/rvm/ubuntu_rvm
	add_ppa ppa:rael-gc/rvm
	apt_packages+=(rvm)

	# https://github.com/rbenv/ruby-build/wiki
	apt_packages+=(
	  autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev
	  libncurses5-dev libffi-dev libgdbm3 libgdbm-dev zlib1g-dev
	)

	# https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-16-04
	add_ppa ppa:ansible/ansible
	apt_packages+=(ansible)

	# http://tipsonubuntu.com/2016/09/13/vim-8-0-released-install-ubuntu-16-04/
	add_ppa ppa:jonathonf/vim
	apt_packages+=(vim)

	# https://launchpad.net/~hnakamur/+archive/ubuntu/tmux
	add_ppa ppa:hnakamur/tmux

	# https://github.com/greymd/tmux-xpanes   BOM
	add_ppa ppa:greymd/tmux-xpanes
	apt_packages+=(tmux-xpanes)

	if is_ubuntu_desktop; then
	  # http://www.omgubuntu.co.uk/2016/06/install-latest-arc-gtk-theme-ubuntu-16-04
	  # apt_keys+=(http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key)
	  # apt_source_files+=(arc-theme)
	  # apt_source_texts+=("deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /")
	  # apt_packages+=(arc-theme)

	  add_ppa ppa:fossfreedom/arc-gtk-theme-daily
	  apt_packages+=(arc-theme)

	  # https://www.techrepublic.com/article/how-to-connect-a-linux-machine-to-google-cloud-print/
	  # sudo /usr/share/cloudprint-cups/setupcloudprint.py
	  add_ppa ppa:simon-cadman/niftyrepo
	  apt_packages+=(cupscloudprint)

	  # https://github.com/tagplus5/vscode-ppa
	  apt_keys+=(https://tagplus5.github.io/vscode-ppa/ubuntu/gpg.key)
	  apt_source_files+=(vscode.list)
	  apt_source_texts+=("deb https://tagplus5.github.io/vscode-ppa/ubuntu ./")
	  apt_packages+=(code code-insiders)

	  # https://www.ubuntuupdates.org/ppa/google_chrome
	  apt_keys+=(https://dl-ssl.google.com/linux/linux_signing_key.pub)
	  apt_source_files+=(google-chrome)
	  apt_source_texts+=("deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main")
	  apt_packages+=(google-chrome-stable)

	  # https://www.charlesproxy.com/documentation/installation/apt-repository/
	  apt_keys+=(https://www.charlesproxy.com/packages/apt/PublicKey)
	  apt_source_files+=(charles)
	  apt_source_texts+=("deb https://www.charlesproxy.com/packages/apt/ charles-proxy3 main")
	  apt_packages+=(charles-proxy)

	  # https://github.com/aluxian/Messenger-for-Desktop#linux
	  apt_keys+=('--keyserver pool.sks-keyservers.net --recv 6DDA23616E3FE905FFDA152AE61DA9241537994D')
	  apt_source_files+=(aluxian)
	  apt_source_texts+=("deb https://dl.bintray.com/aluxian/deb/ beta main")
	  apt_packages+=(messengerfordesktop)

	  # https://www.spotify.com/us/download/linux/
	  apt_keys+=('--keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886')
	  apt_source_files+=(spotify)
	  apt_source_texts+=("deb http://repository.spotify.com stable non-free")
	  apt_packages+=(spotify-client)

	  # https://tecadmin.net/install-oracle-virtualbox-on-ubuntu/
	  apt_keys+=(https://www.virtualbox.org/download/oracle_vbox_2016.asc)
	  apt_source_files+=(virtualbox)
	  apt_source_texts+=("deb http://download.virtualbox.org/virtualbox/debian $release_name contrib")
	  apt_packages+=(virtualbox-5.1)

	  # https://www.skype.com/en/download-skype/skype-for-linux/
	  # https://community.skype.com/t5/Linux/Skype-for-Linux-Beta-signatures-couldn-t-be-verified-because-the/td-p/4645756
	  apt_keys+=(https://repo.skype.com/data/SKYPE-GPG-KEY)
	  apt_source_files+=(skype-stable)
	  apt_source_texts+=("deb https://repo.skype.com/deb stable main")
	  apt_packages+=(skypeforlinux)

	  # http://askubuntu.com/a/190674
	  add_ppa ppa:webupd8team/java
	  apt_packages+=(oracle-java8-installer)
	  function preinstall_oracle-java8-installer() {
	    echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
	    echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
	  }

	  # https://github.com/colinkeenan/silentcast/#ubuntu
	  # https://github.com/colinkeenan/silentcast/#ubuntu-linux-full-install
	  add_ppa ppa:sethj/silentcast
	  add_ppa ppa:webupd8team/y-ppa-manager
	  apt_packages+=(
	    libav-tools x11-xserver-utils xdotool wininfo wmctrl python-gobject python-cairo xdg-utils yad
	    silentcast
	  )

	  # Misc
	  apt_packages+=(adb fastboot)
	  apt_packages+=(
	    chromium-browser
	    fonts-mplus
	    gnome-tweak-tool
	    k4dirstat
	    rofi
	    network-manager-openconnect
	    network-manager-openconnect-gnome
	    openssh-server
	    shutter
	    unity-tweak-tool
	    vlc
	    xclip
	    zenmap
	  )

	  # Manage online accounts via "gnome-control-center" in launcher
	  apt_packages+=(gnome-control-center gnome-online-accounts)

	  # https://github.com/mitchellh/vagrant/issues/7411
	  deb_installed+=(/usr/bin/vagrant)
	  deb_sources+=(https://releases.hashicorp.com/vagrant/1.9.2/vagrant_1.9.2_x86_64.deb)
	  # https://github.com/vagrant-libvirt/vagrant-libvirt/issues/575
	  # apt_packages+=(vagrant)
	  # function postinstall_vagrant() {
	  #   sudo sed -i'' "s/Specification.all = nil/Specification.reset/" /usr/lib/ruby/vendor_ruby/vagrant/bundler.rb
	  # }

	  # https://be5invis.github.io/Iosevka/
	  # https://launchpad.net/~laurent-boulard/+archive/ubuntu/fonts
	  add_ppa ppa:laurent-boulard/fonts
	  apt_packages+=(fonts-iosevka)

	  # https://launchpad.net/grub-customizer
	  add_ppa ppa:danielrichter2007/grub-customizer
	  apt_packages+=(grub-customizer)

	  # https://support.gitkraken.com/how-to-install
	  deb_installed+=(/usr/bin/gitkraken)
	  deb_sources+=(https://release.gitkraken.com/linux/gitkraken-amd64.deb)

	  # http://www.get-notes.com/linux-download-debian-ubuntu
	  apt_packages+=(libqt5concurrent5)
	  deb_installed+=(/usr/bin/notes)
	  deb_sources+=("https://github.com/nuttyartist/notes/releases/download/v1.0.0/notes_1.0.0_amd64-$release_name.deb")

	  # https://www.dropbox.com/install-linux
	  apt_packages+=(python-gtk2 python-gpgme)
	  deb_installed+=(/usr/bin/dropbox)
	  deb_sources+=("https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb")

	  # http://askubuntu.com/a/852727
	  apt_packages+=(cabextract)
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
	  apt_packages+=(python-apt)
	  deb_installed+=(/usr/bin/steam)
	  deb_sources+=(deb_source_steam)
	  function deb_source_steam() {
	    local steam_root steam_file
	    steam_root=http://repo.steampowered.com/steam/pool/steam/s/steam/
	    steam_file="$(wget -q -O- "$steam_root?C=M;O=D" | sed -En '/steam-launcher/{s/.*href="([^"]+)".*/\1/;p;q;}')"
	    echo "$steam_root$steam_file"
	  }
	  # https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=772598
	  # apt_packages+=(steam)
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
	  install_from_zip ngrok 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip'
	  install_from_zip terraform 'https://releases.hashicorp.com/terraform/0.9.2/terraform_0.9.2_linux_amd64.zip'
	}

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
	installed_apt_packages="$(dpkg --get-selections | grep -v deinstall | awk 'BEGIN{FS="[\t:]"}{print $1}' | uniq)"
	apt_packages=($(setdiff "${apt_packages[*]}" "$installed_apt_packages"))

	if (( ${#apt_packages[@]} > 0 )); then
	  e_header "Installing APT packages (${#apt_packages[@]})"
	  for package in "${apt_packages[@]}"; do
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

