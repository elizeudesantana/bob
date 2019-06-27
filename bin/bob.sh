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
#   1.0.0    Script version inicial.
#   2019.01  Dividido em diretorios criação de route e tipando de forma MVC (23/06/2019)
#
# Dependências:
#   function Dependencias()
#
# * Retorno: n/a
# * Data: 25/06/2019
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
    source "${utilsLocation}"; Class_Bob;
else
    e_error "Erro carregando ${utilsLocation}"; Sair;
fi

# -----------------------------------------------------------------------------------------
# Função Principal 
# -----------------------------------------------------------------------------------------
# Menu Principal com as opções para escolha dos usuários, com coisas (assuntos) iniciais 
# -----------------------------------------------------------------------------------------
opt="^"
function Principal(){
    if [ ${opt} = "^" ] ; then
        printf "\n\n\n"; 
        tm="seja bem-vindo ao menu principal."           
        BobMenu principal; 
    fi
    c=0; t=0; l=${#m[@]};
    for ((i=0;i<l;i++))
    do 
        clicked[${i}]="[ ]" 
    done 
    while true; do 
        Titulo_Inicial; printf "\n"
        if [ "${opt}" = "l" ] ; then
            tm="seja bem-vindo ao menu lembretes.";   
            Agenda
        elif [ "${opt}" = "c" ]; then
            Agenda; tm="seja bem-vindo ao menu contatos.";
        elif [ "${opt}" = "p" ]; then
            printf "\n\n\n"; tm="seja bem-vindo ao menu principal.";           
        elif [ "${opt}" = "m" ]; then
            Monitoracao; tm="seja bem-vindo ao menu manutenção.";           
        elif [ "${opt}" = "f" ]; then
            Financeiro; tm="seja bem-vindo ao menu financeiro.";
        elif [ "${opt}" = "i" ]; then
            MenuInstacaoPrincipal; tm="seja bem-vindo ao menu instalação.";
        elif [ "${opt}" = "b" ]; then
            BackupCloud; tm="seja bem-vindo ao menu backup.";       
        elif [ "${opt}" = "d" ]; then
            MenuBD; tm="seja bem-vindo ao menu Banco de Dados.";
        fi
        titulo_menu; echo ${tm}
        for ((i=0;i<l;i++))
        do       
            e_arrow -d "$((${i}+1)))\t${clicked[${i}]}${m[${i}]}"            
        done
        case ${opt} in
            1 ) h1 ;; 
            2 ) h2 ;;
            3 ) h3 ;;
            4 ) h4 ;;
            5 ) h5 ;;
            6 ) h6 ;;
            7 ) h7 ;;
            8 ) h8 ;;
            9 ) h9 ;;
            10 ) h10 ;;
            11 ) h11 ;;
            12 ) h12 ;;
            13 ) h13 ;;
            14 ) h14 ;;
            15 ) h15 ;;
            16 ) h16 ;;
            17 ) h17 ;;
            18 ) h18 ;;
            19 ) h19 ;;
            20 ) h20 ;;
            21 ) h21 ;;
            22 ) h22 ;;
            23 ) h23 ;;
            24 ) h23 ;;
            25 ) h25 ;;
            26 ) h26 ;;
            27 ) h27 ;;
            28 ) h28 ;;
            29 ) h29 ;;
            30 ) h30 ;;
            * ) hd ;;
        esac
        e_arrow -l "[ ﰺ 1 .. $i ﰼ ]  | [ ( ﰾ (e)xecutar)  (ﰽ (p)rincipal ﰼ)  (ﰽ (c)ontatos ﰼ)  (ﰽ (l)embretes ﰼ) ]\n"
        e_arrow -l "[ (ﰽ (m)anutencao ﰼ) (ﰽ (b)ackup ﰼ) (ﰽ (f)inanceiro ﰼ) (ﰽ (i)nstalacao ﰼ) (ﰽ banco(d)ados ﰼ) ]\n"
        e_arrow -l "[ (ﰻ c(o)mmand) (${red} ﰻ ${reset}fi(${bold}n${reset})alizar) ] :${blue}${bold} "; read opt
        if [ "${opt}" = "e" ] ; then                                    
            break
        elif [ "${opt}" = "p" ] ; then
            BobMenu principal; l=${#m[@]};
            for ((i=0;i<l;i++))
            do 
                clicked[${i}]="[ ]" 
            done  
        elif [ "${opt}" = "n" ] ; then              #  Menus
            Sair;
        elif [ "${opt}" = "o" ] ; then
            e_arrow -l "Digite a função a executar [(lista) funções, (s)air ]: "; read tmp
            if [ "${tmp}" = "s" ] ; then
                Principal;
            elif [ "${tmp}" = "lista" ] ; then
                Titulo_Inicial; funcoes; 
            else
                ${tmp}
            fi
        elif [ "${opt}" = "l" ] ; then
            BobMenu lembretes; l=${#m[@]}; 
            for ((i=0;i<l;i++))
            do 
                clicked[${i}]="[ ]" 
            done  
        elif [ "${opt}" = "c" ] ; then
            BobMenu contatos; l=${#m[@]}; 
            for ((i=0;i<l;i++))
            do 
                clicked[${i}]="[ ]" 
            done  
        elif [ "${opt}" = "m" ] ; then
            BobMenu manutencao; l=${#m[@]};
            for ((i=0;i<l;i++))
            do 
                clicked[${i}]="[ ]" 
            done  
        elif [ "${opt}" = "f" ] ; then
            BobMenu financeiro; l=${#m[@]}; 
            for ((i=0;i<l;i++))
            do 
                clicked[${i}]="[ ]" 
            done  
        elif [ "${opt}" = "i" ] ; then
            BobMenu instalacao; l=${#m[@]}; 
            for ((i=0;i<l;i++))
            do 
                clicked[${i}]="[ ]" 
            done  
        elif [ "${opt}" = "b" ] ; then
            BobMenu compactacao; l=${#m[@]}; 
            for ((i=0;i<l;i++))
            do 
                clicked[${i}]="[ ]" 
            done  
        elif [ "${opt}" = "d" ] ; then
            BobMenu bancodados; l=${#m[@]}; 
            for ((i=0;i<l;i++))
            do 
                clicked[${i}]="[ ]" 
            done
        elif [ "${opt}" -ge "1" ] && [ "${opt}" -le "$i" ] ; then
            t=$((opt-1))
            if [ "${clicked[${t}]}" = "[ ]" ] ; then
                clicked[${t}]="[$(e_success)]"
            else
                clicked[${t}]="[ ]"
            fi
        else
            Principal; 
        fi
    done
    l=${#clicked[@]}; 
    for ((i=0;i<l;i++))
    do
        if [ "${clicked[${c}]}" = "[$(e_success)]" ] ; then
            if [ ${e[${c}]} = "Principal" ] ; then
                BobMenu principal; 
                opt="^"; Principal; 
            elif [ ${e[${c}]} = "instalacao.MenuInstalarProgramas" ] ; then # sub menus
                BobMenu instalacao.MenuInstalarProgramas; l=${#m[@]}; 
                for ((i=0;i<l;i++))
                do 
                    clicked[${i}]="[ ]" 
                done  
                MenuInstalarProgramas; tm="seja bem-vindo ao sub menu instalação - programas.";
                Principal;
            else
                ${e[${c}]};
                break
            fi
        fi
        let $((++c))
    done
}
Principal;
