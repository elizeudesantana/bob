#!/bin/bash
############################################################################################
#
#   Bob utilities script bash 
#
#                                                                      The MIT License (MIT)
#                                                         Copyright (c) 2019 elizeudesantana
#
version="2019.01";                                                      # Versão do Programa
#
scriptFileVersion="1.0.0";                                                # Versão do script
#
# History:
#   1.0.0                                                            Script version inicial.
#   2019.01      Dividido em diretorios criação de route e tipando de forma MVC (23/06/2019)
#
# Dependências:                                                     Nome do arquivo: bob.sh
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
                                                                       # (Função Principal)
# -----------------------------------------------------------------------------------------
   # Menu Principal com as opções para escolha dos usuários, com coisas (assuntos) iniciais 
                            # echo -e "\n\tVtestee" | boxes -d dog # sudo apt install boxes
# -----------------------------------------------------------------------------------------
opt="^" # enviar para util
function Principal(){
    if [ ${opt} = "^" ] ; then
        printf "\n\n\n"; 
        tm="seja bem-vindo ao menu principal.${reset}";           
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
            h=$(date '+%m'); a=$(date '+%y'); source "${datasLocation}" $h 20$a; printf "\n";
            oooO="lembretes"; tm="seja bem-vindo ao menu lembretes.${reset}";
        elif [ "${opt}" = "c" ]; then
            h=$(date '+%m'); a=$(date '+%y'); source "${datasLocation}" $h 20$a; printf "\n";
            oooO="contatos"; tm="seja bem-vindo ao menu contatos.${reset}";
        elif [ "${opt}" = "p" ]; then
            oooO="principal"; tm="seja bem-vindo ao menu principal.${reset}"; 
        elif [ "${opt}" = "m" ]; then
            oooO="manutencao"; Monitoracao; tm="seja bem-vindo ao menu manutenção.${reset}";
        elif [ "${opt}" = "f" ]; then
            oooO="financeiro"; Financeiro; tm="seja bem-vindo ao menu financeiro.${reset}";
        elif [ "${opt}" = "i" ]; then
            oooO="instalacao"; MenuInstacaoPrincipal; tm="seja bem-vindo ao menu instalação.${reset}";
        elif [ "${opt}" = "b" ]; then
            oooO="buckup"; BackupCloud; tm="seja bem-vindo ao menu backup.${reset}";
        elif [ "${opt}" = "d" ]; then
            oooO="bancodados"; MenuBD; tm="seja bem-vindo ao menu Banco de Dados.${reset}";
        fi
        ator="peek"; case ${oooO} in 
            "principal")    Escreve " Neste menu principal você, pode escolher \n
                                    entre diversas opções na Note em azul abaixo\n
                                    você encontra a atualização da descrição item\n
                                    por item, no caso de vc precisar monitorar\n
                                    algum item em especifico digite o número\n
                                    correspondente ao item manutenção e depois\n
                                    digite a letra (e) para executar o comando. " "${ator}"; Desenha ;;
            "_services")    Escreve " Nesta escolha, você pode monitorar  e \n
                                    examinar log's ativar e desativar services. " "${ator}"; Desenha ;;
               "_radio")    Escreve " Nesta escolha, você ouvira só sucessos \n
                                    indico romanticas e LOVE SONGS. " "${ator}"; Desenha ;;
         "_bob_texto_1")    Escreve " (Principal -> Arquivo) " "${ator}"; Desenha ;;
        "__bob_texto_2")    Escreve " Principal -> Arquivo (2) -> bob_texto_1 (1) " "${ator}"; Desenha ;;
        "__bob_texto_3")    Escreve " Principal -> Arquivo (2) -> bob_texto_1 (2) " "${ator}"; Desenha ;;
                 "_cht")    Escreve " Melhores repositórios de folhas de dicas \n
                                    orientadas pela comunidade do mundo.\n 
                                    exemplo quer aprender sobre python ou sql\n
                                    go perl ou outra coisa qualquer, é só \n
                                    digitar  'python file' e pronto, não gostou\n
                                    da resposta, digite /2 .. 3 .. 4, etc ao\n
                                    fim da pergunta. exemplo: query desc/2" "${ator}"; Desenha ;;                                    
            # "")         Escreve " " "${ator}"; Desenha ;;
            "lembretes")    Escreve "  " "${ator}"; Desenha ;;
             "contatos")    Escreve " " "${ator}"; Desenha ;;
           "manutencao")    Escreve " Manutenção é uma opção com monitoração\n
                                    on-time de todos os recursos de sua máquina\n
                                    pode também gerar relatótios de seu hardware\n
                                    para analises. " "${ator}"; Desenha ;;
           "_monitorix")    Escreve " Nesta opção você abrirá o browser\n
                                    epiphany com todos os dados de seu \n
                                    hardware, apresentados de forma grafica\n
                                    gerados pelo service monitorix. " "${ator}"; Desenha ;;
           "financeiro")    Escreve " " "${ator}"; Desenha ;;
           "instalacao")    Escreve " " "${ator}"; Desenha ;;
               "backup")    Escreve " " "${ator}"; Desenha ;;
           "bancodados")    Escreve " " "${ator}"; Desenha ;;
 "instalacao.programas")    Escreve " Instalação -> Programas " "${ator}"; Desenha ;;
                      *)    e_error "opção inválida" ;;
        esac
        flc 11 01; titulo_menu; echo ${tm}
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
        elif [ "${opt}" = "n" ] ; then             
            Sair;
        elif [ "${opt}" = "o" ] ; then
            e_arrow -l "Digite a função a executar [(lista) funções, (s)air ]: "; read tmp
            if [ "${tmp}" = "s" ] ; then
                Principal;
            elif [ "${tmp}" = "lista" ] ; then
                Titulo_Inicial; funcoes; 
            else
                ${tmp}; Principal;
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
            Principal; ld 
        fi
    done
    l=${#clicked[@]}; 
    for ((i=0;i<l;i++))
    do
        if [ "${clicked[${c}]}" = "[$(e_success)]" ] ; then
            if [ ${e[${c}]} = "Principal" ] ; then
                BobMenu principal; 
                opt="^"; Principal; 
            elif [ ${e[${c}]} = "Principal.bob_texto_1" ] ; then  # Principal -> Arquivo (2)
                BobMenu Principal.bob_texto_1; l=${#m[@]}; 
                for ((i=0;i<l;i++))
                do 
                    clicked[${i}]="[ ]" 
                done  
                oooO="_bob_texto_1"
                tm="Sub menu Bob texto 1.${reset}";
                Principal; 
            elif [ ${e[${c}]} = "Principal.bob_texto_2" ] ; then  # Principal -> Arquivo (2) -> bob_texto_1 (1)
                BobMenu Principal.bob_texto_2; l=${#m[@]}; 
                for ((i=0;i<l;i++))
                do 
                    clicked[${i}]="[ ]" 
                done  
                oooO="__bob_texto_2"
                tm="Sub menu Bob texto 2.${reset}";
                Principal;
            elif [ ${e[${c}]} = "Principal.bob_texto_3" ] ; then  # Principal -> Arquivo (2) -> bob_texto_1 (2)
                BobMenu Principal.bob_texto_3; l=${#m[@]}; 
                for ((i=0;i<l;i++))
                do 
                    clicked[${i}]="[ ]" 
                done  
                oooO="__bob_texto_3"
                tm="Sub menu Bob texto 3.${reset}";
                Principal;
            elif [ ${e[${c}]} = "instalacao.MenuInstalarProgramas" ] ; then    # instalação -> Programas Div. Net., Midias, Desenvol. e Editores (2)
                BobMenu instalacao.MenuInstalarProgramas; l=${#m[@]}; 
                for ((i=0;i<l;i++))
                do 
                    clicked[${i}]="[ ]" 
                done  
                oooO="instalacao.programas"
                MenuInstalarProgramas; tm="Sub menu Programas.${reset}";
                Principal;
            else
                ${e[${c}]};
                break
            fi
        fi
        let $((++c))
    done
}
# -----------------------------------------------------------------------------------------
                                                              #(Chamada a função Principal)
# -----------------------------------------------------------------------------------------
Principal
# ----------------------------------------THE END------------------------------------------    
