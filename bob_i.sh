#!/bin/bash
############################################################################################
#
#   Bob utilities script bash 
#
version="2019.01";               									# Versão do Programa
#
scriptFileVersion="1.0.0"; 											# Versão do script
#
# History:
# 	1.0.0    script version inicial, [tela 1], configura screen e supre dependêncas.
#   2019.01  Dividido em diretorios criação de route e tipando de forma MVC (23/06/2019)
#
# Dependências:
#	function Dependencias()
#
# * Retorno: n/a
# * Data: n/a
#
# by: Elizeu de Santana -------------------------------------------------------------------

# -----------------------------------------------------------------------------------------
						   # Prover uma variavel com a pespectiva de localizações do script
instalacao="/projetos/bob";                                    # Instalação apartir de HOME
scriptPath_Home="${HOME}";                                             # Diretorio HOME (~)
scriptPath_Bob="${scriptPath_Home}${instalacao}";                       # Instalação do Bob
scriptPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";      # Instalação do script 
# -----------------------------------------------------------------------------------------
if [ $scriptPath != $scriptPath_Bob ] ; then
    utilsLocation="${scriptPath_Bob}/lib/bob_util.sh";  		
else
    utilsLocation="${scriptPath}/lib/bob_util.sh"; 
fi
# -----------------------------------------------------------------------------------------
if [ -f "${utilsLocation}" ]; then
	source "${utilsLocation}"; Class_Bob; 	   # Carrega localização Arq. aux and functions
    #source "${utilsLocation}"; Location;  		        # Carrega localizações dos arquivos
    #source "${utilsLocation}"; Change;					      # Carrega arquivos auxiliares
else
    e_error "Erro carregando ${utilsLocation}";
fi
# -----------------------------------------------------------------------------------------
declare -a dp;		  													     # dependências
readonly -A _bob_=(															   # informação
	[name]='Bob' 
	[keywords]='Shell Script Complet'
	[description]='Pau para toda obra!.'
	[version]='2019.01'
	[language]='shellscript'
	[shell]=${SHELL}
	[shell_version]=${BASH_VERSION}
	[author]='Elizeu de Santana'
	[email]='elizeudesantana@hotmail.com'
	[wiki]='https://github.com/bob/wiki'
	[github]='https://github.com/bob'
	[packages]='curl 7.0, getopt 2.0, jq 1.5, byobu, figlet, aptitude, neofetch, tput, htop,
		irssi'
)
# -----------------------------------------------------------------------------------------
fonts_bob=( "FontFiraCode" "PowerlineSymbols" "NerdFonts" "NotoEmoji" "Devicons")
# -----------------------------------------------------------------------------------------
quiet=false; printLog=false; verbose=false; force=false; strict=false; debug=false; args=() 
# -----------------------------------------------------------------------------------------
																   # Verifica dependências.
# -----------------------------------------------------------------------------------------																	
function Verifica_dp(){
	while read _pkg_ _ver_; do
		if command -v $_pkg_ &>/dev/null; then
			if [[ $($_pkg_ --version 2>&1) =~ [0-9]+\.[0-9]+ ]]; then
				if ! awk 'BEGIN { exit ARGV[1] < ARGV[2] }' $BASH_REMATCH $_ver_; then
					printf "%s: erro: requer o pacote '%s %s' ou \
						superior.\n" ${_bob_[name]} $_pkg_ $_ver_ 1>&2
					exit 1; bob_i_dp=("" "");
				fi
			else
				echo # Comentado devido a erro em versões, implementar function para 
				# realizar o tratamento especifico.
				# printf "%s: erro: '%s' não foi possível obter a \
				# versão.\n" ${_bob_[name]} $_pkg_ 1>&2
				# $_pkg_ -v
			fi
		else
			printf "%s: erro: '%s' o pacote requerido está \
				ausente.\n" ${_bob_[name]} $_pkg_ 1>&2
			dp=($_pkg_);								  # Carrega nome do pacote ausente
		fi
	done <<< "${_bob_[packages]//,/$'\n'}"
	if [ ! -z $dp ] ; then
		echo ${dp[0]}; echo ${dp[1]}; echo ${dp[2]};
		__Instalador $dp;	
	else
		echo ${dp[0]}; echo ${dp[1]}; echo ${dp[2]};
	fi
}
# ----------------------------------------------------------------------------------------
# Criando temp directorio com três números rândomicos process ID
# Este directorio é removido automaticamente ao sair.
# ----------------------------------------------------------------------------------------
tmpDir="/tmp/${scriptName}.$RANDOM.$RANDOM.$RANDOM.$$"
(umask 077 && mkdir "${tmpDir}") || {
  die "Não foi possivel criar arquivo no diretorio! Saindo."
}
# ----------------------------------------------------------------------------------------
# Print usage  - REVISAR		Usar HELP
# # ----------------------------------------------------------------------------------------
# usage() {
#   echo -n "${scriptName} [OPTION]... [FILE]...

# This is a script template.  Edit this description to print help to users.

#  ${bold}Options:${reset}
#   -c, --clima       Clima tempo digite a cidade ./bob_i -c 'guaratiba'
#   -p, --password    User password
#   --force           Skip all user interaction.  Implied 'Yes' to all actions.
#   -q, --quiet       Quiet (no output)
#   -l, --log         Print log to file
#   -s, --strict      Exit script with null variables.  i.e 'set -o nounset'
#   -v, --verbose     Output more information. (Items echoed to 'verbose')
#   -d, --debug       Runs script in BASH debug mode #(set -x)
#   -h, --help        Display this help and exit
#   --version         Output version information and exit
# "
# }
# ----------------------------------------------------------------------------------------
								# Verifica  Integridade dos arquivos que compõe o sistema 
													 # by: Elizeu de Santana / 17-06-2019 
# ----------------------------------------------------------------------------------------
function Dependencias_fonts(){
	Titulo_Inicial; printf "\n\n\n\n";
	e_arrow "Iniciando configuração de fonts. $(e_success)"
	for i in ${fonts_bob[@]}; do
		e_arrow -d "Configurando font ${i}. $(e_success)"
		if [ "${i}" = "FontFiraCode" ]; then
			InstalarFontFiraCode
		elif [ "${i}" = "PowerlineSymbols" ]; then
			InstalarFontsPowerline
		elif [ "${i}" = "NerdFonts" ]; then
			InstalarNerdFonts
		elif [ "${i}" = "NotoEmoji" ]; then
			InstalargoogleNotoEmoji
		elif [ "${i}" = "Devicons" ]; then
			InstalarDevicon
		fi
		e_arrow -d "Configuração da font ${i} terminada. $(e_success)"
	done
	fc-cache -vf "${fontsLocation}"; 
	sleep 1
}
# ----------------------------------------------------------------------------------------
								 # Verifica  Integridade dos arquivos que compõe o sistema 
													  # by: Elizeu de Santana / 17-06-2019
# ----------------------------------------------------------------------------------------
function Integridade(){	
	Titulo_Inicial; printf "\n\n\n\n"
	int_x=( "${bobLocation}" "${pythonLocation}" "${instalacaoLocation}" "${shellfontsLocation}" 
		"${programasLocation}" "${servidorLocation}" "${errosLocation}" "${textoLocation}" 
		"${chtLocation}" "${financeiroLocation}" "${financeiroBDLocation}" "${bancodadosLocation}" 
		"${manutencaoLocation}"	"${zzfuncaoLocation}" )
	local contagem=0; 	e_arrow "Iniciando configuração Integridade. $(e_success)"
	for i in ${int_x[@]}; do
		if [ -f "${i}" ]; then
			let $((contagem=contagem+1))
		else
			e_error "Integridade comprometida !!! Arquivo ${i} ausente."; read
			Sair
		fi
		e_arrow -d "Configuração Integridade ${i} terminada. $(e_success)"
	done; sleep 1
}
# ----------------------------------------------------------------------------------------
													  		  # (ColorSchemeGnomeTerminal)
														 #https://github.com/Mayccoll/Gogh
# ----------------------------------------------------------------------------------------
function ColorSchemeGnomeTerminal(){
	Titulo_Inicial; printf "\n\n\n\n"
	seek_confirmation "Iniciando Configuração screen, gostaria de trocar o Color Scheme \
		Gnome Terminal ?"
	if is_confirmed; then
		if [[ ! $(which gogh 2>/dev/null) ]]; then
			sudo wget -O /usr/local/bin/gogh https://git.io/vQgMr  
			sudo chmod +x /usr/local/bin/gogh
			#bash -c  "$(wget -qO- https://git.io/vQgMr)" [exec o script on-line]
			gogh
			e_arrow "Configuração screen style terminal pronta, click esquerdo / perfil \
				escolha. $(e_success)"
		fi
	else
		e_arrow "Configuração screen style terminal pronta. $(e_success)"
	fi
}
# ----------------------------------------------------------------------------------------
																	       #( mainScript )
# ----------------------------------------------------------------------------------------
							  ### Função Principal, inicio do software. versao 2019.01 ###
													  # by: Elizeu de Santana / 16-06-2019 
# ----------------------------------------------------------------------------------------
function mainScript(){
	Verifica_dp; _Clima_ -t; Integridade; Dependencias_fonts; ColorSchemeGnomeTerminal;
	Titulo_Inicial; printf "\n\n\n\n"; neofetch
	e_arrow "Configuração inicial terminada. $(e_success)"
	seek_confirmation "Iniciando Configuração screen, gostaria de monitorar o sistema ?"
	if is_confirmed; then
		if [ -z "$(byobu list-sessions | grep bob)" ] ; then
		    byobu-tmux new-session -d -t bob 
		    byobu-tmux rename-window bob 
		   	byobu-tmux send-keys -t 0 '${bobLocation}' 'C-m'
		    byobu split-window -h
		    byobu-tmux send-keys -t 1 'htop' 'C-m'
		fi
		e_arrow "Configuração screen monitoração terminada. $(e_success)"
		seek_confirmation "Iniciando Configuração screen, gostaria de conversar \
			(baixar mp3, livros, etc.) ?"
		if is_confirmed; then
		    byobu split-window -v
		    byobu-tmux send-keys -t 2 'irssi' 'C-m'
		fi
		byobu-tmux attach -t bob
	else
		e_arrow "Configuração screen monitoração terminada. $(e_success)"
		seek_confirmation "Iniciando Configuração screen, gostaria de conversar \
			(baixar mp3, livros, etc.) ?"
		if is_confirmed; then
			if [ -z "$(byobu list-sessions | grep bob)" ] ; then
			    byobu-tmux new-session -d -t bob 
			    byobu-tmux rename-window bob 
			   	byobu-tmux send-keys -t 0 '${bobLocation}' 'C-m'
			    byobu split-window -v
			    byobu-tmux send-keys -t 1 'irssi' 'C-m'
			fi
			byobu-tmux attach -t bob
		else
			e_arrow "Configuração screen conversa terminada. $(e_success)"
		fi
	fi
	e_arrow "Configuração screen terminada. $(e_success)"
	seek_confirmation "gostaria de iniciar o bob ?"
	if is_confirmed; then
		source "${bobLocation}"; #Principal;
	else 
	   	e_error "${lgt}, obrigado pela preferência."
	   	Sair
	fi
	Sair
}
# -----------------------------------------------------------------------------------------
                                                              #(Chamada a função Principal)
# -----------------------------------------------------------------------------------------
mainScript
# ----------------------------------------THE END------------------------------------------    