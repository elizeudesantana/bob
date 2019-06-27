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
if [ -f "${financeiroBDLocation}" ]; then
    source "${financeiroBDLocation}";
else
    e_error "Erro carregando ${financeiroBDLocation}"; Sair;
fi
# -----------------------------------------------------------------------------------------

# variaveis -------------------------------------------------------------------------------
moedaDefalt="brl"; INTERVAL=.1; INTERVAL2=1
# Output program
#PRINT="$(which xsetroot) -name"
PRINT="echo -ne"

# -----------------------------------------------------------------------------------------
# Função Financeiro
# -----------------------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------------------
function Financeiro(){
    sleep 3 & _Annime_BancoDados; $sql_user "show databases;" $agenda_DB;
    e_arrow "Base de dados pronta. $(e_success)"; sleep 3
    clear; curl http://${moedaDefalt}.rate.sx; read    

    Titulo_Inicial; printf "\n\n\n\n"
    #marquee "$@" "este e um teste muito lono teno que escreve um muonte coisa sem saber o escrevaed" & 
    e_header "Você pode fazer as  seguintes escolhas."  
}

# by: Elizeu de Santana / 15-06-2019 -------------------------------------------------------
function Cripto(){
    while true ; do
        clear
        curl http://${moedaDefalt}.rate.sx
        echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
        echo -ne "${ctm} (B)TC, (E)TH, (X)RP, (L)TC, B(C)H, E(O)S, B(N)B, B(S)V, (U)SDT, XL(M) | Out(r)os | (s)air : ${dlc}"; read opt
        case ${opt} in
            B) clear; curl http://${moedaDefalt}.rate.sx/btc; read ;; 
            E) clear; curl http://${moedaDefalt}.rate.sx/eth; read ;; 
            X) clear; curl http://${moedaDefalt}.rate.sx/xrp; read ;; 
            L) clear; curl http://${moedaDefalt}.rate.sx/ltc; read ;; 
            C) clear; curl http://${moedaDefalt}.rate.sx/bch; read ;; 
            O) clear; curl http://${moedaDefalt}.rate.sx/eos; read ;; 
            N) clear; curl http://${moedaDefalt}.rate.sx/bnb; read ;; 
            N) clear; curl http://${moedaDefalt}.rate.sx/bnb; read ;; 
            S) clear; curl http://${moedaDefalt}.rate.sx/bsv; read ;; 
            U) clear; curl http://${moedaDefalt}.rate.sx/usdt; read ;; 
            M) clear; curl http://${moedaDefalt}.rate.sx/xlm; read ;; 
            r) MenuCript ;; 
            s) Financeiro ;; 
            *) echo -e "${ctm} Comando desconhecido Cripto! ${dlc}"; read ;;
        esac        
    done
}

# by: Elizeu de Santana / 15-06-2019 -------------------------------------------------------
function MenuCript(){
    cot1btc=$(curl ${moedaDefalt}.rate.sx/1BTC); Titulo_Inicial
    echo -e "${ctm} 1) Visualizar coins. [ (max 500) ]                                     ${dlc}"
    echo -e "${ctm} 2) Analise grafica de um coins.                                        ${dlc}"
    echo -ne "${ctm} 3) Cotação de 1 BTC - ${dlc}" 
    echo -ne "${ctr} R$ ${cot1btc} ${dlc}" 
    echo -e "${ctm} - Realizar conversões. ${dlc}"
    echo -e "${ctm} 4) Analise historica. [ Criptomoedas ]                                 ${dlc}"
    echo -e "${ctm} 5) Moedas disponiveis para conversão. [ Currencies ]                   ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
    echo -e "${ctm} (s)air de volta ao Cripto.                                             ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
    echo -ne "${ctm} opção: ${dlc}"; read opt
    case ${opt} in
        1) 
            Titulo_Inicial
            echo -ne "${ctr} Digite o número de coins : ${dlc}"; read opt
            curl "${moedaDefalt}.rate.sx/?qT&n=${opt}"
            echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"; read
            MenuCript
            ;;
        2) 
            Titulo_Inicial
            curl http://rate.sx/:coins  
            echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
            echo -ne "${ctr} Digite a sigla da coin : ${dlc}"; read opt
            curl ${opt}.rate.sx; read; MenuCript
            ;;
        3)  
            ConvCrpt
            ;;
        4)
            CrptHistory
            ;;
        5)
            Titulo_Inicial
            echo -e "${ctr} Moedas por paises currencies : ${dlc}"
            curl http://rate.sx/:currencies
            echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
            echo -ne "${ctr} Moeda atual : ${moedaDefalt}   | Modificar a moeda (d)efault - (s)air : ${dlc}"; read opt
            if [ "${opt}" = "s" ] ; then
                MenuCript
            elif [ "${opt}" = "d" ] ; then
                echo -ne "${ctr} Digite a nova moeda : ${dlc}"; read opt
                moedaDefalt=${opt}
            else
                echo -e "${ctr} Comando não reconhecido. ${dlc}"; MenuCript
            fi          
            ;;
        s) 
            Cripto 
            ;;
        *) MenuCript;;
    esac
}

# by: Elizeu de Santana / 15-06-2019 -------------------------------------------------------
function CrptHistory(){
    while true ; do
        Titulo_Inicial; cal -3
        echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
        echo -ne "${ctr} \n Digite quantidade de (d)ias ou (m)ês - (c)alendario ou (s)air :  ${dlc}";read opt
        echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
        if [ "${opt}" = "d" ] ; then
            echo -ne "${ctr} Quantidade : ${dlc}"; read q
            echo -ne "${ctr} Criptomoeda : ${dlc}"; read c
            Titulo_Inicial; curl ${moedaDefalt}.rate.sx/${c}@${q}d; read
        elif [ "${opt}" = "m" ] ; then
            echo -ne "${ctr} Mês : ${dlc}"; read q
            echo -ne "${ctr} Criptomoeda : ${dlc}"; read c
            Titulo_Inicial; curl ${moedaDefalt}.rate.sx/${c}@${q}; read
        elif [ "${opt}" = "c" ] ; then
            Titulo_Inicial
            echo -ne "${ctr} \n Data - (ano [2019], mes [June] ou data ) :  ${dlc}"; read a; cal ${a}; read  
        else
            MenuCript
        fi
    done
}

# by: Elizeu de Santana / 15-06-2019 -------------------------------------------------------
function ConvCrpt(){
    while true ; do
        Titulo_Inicial
        echo -e "${ctr} \n Conversão de Criptomoedas para Reais :  ${dlc}"
        echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
        echo -ne "${ctr} Quantidade : ${dlc}"; read q
        echo -ne "${ctr} Criptomoeda : ${dlc}"; read c
        echo -e "${cls} Processando ---------------------------------------------------------- ${dlc}"
        cotcrpt=$(curl ${moedaDefalt}.rate.sx/${q}${c})
        echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
        echo -ne "${ctr} A cotação atual em reais da Criptomoeda ${c} com a quantidade ${q} : R$ ${dlc}"
        echo -e "${ctm} ${cotcrpt} ${dlc}"
        echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
        echo -ne "${ctr} (n)ova conversão, (s)air, (r)elação das criptomoedas : ${dlc}"; read opt
        if [ "${opt}" = "s" ] ; then
            MenuCript
        elif [ "${opt}" = "r" ] ; then
            Titulo_Inicial
            curl http://rate.sx/:coins  
            echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
            echo -ne "${ctr} Digite a sigla da coin : ${dlc}"; read opt
            curl ${opt}.rate.sx; read
        fi
    done
}

# by: Elizeu de Santana / 18-06-2019 -------------------------------------------------------
marquee_left()
{
    string="$*"
    let eidx=${#string}+1
    for i in $(seq 1 $eidx)
    do
        let j=i-1; strout="$(echo "$string" |cut -b $i-)"
        [ $j -ne 0 ] && strout="$strout$(echo "$string" |cut -b -$j)"
        $PRINT "$strout\r"; sleep $INTERVAL
    done
}
# by: Elizeu de Santana / 18-06-2019 -------------------------------------------------------
marquee_right()
{
    string="$*"
    let eidx=${#string}+1
    for i in $(seq 1 $eidx)
    do
        let j=$eidx-$i+1; strout="$(echo "$string" | cut -b $j-)"; let --j
        [ $j -gt 0 ] && strout="$strout$(echo "$string" | cut -b -$j)"
        $PRINT "$strout\r"; sleep $INTERVAL
    done
}

# by: Elizeu de Santana / 18-06-2019 -------------------------------------------------------
marquee()
{
    [ -z "$*" ] && echo "Uso: $(basename $0) <string>" && exit 1
    for SIG in INT TERM
        do trap "$PRINT '' && exit" $SIG
    done
    n=0
    while true
    do
        let "$n"; n=$?
        [ $n -ne 0 ] && marquee_right "$*" || marquee_left "$*"
        sleep $INTERVAL2
    done
}