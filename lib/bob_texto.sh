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
# * Funções escritas neste script:
# >>>>>>>>>>>>>>>>>>>>>>[  sed -n '/^function/p' bob_util_montante.sh ]<<<<<<<<<<<<<<<<<<<<<<<<<
# "Dependencias"
# "MenuTexto"
# "MenuTextoContinucao"
# "SubMenuTexto"
# "SelecionaArquivo"
# "SelecionaPalavra"
# "SelecionaListagem"
# "Linhas"
#
# by: Elizeu de Santana -------------------------------------------------------------------

# -----------------------------------------------------------------------------------------
# Prover uma variavel com a pespectiva de localizações do script
instalacao="/Projetos/bob";                                          # Diretorio de Instalação apartir de HOME
scriptPath_Home="${HOME}";                                           # Diretorio HOME (~)
scriptPath_Bob="${scriptPath_Home}${instalacao}";                    # Diretrio de Instalação do Bob
scriptPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";      # Diretorio de instalação do script 
if [ $scriptPath != $scriptPath_Bob ] ; then
    utilsLocation="${scriptPath_Bob}/lib/bob_util.sh";               # Diretorio de localização bob_util.sh
else
    utilsLocation="${scriptPath}/lib/bob_util.sh"; 
fi
if [ -f "${utilsLocation}" ]; then
    source "${utilsLocation}";
else
    echo "Por favor procure bob_util.sh e adicione referência a este script. Saindo.";
    exit 1;
fi

function Dependencias() {
    ### Instala dependencias necessarias para o programa rodar. ###
    deps=( "" )
    e_arrow "Iniciando configuração dependências. $(e_success)"
    for i in ${deps[@]}; do
        if [[ ! $(which $i 2>/dev/null) ]]; then
            seek_confirmation "${USER}, existe a seguinte dependência  ${i}, permite a manutenção do sistema ?" 
            if is_confirmed; then
                e_arrow -d "Instalando : $i."
                if [ ${i} = "aptitude" ] ; then
                    sudo apt install ${i}
                else
                    sudo aptitude install ${i}
                fi
            else
                e_error "Sem a manutenção do sistema, não é possível a execução ${lgt}, supra as dependências e execute novamente."
                Sair
            fi
        fi
        e_arrow -d "Configuração dependência ${i} terminada. $(e_success)"
    done; sleep 1
}

# # Constantes ------------------------------------------------------------------------------
# arquivo="lista.txt"; palavra="tabela"; l="$(ls -la)";
# submodulo[0]="$(sed -n "/${palavra}/p" ${arquivo})"
# submodulo[1]="$(sed -n "/${palavra}/{p;q;}" ${arquivo})"

# ###### as abaixo debugar #################################################################
# submodulo[2]="$(sed -n "/${palavra}/h;${x;p;}" ${arquivo})" 
# # 2.3. Imprimir a última ocorrência da linha com determinada string
# # sed -n '/dia/h;${x;p;}'
# #   prompt> sed -n '/dia/h;${x;p;}' arquivo.txt
# #      No quarto dia, ficou com preguiça, então falou:
# submodulo[3]="$(sed "/${palavra}/,$!d" ${arquivo})"
# # 2.4. Imprimir da primeira ocorrência da string até o final
# # sed '/dia/,$!d'
# #   prompt> sed '/dia/,$!d' arquivo.txt
# #    No segundo dia, fez um rascunho à lápis.
# #     No terceiro dia, apagou e começou tudo de novo.
# #      No quarto dia, ficou com preguiça, então falou:
# #   - Sexta-feira eu continuo, se não estiver cansado...
# #     E no fim, nada.
# submodulo[4]="$(sed -n "/${palavra}/{h;${x;p;};d;};H;${x;p;}" ${arquivo})"
# # 2.5. Imprimir da última ocorrência da string até o final
# # sed -n '/dia/{h;${x;p;};d;};H;${x;p;}'
# #   prompt> sed -n '/dia/{h;${x;p;};d;};H;${x;p;}' arquivo.txt
# #      No quarto dia, ficou com preguiça, então falou:
# #   - Sexta-feira eu continuo, se não estiver cansado...
# #     E no fim, nada.
# submodulo[5]="$(sed "/${palavra}/d" ${arquivo})"
# # 2.6. Apagar as linhas com uma determinada string
# # sed '/dia/d'
# #   prompt> sed  '/dia/d' arquivo.txt
# #   No início do início, era um nada.
# #   - Sexta-feira eu continuo, se não estiver cansado...
# #     E no fim, nada.
# submodulo[6]="$(sed "/${palavra}/{H;x;/^\n/d;g;}" ${arquivo})"
# # 2.7. Apagar apenas a primeira linha com determinada string I
# # sed '/dia/{H;x;/^\n/d;g;}'
# #   prompt> sed '/dia/{H;x;/^\n/d;g;}' arquivo.txt
# #   No início do início, era um nada.
# #     No terceiro dia, apagou e começou tudo de novo.
# #      No quarto dia, ficou com preguiça, então falou:
# #   - Sexta-feira eu continuo, se não estiver cansado...
# #     E no fim, nada.
# submodulo[7]="$(sed -n "/${palavra}/{:a;n;p;ba;};p" ${arquivo})"
# # 2.8. Apagar apenas a primeira linha com determinada string II
# # sed -n '/dia/{:a;n;p;ba;};p'
# #   prompt> sed -n '/dia/{:a;n;p;ba;};p' arquivo.txt
# #   No início do início, era um nada.
# #     No terceiro dia, apagou e começou tudo de novo.
# #      No quarto dia, ficou com preguiça, então falou:
# #   - Sexta-feira eu continuo, se não estiver cansado...
# #     E no fim, nada.
# submodulo[8]="$(sed "s/^/texto incluido/" ${arquivo})"
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
# submodulo[9]="$(sed "s/$/texto incluido/" ${arquivo})"
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
# submodulo[10]="$(sed "/^$/d" ${arquivo})"
# # 2.11. Retirar linhas em branco
# # sed '/^$/d'
# #   prompt> sed '/^$/d' arquivo.txt
# #   No início do início, era um nada.
# #    No segundo dia, fez um rascunho à lápis.
# #     No terceiro dia, apagou e começou tudo de novo.
# #      No quarto dia, ficou com preguiça, então falou:
# #   - Sexta-feira eu continuo, se não estiver cansado...
# #     E no fim, nada.
# submodulo[11]="$(sed "1s/^/começo do arquivo/"  ${arquivo})"
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
# submodulo[12]="$(sed "1s/$/final da linha/" ${arquivo})"
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
# submodulo[13]="$(sed "1s/.*/início do arquivo/" ${arquivo})"
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
# submodulo[14]="$(sed -e "1i\' -e 'começo do arquivo" ${arquivo})"
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
# submodulo[15]="$(sed -e "$a\' -e 'linha final" ${arquivo})"
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
# submodulo[16]="$(sed "2!d" ${arquivo})"
# # 2.17. Imprimir somente a linha N
# # OBS: troque o número 2 para a linha que você quiser
# # sed '2!d'
# #   prompt> sed '2!d' arquivo.txt
# #    No segundo dia, fez um rascunho à lápis.
# submodulo[17]="$(sed "2d" ${arquivo})"
# # 2.18. Retirar a linha N
# # OBS: troque o número 2 pela linha que você quiser
# # sed '2d'
# #   prompt> sed '2d' arquivo.txt
# #   No início do início, era um nada.
# #     No terceiro dia, apagou e começou tudo de novo.
# #      No quarto dia, ficou com preguiça, então falou:
# #   - Sexta-feira eu continuo, se não estiver cansado...
# #     E no fim, nada.
# submodulo[18]="$(sed "s/^[^,]*,\([^,]\+\),\?.*/\1/" ${arquivo})"
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
# submodulo[19]="$(sed "s/[ ]\+/ /g" ${arquivo})"
# # 2.20. Retirar espaços em branco repetidos
# # sed 's/[ ]\+/ /g'
# #   prompt> sed 's/[ ]\+/ /g' arquivo.txt
# #   No início do início, era um nada.
# #    No segundo dia, fez um rascunho à lápis.
# #    No terceiro dia, apagou e começou tudo de novo.
# #    No quarto dia, ficou com preguiça, então falou:
# #   - Sexta-feira eu continuo, se não estiver cansado...
# #    E no fim, nada.
# submodulo[20]="$(sed "s/^ \+//" ${arquivo})"
# # 2.21. Retirar espaços em branco no início da linha
# # sed 's/^ \+//'
# #   prompt> sed 's/^ \+//' arquivo.txt
# #   No início do início, era um nada.
# #   No segundo dia, fez um rascunho à lápis.
# #   No terceiro dia, apagou e começou tudo de novo.
# #   No quarto dia, ficou com preguiça, então falou:
# #   - Sexta-feira eu continuo, se não estiver cansado...
# #   E no fim, nada.
# submodulo[21]="$(sed 's/^No//' ${arquivo})"
# # 2.22. Apagar uma string do início da linha
# # sed 's/^No//'
# #   prompt> sed 's/^No//' arquivo.txt
# #    início do início, era um nada.
# #    No segundo dia, fez um rascunho à lápis.
# #     No terceiro dia, apagou e começou tudo de novo.
# #      No quarto dia, ficou com preguiça, então falou:
# #   - Sexta-feira eu continuo, se não estiver cansado...
# #     E no fim, nada.
# submodulo[22]="$(sed 's/^.*${palavra}//' ${arquivo})"
# # 2.23. Apagar do início da linha até uma string
# # sed 's/^.*dia//'
# #   prompt> sed 's/^.*dia//' arquivo.txt
# #   No início do início, era um nada.
# #   , fez um rascunho à lápis.
# #   , apagou e começou tudo de novo.
# #   , ficou com preguiça, então falou:
# #   - Sexta-feira eu continuo, se não estiver cansado...
# #     E no fim, nada.
# submodulo[23]="$(sed 's/${palavra}.*$//' ${arquivo})"
# # 2.24. Apagar de uma string até o final da linha
# # sed 's/dia.*$//'
# #   prompt> sed 's/dia.*$//' arquivo.txt
# #   No início do início, era um nada.
# #    No segundo 
# #     No terceiro 
# #      No quarto 
# #   - Sexta-feira eu continuo, se não estiver cansado...
# #     E no fim, nada.
# submodulo[24]="$(sed 's/ [^ ]\+ *$//g' ${arquivo})"
# # 2.25. Apagar a última string da linha
# # sed 's/ [^ ]\+ *$//g'
# #   prompt> sed 's/ [^ ]\+ *$//g' arquivo.txt
# #   No início do início, era um
# #    No segundo dia, fez um rascunho à
# #     No terceiro dia, apagou e começou tudo de
# #      No quarto dia, ficou com preguiça, então
# #   - Sexta-feira eu continuo, se não estiver
# #     E no fim,
# submodulo[25]="$(sed ':a;$!N;s/\n//;ta;' ${arquivo})"
# # 2.26. Colocar todas as linhas em uma só
# # sed ':a;$!N;s/\n//;ta;'
# #   prompt> sed ':a;$!N;s/\n//;ta;' arquivo.txt
# #   No início do início, era um nada. No segundo dia, fez um rascunho à lápis.  No terceiro dia, apagou e começou tudo de novo.   No quarto dia, ficou com preguiça, então falou:- Sexta-feira eu continuo, se não estiver cansado...  E no fim, nada.
# submodulo[26]="$(sed 'N;s/\n//' ${arquivo})"
# # 2.27. Juntar a linha com a próxima
# # sed 'N;s/\n//'
# #   prompt> sed 'N;s/\n//' arquivo.txt
# #   No início do início, era um nada. No segundo dia, fez um rascunho à lápis.
# #     No terceiro dia, apagou e começou tudo de novo.   No quarto dia, ficou com preguiça, então falou:
# #   - Sexta-feira eu continuo, se não estiver cansado...
# #     E no fim, nada.
# submodulo[27]="$(sed ':a;s/^\([^,]\+\)o/\1x/;ta' ${arquivo})"
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
# submodulo[28]="$(sed ':a;s/^\([^,]*,[^,]\+\)o/\1x/;ta' ${arquivo})"
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
# submodulo[29]="$(sed '/terceiro/s/${palavra}/noite/g' ${arquivo})"
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
# submodulo[30]="$(sed '/terceiro/!s/${palavra}/noite/g' ${arquivo})"
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
# submodulo[31]="$(sed ':a;$!{N;ba;};s/\(.*\)${palavra}/\1noite/' ${arquivo})"
# # 2.32. Substituir a última ocorrência de uma string por outra
# # sed ':a;$!{N;ba;};s/\(.*\)dia/\1noite/'
# #   prompt> sed ':a;$!{N;ba;};s/\(.*\)dia/\1noite/' arquivo.txt
# #   No início do início, era um nada.
# #    No segundo dia, fez um rascunho à lápis.
# #     No terceiro dia, apagou e começou tudo de novo.
# #      No quarto noite, ficou com preguiça, então falou:
# #   - Sexta-feira eu continuo, se não estiver cansado...
# #     E no fim, nada.
# submodulo[32]="$(sed 's/^/§ /;:a;s/\(.*\)§ \+\([^ ]\+\)/\2 \1§/;ta;s/§//' ${arquivo})"
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
# submodulo[33]="$(sed 's/^/§/;:a;s/\(.*\)§\(.\)/\2\1§/;ta;s/§$//' ${arquivo})"
# # 2.34. Trocar a ordem das letras (igual ao comando rev)
# # sed 's/^/§/;:a;s/\(.*\)§\(.\)/\2\1§/;ta;s/§$//'
# #   prompt> sed 's/^/§/;:a;s/\(.*\)§\(.\)/\2\1§/;ta;s/§$//' arquivo.txt
# #   .adan mu are ,oicíni od oicíni oN
# #   .sipál à ohnucsar mu zef ,aid odnuges oN 
# #   .ovon ed odut uoçemoc e uogapa ,aid oriecret oN  
# #   :uolaf oãtne ,açiugerp moc uocif ,aid otrauq oN   
# #   ...odasnac revitse oãn es ,ounitnoc ue arief-atxeS -
# #   .adan ,mif on E  
# submodulo[34]="$(sed 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÉÊÍÓÔÕÚÇ/abcdefghijklmnopqrstuvwxyzàáâãéêíóôõúç/' ${arquivo})"
# # 2.35. Trocar de maiúsculas para minúsculas
# # sed 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÉÊÍÓÔÕÚÇ/abcdefghijklmnopqrstuvwxyzàáâãéêíóôõúç/'
# #   prompt> sed 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÉÊÍÓÔÕÚÇ/abcdefghijklmnopqrstuvwxyzàáâãéêíóôõúç/' arquivo.txt
# #   no início do início, era um nada.
# #    no segundo dia, fez um rascunho à lápis.
# #     no terceiro dia, apagou e começou tudo de novo.
# #      no quarto dia, ficou com preguiça, então falou:
# #   - sexta-feira eu continuo, se não estiver cansado...
# #     e no fim, nada.
# submodulo[35]="$(sed 'y/abcdefghijklmnopqrstuvwxyzàáâãéêíóôõúç/ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÉÊÍÓÔÕÚÇ/' ${arquivo})"
# # 2.36. Trocar de minúsculas para maiúsculas
# # sed 'y/abcdefghijklmnopqrstuvwxyzàáâãéêíóôõúç/ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÉÊÍÓÔÕÚÇ/'
# #   prompt> sed 'y/abcdefghijklmnopqrstuvwxyzàáâãéêíóôõúç/ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÉÊÍÓÔÕÚÇ/' arquivo.txt
# #   NO INÍCIO DO INÍCIO, ERA UM NADA.
# #    NO SEGUNDO DIA, FEZ UM RASCUNHO À LÁPIS.
# #     NO TERCEIRO DIA, APAGOU E COMEÇOU TUDO DE NOVO.
# #      NO QUARTO DIA, FICOU COM PREGUIÇA, ENTÃO FALOU:
# #   - SEXTA-FEIRA EU CONTINUO, SE NÃO ESTIVER CANSADO...
# #     E NO FIM, NADA.

# # 3. Brincando com Partes do texto
# submodulo[36]="$(sed -n '/segundo/{x;p;};h' ${arquivo})"
# # 3.1. Imprimir a linha antes de uma string
# # sed -n '/segundo/{x;p;};h'
# #   prompt> sed -n '/segundo/{x;p;};h' arquivo.txt
# #   No início do início, era um nada.
# submodulo[37]="$(sed -n '/segundo/{H;x;p;};h' ${arquivo})"
# # 3.2. Imprimir a linha antes de uma string e a linha da string
# # sed -n '/segundo/{H;x;p;};h'
# #   prompt> sed -n '/segundo/{H;x;p;};h' arquivo.txt
# #   No início do início, era um nada.
# #    No segundo dia, fez um rascunho à lápis.
# submodulo[38]="$(sed -n '/segundo/{n;p;}' ${arquivo})"
# # 3.3. Imprimir a linha após uma string
# # sed -n '/segundo/{n;p;}'
# #   prompt> sed -n '/segundo/{n;p;}' arquivo.txt
# #     No terceiro dia, apagou e começou tudo de novo.
# submodulo[39]="$(sed -n '/segundo/{N;p;}' ${arquivo})"
# # 3.4. Imprimir a linha após uma string e a linha da string
# # sed -n '/segundo/{N;p;}'
# #   prompt> sed -n '/segundo/{N;p;}' arquivo.txt
# #    No segundo dia, fez um rascunho à lápis.
# #     No terceiro dia, apagou e começou tudo de novo.
# submodulo[40]="$(sed -n '/terceiro/{H;x;p;n;p;};h' ${arquivo})"
# # 3.5. Imprimir a linha anterior, posterior e a linha que contém uma string
# # sed -n '/terceiro/{H;x;p;n;p;};h'
# #   prompt> sed -n '/terceiro/{H;x;p;n;p;};h' arquivo.txt
# #    No segundo dia, fez um rascunho à lápis.
# #     No terceiro dia, apagou e começou tudo de novo.
# #      No quarto dia, ficou com preguiça, então falou:
# submodulo[41]="$(sed -n '/terceiro/{x;p;n;p;};h' ${arquivo})"
# # 3.6. Imprimir a linha anterior e posterior a linha que contém uma string
# # sed -n '/terceiro/{x;p;n;p;};h'
# #   prompt> sed -n '/terceiro/{x;p;n;p;};h' arquivo.txt
# #    No segundo dia, fez um rascunho à lápis.
# #      No quarto dia, ficou com preguiça, então falou:
# submodulo[42]="$(sed -n '/quarto/{x;p;x;N;N;p;q;};1!{H;g;};1,2!s/[^\n]*\n//;h;' ${arquivo})"
# # 3.7. Imprimir N linhas antes, a linha da string e M linhas após uma string I
# # OBS: 'quarto' é a string, troque o '2' de 1,2 para o número de linhas antes, e adicione quantos 'Ns' para linhas após. No exemplo está 2 antes e 2 depois
# # sed -n '/quarto/{x;p;x;N;N;p;q;};1!{H;g;};1,2!s/[^\n]*\n//;h;'
# #   prompt> sed -n '/quarto/{x;p;x;N;N;p;q;};1!{H;g;};1,2!s/[^\n]*\n//;h;' arquivo.txt
# #    No segundo dia, fez um rascunho à lápis.
# #     No terceiro dia, apagou e começou tudo de novo.
# #      No quarto dia, ficou com preguiça, então falou:
# #   - Sexta-feira eu continuo, se não estiver cansado...
# submodulo[43]="$(sed 'H;/quarto/{g;N;N;s/^\n//p;}; x;s/.*\(\(\n[^\n]*\)\{2\}\)/\1/;x ;d' ${arquivo})"
# # 3.8. Imprimir N linhas antes, a linha da string e M linhas após uma string II
# # OBS: troque o número entre chaves '{2}' pelo número de linhas antes da string e adicione quandos 'Ns' para linhas após. No exemploestá 2 antes e 2 depois
# # sed 'H;/quarto/{g;N;N;s/^\n//p;}; x;s/.*\(\(\n[^\n]*\)\{2\}\)/\1/;x ;d'
# #   prompt> sed 'H;/quarto/{g;N;N;s/^\n//p;}; x;s/.*\(\(\n[^\n]*\)\{2\}\)/\1/;x ;d' arquivo.txt
# #    No segundo dia, fez um rascunho à lápis.
# #     No terceiro dia, apagou e começou tudo de novo.
# #      No quarto dia, ficou com preguiça, então falou:
# #   - Sexta-feira eu continuo, se não estiver cansado...
# submodulo[44]="$(sed '/segundo/{h;s/.*/Texto adicionado/;p;x;}' ${arquivo})"
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
# submodulo[45]="$(sed '/segundo/{p;s/.*/Texto adicionado/;}' ${arquivo})"
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
# submodulo[46]="$(sed '4,6!d' ${arquivo})"
# # 3.11. Imprimir somente entre linha N e M
# # sed '4,6!d'
# #   prompt> sed '4,6!d' arquivo.txt
# #      No quarto dia, ficou com preguiça, então falou:
# #   - Sexta-feira eu continuo, se não estiver cansado...
# submodulo[47]="$(sed '3,6s/dia/noite/' ${arquivo})"
# # 3.12. Substituir uma string por outra somente entre determinadas linhas
# # sed '3,6s/dia/noite/'
# #   prompt> sed '3,6s/dia/noite/' arquivo.txt
# #   No início do início, era um nada.
# #    No segundo dia, fez um rascunho à lápis.
# #     No terceiro noite, apagou e começou tudo de novo.
# #      No quarto noite, ficou com preguiça, então falou:
# #   - Sexta-feira eu continuo, se não estiver cansado...
# #     E no fim, nada.
# submodulo[48]="$(sed '/segundo\|quarto/!d' ${arquivo})"
# # 3.13. Imprimir linhas que contém uma ou outra string
# # OBS: imprime linhas que contém a string 'segundo' ou 'quarto'
# # sed '/segundo\|quarto/!d'
# #   prompt> sed '/segundo\|quarto/!d' arquivo.txt
# #    No segundo dia, fez um rascunho à lápis.
# #      No quarto dia, ficou com preguiça, então falou:
# submodulo[49]="$(sed -n '/No.*segundo/p' ${arquivo})"
# # 3.14. Imprimir linhas que contém uma e outra string
# # OBS: imprime linhas que contém 'No' e 'segundo'
# # sed -n '/No.*segundo/p'
# #   prompt> sed -n '/No.*segundo/p' arquivo.txt
# #    No segundo dia, fez um rascunho à lápis.
# submodulo[50]="$(sed -n '/segundo/,/quarto/p' ${arquivo})"
# # 3.15. Extrair um trecho do arquivo
# # sed -n '/segundo/,/quarto/p'
# #   prompt> sed -n '/segundo/,/quarto/p' arquivo.txt
# #    No segundo dia, fez um rascunho à lápis.
# #     No terceiro dia, apagou e começou tudo de novo.
# #      No quarto dia, ficou com preguiça, então falou:
# submodulo[51]="$(sed -n '/segundo/{:a;/quarto/!{N;ba;};p;}' ${arquivo})"
# # 3.16. Extrair trecho que pode ou não estar na mesma linha
# # sed -n '/segundo/{:a;/quarto/!{N;ba;};p;}'
# #   prompt> sed -n '/segundo/{:a;/quarto/!{N;ba;};p;}' arquivo.txt
# #    No segundo dia, fez um rascunho à lápis.
# #     No terceiro dia, apagou e começou tudo de novo.
# #      No quarto dia, ficou com preguiça, então falou:
# submodulo[52]="$(sed -n '/segundo/{/falou/tc;:a;/falou/!{N;ba;};:c;s/.*segundo//;s/falou.*$//;p;}' ${arquivo})"
# # 3.17. Extrair trecho que pode ou não estar na mesma linha tirando os delimitadores
# # OBS: 'segundo' é a TAG inicial e 'falou' a TAG final
# # sed -n '/segundo/{/falou/tc;:a;/falou/!{N;ba;};:c;s/.*segundo//;s/falou.*$//;p;}'
# #   prompt> sed -n '/segundo/{/falou/tc;:a;/falou/!{N;ba;};:c;s/.*segundo//;s/falou.*$//;p;}' arquivo.txt
# #    dia, fez um rascunho à lápis.
# #     No terceiro dia, apagou e começou tudo de novo.
# #      No quarto dia, ficou com preguiça, então 
# submodulo[53]="$(sed '/segundo/{/falou/{s/segundo.*falou//;t};:a;/falou/!{N;s/\n//;ta;};s/segundo.*falou/\n/;}' ${arquivo})"
# # 3.18. Apagar o que está entre delimitadores
# # sed '/segundo/{/falou/{s/segundo.*falou//;t};:a;/falou/!{N;s/\n//;ta;};s/segundo.*falou/\n/;}'
# #   prompt> sed '/segundo/{/falou/{s/segundo.*falou//;t};:a;/falou/!{N;s/\n//;ta;};s/segundo.*falou/\n/;}' arquivo.txt
# #   No início do início, era um nada.
# #    No n:
# #   - Sexta-feira eu continuo, se não estiver cansado...
# #     E no fim, nada.
# submodulo[54]="$(sed '/segundo/{:a;/quarto/!{N;ba;};/rascunho/d;}' ${arquivo})"
# # 3.19. Apagar um trecho se ele contém um padrão
# # OBS: 'segundo' marca o início do trecho, 'quarto' o final, e 'rascunho' é o padrão de procura
# # sed '/segundo/{:a;/quarto/!{N;ba;};/rascunho/d;}'
# #   prompt> sed '/segundo/{:a;/quarto/!{N;ba;};/rascunho/d;}' arquivo.txt
# #   No início do início, era um nada.
# #   - Sexta-feira eu continuo, se não estiver cansado...
# #     E no fim, nada.
# submodulo[55]="$(sed -n '$ba;h;n;p;x;:a;p' ${arquivo})"
# # 3.20. Trocar de lugar a linha com a próxima (troca de lugar linha 1 com 2, 3 com 4...) I
# # sed -n '$ba;h;n;p;x;:a;p'
# #   prompt> sed -n '$ba;h;n;p;x;:a;p' arquivo.txt
# #    No segundo dia, fez um rascunho à lápis.
# #   No início do início, era um nada.
# #      No quarto dia, ficou com preguiça, então falou:
# #     No terceiro dia, apagou e começou tudo de novo.
# #   - Sexta-feira eu continuo, se não estiver cansado...
# #     E no fim, nada.
# submodulo[56]="$(sed 'N;s/\([^\n]*\)\(\n\)\([^\n]*\)/\3\2\1/' ${arquivo})"
# # 3.21. Trocar de lugar a linha com a próxima (troca de lugar linha 1 com 2, 3 com 4...) II
# # sed 'N;s/\([^\n]*\)\(\n\)\([^\n]*\)/\3\2\1/'
# #   prompt> sed 'N;s/\([^\n]*\)\(\n\)\([^\n]*\)/\3\2\1/' arquivo.txt
# #    No segundo dia, fez um rascunho à lápis.
# #   No início do início, era um nada.
# #      No quarto dia, ficou com preguiça, então falou:
# #     No terceiro dia, apagou e começou tudo de novo.
# #   - Sexta-feira eu continuo, se não estiver cansado...
# #     E no fim, nada.
  
# # 4. Utilidade Pública
# submodulo[57]="$(sed 's/<[^>]*>//g' ${arquivo})"
# # 4.1. Retirar comandos HTML (tudo entre < e >)
# # sed 's/<[^>]*>//g'
# #   prompt> sed 's/<[^>]*>//g' arquivo.txt
# #   No início do início, era um nada.
# #    No segundo dia, fez um rascunho à lápis.
# #     No terceiro dia, apagou e começou tudo de novo.
# #      No quarto dia, ficou com preguiça, então falou:
# #   - Sexta-feira eu continuo, se não estiver cansado...
# #     E no fim, nada.
# submodulo[58]="$(sed -n '/^[^:]\+::/p' ${arquivo})"
# # 4.2. Pesquisar se existe algum usuário sem senha no /etc/passwd
# # sed -n '/^[^:]\+::/p'
# #   prompt> sed -n '/^[^:]\+::/p' arquivo.txt
# # This HTML page is  (see source)


# by: Elizeu de Santana / 04-06-2019 -------------------------------------------------------
function MenuTexto(){
    ### Menu Principal com as opções para escolha dos usuários, com coisas (assuntos) iniciais . ###
    Titulo; 
    while true; do
        echo -e "${ctm} Explorer                  ${dlc}"        
        echo -e "${ctm} Trabalhando Linhas :                                                          ${dlc}"
        echo -e "${ctm} 21. Imprimir somente as linhas com uma determinada string                    ${dlc}"
        echo -e "${ctm} 22. Imprimir somente a primeira ocorrência da linha com determinada string   ${dlc}"
        echo -e "${ctm} 23. Imprimir a última ocorrência da linha com determinada string             ${dlc}"
        echo -e "${ctm} 24. Imprimir da primeira ocorrência da string até o final                    ${dlc}"
        echo -e "${ctm} 25. Imprimir da última ocorrência da string até o final                      ${dlc}"
        echo -e "${ctm} 26. Apagar as linhas com uma determinada string                              ${dlc}"
        echo -e "${ctm} 27. Apagar apenas a primeira linha com determinada string I                  ${dlc}"
        echo -e "${ctm} 28. Apagar apenas a primeira linha com determinada string II                 ${dlc}"
        echo -e "${ctm} 29. Adicionar texto no início da linha                                       ${dlc}"
        echo -e "${ctm} 210. Adicionar texto no final da linha                                       ${dlc}"
        echo -e "${ctm} 211. Retirar linhas em branco                                                ${dlc}"
        echo -e "${ctm} 212. Incluir texto no início da linha N                                      ${dlc}"
        echo -e "${ctm} 213. Incluir texto no final da linha N                                       ${dlc}"
        echo -e "${ctm} 214. Incluir texto na linha N apagando o conteúdo existente                  ${dlc}"
        echo -e "${ctm} 215. Incluir texto antes da linha N                                          ${dlc}"
        echo -e "${ctm} 216. Incluir linha após a última                                             ${dlc}"
        echo -e "${ctm} 217. Imprimir somente a linha N                                              ${dlc}"
        echo -e "${ctm} 218. Retirar a linha N                                                       ${dlc}"
        echo -e "${ctm} 219. Extrair um trecho de uma linha                                          ${dlc}"
        echo -e "${ctm} 220. Retirar espaços em branco repetidos                                     ${dlc}"
        echo -e "${ctm} 221. Retirar espaços em branco no início da linha                            ${dlc}"
        echo -e "${cls} ----------------------------------------------------------------------        ${dlc}"
        echo -e "${ctm} c. Trabalhando Linhas - Continuação :                                         ${dlc}"
        echo -e "${ctm} t. Trabalhando com Partes do texto :                                          ${dlc}"
        echo -e "${ctm} s. Voltar ao menu Principal.                                                  ${dlc}"
        echo -e "${cls} ----------------------------------------------------------------------        ${dlc}"
        echo -ne "${ctr} Opções acima sem ponto, digite (21): ${dlc}"; read opt
        case ${opt} in
            e) mc; MenuTexto ;;
            21) Linhas 0;;                               
            22) Linhas 1;;                               
            23) Linhas 2;;                               
            24) Linhas 3;;                               
            25) Linhas 4;;                               
            26) Linhas 5;;
            27) Linhas 6;;
            28) Linhas 7;;
            29) Linhas 8;;
            210) Linhas 9;;
            211) Linhas 10;;
            212) Linhas 11;;
            213) Linhas 12;;
            214) Linhas 13;;
            215) Linhas 14;;
            216) Linhas 15;;
            217) Linhas 16;;
            218) Linhas 17;;
            219) Linhas 18;;
            220) Linhas 19;;
            221) Linhas 20;;
            c) MenuTextoContinucao;;
            t) SubMenuTexto ;;       
            s) . 'bob.sh'; Principal ;;
            *) echo -e "${ctr} Opção desconhecida. ${dlc}"; MenuTexto ;;
        esac
    done
}       

# by: Elizeu de Santana / 08-06-2019 -------------------------------------------------------
function MenuTextoContinucao(){
    ### Menu Principal com as opções para escolha dos usuários, com coisas (assuntos) iniciais . ###
    Titulo; 
    while true; do
        echo -e "${ctm} Trabalhando Linhas - Continuação :                                            ${dlc}"
        echo -e "${ctm} 222. Apagar uma string do início da linha                                    ${dlc}"
        echo -e "${ctm} 223. Apagar do início da linha até uma string                                ${dlc}"
        echo -e "${ctm} 224. Apagar de uma string até o final da linha                               ${dlc}"
        echo -e "${ctm} 225. Apagar a última string da linha                                         ${dlc}"
        echo -e "${ctm} 226. Colocar todas as linhas em uma só                                       ${dlc}"
        echo -e "${ctm} 227. Juntar a linha com a próxima                                            ${dlc}"
        echo -e "${ctm} 228. Substituir caractere por outro até uma TAG                              ${dlc}"
        echo -e "${ctm} 229. Substituir caractere por outro entre TAGs                               ${dlc}"
        echo -e "${ctm} 230. Substituir string por outra somente em certas linhas                    ${dlc}"
        echo -e "${ctm} 231. Substituir string por outra somente em certas linhas II                 ${dlc}"
        echo -e "${ctm} 232. Substituir a última ocorrência de uma string por outra                  ${dlc}"
        echo -e "${ctm} 233. Trocar a ordem das palavras (última vira prim. penúltima vira seg.)     ${dlc}"
        echo -e "${ctm} 234. Trocar a ordem das letras (igual ao comando rev)                        ${dlc}"
        echo -e "${ctm} 235. Trocar de maiúsculas para minúsculas                                    ${dlc}"
        echo -e "${ctm} 236. Trocar de minúsculas para maiúsculas                                    ${dlc}"
        echo -e "${cls} ----------------------------------------------------------------------        ${dlc}"
        echo -e "${ctm} r. Retorna Menu Texto :                                                       ${dlc}"
        echo -e "${ctm} t. Trabalhando com Partes do texto :                                          ${dlc}"
        echo -e "${ctm} s. Voltar ao menu Principal.                                                  ${dlc}"
        echo -e "${cls} ----------------------------------------------------------------------        ${dlc}"
        echo -ne "${ctr} Opções acima sem ponto, digite (21): ${dlc}"; read opt
        case ${opt} in
            222) Linhas 21;;
            223) Linhas 22;;
            224) Linhas 23;;
            225) Linhas 24;;
            226) Linhas 25;;
            227) Linhas 26;;
            228) Linhas 27;;
            229) Linhas 28;;
            230) Linhas 29;;
            231) Linhas 30;;
            232) Linhas 31;;
            233) Linhas 32;;
            234) Linhas 33;;
            235) Linhas 34;;
            236) Linhas 35;;
            r) MenuTexto ;;
            t) SubMenuTexto ;;       
            s) . 'bob.sh'; Principal ;;
           *) echo -e "${ctr} Opção desconhecida. ${dlc}"; MenuTextoContinucao ;;
        esac
    done
}        

# by: Elizeu de Santana / 04-06-2019 -------------------------------------------------------
function SubMenuTexto(){
    ### Menu Principal com as opções para escolha dos usuários, com coisas (assuntos) iniciais . ###
    Titulo; 
    while true; do
        echo -e "${ctm} Trabalhando com Partes do texto :                                         ${dlc}"
        echo -e "${ctm} 31. Imprimir a linha antes de uma string                                 ${dlc}"
        echo -e "${ctm} 32. Imprimir a linha antes de uma string e a linha da string             ${dlc}"
        echo -e "${ctm} 33. Imprimir a linha após uma string                                     ${dlc}"
        echo -e "${ctm} 34. Imprimir a linha após uma string e a linha da string                 ${dlc}"
        echo -e "${ctm} 35. Imprimir a linha anterior, posterior e a linha que contém uma string ${dlc}"
        echo -e "${ctm} 36. Imprimir a linha anterior e posterior a linha que contém uma string  ${dlc}"
        echo -e "${ctm} 37. Imprimir N linhas antes, a linha da string e M linhas após uma string I ${dlc}"
        echo -e "${ctm} 38. Imprimir N linhas antes, a linha da string e M linhas após uma string II ${dlc}"
        echo -e "${ctm} 39. Adicionar linha antes de uma string ${dlc}"
        echo -e "${ctm} 310. Adicionar linha após a linha com uma determinada string ${dlc}"
        echo -e "${ctm} 311. Imprimir somente entre linha N e M ${dlc}"
        echo -e "${ctm} 312. Substituir uma string por outra somente entre determinadas linhas ${dlc}"
        echo -e "${ctm} 313. Imprimir linhas que contém uma ou outra string ${dlc}"
        echo -e "${ctm} 314. Imprimir linhas que contém uma e outra string ${dlc}"
        echo -e "${ctm} 315. Extrair um trecho do arquivo ${dlc}"
        echo -e "${ctm} 316. Extrair trecho que pode ou não estar na mesma linha ${dlc}"
        echo -e "${ctm} 317. Extrair trecho que pode ou não estar na mesma linha tirando os delimitadores ${dlc}"
        echo -e "${ctm} 318. Apagar o que está entre delimitadores ${dlc}"
        echo -e "${ctm} 319. Apagar um trecho se ele contém um padrão ${dlc}"
        echo -e "${ctm} 320. Trocar de lugar a linha com a próxima (troca de lugar linha 1 com 2, 3 com 4...) I ${dlc}"
        echo -e "${ctm} 321. Trocar de lugar a linha com a próxima (troca de lugar linha 1 com 2, 3 com 4...) II ${dlc}"
        echo -e "${ctm} 41. Retirar comandos HTML (tudo entre < e >) ${dlc}"
        echo -e "${ctm} 42. Pesquisar se existe algum usuário sem senha no /etc/passwd ${dlc}"
        echo -e "${cls} ----------------------------------------------------------------------        ${dlc}"
        echo -e "${ctm} r. Retorna Menu Texto :                                                       ${dlc}"
        echo -e "${ctm} s. Voltar ao menu Principal.                                                  ${dlc}"
        echo -e "${cls} \n ----------------------------------------------------------------------     ${dlc}"
        echo -ne "${cor[2]} Opções acima no parenteses, digite : ${dlc}"; read PrincipalEsc
        case ${PrincipalEsc} in
            31) Linhas 36;;
            32) Linhas 37;;
            33) Linhas 38;;
            34) Linhas 39;;
            35) Linhas 40;;
            36) Linhas 41;;
            37) Linhas 42;;
            38) Linhas 43;;
            39) Linhas 44;;
            310) Linhas 45;;
            311) Linhas 46;;
            312) Linhas 47;;
            313) Linhas 48;;
            314) Linhas 49;;
            315) Linhas 50;;
            316) Linhas 51;;
            317) Linhas 52;;
            318) Linhas 53;;
            319) Linhas 54;;
            320) Linhas 55;;
            321) Linhas 56;;
            41) Linhas 57;;
            42) Linhas 58;;
            r) MenuTexto ;;
            t) SubMenuTexto ;;       
            s) . 'bob.sh'; Principal ;;
           *) echo -e "${ctr} Opção desconhecida. ${dlc}"; SubMenuTexto ;;
        esac
    done
}        

# by: Elizeu de Santana / 04-06-2019 -------------------------------------------------------
function SelecionaArquivo(){
    ### Seleciona o arquivo ###
    arquivo=$(dialog --title "Selecione um arquivo" --stdout --title "$(sed -n 2p ${log[2]})" --fselect /tmp/ 14 48)
}

# by: Elizeu de Santana / 04-06-2019 -------------------------------------------------------
function SelecionaPalavra(){
    # show an inputbox
    palavra=dialog --title "$(sed -n 2p ${log[2]})" --backtitle "$(sed -n 2p ${log[2]})" --inputbox "Entre a palavra  " 8 60 
}

# Utilidade Pública
# 4.1. Retirar comandos HTML (tudo entre < e >)
# 4.2. Pesquisar se existe algum usuário sem senha no /etc/passwd

# by: Elizeu de Santana / 08-06-2019 -------------------------------------------------------
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

# by: Elizeu de Santana / 04-06-2019 -------------------------------------------------------
# by: Elizeu de Santana / 08-06-2019 -------------------------------------------------------
function Linhas(){
    ### Linha com palavra ###
    Titulo
    echo -e "${ctm} 2.1. Imprimir somente as linhas com uma determinada string                    ${dlc}" 
    echo "${l}"
    echo -e "${ctm} \n Estamos em : ${PWD} : ${dlc}"
    echo -ne "${ctm} Digite arquivo : ${dlc}"; read arquivo
    echo -ne "${ctm} Digite palavra : ${dlc}"; read palavra
    submodulo="$(sed -n "/${palavra}/p" ${arquivo})"
    if [ -f ${arquivo} ] ; then
        Titulo
        echo "${submodulo[$1]}"
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
            MenuTexto
        fi 
   fi
}