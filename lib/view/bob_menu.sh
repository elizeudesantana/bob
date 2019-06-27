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
# * Retorno: n/a
# * Data: n/a
#
# by: Elizeu de Santana -------------------------------------------------------------------

# -----------------------------------------------------------------------------------------
# Arg () menu Principal : p
#
# -----------------------------------------------------------------------------------------
function BobMenu(){
    if [ ${1} = "principal" ] ; then
        m=( "  Python  Django." 
            "  Instalações." 
            "  Agenda." 
            "  Arquivos." 
            " ﰁ Snippers." #5
            " ﰁ Como." 
            "  Financeiro." 
            "   zz." 
            "  Configuração." 
            " 襁 Manutenção." #10
            "  Fluxograma Bob." 
            " ﰀ Limpar histórico." 
            " ${red}${reset} Sair." 
            "  Proteção de tela.")      
        e=( "MenuPython" 
            "MenuInstacaoPrincipal" 
            "BobMenu contatos" #"Agenda contatos" 
            "MenuTexto" 
            "Cht" #5
            "Com" 
            "Financeiro" 
            "DiversasZZ" 
            "Configurar" 
            "Manutencao" #10
            "Plota" 
            "rm ${log[0]}" 
            "Sair" 
            "Aquarium")
        h1(){
            e_note "Python Django é uma escola para quem quer montar máquinas virtuais"
            e_note -c "desmontar criar novos aplicativos deletar aplicativos e aida modulos."
            e_note -c ""
            e_note -c ""
            }
        h2(){
            e_note "Instalações de programas, esta dividido em quatro partes ,"
            e_note -c "Servidores: Apache2, ppmyadmin, ppadmin,LAMP byTeddysun, lamp via repositorio."
            e_note -c "desistalação, configuração, cria chave RSA, update e uprade,Server Monitor Cockpit."
            e_note -c "Monitor Server Nagios4, Server E-mail PostFix, Monitor Server Nagios xi."
            e_note -c "Web Server WebWin, Web Server WordPress."
            }
        h3(){
            e_note "Bob lembra, é uma agenda de contatos, com tecnologia a banco de dados relacional,"
            e_note -c "MySQL. Oferece a principio 4 escolhas de campo, mas pode ser configurado para"
            e_note -c "tantos campos, quanto se queira. Oferece, ainda um agendador TODO, que lhe avisa "
            e_note -c "por e-mail ou/e celular no tempo estipulado a ocorrência, além de mostrar na tela"
            e_note -c "principal as ocorrencias do mês vigente."
            }
        h4(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h5(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h6(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h7(){
            e_note "Financeiro, um grande dicionario de termos técnicos-finaceiro, para pesquisa. Explore até 500 "
            e_note -c "cryptocurrency com rate.sx, console service for exploring (crypto)currencies exchange "
            e_note -c "rates, (crypto)currencies converter and calculator. historical² exchange rates graphical"
            e_note -c "representation (Licença MIT - Direitos autorais (c) 2017 Igor Chubin)"
            e_note -c "Bolsa de valores, ibovespa e mundiais, cotações on-line on-time para todos os dispositivos."
            }
        h8(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h9(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h10(){
            e_note "Monitorações gráficas e Relatórios do sistema."
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h11(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h12(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h13(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        hd(){
            e_note "${USER}, você pode escolher qualquer número do indice, do 1 ao ${i},"
            e_note -c "digitando o mesmo número desclica, para executar, você digita a letra (e)."
            e_note -c "quando o (e) é digitado, o menu é desmontado e inicia o procsso para"
            e_note -c "outro menu ou a execução do comando."
            }
    ### Aqui o menu realiza chamada com opção (contatos)                   ###
    ### Testa se existe o banco de dados mysql que é utilizado  com bancos ###
    ### e tabelas, os dados são inseridos em duas tabelas definas em util. ###
    ### existindo o aplicativo os glypcons assumem cores verde ou vermelho ###
    ###
    elif [ ${1} = "contatos" ] ; then    ### aqui o usuario escolheu contatos
        if [[ $(which mysql 2>/dev/null) ]]; then  ### existe o aplicativo
            Ac="${green}   ${reset}"; Ec="${green}   ${reset}"                  
            At="${green}   ${reset}"; Lt="${green}   ${reset}"                      
            Pc="${green}   ${reset}"; Au="${green}   ${reset}"      
            CD="${green}   ${reset}"; Ad="${green}   ${reset}"
        
            m=( "${Ac}Adicionar contato."   ### monta o menu verde
                "${Ec}Editar contato."
                "${At}Apagar contato." 
                "${Lt}Listar tudo." 
                "${Pc}Procurar contato." 
                "${Au}Apagar tudo.(implementar)." 
                "${CD}Criar Base de Dados." 
                "${Ad}Acessar banco de dados." 
                " ${red}廒${reset}\tRetornar ao bob.") 
            e=( "Bob_Agenda a"                          
                "Bob_Agenda e"                          
                "Bob_Agenda d"                          
                "Bob_Agenda l"                          
                "Bob_Agenda q"                          
                ""                                      
                "Bob_Agenda c"                          
                "mycli_db"                              
                "Principal")                            
        else                            ### não existe o aplicativo
            Ac="${red}   ${reset}"; Ec="${red}   ${reset}"                  
            At="${red}   ${reset}"; Lt="${red}   ${reset}"                      
            Pc="${red}   ${reset}"; Au="${red}   ${reset}"      
            CD="${red}   ${reset}"; Ad="${red}   ${reset}" 
            
            m=( "${Ac}Adicionar contato."    ### monta o menu vermelho
                "${Ec}Editar contato."
                "${At}Apagar contato." 
                "${Lt}Listar tudo." 
                "${Pc}Procurar contato." 
                "${Au}Apagar tudo.(implementar)." 
                "${CD}Criar Base de Dados." 
                "${Ad}Acessar banco de dados." 
                " ${red}廒${reset}\tRetornar ao bob.") 
            e=( "Bob_Agenda a"                          
                "Bob_Agenda e"                          
                "Bob_Agenda d"                          
                "Bob_Agenda l"                          
                "Bob_Agenda q"                          
                ""                                      
                "Bob_Agenda c"                          
                "mycli_db"                              
                "Principal") 
            e_error "Verificando status base de dados ..."
            error "Verificado error no banco de dados relacional  mysql!"
            sudo service mysql status
            seek_confirmation "${USER}, temos a opção de manutenção, acessar ?" 
            if is_confirmed; then
                echo "manut"
            else
                . 'bob.sh'
            fi
        fi
        h1(){
            e_note "Adicionar contato, este item o levara a tela de aquisição de dados,"
            e_note -c "que consiste em nome, telefone, e-mail e data de aniversario."
            e_note -c "lembrando que ao fim após completar data, sera perguntado que deseja"
            e_note -c "incluir o registro sendo a resposta sim, sera criado na base de dados"
            e_note -c "um registro com o nome cadastrado."
            }
        h2(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h3(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        hd(){
            e_note "${USER}, você pode escolher qualquer número do indice, do 1 ao ${i},"
            e_note -c "digitando o mesmo número desclica, para sair, você digita a letra (s)."
            e_note -c "quando o (e) é digitado, o menu é desmontado e inicia o processo para"
            e_note -c "outro menu ou a execução do comando."
            }
    elif [ ${1} = "lembretes" ] ; then         ### aqui o usuario escolheu lembretes
        if [[ $(which mysql 2>/dev/null) ]]; then  ### existe o aplicativo
            Ac="${green}   ${reset}"; Ec="${green}   ${reset}"                  
            At="${green}   ${reset}"; Lt="${green}   ${reset}"                      
            Pc="${green}   ${reset}"; Au="${green}   ${reset}"      
            CD="${green}   ${reset}"; Ad="${green}   ${reset}"

            m=( "${Ac}Adicionar lembrete."      ### monta o menu verde para lembretes
                "${Ec}Editar lembrete."
                "${At}Apagar lembrete." 
                "${Lt}Listar tudo." 
                "${Pc}Procurar lembrete." 
                "${Au}Apagar tudo.(implementar)." 
                " ${red}廒${reset}\tRetornar ao bob.") 
            e=( "Bob_Lembrete a"                            
                "Bob_Lembrete e"                            
                "Bob_Lembrete d"                            
                "Bob_Lembrete l"                            
                "Bob_Lembrete q"                            
                ""                                      
                "Principal") 
        else                ### não existe o aplicativo
            Ac="${red}   ${reset}"; Ec="${red}   ${reset}"                  
            At="${red}   ${reset}"; Lt="${red}   ${reset}"                      
            Pc="${red}   ${reset}"; Au="${red}   ${reset}"      
            CD="${red}   ${reset}"; Ad="${red}   ${reset}" 

            m=( "${Ac}Adicionar lembrete."
                "${Ec}Editar lembrete."
                "${At}Apagar lembrete." 
                "${Lt}Listar tudo." 
                "${Pc}Procurar lembrete." 
                "${Au}Apagar tudo.(implementar)." 
                " ${red}廒${reset}\tRetornar ao bob.") 
            e=( "Bob_Lembrete a"                            
                "Bob_Lembrete e"                            
                "Bob_Lembrete d"                            
                "Bob_Lembrete l"                            
                "Bob_Lembrete q"                            
                ""                                      
                "Principal") 
            e_error "Verificando status base de dados ..."
            error "Verificado error no banco de dados relacional  mysql!"
            sudo service mysql status
            seek_confirmation "${USER}, temos a opção de manutenção, acessar ?" 
            if is_confirmed; then
                echo "manut"
            else
                . 'bob.sh'
            fi
        fi
        h1(){
            e_note "Adicionar lembrete, este item o levara a tela de aquisição de dados,"
            e_note -c "que consiste em lembrete, dia, mês."
            e_note -c "lembrando que ao fim após completar data, sera perguntado que deseja"
            e_note -c "incluir o registro sendo a resposta sim, sera criado na base de dados"
            e_note -c "um registro com o lembrete cadastrado."
            }
        h2(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h3(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        hd(){
            e_note "${USER}, você pode escolher qualquer número do indice, do 1 ao ${i},"
            e_note -c "digitando o mesmo número desclica, para sair, você digita a letra (s)."
            e_note -c "quando o (e) é digitado, o menu é desmontado e inicia o processo para"
            e_note -c "outro menu ou a execução do comando."
            }
    elif [ ${1} = "manutencao" ] ; then         ### aqui o usuario escolheu manutencao
        m=( " ﯑ Serviço Monitoração." 
            "  Imprimir Relatorio." 
            " ﱨ Monitoração grafica and testes no cpu." 
            "  Monitoração grafica CPU, teste streess, overeclock e muito mais." 
            " ﱨ Uso Real de memoria." #5
            "  Serviço de monitoração e banda Network." 
            "  Monitoração do Sistema Operacional." 
            "  Monitoração de E/S disco e TCP dump." 
            " ﲾ Hardware instalados e configurados." 
            "  Lista do diretorio dos arquivos de controle do linux - (/dev)." #10
            " ﲾ Sistema de discos." 
            " ﲾ Sistema de discos detalhados." 
            " ﲾ System CD-ROM Drives."
            "  Defined Adapters in the System." 
            " 着Network Routes." #15
            " 着Network Interface Statistics. (C-c sair)." 
            "  Informação de impressoras."
            "  Lista de processos ativos.  (C-c sair)"
            "  Informação do  driver de video."
            "  Listagem de todas as portas no processo."   #20
            "  Configuração do sistema - listagem completa."
            "  Listagem dos pacotes instalados no Sistema."
            "  Listagem dos pacotes Quebrados no Sistema."
            "  Lista dos últimos 100 users a logar em ${myhost}"
            "  Latência."          #25
            " ${red}廒${reset} Sair." ) 
        e=( " AbreMonitorix" 
            " CheckDir" 
            " Monitoracao atop" 
            " Monitoracao cpu" 
            " Manut get_real_mem_graf" #5
            " Monitoracao net" 
            " Monitoracao SO" 
            " Monitoracao io" 
            " Manut get_devices" 
            " Manut get_long_devdir_listing" #10
            " Manut get_defined_pdisks" 
            " Manut get_defined_disks" 
            " Manut get_cdrom" 
            " Manut get_adapters"
            " Manut get_routes" #15
            " Manut get_netstats"
            " Manut get_printer_info"
            " Manut get_process_info"
            " Manut get_video_info"
            " Manut get_portas_procs" #20
            " Manut get_long_sys_config"
            " Manut get_installed_filesets"
            " Manut check_for_broken_filesets; cat tmp"
            " Manut last_logins"
            " curl http://cheat.sh/latency" #25
            " Principal")
        h1(){
            e_note "Serviço de monitoração completo banco de dados, rede, kernel, etc."
            e_note -c "Click neste link ➜ http://localhost:8080/monitorix ( direito|abrir link)."
            e_note -c "parta utilizar seu browser padrão, ou (s) para utilizar o epiphany browser modular."
            }
        h2(){
            e_note "Imprimir em um arquivo snaphot todo o conteúdo de seu hardware com vários ,"
            e_note -c "testes de performace e informações do sistema. Após terminar os testes"
            e_note -c "o bob grava o arquivo e salva no diretorio pré-setado e abre o vim,"
            e_note -c "com ele vc pode realizar uma visualização e realizar buscas por aparatus,"
            e_note -c "e também explorar toda a base de arquivos."
            e_note -c "Para sair (:q) e depois exit."
            }
        h3(){
            e_note "Abre aplicativo monitor de desempenho capaz de relatar a atividade de todos os processos,"
            e_note -c "(mesmo que os processos tenham terminado durante o intervalo), trabalha com logs diários"
            e_note -c "do sistema e análise de longo prazo.  "
            e_note -c "Em intervalos regulares, ele mostra a carga e atividades da CPU, memória, swap, discos"
            e_note -c "e camadas de rede. E para cada processo ativo, ele mostra a utilização da CPU."
            e_note -c "Para sair e retornar ao Bob, C-c (ctrl+c) ou (q), depois digite exit, para fechar a janela."
            }
        h4(){
            e_note "Esse aplicativo mostra a temperatura da CPU, a frequência de utilização e o consumo"
            e_note -c "de energia de forma gráfica, no terminal."
            e_note -c "Oferece teste de estresse para solução de resfriamento ou se certificar"
            e_note -c "de que você tenha uma overclock estável."
            e_note -c "Detectar um superaquecimento com s-tui é fácil, quando você vê uma queda de freqüência."
            e_note -c "E a indicação de desempenho perdido também é mostrada."
            e_note -c "E ao lado o outro aplicativo é uma ferramenta de monitoramento de sistema que lê" 
            e_note -c "informações sobre processos e estados do sistema no modo dinâmico."
            e_note -c "Para sair e retornar ao Bob, C-c (ctrl+c) ou (q), depois digite exit, para fechar a janela."
            }
        h5(){
            e_note "Esta é uma ferramenta que pode fornecer vários relatórios sobre o uso da memória em sistemas Linux."
            e_note -c "Ao contrário das ferramentas existentes, este pode relatar o tamanho do conjunto proporcional (PSS),"
            e_note -c "que é uma representação mais significativa da quantidade de memória usada por bibliotecas"
            e_note -c "e aplicativos em um sistema de memória virtual."
            e_note -c "Como grandes porções de memória física são normalmente compartilhadas entre vários aplicativos,"
            e_note -c "a medida padrão de uso de memória conhecida como tamanho de conjunto residente (RSS) superestima"
            e_note -c "significativamente o uso de memória. Em vez disso, o PSS mede a 'parte justa' de cada aplicativo"
            e_note -c "de cada área compartilhada para fornecer uma medida realista."
            }
        h6(){
            e_note "Estes aplicativos monitoram o tráfego de rede e ainda a largura de banda bem como portas e outros."
            e_note -c "Visualização do consumo da banda de rede. Para ativar visualização portas digite (S) em iftop."
            e_note -c "Ainda a ferramenta de monitoramento e depuração de rede simples, mas poderosa, baseada em texto para"
            e_note -c "sistemas Unix-like, que captura estatísticas relacionadas à rede e as exibe visualmente"
            e_note -c "em um formato amigável. É um monitor de largura de banda em tempo real confiável e eficaz"
            e_note -c "e estimador de taxa."
            }
        h7(){
            e_note "Financeiro, um grande dicionario de termos técnicos-finaceiro, para pesquisa. Explore até 500 "
            e_note -c "cryptocurrency com rate.sx, console service for exploring (crypto)currencies exchange "
            e_note -c "rates, (crypto)currencies converter and calculator. historical² exchange rates graphical"
            e_note -c "representation (Licença MIT - Direitos autorais (c) 2017 Igor Chubin)"
            e_note -c "Bolsa de valores, ibovespa e mundiais, cotações on-line on-time para todos os dispositivos."

            }
        h8(){

            e_note "Monitorar detalhes de uso de E / S de disco do Linux e imprime uma tabela da utilização de"
            e_note -c "E/S existente por processo ou threads nos sistemas"
            e_note -c "Sniffer ou ferramenta de analisador de pacotes que é usado para capturar ou filtrar"
            e_note -c "pacotes TCP/IP recebidos ou transferidos através de uma rede em uma interface específica."
            e_note -c "Em vez de quebrar o tráfego por protocolo ou por sub-rede, como a maioria das ferramentas,"
            e_note -c "ele agrupa largura de banda por processo."
            e_note -c "Para sair e retornar ao Bob, C-c (ctrl+c) ou (q), depois digite exit, para fechar a janela."
            }
        h9(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h10(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h11(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h12(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h13(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        hd(){
            e_note "${USER}, você pode escolher qualquer número do indice, do 1 ao ${i},"
            e_note -c "digitando o mesmo número desclica, para sair, você digita a letra (s)."
            e_note -c "quando o s é digitado, o menu é desmontado e inicia o procsso para"
            e_note -c "outro menu ou a execução do comando."
            }
    elif [ ${1} = "financeiro" ] ; then         ### aqui o usuario escolheu financeiro
        m=( "   Cripto moedas - analise grafica." 
            "   Indice de termos financeiros."    
            " ${red}廒${reset} Sair." )     
        e=( "Cripto" 
            "Indice" 
            "Principal" )
        h1(){
            e_note "Analise de criptmoedas graficamente, visualização de top 10 e mais 500 bitcoins"
            e_note -c "realtime¹ currencies and cryptocurrencies exchange rates information"
            e_note -c "(crypto)currencies converter and calculator"
            e_note -c "historical² exchange rates graphical representation"
            e_note -c "clean, concise and very fast³ interface"
            e_note -c "rate.sx — console service for exploring (crypto)currencies exchange rates"
            }
        h2(){
            e_note "Instações de proramas, esta dividido em quatro partes respectivamente,"
            e_note -c "Servidores: Apache2, ppmyadmin, ppadmin,LAMP byTeddysun, lamp via repositorio."
            e_note -c "desistalação, configuração, cria chave RSA, update e uprade,Server Monitor Cockpit."
            e_note -c "Monitor Server Nagios4, Server E-mail PostFix,Monitor Server Nagios xi."
            e_note -c "Web Server WebWin  ,  Web Server WordPress  ."
            }
        h3(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        hd(){
            e_note "${USER}, você pode escolher qualquer número do indice, do 1 ao ${i},"
            e_note -c "digitando o mesmo número desclica, para sair, você digita a letra (s)."
            e_note -c "quando o s é digitado, o menu é desmontado e inicia o procsso para"
            e_note -c "outro menu ou a execução do comando."
            }
    elif [ ${1} = "instalacao" ] ; then         ### aqui o usuario escolheu instalacao        
        m=( " ${red}${reset}${blue}   ${reset} Shell & Fonts." 
            "   Programas Diversos NetWork, Midias, Desenvolvimento e Editores" 
            "   Servidor de Internet [LAMP]." 
            " $(e_error) Tratamento de Erros." 
            "   Instalar pacotão de utilitarios && Fonts." #5
            "   Instalar e Configurar grive sincronismo Google-Driver." 
            "   Backup em nuvem (Cloud) [Google-Driver] diretorio : ~/Documentos." 
            "   Sincronismo com Gogle Driver." 
            "   Sincronismo com Microsoft - One-Driver." 
            "    Gerenciador de pacotes." #10
            "   Gerenciador de pacotes."
            " ${red}廒${reset} Sair." ) 
        e=( " MenuInstalacaoFonts" 
            " instalacao.MenuInstalarProgramas"  # sub-menu recursivo 
            " MenuServidor" 
            " MenuErros" 
            " InstalarUtil; InstalarFonts" #5
            " InstalarGrive" 
            " BackupCloud" 
            " EnviarGrive" 
            " InstalarOneDriver" 
            " Construtor_Apt_Get" #10
            " Construtor_Snap"
            " Principal") 
        h1(){
            e_note "Python Django é uma escola para quem quer montar máquinas virtuais"
            e_note -c "desmontar criar novos aplicativos deletar aplicativos e aida modulos."
            e_note -c ""
            e_note -c ""
            }
        h2(){
            e_note "Instalações de programas, esta dividido em quatro partes ,"
            e_note -c "Servidores: Apache2, ppmyadmin, ppadmin,LAMP byTeddysun, lamp via repositorio."
            e_note -c "desistalação, configuração, cria chave RSA, update e uprade,Server Monitor Cockpit."
            e_note -c "Monitor Server Nagios4, Server E-mail PostFix, Monitor Server Nagios xi."
            e_note -c "Web Server WebWin, Web Server WordPress."
            }
        h3(){
            e_note "Bob lembra, é uma agenda de contatos, com tecnologia a banco de dados relacional,"
            e_note -c "MySQL. Oferece a principio 4 escolhas de campo, mas pode ser configurado para"
            e_note -c "tantos campos, quanto se queira. Oferece, ainda um agendador TODO, que lhe avisa "
            e_note -c "por e-mail ou/e celular no tempo estipulado a ocorrência, além de mostrar na tela"
            e_note -c "principal as ocorrencias do mês vigente."
            }
        h4(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h5(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h6(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h7(){
            e_note "Financeiro, um grande dicionario de termos técnicos-finaceiro, para pesquisa. Explore até 500 "
            e_note -c "cryptocurrency com rate.sx, console service for exploring (crypto)currencies exchange "
            e_note -c "rates, (crypto)currencies converter and calculator. historical² exchange rates graphical"
            e_note -c "representation (Licença MIT - Direitos autorais (c) 2017 Igor Chubin)"
            e_note -c "Bolsa de valores, ibovespa e mundiais, cotações on-line on-time para todos os dispositivos."
            }
        h8(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h9(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h10(){
            e_note "Monitorações gráficas e Relatórios do sistema."
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h11(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        hd(){
            e_note "${USER}, você pode escolher qualquer número do indice, do 1 ao ${i},"
            e_note -c "digitando o mesmo número desclica, para sair, você digita a letra (s)."
            e_note -c "quando o s é digitado, o menu é desmontado e inicia o procsso para"
            e_note -c "outro menu ou a execução do comando."
            }
    elif [ ${1} = "instalacao.MenuInstalarProgramas" ] ; then         # Sub menu
        m=( " Instalar Programas Multimidia   [ Som & Video ]."
            " Programas Desenvolvimento      [ Copiladores ]."     
            " Instalar Programas Editores    [ Editores texto ]."    
            " Instalar Programas NetWork     [ Browsers & Redes ]." )
        e=( " MenuMidia"
            " MenuDesenvolvimento"
            " MenuEditor"
            " MenuNetwork" )
        h1(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        hd(){
            e_note "${USER}, você pode escolher qualquer número do indice, do 1 ao ${i},"
            e_note -c "digitando o mesmo número desclica, para sair, você digita a letra (s)."
            e_note -c "quando o s é digitado, o menu é desmontado e inicia o procsso para"
            e_note -c "outro menu ou a execução do comando."
            }
    elif [ ${1} = "compactacao" ] ; then         ### aqui o usuario escolheu compactacao     
        m=( "  Compactar para .tar"
            "  Compactar para .tar.gz "
            "  Compactar para .bz2" 
            "  Descompactar .tar"  
            "  Descompactar .tar.gz" 
            "  Descompactar .bz2" )
        e=( "compactarTar"
            "compactarGz"
            "compactarBz2"
            "descompactarTar"
            "descompactarGz"
            "descompactarBz2" )
        h1(){
            e_note "Python Django é uma escola para quem quer montar máquinas virtuais"
            e_note -c "desmontar criar novos aplicativos deletar aplicativos e aida modulos."
            e_note -c ""
            e_note -c ""
            }
        h2(){
            e_note "Instalações de programas, esta dividido em quatro partes ,"
            e_note -c "Servidores: Apache2, ppmyadmin, ppadmin,LAMP byTeddysun, lamp via repositorio."
            e_note -c "desistalação, configuração, cria chave RSA, update e uprade,Server Monitor Cockpit."
            e_note -c "Monitor Server Nagios4, Server E-mail PostFix, Monitor Server Nagios xi."
            e_note -c "Web Server WebWin, Web Server WordPress."
            }
        h3(){
            e_note "Bob lembra, é uma agenda de contatos, com tecnologia a banco de dados relacional,"
            e_note -c "MySQL. Oferece a principio 4 escolhas de campo, mas pode ser configurado para"
            e_note -c "tantos campos, quanto se queira. Oferece, ainda um agendador TODO, que lhe avisa "
            e_note -c "por e-mail ou/e celular no tempo estipulado a ocorrência, além de mostrar na tela"
            e_note -c "principal as ocorrencias do mês vigente."
            }
        h4(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h5(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h6(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        hd(){
            e_note "${USER}, você pode escolher qualquer número do indice, do 1 ao ${i},"
            e_note -c "digitando o mesmo número desclica, para sair, você digita a letra (s)."
            e_note -c "quando o s é digitado, o menu é desmontado e inicia o procsso para"
            e_note -c "outro menu ou a execução do comando."
            }
    elif [ ${1} = "bancodados" ] ; then         ### aqui o usuario escolheu compactacao     
        pic=""             # define picture default
        if [[ $(which postgres 2>/dev/null) ]]; then  ### existe o aplicativo
            picgres=""
        else
            picgres=""
        fi
        if [[ $(which mysql 2>/dev/null) ]]; then  ### existe o aplicativo
            picmy=""
        else
            picmy=""
        fi
        if [[ $(which workbench 2>/dev/null) ]]; then  ### existe o aplicativo
            picmy=""
        else
            picmy=""
        fi
        m=( " ${picgres} Instalar Banco de Dados Relacional [ PostGres ]."
            " ${picmy} Instalar Banco de Dados Relacional [ MySQL-Server 5.7 ]."
            " ${picmy} Instalar B. Dados Relacional [ MySQL-Server-communit ].**ERRO**"
            " ${pic} Configurar Banco de Dados Relacional [ Criar Usuario ] postgresql."
            " ${pic} Configurar Banco de Dados Relacional [ MySQL-Server 5.7 ].        "
            " ${pic} Configurar B.Dados Relacional [ MySQL-Server-communit ].**ERRO**"
            " ${pic} Instalar os seguintes [ php7.2 phppgadmin php7.2-pgsql ]."
            " ${pic} Instalar os seguintes [ mysql Workbench ]." )            
        e=( "InstallPostGres"
            "InstallMySQL"
            "InstallMySQL_Communit"
            "ConfiguraUsuarioPSQL"
            "ConfigMySQL"
            ""
            "InstalarPhPphppgAdmin"
            "InstalarWorkbench"     
            ". 'bob_instalacao.sh'; MenuInstacaoPrincipal;;"
            ". 'bob_Servidor.sh'; MenuServidor" )
        h1(){
            e_note "Python Django é uma escola para quem quer montar máquinas virtuais"
            e_note -c "desmontar criar novos aplicativos deletar aplicativos e aida modulos."
            e_note -c ""
            e_note -c ""
            }
        h2(){
            e_note "Instalações de programas, esta dividido em quatro partes ,"
            e_note -c "Servidores: Apache2, ppmyadmin, ppadmin,LAMP byTeddysun, lamp via repositorio."
            e_note -c "desistalação, configuração, cria chave RSA, update e uprade,Server Monitor Cockpit."
            e_note -c "Monitor Server Nagios4, Server E-mail PostFix, Monitor Server Nagios xi."
            e_note -c "Web Server WebWin, Web Server WordPress."
            }
        h3(){
            e_note "Bob lembra, é uma agenda de contatos, com tecnologia a banco de dados relacional,"
            e_note -c "MySQL. Oferece a principio 4 escolhas de campo, mas pode ser configurado para"
            e_note -c "tantos campos, quanto se queira. Oferece, ainda um agendador TODO, que lhe avisa "
            e_note -c "por e-mail ou/e celular no tempo estipulado a ocorrência, além de mostrar na tela"
            e_note -c "principal as ocorrencias do mês vigente."
            }
        h4(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h5(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h6(){
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        hd(){
            e_note "${USER}, você pode escolher qualquer número do indice, do 1 ao ${i},"
            e_note -c "digitando o mesmo número desclica, para sair, você digita a letra (s)."
            e_note -c "quando o s é digitado, o menu é desmontado e inicia o procsso para"
            e_note -c "outro menu ou a execução do comando."
            }
    elif [ ${1} = "" ] ; then         ### aqui o usuario escolheu compactacao     
        #                        
        #                       ${red}廒${reset} Sair.
        #           ﯑ 
        echo   

    fi
}