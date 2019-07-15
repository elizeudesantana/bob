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
# Dependências:                                                Nome do arquivo: bob_texto.sh
#   function Dependencias()
#
# * Retorno: n/a
# * Data: 25/06/2019
#
# by: Elizeu de Santana -------------------------------------------------------------------

# ----------------------------------------------------------------------------------------
                                                             # (array contendo as funções)
# ----------------------------------------------------------------------------------------
array_bob_texto=( "Class_Tratamento_Arquivo" "MenuTexto" "MenuTextoContinucao" 
        "SubMenuTexto" "SelecionaArquivo" "SelecionaPalavra" "SelecionaListagem" "Linhas" );
# -----------------------------------------------------------------------------------------
                                                      # (function Class_Tratamento_Arquivo)
# -----------------------------------------------------------------------------------------
                                           # contém todas as funções escritas neste arquivo
# -----------------------------------------------------------------------------------------
function Class_Tratamento_Arquivo(){
    local arquivo="";
    local str_trab=""; 
    declare str_sed;
    declare submodulo_sed;

    # -----------------------------------------------------------------------------------------
                                                                            # ( função Linhas )
    # -----------------------------------------------------------------------------------------
    function Linhas(){
        Titulo_Inicial; SelecionaArquivo;
        
        e_arrow "${str_sed[$1]}"; ${submodulo_sed[$1]}
        
        echo -e "${ctm} \n Estamos em : ${PWD} : ${dlc}"
        echo -ne "${ctm} Digite arquivo : ${dlc}"; read arquivo
        echo -ne "${ctm} Digite palavra : ${dlc}"; read palavra
        submodulo_sed="$(sed -n "/${palavra}/p" ${arquivo})"
        if [ -f ${arquivo} ] ; then
            Titulo
            echo "${submodulo_sed[$1]}"
            echo -e "${cls} ----------------------------------------------------------------------      ${dlc}"
            echo -ne "${ctr} Nova consulta (n), Sair (s), Nova consulta com listagem diferente (l) : ${dlc}"; read opt
            case ${opt} in
                n) Linhas ;;
                s) MenuTexto ;;
                l) SelecionaListagem ;;
                *) echo -e "${ctr} Opção desconhecida! ${dlc}"; Linhas;;
            esac
            read
        else
            echo -ne "${ctr} Não encontrado o arquivo, digite o endereço completo quando solicitado ou ([s]sair). : ${dlc}"; read opt
            if [ ${opt} == "s" ] ; then
                echo
            fi 
        fi
    }
    # -----------------------------------------------------------------------------------------
    # -----------------------------------------------------------------------------------------
    function SelecionaListagem(){
        ### ###
        Titulo
        echo -e "${ctr} 1) ls -la, 2) ls -l, 3) ls -a, 4) ls -t, 5) ls -lt, 6) ls -ltr, 7) ls -s, 9) ls -1  ${dlc}"
        echo -e "${ctr} 8) ls -l *.extensao, 10) ls -lh, 11) ls -d */, 12) ls -g -G, 13) ls -R, 14) ls -m,15) ls -d PWD/*  ${dlc}"
        echo -e "${cls} ----------------------------------------------------------------------        ${dlc}"
        echo -ne "${ctr} Escolha :  ${dlc}"; read opt
        case ${opt} in
            1) l="$(ls -la)"; Linhas ;;
            2) l="$(ls -l)"; Linhas ;;
            3) l="$(ls -a)"; Linhas ;;
            4) l="$(ls -t)"; Linhas ;;
            5) l="$(ls -lt)"; Linhas ;;
            6) l="$(-ltr)"; Linhas ;;
            7) l="$(ls -s)"; Linhas ;;
            8) echo -ne "${ctr} Digite extensão: ${dlc}"; read ext; l="$(ls -l *.${ext})"; Linhas ;;
            9) l="$(ls -l)"; Linhas ;;
            10) l="$(ls -lh)"; Linhas ;;
            11) l="$(ls -d */)"; Linhas ;;
            12) l="$(ls -g -G)"; Linhas ;;
            13) l="$(ls -R)"; Linhas ;;
            14) l="$(ls -m)"; Linhas ;;
            15) l="$(ls -d)"; Linhas ;;
            *) echo -e "${ctr} Opção desconhecida! ${dlc}"; Linhas;;
        esac
    }                                                                                   
    # -----------------------------------------------------------------------------------------
                                                                  # ( função SelecionaArquivo )
                                                   # Dialog com usuário para escolha de arquivo
    # -----------------------------------------------------------------------------------------
    function SelecionaArquivo(){
        which yad || Dependencias yad; 
        while arquivo=$(yad --file            \
                --width='400' --height='350'  \
                #--filename="${climaLocation}" \
                --open ) # --confirm-overwrite) #save
        
        do
            conteudo=$(yad --text-info        \
                --title="Arquivo de trabalho" \
                --width=500 --height=500      \
                --filename="${arquivo}"       \
                --editable                    \
                --fore="#0000FF"              \
                --back="#AAFFAA"              \
                --fontname="Ubuntu Mono"      \
                --justify="fill"              \
                --margins="20"                \
                --show-uri                    \
                --button='Sair':1             \
                --button='Salvar':0)    
            echo "$arquivo" 
        done

        killall yad
        Principal
        #arquivo=$(dialog --title "Selecione um arquivo" --stdout --title "$(sed -n 2p ${log[2]})" --fselect /tmp/ 14 48)
    }

    # -----------------------------------------------------------------------------------------
    # -----------------------------------------------------------------------------------------
    function SelecionaPalavra(){
        # show an inputbox
        str_trabalho=dialog --title "$(sed -n 2p ${log[2]})" --backtitle "$(sed -n 2p ${log[2]})" --inputbox "Entre a palavra  " 8 60 
    }

    # -----------------------------------------------------------------------------------------
    str_sed[0]="Imprimir somente as linhas com uma determinada string"
    submodulo_sed[0]="$(sed -n "/${palavra}/p" ${arquivo})"
    # -----------------------------------------------------------------------------------------
    str_sed[1]="Imprimir somente a primeira ocorrência da linha com determinada string"
    submodulo_sed[1]="$(sed -n "/${palavra}/{p;q;}" ${arquivo})"
    # -----------------------------------------------------------------------------------------
    # sed -n '/dia/h;${x;p;}'
    #   prompt> sed -n '/dia/h;${x;p;}' arquivo.txt
    #      No quarto dia, ficou com preguiça, então falou:
    str_sed[2]="Imprimir a última ocorrência da linha com determinada string"
    submodulo_sed[2]="$(sed -n "/${palavra}/h;${x;p;}" ${arquivo})" 
    
    # # -----------------------------------------------------------------------------------------
    # # 2.4. Imprimir da primeira ocorrência da string até o final
    # # sed '/dia/,$!d'
    # #   prompt> sed '/dia/,$!d' arquivo.txt
    # #    No segundo dia, fez um rascunho à lápis.
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #      No quarto dia, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[3]="$(sed "/${palavra}/,$!d" ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.5. Imprimir da última ocorrência da string até o final
    # # sed -n '/dia/{h;${x;p;};d;};H;${x;p;}'
    # #   prompt> sed -n '/dia/{h;${x;p;};d;};H;${x;p;}' arquivo.txt
    # #      No quarto dia, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[4]="$(sed -n "/${palavra}/{h;${x;p;};d;};H;${x;p;}" ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.6. Apagar as linhas com uma determinada string
    # # sed '/dia/d'
    # #   prompt> sed  '/dia/d' arquivo.txt
    # #   No início do início, era um nada.
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[5]="$(sed "/${palavra}/d" ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.7. Apagar apenas a primeira linha com determinada string I
    # # sed '/dia/{H;x;/^\n/d;g;}'
    # #   prompt> sed '/dia/{H;x;/^\n/d;g;}' arquivo.txt
    # #   No início do início, era um nada.
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #      No quarto dia, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[6]="$(sed "/${palavra}/{H;x;/^\n/d;g;}" ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.8. Apagar apenas a primeira linha com determinada string II
    # # sed -n '/dia/{:a;n;p;ba;};p'
    # #   prompt> sed -n '/dia/{:a;n;p;ba;};p' arquivo.txt
    # #   No início do início, era um nada.
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #      No quarto dia, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[7]="$(sed -n "/${palavra}/{:a;n;p;ba;};p" ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.9. Adicionar texto no início da linha
    # # sed 's/^/texto incluido/'
    # #   prompt> sed 's/^/texto incluido/' arquivo.txt
    # #   texto incluidoNo início do início, era um nada.
    # #   texto incluido No segundo dia, fez um rascunho à lápis.
    # #   texto incluido  No terceiro dia, apagou e começou tudo de novo.
    # #   texto incluido   No quarto dia, ficou com preguiça, então falou:
    # #   texto incluido
    # #   texto incluido- Sexta-feira eu continuo, se não estiver cansado...
    # #   texto incluido
    # #   texto incluido  E no fim, nada.
    # submodulo_sed[8]="$(sed "s/^/texto incluido/" ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.10. Adicionar texto no final da linha
    # # sed 's/$/texto incluido/'
    # #   prompt> sed 's/$/texto incluido/' arquivo.txt
    # #   No início do início, era um nada.texto incluido
    # #    No segundo dia, fez um rascunho à lápis.texto incluido
    # #     No terceiro dia, apagou e começou tudo de novo.texto incluido
    # #      No quarto dia, ficou com preguiça, então falou:texto incluido
    # #   texto incluido
    # #   - Sexta-feira eu continuo, se não estiver cansado...texto incluido
    # #   texto incluido
    # #     E no fim, nada.texto incluido
    # submodulo_sed[9]="$(sed "s/$/texto incluido/" ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.11. Retirar linhas em branco
    # # sed '/^$/d'
    # #   prompt> sed '/^$/d' arquivo.txt
    # #   No início do início, era um nada.
    # #    No segundo dia, fez um rascunho à lápis.
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #      No quarto dia, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[10]="$(sed "/^$/d" ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.12. Incluir texto no início da linha N
    # # OBS: troque o número 1 para a linha que você quiser
    # # sed '1s/^/começo do arquivo/'
    # #   prompt> sed '1s/^/começo do arquivo/'  arquivo.txt
    # #   começo do arquivoNo início do início, era um nada.
    # #    No segundo dia, fez um rascunho à lápis.
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #      No quarto dia, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[11]="$(sed "1s/^/começo do arquivo/"  ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.13. Incluir texto no final da linha N
    # # OBS: troque o número 1 para a linha que você quiser
    # # sed '1s/$/final da linha/'
    # #   prompt> sed '1s/$/final da linha/' arquivo.txt
    # #   No início do início, era um nada.final da linha
    # #    No segundo dia, fez um rascunho à lápis.
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #      No quarto dia, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[12]="$(sed "1s/$/final da linha/" ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.14. Incluir texto na linha N apagando o conteúdo existente
    # # OBS: troque o número 1 para a linha que você quiser
    # # sed '1s/.*/início do arquivo/'
    # #   prompt> sed '1s/.*/início do arquivo/' arquivo.txt
    # #   início do arquivo
    # #    No segundo dia, fez um rascunho à lápis.
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #      No quarto dia, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[13]="$(sed "1s/.*/início do arquivo/" ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.15. Incluir texto antes da linha N
    # # OBS: troque o número 1 para a linha que você quiser
    # # sed -e '1i\' -e 'começo do arquivo'
    # #   prompt> sed -e '1i\' -e 'começo do arquivo' arquivo.txt
    # #   começo do arquivo
    # #   No início do início, era um nada.
    # #    No segundo dia, fez um rascunho à lápis.
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #      No quarto dia, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[14]="$(sed -e "1i\' -e 'começo do arquivo" ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.16. Incluir linha após a última
    # # sed -e '$a\' -e 'linha final'
    # #   prompt> sed -e '$a\' -e 'linha final' arquivo.txt
    # #   No início do início, era um nada.
    # #    No segundo dia, fez um rascunho à lápis.
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #      No quarto dia, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # #   linha final
    # submodulo_sed[15]="$(sed -e "$a\' -e 'linha final" ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.17. Imprimir somente a linha N
    # # OBS: troque o número 2 para a linha que você quiser
    # # sed '2!d'
    # #   prompt> sed '2!d' arquivo.txt
    # #    No segundo dia, fez um rascunho à lápis.
    # submodulo_sed[16]="$(sed "2!d" ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.18. Retirar a linha N
    # # OBS: troque o número 2 pela linha que você quiser
    # # sed '2d'
    # #   prompt> sed '2d' arquivo.txt
    # #   No início do início, era um nada.
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #      No quarto dia, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[17]="$(sed "2d" ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.19. Extrair um trecho de uma linha
    # # OBS: O mesmo que cut -d, -f2
    # # sed 's/^[^,]*,\([^,]\+\),\?.*/\1/'
    # #   prompt> sed 's/^[^,]*,\([^,]\+\),\?.*/\1/' arquivo.txt
    # #    era um nada.
    # #    fez um rascunho à lápis.
    # #    apagou e começou tudo de novo.
    # #    ficou com preguiça
    # #    se não estiver cansado...
    # #    nada.
    # submodulo_sed[18]="$(sed "s/^[^,]*,\([^,]\+\),\?.*/\1/" ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.20. Retirar espaços em branco repetidos
    # # sed 's/[ ]\+/ /g'
    # #   prompt> sed 's/[ ]\+/ /g' arquivo.txt
    # #   No início do início, era um nada.
    # #    No segundo dia, fez um rascunho à lápis.
    # #    No terceiro dia, apagou e começou tudo de novo.
    # #    No quarto dia, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #    E no fim, nada.
    # submodulo_sed[19]="$(sed "s/[ ]\+/ /g" ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.21. Retirar espaços em branco no início da linha
    # # sed 's/^ \+//'
    # #   prompt> sed 's/^ \+//' arquivo.txt
    # #   No início do início, era um nada.
    # #   No segundo dia, fez um rascunho à lápis.
    # #   No terceiro dia, apagou e começou tudo de novo.
    # #   No quarto dia, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #   E no fim, nada.
    # submodulo_sed[20]="$(sed "s/^ \+//" ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.22. Apagar uma string do início da linha
    # # sed 's/^No//'
    # #   prompt> sed 's/^No//' arquivo.txt
    # #    início do início, era um nada.
    # #    No segundo dia, fez um rascunho à lápis.
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #      No quarto dia, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[21]="$(sed 's/^No//' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.23. Apagar do início da linha até uma string
    # # sed 's/^.*dia//'
    # #   prompt> sed 's/^.*dia//' arquivo.txt
    # #   No início do início, era um nada.
    # #   , fez um rascunho à lápis.
    # #   , apagou e começou tudo de novo.
    # #   , ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[22]="$(sed 's/^.*${palavra}//' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.24. Apagar de uma string até o final da linha
    # # sed 's/dia.*$//'
    # #   prompt> sed 's/dia.*$//' arquivo.txt
    # #   No início do início, era um nada.
    # #    No segundo 
    # #     No terceiro 
    # #      No quarto 
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[23]="$(sed 's/${palavra}.*$//' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.25. Apagar a última string da linha
    # # sed 's/ [^ ]\+ *$//g'
    # #   prompt> sed 's/ [^ ]\+ *$//g' arquivo.txt
    # #   No início do início, era um
    # #    No segundo dia, fez um rascunho à
    # #     No terceiro dia, apagou e começou tudo de
    # #      No quarto dia, ficou com preguiça, então
    # #   - Sexta-feira eu continuo, se não estiver
    # #     E no fim,
    # submodulo_sed[24]="$(sed 's/ [^ ]\+ *$//g' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.26. Colocar todas as linhas em uma só
    # # sed ':a;$!N;s/\n//;ta;'
    # #   prompt> sed ':a;$!N;s/\n//;ta;' arquivo.txt
    # #   No início do início, era um nada. No segundo dia, fez um rascunho à lápis.  No terceiro dia, apagou e começou tudo de novo.   No quarto dia, ficou com preguiça, então falou:- Sexta-feira eu continuo, se não estiver cansado...  E no fim, nada.
    # submodulo_sed[25]="$(sed ':a;$!N;s/\n//;ta;' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.27. Juntar a linha com a próxima
    # # sed 'N;s/\n//'
    # #   prompt> sed 'N;s/\n//' arquivo.txt
    # #   No início do início, era um nada. No segundo dia, fez um rascunho à lápis.
    # #     No terceiro dia, apagou e começou tudo de novo.   No quarto dia, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[26]="$(sed 'N;s/\n//' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.28. Substituir caractere por outro até uma TAG
    # # OBS: troca 'o' por 'x' até encontrar a primeira ','
    # # sed ':a;s/^\([^,]\+\)o/\1x/;ta'
    # #   prompt> sed ':a;s/^\([^,]\+\)o/\1x/;ta' arquivo.txt
    # #   Nx inícix dx inícix, era um nada.
    # #    Nx segundx dia, fez um rascunho à lápis.
    # #     Nx terceirx dia, apagou e começou tudo de novo.
    # #      Nx quartx dia, ficou com preguiça, então falou:
    # #   - Sexta-feira eu cxntinux, se não estiver cansado...
    # #     E nx fim, nada.
    # submodulo_sed[27]="$(sed ':a;s/^\([^,]\+\)o/\1x/;ta' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.29. Substituir caractere por outro entre TAGs
    # # OBS: troca 'o' por 'x' entre a segunda e terceira ','
    # # sed ':a;s/^\([^,]*,[^,]\+\)o/\1x/;ta'
    # #   prompt> sed ':a;s/^\([^,]*,[^,]\+\)o/\1x/;ta' arquivo.txt
    # #   No início do início, era um nada.
    # #    No segundo dia, fez um rascunhx à lápis.
    # #     No terceiro dia, apagxu e cxmeçxu tudx de nxvx.
    # #      No quarto dia, ficxu cxm preguiça, então falou:
    # #   - Sexta-feira eu continuo, se nãx estiver cansadx...
    # #     E no fim, nada.
    # submodulo_sed[28]="$(sed ':a;s/^\([^,]*,[^,]\+\)o/\1x/;ta' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.30. Substituir string por outra somente em certas linhas
    # # OBS: substitui 'dia' por 'noite' somente em linhas que contém a string 'terceiro'
    # # sed '/terceiro/s/dia/noite/g'
    # #   prompt> sed '/terceiro/s/dia/noite/g' arquivo.txt
    # #   No início do início, era um nada.
    # #    No segundo dia, fez um rascunho à lápis.
    # #     No terceiro noite, apagou e começou tudo de novo.
    # #      No quarto dia, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[29]="$(sed '/terceiro/s/${palavra}/noite/g' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.31. Substituir string por outra somente em certas linhas II
    # # OBS: substitui 'dia' por 'noite' nas linha que NÃO contém a string 'terceiro'
    # # sed '/terceiro/!s/dia/noite/g'
    # #   prompt> sed '/terceiro/!s/dia/noite/g' arquivo.txt
    # #   No início do início, era um nada.
    # #    No segundo noite, fez um rascunho à lápis.
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #      No quarto noite, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[30]="$(sed '/terceiro/!s/${palavra}/noite/g' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.32. Substituir a última ocorrência de uma string por outra
    # # sed ':a;$!{N;ba;};s/\(.*\)dia/\1noite/'
    # #   prompt> sed ':a;$!{N;ba;};s/\(.*\)dia/\1noite/' arquivo.txt
    # #   No início do início, era um nada.
    # #    No segundo dia, fez um rascunho à lápis.
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #      No quarto noite, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[31]="$(sed ':a;$!{N;ba;};s/\(.*\)${palavra}/\1noite/' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.33. Trocar a ordem das palavras (última vira primeira, penúltima vira segunda....)
    # # OBS: se o seu arquivo tiver o caractere '§' troque o '§' do sed por outro carectere que não exista.
    # # sed 's/^/§ /;:a;s/\(.*\)§ \+\([^ ]\+\)/\2 \1§/;ta;s/§//'
    # #   prompt> sed 's/^/§ /;:a;s/\(.*\)§ \+\([^ ]\+\)/\2 \1§/;ta;s/§//' arquivo.txt
    # #   nada. um era início, do início No 
    # #   lápis. à rascunho um fez dia, segundo No 
    # #   novo. de tudo começou e apagou dia, terceiro No 
    # #   falou: então preguiça, com ficou dia, quarto No 
    # #   cansado... estiver não se continuo, eu Sexta-feira - 
    # #   nada. fim, no E 
    # submodulo_sed[32]="$(sed 's/^/§ /;:a;s/\(.*\)§ \+\([^ ]\+\)/\2 \1§/;ta;s/§//' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # submodulo_sed[33]="$(sed 's/^/§/;:a;s/\(.*\)§\(.\)/\2\1§/;ta;s/§$//' ${arquivo})"
    # # 2.34. Trocar a ordem das letras (igual ao comando rev)
    # # sed 's/^/§/;:a;s/\(.*\)§\(.\)/\2\1§/;ta;s/§$//'
    # #   prompt> sed 's/^/§/;:a;s/\(.*\)§\(.\)/\2\1§/;ta;s/§$//' arquivo.txt
    # #   .adan mu are ,oicíni od oicíni oN
    # #   .sipál à ohnucsar mu zef ,aid odnuges oN 
    # #   .ovon ed odut uoçemoc e uogapa ,aid oriecret oN  
    # #   :uolaf oãtne ,açiugerp moc uocif ,aid otrauq oN   
    # #   ...odasnac revitse oãn es ,ounitnoc ue arief-atxeS -
    # #   .adan ,mif on E  
    # # -----------------------------------------------------------------------------------------
    # # 2.35. Trocar de maiúsculas para minúsculas
    # # sed 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÉÊÍÓÔÕÚÇ/abcdefghijklmnopqrstuvwxyzàáâãéêíóôõúç/'
    # #   prompt> sed 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÉÊÍÓÔÕÚÇ/abcdefghijklmnopqrstuvwxyzàáâãéêíóôõúç/' arquivo.txt
    # #   no início do início, era um nada.
    # #    no segundo dia, fez um rascunho à lápis.
    # #     no terceiro dia, apagou e começou tudo de novo.
    # #      no quarto dia, ficou com preguiça, então falou:
    # #   - sexta-feira eu continuo, se não estiver cansado...
    # #     e no fim, nada.
    # submodulo_sed[34]="$(sed 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÉÊÍÓÔÕÚÇ/abcdefghijklmnopqrstuvwxyzàáâãéêíóôõúç/' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 2.36. Trocar de minúsculas para maiúsculas
    # # sed 'y/abcdefghijklmnopqrstuvwxyzàáâãéêíóôõúç/ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÉÊÍÓÔÕÚÇ/'
    # #   prompt> sed 'y/abcdefghijklmnopqrstuvwxyzàáâãéêíóôõúç/ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÉÊÍÓÔÕÚÇ/' arquivo.txt
    # #   NO INÍCIO DO INÍCIO, ERA UM NADA.
    # #    NO SEGUNDO DIA, FEZ UM RASCUNHO À LÁPIS.
    # #     NO TERCEIRO DIA, APAGOU E COMEÇOU TUDO DE NOVO.
    # #      NO QUARTO DIA, FICOU COM PREGUIÇA, ENTÃO FALOU:
    # #   - SEXTA-FEIRA EU CONTINUO, SE NÃO ESTIVER CANSADO...
    # #     E NO FIM, NADA.
    # submodulo_sed[35]="$(sed 'y/abcdefghijklmnopqrstuvwxyzàáâãéêíóôõúç/ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÉÊÍÓÔÕÚÇ/' ${arquivo})"
    
    # # 3. Brincando com Partes do texto
    # # -----------------------------------------------------------------------------------------
    # # 3.1. Imprimir a linha antes de uma string
    # # sed -n '/segundo/{x;p;};h'
    # #   prompt> sed -n '/segundo/{x;p;};h' arquivo.txt
    # #   No início do início, era um nada.
    # submodulo_sed[36]="$(sed -n '/segundo/{x;p;};h' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 3.2. Imprimir a linha antes de uma string e a linha da string
    # # sed -n '/segundo/{H;x;p;};h'
    # #   prompt> sed -n '/segundo/{H;x;p;};h' arquivo.txt
    # #   No início do início, era um nada.
    # #    No segundo dia, fez um rascunho à lápis.
    # submodulo_sed[37]="$(sed -n '/segundo/{H;x;p;};h' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 3.3. Imprimir a linha após uma string
    # # sed -n '/segundo/{n;p;}'
    # #   prompt> sed -n '/segundo/{n;p;}' arquivo.txt
    # #     No terceiro dia, apagou e começou tudo de novo.
    # submodulo_sed[38]="$(sed -n '/segundo/{n;p;}' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 3.4. Imprimir a linha após uma string e a linha da string
    # # sed -n '/segundo/{N;p;}'
    # #   prompt> sed -n '/segundo/{N;p;}' arquivo.txt
    # #    No segundo dia, fez um rascunho à lápis.
    # #     No terceiro dia, apagou e começou tudo de novo.
    # submodulo_sed[39]="$(sed -n '/segundo/{N;p;}' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 3.5. Imprimir a linha anterior, posterior e a linha que contém uma string
    # # sed -n '/terceiro/{H;x;p;n;p;};h'
    # #   prompt> sed -n '/terceiro/{H;x;p;n;p;};h' arquivo.txt
    # #    No segundo dia, fez um rascunho à lápis.
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #      No quarto dia, ficou com preguiça, então falou:
    # submodulo_sed[40]="$(sed -n '/terceiro/{H;x;p;n;p;};h' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 3.6. Imprimir a linha anterior e posterior a linha que contém uma string
    # # sed -n '/terceiro/{x;p;n;p;};h'
    # #   prompt> sed -n '/terceiro/{x;p;n;p;};h' arquivo.txt
    # #    No segundo dia, fez um rascunho à lápis.
    # #      No quarto dia, ficou com preguiça, então falou:
    # submodulo_sed[41]="$(sed -n '/terceiro/{x;p;n;p;};h' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 3.7. Imprimir N linhas antes, a linha da string e M linhas após uma string I
    # # OBS: 'quarto' é a string, troque o '2' de 1,2 para o número de linhas antes, e adicione quantos 'Ns' para linhas após. No exemplo está 2 antes e 2 depois
    # # sed -n '/quarto/{x;p;x;N;N;p;q;};1!{H;g;};1,2!s/[^\n]*\n//;h;'
    # #   prompt> sed -n '/quarto/{x;p;x;N;N;p;q;};1!{H;g;};1,2!s/[^\n]*\n//;h;' arquivo.txt
    # #    No segundo dia, fez um rascunho à lápis.
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #      No quarto dia, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # submodulo_sed[42]="$(sed -n '/quarto/{x;p;x;N;N;p;q;};1!{H;g;};1,2!s/[^\n]*\n//;h;' ${arquivo})"
    
    #     # -----------------------------------------------------------------------------------------
    # # 3.8. Imprimir N linhas antes, a linha da string e M linhas após uma string II
    # # OBS: troque o número entre chaves '{2}' pelo número de linhas antes da string e adicione quandos 'Ns' para linhas após. No exemploestá 2 antes e 2 depois
    # # sed 'H;/quarto/{g;N;N;s/^\n//p;}; x;s/.*\(\(\n[^\n]*\)\{2\}\)/\1/;x ;d'
    # #   prompt> sed 'H;/quarto/{g;N;N;s/^\n//p;}; x;s/.*\(\(\n[^\n]*\)\{2\}\)/\1/;x ;d' arquivo.txt
    # #    No segundo dia, fez um rascunho à lápis.
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #      No quarto dia, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # submodulo_sed[43]="$(sed 'H;/quarto/{g;N;N;s/^\n//p;}; x;s/.*\(\(\n[^\n]*\)\{2\}\)/\1/;x ;d' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 3.9. Adicionar linha antes de uma string
    # # OBS: inclui o 'Texto adicionado' antes da linha com a string 'segundo'
    # # sed '/segundo/{h;s/.*/Texto adicionado/;p;x;}'
    # #   prompt> sed '/segundo/{h;s/.*/Texto adicionado/;p;x;}' arquivo.txt
    # #   No início do início, era um nada.
    # #   Texto adicionado
    # #    No segundo dia, fez um rascunho à lápis.
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #      No quarto dia, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[44]="$(sed '/segundo/{h;s/.*/Texto adicionado/;p;x;}' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 3.10. Adicionar linha após a linha com uma determinada string
    # # sed '/segundo/{p;s/.*/Texto adicionado/;}'
    # #   prompt> sed '/segundo/{p;s/.*/Texto adicionado/;}' arquivo.txt
    # #   No início do início, era um nada.
    # #    No segundo dia, fez um rascunho à lápis.
    # #   Texto adicionado
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #      No quarto dia, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[45]="$(sed '/segundo/{p;s/.*/Texto adicionado/;}' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 3.11. Imprimir somente entre linha N e M
    # # sed '4,6!d'
    # #   prompt> sed '4,6!d' arquivo.txt
    # #      No quarto dia, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # submodulo_sed[46]="$(sed '4,6!d' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 3.12. Substituir uma string por outra somente entre determinadas linhas
    # # sed '3,6s/dia/noite/'
    # #   prompt> sed '3,6s/dia/noite/' arquivo.txt
    # #   No início do início, era um nada.
    # #    No segundo dia, fez um rascunho à lápis.
    # #     No terceiro noite, apagou e começou tudo de novo.
    # #      No quarto noite, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[47]="$(sed '3,6s/dia/noite/' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 3.13. Imprimir linhas que contém uma ou outra string
    # # OBS: imprime linhas que contém a string 'segundo' ou 'quarto'
    # # sed '/segundo\|quarto/!d'
    # #   prompt> sed '/segundo\|quarto/!d' arquivo.txt
    # #    No segundo dia, fez um rascunho à lápis.
    # #      No quarto dia, ficou com preguiça, então falou:
    # submodulo_sed[48]="$(sed '/segundo\|quarto/!d' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 3.14. Imprimir linhas que contém uma e outra string
    # # OBS: imprime linhas que contém 'No' e 'segundo'
    # # sed -n '/No.*segundo/p'
    # #   prompt> sed -n '/No.*segundo/p' arquivo.txt
    # #    No segundo dia, fez um rascunho à lápis.
    # submodulo_sed[49]="$(sed -n '/No.*segundo/p' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 3.15. Extrair um trecho do arquivo
    # # sed -n '/segundo/,/quarto/p'
    # #   prompt> sed -n '/segundo/,/quarto/p' arquivo.txt
    # #    No segundo dia, fez um rascunho à lápis.
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #      No quarto dia, ficou com preguiça, então falou:
    # submodulo_sed[50]="$(sed -n '/segundo/,/quarto/p' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 3.16. Extrair trecho que pode ou não estar na mesma linha
    # # sed -n '/segundo/{:a;/quarto/!{N;ba;};p;}'
    # #   prompt> sed -n '/segundo/{:a;/quarto/!{N;ba;};p;}' arquivo.txt
    # #    No segundo dia, fez um rascunho à lápis.
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #      No quarto dia, ficou com preguiça, então falou:
    # submodulo_sed[51]="$(sed -n '/segundo/{:a;/quarto/!{N;ba;};p;}' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 3.17. Extrair trecho que pode ou não estar na mesma linha tirando os delimitadores
    # # OBS: 'segundo' é a TAG inicial e 'falou' a TAG final
    # # sed -n '/segundo/{/falou/tc;:a;/falou/!{N;ba;};:c;s/.*segundo//;s/falou.*$//;p;}'
    # #   prompt> sed -n '/segundo/{/falou/tc;:a;/falou/!{N;ba;};:c;s/.*segundo//;s/falou.*$//;p;}' arquivo.txt
    # #    dia, fez um rascunho à lápis.
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #      No quarto dia, ficou com preguiça, então 
    # submodulo_sed[52]="$(sed -n '/segundo/{/falou/tc;:a;/falou/!{N;ba;};:c;s/.*segundo//;s/falou.*$//;p;}' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 3.18. Apagar o que está entre delimitadores
    # # sed '/segundo/{/falou/{s/segundo.*falou//;t};:a;/falou/!{N;s/\n//;ta;};s/segundo.*falou/\n/;}'
    # #   prompt> sed '/segundo/{/falou/{s/segundo.*falou//;t};:a;/falou/!{N;s/\n//;ta;};s/segundo.*falou/\n/;}' arquivo.txt
    # #   No início do início, era um nada.
    # #    No n:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[53]="$(sed '/segundo/{/falou/{s/segundo.*falou//;t};:a;/falou/!{N;s/\n//;ta;};s/segundo.*falou/\n/;}' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 3.19. Apagar um trecho se ele contém um padrão
    # # OBS: 'segundo' marca o início do trecho, 'quarto' o final, e 'rascunho' é o padrão de procura
    # # sed '/segundo/{:a;/quarto/!{N;ba;};/rascunho/d;}'
    # #   prompt> sed '/segundo/{:a;/quarto/!{N;ba;};/rascunho/d;}' arquivo.txt
    # #   No início do início, era um nada.
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[54]="$(sed '/segundo/{:a;/quarto/!{N;ba;};/rascunho/d;}' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 3.20. Trocar de lugar a linha com a próxima (troca de lugar linha 1 com 2, 3 com 4...) I
    # # sed -n '$ba;h;n;p;x;:a;p'
    # #   prompt> sed -n '$ba;h;n;p;x;:a;p' arquivo.txt
    # #    No segundo dia, fez um rascunho à lápis.
    # #   No início do início, era um nada.
    # #      No quarto dia, ficou com preguiça, então falou:
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[55]="$(sed -n '$ba;h;n;p;x;:a;p' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 3.21. Trocar de lugar a linha com a próxima (troca de lugar linha 1 com 2, 3 com 4...) II
    # # sed 'N;s/\([^\n]*\)\(\n\)\([^\n]*\)/\3\2\1/'
    # #   prompt> sed 'N;s/\([^\n]*\)\(\n\)\([^\n]*\)/\3\2\1/' arquivo.txt
    # #    No segundo dia, fez um rascunho à lápis.
    # #   No início do início, era um nada.
    # #      No quarto dia, ficou com preguiça, então falou:
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[56]="$(sed 'N;s/\([^\n]*\)\(\n\)\([^\n]*\)/\3\2\1/' ${arquivo})"
    
    
    # # 4. Utilidade Pública
    # # -----------------------------------------------------------------------------------------
    # # 4.1. Retirar comandos HTML (tudo entre < e >)
    # # sed 's/<[^>]*>//g'
    # #   prompt> sed 's/<[^>]*>//g' arquivo.txt
    # #   No início do início, era um nada.
    # #    No segundo dia, fez um rascunho à lápis.
    # #     No terceiro dia, apagou e começou tudo de novo.
    # #      No quarto dia, ficou com preguiça, então falou:
    # #   - Sexta-feira eu continuo, se não estiver cansado...
    # #     E no fim, nada.
    # submodulo_sed[57]="$(sed 's/<[^>]*>//g' ${arquivo})"
    
    # # -----------------------------------------------------------------------------------------
    # # 4.2. Pesquisar se existe algum usuário sem senha no /etc/passwd
    # # sed -n '/^[^:]\+::/p'
    # #   prompt> sed -n '/^[^:]\+::/p' arquivo.txt
    # # This HTML page is  (see source)
    # submodulo_sed[58]="$(sed -n '/^[^:]\+::/p' ${arquivo})"
} 