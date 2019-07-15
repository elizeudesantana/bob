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
# # Prover uma variavel com a pespectiva de localizações do script
# instalacao="/Projetos/bob";                                          # Diretorio de Instalação apartir de HOME
# scriptPath_Home="${HOME}";                                           # Diretorio HOME (~)
# scriptPath_Bob="${scriptPath_Home}${instalacao}";                    # Diretrio de Instalação do Bob
# scriptPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";      # Diretorio de instalação do script 
# if [ $scriptPath != $scriptPath_Bob ] ; then
#     utilsLocation="${scriptPath_Bob}/lib/bob_util.sh";               # Diretorio de localização bob_util.sh
# else
#     utilsLocation="${scriptPath}/lib/bob_util.sh"; 
# fi
# if [ -f "${utilsLocation}" ]; then
#     source "${utilsLocation}";
# else
#     echo "Por favor procure bob_util.sh e adicione referência a este script. Saindo.";
#     exit 1;
# fi

function Plota(){
	Titulo
	cat << EOF
.
├── (bob.sh)
│   ├── *Python Django.
│   │   │
│   │   └── (bob_python.sh)
│   │       ├── *Criar uma máquina virtual [ anaconda3 ].
│   │       ├── *Ativar máquina virtual [ anaconda3 ].  
│   │       ├── *Remover máquina virtual. 
│   │       ├── *Instalar o django. 
│   │       ├── *Criar projeto django.
│   │       ├── *Iniciar o servidor http django.  
│   │       ├── *Remover projeto django. 
│   │       ├── *Criar Modulos dentro do Projeto. 
│   │       ├── *Configurar os Modulos dentro do Projeto.  
│   │       ├── 
│   │       └── *Retornar ao Menu Principal Bob.
│   │       
│   ├── *Instalações Servidores, Editores, BD, etc. 
│   │   │
│   │   └── (bob_instalacao.sh)    
│   │       ├── *Bob Shell Fonts. [Oh-my-Zsh e Fonts]
│   │       │   └── (bob_shellfonts.sh)
│   │       ├── *Programas Diversos NetWork, Midias, Desenvolvimento e Editores.
│   │       │   └── (bob_programas.sh)
│   │       ├── *Servidor de Internet [LAMP].
│   │       │   └── (bob_servidor.sh)
│   │       ├── *Tratamento de Erros.  
│   │       │   └── (Erros.sh)
│   │       ├── *Instalar pacotão de utilitarios && Fonts.  
│   │       ├── *Instalar e Configurar grive sincronismo Google-Driver. 
│   │       ├── *Backup em nuvem (Cloud) [Google-Driver] diretorio : ~/Documentos
│   │       │   ├── *Compactar para .tar
│   │       │   ├── *Compactar para .tar.gz
│   │       │   ├── *Compactar para .bz2
│   │       │   ├── *Descompactar .tar
│   │       │   ├── *Descompactar .tar.gz
│   │       │   └── *Descompactar .bz2
│   │       ├── *Sincronismo com Gogle Driver.
│   │       ├── *Sincronismo com Microsoft - One-Driver. 
│   │       ├── *Retorna ao Menu Principal Bob.
│   │       └──  *Limpa historico.  
│   │       
│   ├── *Trabalhando arquivos.          
│   │   │   
│   │   └── (bob_texto.sh)  
│   │       ├── *Imprimir somente as linhas com uma determinada string                  
│   │       ├── *Imprimir somente a primeira ocorrência da linha com determinada string 
│   │       ├── *Imprimir a última ocorrência da linha com determinada string           
│   │       ├── *Imprimir da primeira ocorrência da string até o final                  
│   │       ├── *Imprimir da última ocorrência da string até o final                    
│   │       ├── *Apagar as linhas com uma determinada string                            
│   │       ├── *Apagar apenas a primeira linha com determinada string I                
│   │       ├── *Apagar apenas a primeira linha com determinada string II               
│   │       ├── *Adicionar texto no início da linha                                      
│   │       ├── *Adicionar texto no final da linha                                       
│   │       ├── *Retirar linhas em branco                                                
│   │       ├── *Incluir texto no início da linha N                                      
│   │       ├── *Incluir texto no final da linha N                                       
│   │       ├── *Incluir texto na linha N apagando o conteúdo existente                  
│   │       ├── *Incluir texto antes da linha N                                          
│   │       ├── *Incluir linha após a última                                             
│   │       ├── *Imprimir somente a linha N                                              
│   │       ├── *Retirar a linha N                                                       
│   │       ├── *Extrair um trecho de uma linha                                          
│   │       ├── *Retirar espaços em branco repetidos                                     
│   │       ├── *Retirar espaços em branco no início da linha   
│   │       ├── *Trabalhando Linhas - Continuação :    
│   │       │   ├── *Apagar uma string do início da linha                  
│   │       │   ├── *Apagar do início da linha até uma string                  
│   │       │   ├── *Apagar de uma string até o final da linha                  
│   │       │   ├── *Apagar a última string da linha                  
│   │       │   ├── *Colocar todas as linhas em uma só                    
│   │       │   ├── *Juntar a linha com a próxima                   
│   │       │   ├── *Substituir caractere por outro até uma TAG                  
│   │       │   ├── *Substituir caractere por outro entre TAGs                  
│   │       │   ├── *Substituir string por outra somente em certas linhas                 
│   │       │   ├── *Substituir string por outra somente em certas linhas II                  
│   │       │   ├── *Substituir a última ocorrência de uma string por outra                    
│   │       │   ├── *Trocar a ordem das palavras (última vira prim. penúltima vira seg.)                 
│   │       │   ├── *Trocar a ordem das letras (igual ao comando rev)                    
│   │       │   ├── *Trocar de maiúsculas para minúsculas                 
│   │       │   ├── *Trocar de minúsculas para maiúsculas                    
│   │       │   ├── *Retorna Menu Texto :                 
│   │       │   ├── *Trabalhando com Partes do texto :                    
│   │       │   └── *Voltar ao menu Principal.                   
│   │       ├── *Trabalhando com Partes do texto :                                        
│   │       │   ├── *Imprimir a linha antes de uma string                   
│   │       │   ├── *Imprimir a linha antes de uma string e a linha da string                  
│   │       │   ├── *Imprimir a linha após uma string                     
│   │       │   ├── *Imprimir a linha após uma string e a linha da string                  
│   │       │   ├── *Imprimir a linha anterior, posterior e a linha que contém uma string                  
│   │       │   ├── *Imprimir a linha anterior e posterior a linha que contém uma string                 
│   │       │   ├── *Imprimir N linhas antes, a linha da string e M linhas após uma string I                 
│   │       │   ├── *Imprimir N linhas antes, a linha da string e M linhas após uma string II                  
│   │       │   ├── *Adicionar linha antes de uma string                 
│   │       │   ├── *Adicionar linha após a linha com uma determinada string                  
│   │       │   ├── *Imprimir somente entre linha N e M                  
│   │       │   ├── *Substituir uma string por outra somente entre determinadas linhas                  
│   │       │   ├── *Imprimir linhas que contém uma ou outra string                  
│   │       │   ├── *Imprimir linhas que contém uma e outra string                 
│   │       │   ├── *Extrair um trecho do arquivo                 
│   │       │   ├── *Extrair trecho que pode ou não estar na mesma linha                   
│   │       │   ├── *Extrair trecho que pode ou não estar na mesma linha tirando os delimitadores                  
│   │       │   ├── *Apagar o que está entre delimitadores                  
│   │       │   ├── *Apagar um trecho se ele contém um padrão                   
│   │       │   ├── *Trocar de lugar a linha com a próxima (troca de lugar linha 1 com 2, 3 com 4...) I                 
│   │       │   ├── *Trocar de lugar a linha com a próxima (troca de lugar linha 1 com 2, 3 com 4...) II                 
│   │       │   ├── *Retirar comandos HTML (tudo entre < e >)                  
│   │       │   ├── *Pesquisar se existe algum usuário sem senha no /etc/passwd                 
│   │       │   ├── *Retorna Menu Texto :  
│   │       │   └── *Voltar ao menu Principal. 
│   │       └── *Voltar ao menu Principal.      
│   │      
│   ├── *Função cht snippers. 
│   │   ├── (cht.sh)  ───────────
│   │   │                        │ 
│   ├── *Como ... ───────────────├
│   │      _                _    V     _    __                                        
│   │  ___| |__   ___  __ _| |_   ___| |__ \ \      The only cheat sheet you need    
│   │ / __| '_ \ / _ \/ _  | __| / __| '_ \ \ \     Unified access to the best       
│   │| (__| | | |  __/ (_| | |_ _\__ \ | | |/ /     community driven documentation   
│   │ \___|_| |_|\___|\__,_|\__(_)___/_| |_/_/      repositories of the world        
│   │                                                                                
│   │+------------------------+ +------------------------+ +------------------------+
│   │| $ curl cheat.sh/ls     | | $ cht.sh btrfs         | | $ cht.sh lua/:learn    |
│   │| $ curl cht.sh/btrfs    | | $ cht.sh tar~list      | | Learn any* programming |
│   │| $ curl cht.sh/tar~list | |                        | | language not leaving   |
│   │| $ curl https://cht.sh  | |                        | | your shell             |
│   │|                        | |                        | | *) any of 60           |
│   │|                        | |                        | |                        |
│   │+-- queries with curl ---+ +- own optional client --+ +- learn, learn, learn! -+
│   │+------------------------+ +------------------------+ +------------------------+
│   │| $ cht.sh go/f<tab><tab>| | $ cht.sh --shell       | | $ cht.sh go zip lists  |
│   │| go/for   go/func       | | cht.sh> help           | | Ask any question using |
│   │| $ cht.sh go/for        | | ...                    | | cht.sh or curl cht.sh: |
│   │| ...                    | |                        | | /go/zip+lists          |
│   │|                        | |                        | | (use /,+ when curling) |
│   │|                        | |                        | |                        |
│   │+---- TAB-completion ----+ +-- interactive shell ---+ +- programming questions-+
│   │+------------------------+ +------------------------+ +------------------------+
│   │| $ curl cht.sh/:help    | | $ vim prg.py           | | $ time curl cht.sh/    |
│   │| see /:help and /:intro | | ...                    | | ...                    |
│   │| for usage information  | | zip lists _            | | real    0m0.075s       |
│   │| and README.md on GitHub| | <leader>KK             | |                        |
│   │| for the details        | |             *awesome*  | |                        |
│   │|            *start here*| |                        | |                        |
│   │+--- self-documented ----+ +- queries from editor! -+ +---- instant answers ---+
│   │                                                                                
│   │[Follow @igor_chubin for updates][github.com/chubin/cheat.sh]                   
│   │
│   ├── *Financeiro. 
│   │   └── (bob_financeiro.sh)
│   │   
│   │   ├── (bob_financeiro_BD.sh)
│   │
│   │
│   │
│   │
│   │
│   │
│   ├── *Funções zz diversas. 
│   │   
│   ├── *Configurar parâmetros do programa.   
│   ├── *Manutenção e Relatorios do sistema.
│   │   ├── bob_manutencao.sh

│   ├── *Limpar histórico.  Sair.  
│   ├── *Sair.  

├── bob_bancodados.sh
│   ├── agenda21.sh
│   │   ├──
├── 
├── 
├── bob_util.sh
── bob_zzfuncao.sh

EOF
read; . 'bob.sh'; Principal
#$(./bob_zzfuncao.sh zzajuda --lista) 
}
