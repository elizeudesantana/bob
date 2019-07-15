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

	

# by: Elizeu de Santana / 31-05-2019 -------------------------------------------------------
function MenuPython(){
    deps=("ruby" "ruby-dev" "ruby-colorize" "colorls")
    ### Menu Principal com as opções para escolha dos usuários, com coisas (assuntos) iniciais . ###
    Dependencias; Titulo
    while true; do
        echo -e "${ctm} 01) Criar uma máquina virtual [ anaconda3 ].                             ${dlc}"
        echo -e "${ctm} 02) Ativar máquina virtual [ anaconda3 ].                                ${dlc}"
        echo -e "${ctm} 03) Desativar máquina virtual [ anaconda3 ].                             ${dlc}"
        echo -e "${ctm} 04) Remover máquina virtual.                                             ${dlc}"
        echo -e "${cls} ----------------------------------------------------------------------   ${dlc}"
        echo -e "${ctm} 05) Instalar o django.                                                   ${dlc}"
        echo -e "${ctm} 06) Criar projeto django.                                                ${dlc}"
        echo -e "${ctm} 07) Iniciar o servidor http django.                                      ${dlc}"
        echo -e "${ctm} 08) Remover projeto django.                                              ${dlc}"
        echo -e "${cls} ----------------------------------------------------------------------   ${dlc}"
        echo -e "${ctm} 09) Criar Modulos dentro do Projeto.                                     ${dlc}"
        echo -e "${ctm} 10) Configurar os Modulos dentro do Projeto.                             ${dlc}"
        echo -e "${ctm} l)                                                                       ${dlc}"
        echo -e "${ctm} s)  Retornar ao Menu Principal Bob.                                      ${dlc}"
        echo -e "${cls} ----------------------------------------------------------------------   ${dlc}"
        echo -ne "${ctm} Opções acima no parenteses, digite : ${dlc}"; read PrincipalEsc
        case ${PrincipalEsc} in
            1) CriarVirtualEnv;;
            2) DefinirVM; Principal;;
            3) DesativarVirtualEnv; Principal;;
            4) DesativarVirtualEnv; RemoverVM;;
            5) InstalaDjango;;
            6) StartDjango;;
            7) IniciarServidorDjango;;
            8) RemoverProjDjango;;
            9) CriarModulo ;;
            10) ConfModulos ;;
            c) Configurar;;
            l) rm ${log[0]}; Principal;;
            s) . 'bob.sh'; Principal ;;
            *) echo -e "${ctm} Opção desconhecida! ${dlc}"; Principal;; #CriarVirtualEnv;;
        esac
    done
}

# by: Elizeu de Santana / 14-06-2019 -------------------------------------------------------
function ConfModulos(){
    ###  1 - Configurar o arquivo (criado pelo django) settings.py  ###
    echo -ne "${ctr} Defina o nome do projeto : ${dlc}";read projectName
    tree ~/Projetos/${projectName}
    echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
    sed -i "s/'django.contrib.staticfiles',]/'django.contrib.staticfiles','blog',]" settings.py 
}

# by: Elizeu de Santana / 31-05-2019 -------------------------------------------------------
function CriarModulo(){
    ### Cria Modulo dentro do projeto diretorio. ###
    Titulo; colorls
    echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
    echo -ne "${ctr} Defina o nome do projeto : ${dlc}";read projectName
    echo -ne "${ctr} Defina o nome do Módulo : ${dlc}";read moduloName
    DefinirVM; cd ${projectName}

    django-admin startapp ${moduloName}; cd ..
    #python manage.py startapp ${moduloName}
    
    echo -e "${ctr} Modulo ${moduloName}, pronto! ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
    echo -e "${ctr} Projeto ${projectName}, tree: ${dlc}"
    tree ~/Projetos/${projectName}
    echo "${projectName}" > projetotmp.txt
    echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
    sleep 20
    Principal               # Retorno ao fluxo.
}

# by: Elizeu de Santana / 01-06-2019 -------------------------------------------------------
function RemoverProjDjango(){
    ### CUIDADO - Remove django diretorios e sub diretorios - CUIDADO ###
    Titulo
    tree -d -L 1
    echo -e "${cls} \n ---------------------------------------------------------------------- ${dlc}"
    echo -e "${clg} CUIDADO - Remove django diretorios e sub diretorios - CUIDADO ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
    echo -ne "${ctr} Remover projeto django & VM, digite o nome do projeto :  ${dlc}"; read projDjango

    rm -rf ${projDjango}
    DesativarVirtualEnv
    RemoverVM
}

# by: Elizeu de Santana / 31-05-2019 -------------------------------------------------------
function IniciarServidorDjango(){
    ### Inicia o servidor htttp do django. ###
    Titulo
    echo -e "${ctr} Iniciando servidor django ip: 127.0.0.1 porta: 8080  ${dlc}"
    tmp=`tail -n 1 projetotmp.txt`
    cd ${tmp}
    python manage.py runserver 127.0.0.1:8080

    exit
}

# by: Elizeu de Santana / 31-05-2019 -------------------------------------------------------
function RemoverVM(){
    ### CUIDADO - Remove máquinas virtuais - CUIDADO ###
    Titulo
    echo -e "${cls} \n ---------------------------------------------------------------------- ${dlc}"
    echo -e "${clg} CUIDADO - Remove máquinas virtuais - CUIDADO ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
    echo -e "${ctr} Removendo uma máquina virtual utilizando anaconda3 : ${dlc}"
    conda info --envs
    echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
    echo -ne "${ctr} Para remover Máquina virtual, digite o nome : ${dlc}"; read mv
    conda remove --name ${mv} --all
    echo -e "${ctr} Removida a máquina virtual, pronto! ${dlc}"
    conda info --envs
    echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
    sleep 15
    Principal               # Retorno ao fluxo.
}

# by: Elizeu de Santana / 31-05-2019 -------------------------------------------------------
function StartDjango(){
    ### Cria projeto diretorio, automatizado apartir do django. ###
    Titulo
    echo -ne "${ctr} Defina o nome do projeto : ${dlc}";read projectName
    django-admin startproject ${projectName}
    echo -e "${ctr} Projeto ${projectName}, pronto! ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
    echo -e "${ctr} Projeto ${projectName}, tree: ${dlc}"
    tree ${projectName}
    echo "${projectName}" > projetotmp.txt
    echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
    sleep 20
    Principal               # Retorno ao fluxo.
}

# by: Elizeu de Santana / 31-05-2019 -------------------------------------------------------
function CriarVirtualEnv(){
    Titulo
    source activate base
    echo -e "${ctr} Atualizando Conda : ${dlc}"
    #conda update -n base conda
    conda update conda
    echo -e "${ctr} Atualizado Conda, pronto : ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
    echo -e "${ctr} Conda versão & lista versões python para escolha : ${dlc}"
    conda --version
    conda search "^python$"
    echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
    echo -e "${ctr} VMs existentes, (*) máquina ativa, se mesmo nome remove e reinstala : ${dlc}"
    conda info --envs
    echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
    echo -ne "${ctr} Para criar Máquina virtual, digite o nome da VM [p373_NomeProjeto]: ${dlc}"; read mv
    echo -ne "${ctr} Para criar Máquina virtual, digite a versão python [3.7.3]: ${dlc}"; read vp
    conda create -n ${mv} python=${vp}
    echo -ne "${ctr} Criado Máquina virtual ->${dlc} ${ctm} ${mv} python versão ${vp}. ${dlc}"
    echo -e "${cls} \n ---------------------------------------------------------------------- ${dlc}"
    #echo -e "${cls} Os seguintes pacotes instalados : ${dlc}"
    #conda list
    #echo -e "${cls} \n ---------------------------------------------------------------------- ${dlc}"
    sleep 10
    Principal               # Retorno ao fluxo.
}

# by: Elizeu de Santana / 31-05-2019 -------------------------------------------------------
function DefinirVM(){
    Titulo
    echo -e "${ctr} Definido uma máquina virtual utilizando anaconda3 : ${dlc}"
    conda info --envs
    echo -e "${cls} \n ---------------------------------------------------------------------- ${dlc}"
    echo -ne "${ctr} Para escolher a máquina virtual, digite o nome da MV: ${dlc}"; read mvEsc
    source activate ${mvEsc}
    conda info --envs
    echo -e "${ctr} Ativada a máquina virtual ${mvEsc}, pronto! ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
    echo -e "${ctr} VM -> ${mvEsc} ativa, contem os seguintes pacotes: ${dlc}"
    conda list
    echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
    sleep 5
}

# by: Elizeu de Santana / 31-05-2019 -------------------------------------------------------
function DesativarVirtualEnv(){
    Titulo
    echo -e "${ctr} Desativando uma máquina virtual ... ${dlc}"
    conda info --envs
    echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
    echo -ne "${ctr} Para Desativar  Máquina virtual, digite o nome : ${dlc}"; read mv
    #source deactivate  ${mv}
    conda deactivate  #${mv}
    echo -e "${ctr} VM ${mv}, desativada!  ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
    conda env list
    echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
    sleep 10
}

# by: Elizeu de Santana / 31-05-2019 -------------------------------------------------------
function InstalaDjango(){
    Titulo
    echo -e "${ctr} Lista das máquinas virtuais: ${dlc}"
    conda info --envs
    echo -e "${cls} \n ---------------------------------------------------------------------- ${dlc}"
    echo -ne "${ctr} A máquina virtual correspondente, esta selecionada ? [s/n] ${dlc}"; read IDesc
    if [ "${IDesc}" -eq "s"] ; then
        echo -e "${ctr} Instalando o django ... ${dlc}"
        pip install django
    else
        DefinirVM
        pip install django
    fi
    echo -e "${ctr} Instalado o django, pronto! ${dlc}"
    echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
    echo -e "${ctr} Versão instalada do django : ${dlc}"
    python -m django --version
    echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
    sleep 10
    Principal               # Retorno ao fluxo.
}

function ConfigSettings(){
    tree--d -L 1 ~/Projetos/
    Digite o nome do projeto : 

    VarSettings="
        import os
        BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        print (BASE_DIR)
        SECRET_KEY = '&r9(p@(vf84lu(saet_007#j@$54pfd57)$z1e&*bj9z3t823#'
        DEBUG = True
        ALLOWED_HOSTS = []
        INSTALLED_APPS = ['django.contrib.admin','django.contrib.auth','django.contrib.contenttypes','django.contrib.sessions','django.contrib.messages','django.contrib.staticfiles',]
        MIDDLEWARE = ['django.middleware.security.SecurityMiddleware','django.contrib.sessions.middleware.SessionMiddleware','django.middleware.common.CommonMiddleware','django.middleware.csrf.CsrfViewMiddleware','django.contrib.auth.middleware.AuthenticationMiddleware','django.contrib.messages.middleware.MessageMiddleware','django.middleware.clickjacking.XFrameOptionsMiddleware',]
        ROOT_URLCONF = 'p350.urls'
        TEMPLATES = [{'BACKEND': 'django.template.backends.django.DjangoTemplates','DIRS': [],'APP_DIRS': True,'OPTIONS': {'context_processors': ['django.template.context_processors.debug','django.template.context_processors.request','django.contrib.auth.context_processors.auth','django.contrib.messages.context_processors.messages',],},},]
        WSGI_APPLICATION = 'p350.wsgi.application'
        DATABASES = {'default': {'ENGINE': 'django.db.backends.sqlite3','NAME': os.path.join(BASE_DIR, 'db.sqlite3'),}}
        AUTH_PASSWORD_VALIDATORS = [{'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',},{'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',},{'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',},{'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',},]
        LANGUAGE_CODE = 'pt-BR'
        TIME_ZONE = 'America/Sao_Paulo'
        USE_I18N = True
        USE_L10N = True
        USE_TZ = True
        STATIC_URL = '/static/'"
}
