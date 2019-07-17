#!/bin/bash
############################################################################################
#
#   Bob utilities script bash 
#
version="2019.01";                                                  # Versão do Programa
#
scriptFileVersion="1.0.0";                                          # Versão do script
#
# History:
#   1.0.0    script version inicial, [tela 1], configura screen e supre dependêncas.
#   2019.01  Dividido em diretorios criação de route e tipando de forma MVC (23/06/2019)
#
# Dependências:
#   function Dependencias()
#
# * Retorno: Carregado por bob_util.sh
# * Data: n/a
#
# by: Elizeu de Santana -------------------------------------------------------------------

# -----------------------------------------------------------------------------------------
                                                                                   # bob ls
# -----------------------------------------------------------------------------------------
function Mostra_diretorio(){
    function devicons_get_directory_symbol {
        local symbol=""; echo "$symbol $1"
        return 0
    }

    function devicons_get_filetype_symbol {
        declare -A extensions=(
            [txt]=e
            [styl]=
            [scss]=
            [htm]=
            [html]=
            [slim]=
            [ejs]=
            [css]=
            [less]=
            [md]=
            [markdown]=
            [json]=
            [js]=
            [jsx]=
            [rb]=
            [php]=
            [py]=
            [pyc]=
            [pyo]=
            [pyd]=
            [coffee]=
            [mustache]=
            [hbs]=
            [conf]=
            [ini]=
            [yml]=
            [bat]=
            [jpg]=
            [jpeg]=
            [bmp]=
            [png]=
            [gif]=
            [ico]=
            [twig]=
            [cpp]=
            [c++]=
            [cxx]=
            [cc]=
            [cp]=
            [c]=
            [hs]=
            [lhs]=
            [lua]=
            [java]=
            [sh]=
            [fish]=
            [ml]=λ
            [mli]=λ
            [diff]=
            [db]=
            [sql]=
            [dump]=
            [clj]=
            [cljc]=
            [cljs]=
            [edn]=
            [scala]=
            [go]=
            [dart]=
            [xul]=
            [sln]=
            [suo]=
            [pl]=
            [pm]=
            [t]=
            [rss]=
            [f#]=
            [fsscript]=
            [fsx]=
            [fs]=
            [fsi]=
            [rs]=
            [rlib]=
            [d]=
            [erl]=
            [hrl]=
            [vim]=
            [ai]=
            [psd]=
            [psb]=
            [ts]=
            [jl]=
        )
        local filetype
        local default=
        local exist_check=1
        local input=$1
        local filename="$1"
        # using ## for possibly more than one "." (get after last one):
        local filetype="${filename##*.}"

        if [ ! -z "$filetype" ] && [ ${extensions[$filetype]+$exist_check} ]; then
        local symbol=${extensions[$filetype]}
        else
        local symbol=$default
        fi

        echo "$symbol $1"

        return 0
    }
    find $1 -maxdepth 1 -type f -printf "%P\n" | sort | { while read line; do
       lines="$lines $(devicons_get_filetype_symbol $line) \n"
    done
    echo -en "$lines \n" | column -n
    }
    find $1 -maxdepth 1 -mindepth 1 -type d -printf "%P\n" | sort | { while read line; do
       lines="$lines $(devicons_get_directory_symbol $line) \n"
    done
    echo -en "$lines \n" | column -n
    }
}

# -----------------------------------------------------------------------------------------
                                                        # Mostrar fonts instaladas glyicons
                                                       # by: Elizeu de Santana / 12-06-2019 
# -----------------------------------------------------------------------------------------
function MenuInstalacaoFonts() {
  Titulo
  echo -e "${ctm} Menu Instalação de Fonts :                       ${dlc}"
  echo -e "${ctm} 1 - Instalar Fira code Fonts.                      ${dlc}"
  echo -e "${ctm} 2 - Instalar Powerline Symbols Fonts & fonts-powerline all 2.6-1   ${dlc}"
  echo -e "${ctm} 3 - Instalar Tweak para configurar ubuntu.               ${dlc}"
  echo -e "${ctm} 4 - Instalar Nerd Fonts.                       ${dlc}"
  echo -e "${ctm} 5 - Instalar Oh-my-Zsh.                        ${dlc}"
  echo -e "${ctm} 6 - Instalar Gedit & Terminal -> theme Dracula.            ${dlc}"
  echo -e "${cls} ----------------------------------------------------------------     ${dlc}"
  echo -e "${ctm} s - Retorna ao Menu Principal Bob.                   ${dlc}"
  echo -e "${ctm} l - Retorna ao Menu Instalação Bob.                  ${dlc}"
  echo -e "${cls} ----------------------------------------------------------------     ${dlc}"
  echo -ne "${ctr} Digite a opção :  ${dlc}"; read opt
  case $opt in
  1) InstalarFontFiraCode ;;
  2) InstalarFontsPowerline ;;
  3) InstalarTweak ;;
  4) InstalarNerdFonts ;;
  5) ZSHInstall ;;
  6) InstalarThemeDraculaTerminal ;;
  s) . 'bob.sh'; Principal ;;
  l) . 'bob.instalacao.sh'; MenuInstacaoPrincipal ;;
  *) echo -e "${ctr} Opção desconhecida. ${dlc}"; MenuInstalacaoFonts ;;
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
                                                              # function InstalarDevicon()
# ----------------------------------------------------------------------------------------
function InstalarDevicon() {
  fonts_dir="${HOME}/.local/share/fonts"
  if [ ! -d "${fonts_dir}" ]; then
    e_error "Não encontrado diretorio, $fonts_dir $(e_error)"
    mkdir -p "${fonts_dir}"
    e_arrow -d "Configuração criado diretorio, $fonts_dir terminado. $(e_success)"
  else
    e_arrow -d "Configuração diretorio, $fonts_dir terminado. $(e_success)"
  fi
  file_path="${HOME}/.local/share/fonts/devicons.ttf"
  file_url="https://github.com/vorillaz/devicons/archive/master.zip"
  file_local="${deviconsLocation}"
  if [ ! -e "${file_path}" ]; then
    e_error "Não encontrado font, ${file_path} $(e_error)"
    wget -O "${file_local}" "${file_url}"
    sudo unzip $file_local $fonts_dir
    e_arrow -d "Configuração instalado fonts, devicons terminado. $(e_success)"
  else
    e_arrow -d "Configuração existe fonts, devicons terminado. $(e_success)"
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
function InstalarFontFiraCode() {
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

# -----------------------------------------------------------------------------------------
                                                                # Nerd Fonts Version: 2.0.0
                                                                    # Script Version: 1.0.0
                           # Given an array of decimal numbers print all unicode codepoint.
# -----------------------------------------------------------------------------------------                        
function print-decimal-unicode-range() {
    local originalSequence=("$@")
    local counter=0
    # Use alternating colors to see which symbols extend out of the bounding
    # box.
    local bgColorBorder='\033[48;5;8m'
    local bgColorCode='\033[48;5;246m'
    local alternateBgColorCode='\033[48;5;240m'
    local bgColorChar='\033[48;5;66m'
    local alternateBgColorChar='\033[48;5;60m'
    local underline='\033[4m'
    local currentColorCode="${bgColorCode}"
    local currentColorChar="${bgColorChar}"
    local reset_color='\033[0m'
    local allChars=""
    local allCodes=""
    local wrapAt=5
    local topLine="${bgColorBorder}╔══════╦══════╦══════╦══════╦══════╗${reset_color}"
    local bottomLine="${bgColorBorder}╚══════╩══════╩══════╩══════╩══════╝${reset_color}"
    local line="${bgColorBorder}╠══════╬══════╬══════╬══════╬══════╣${reset_color}"
    local bar="${bgColorBorder}║${reset_color}"
    local originalSequenceLength=${#originalSequence[@]}
    local leftoverSpaces=$((wrapAt - (originalSequenceLength % wrapAt)))
    # add fillers to array to maintain table:
    if [[ "$leftoverSpaces" < "$wrapAt" ]]; then
        # shellcheck disable=SC2034
        # needs rework without 'i' var?
        for i in $(seq 1 $leftoverSpaces); do
            originalSequence+=(0)
        done
    fi
    local sequenceLength=${#originalSequence[@]}
    printf "%b\\n" "$topLine"
    for decimalCode in "${originalSequence[@]}"; do
        local hexCode
        hexCode=$(printf '%x' "${decimalCode}")
        local code="${hexCode}"
        local char="\\u${hexCode}"
        # fill in placeholder cells properly formatted:
        if [ "${char}" = "\\u0" ]; then
            char=" "
            code="    "
        fi
        allCodes+="${currentColorCode} ${underline}${code}${reset_color}${currentColorCode} ${reset_color}$bar"
        allChars+="${currentColorChar}  ${char}   ${reset_color}$bar"
        counter=$((counter + 1))
        count=$(( (count + 1) % wrapAt))
        if [[ $count -eq 0 ]]; then
            if [[ "${currentColorCode}" = "${alternateBgColorCode}" ]]; then
                currentColorCode="${bgColorCode}"
                currentColorChar="${bgColorChar}"
            else
                currentColorCode="${alternateBgColorCode}"
                currentColorChar="${alternateBgColorChar}"
            fi
            printf "%b%b%b" "$bar" "$allCodes" "$reset_color"
            printf "\\n"
            printf "%b%b%b" "$bar" "$allChars" "$reset_color"
            printf "\\n"
            if [ "$counter" != "$sequenceLength" ]; then
                printf "%b\\n" "$line"
            fi
            allCodes=""
            allChars=""
        fi
    done
    printf "%b\\n" "$bottomLine"
}
# -----------------------------------------------------------------------------------------
                                                                                   # printa
# -----------------------------------------------------------------------------------------
function print-unicode-ranges() {
    echo ''
    local arr=($@)
    local len=$#
    local combinedRanges=()
    for ((j=0; j<len; j+=2)); do
        local start="${arr[$j]}"
        local end="${arr[(($j+1))]}"
        local startDecimal=$((16#$start))
        local endDecimal=$((16#$end))
        combinedRanges+=($(seq "${startDecimal}" "${endDecimal}"))
    done
    print-decimal-unicode-range "${combinedRanges[@]}"
}
# -----------------------------------------------------------------------------------------
                                                                             # printa fonts
# -----------------------------------------------------------------------------------------
function test-fonts() {
  # echo "Nerd Fonts - Pomicons"
  # print-unicode-ranges e000 e00d
  # echo; echo
  # echo "Nerd Fonts - Powerline"
  # print-unicode-ranges e0a0 e0a2 e0b0 e0b3
  # echo; echo
  # echo "Nerd Fonts - Powerline Extra"
  # print-unicode-ranges e0a3 e0a3 e0b4 e0c8 e0cc e0d2 e0d4 e0d4
  # echo; echo
  # echo "Nerd Fonts - Symbols original"
  # print-unicode-ranges e5fa e62b
  # echo; echo
  # echo "Nerd Fonts - Devicons"
  # print-unicode-ranges e700 e7c5
  # echo; echo
  # echo "Nerd Fonts - Font awesome"
  # print-unicode-ranges f000 f2e0
  # echo; echo
  # echo "Nerd Fonts - Font awesome extension"
  # print-unicode-ranges e200 e2a9
  # echo; echo
  # echo "Nerd Fonts - Octicons"
  # print-unicode-ranges f400 f4a8 2665 2665 26A1 26A1 f27c f27c
  # echo; echo
  # echo "Nerd Fonts - Font Linux"
  # print-unicode-ranges f300 f313
  # echo; echo
  # echo "Nerd Fonts - Font Power Symbols"
  # print-unicode-ranges 23fb 23fe 2b58 2b58
  # echo; echo
  # echo "Nerd Fonts - Material Design Icons"
  # print-unicode-ranges f500 fd46
  # echo; echo
  echo "Nerd Fonts - All"
  print-unicode-ranges e000 e00d e0a0 e0a2 e0b0 e0b3 e0a3 e0a3 e0b4 e0c8 e0cc e0d2 e0d4 e0d4 e5fa e62b e700 e7c5 f000 f2e0 e200 e2a9 f400 f4a8 2665 2665 26A1 26A1 f27c f27c f300 f313 23fb 23fe 2b58 2b58 f500 fd46
  read; echo; echo
} 
#test-fonts
