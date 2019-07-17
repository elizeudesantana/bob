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
# Dependências:                                                Nome do arquivo: bob_menu.sh
#   function Dependencias()
#
# * Retorno: n/a
# * Data: 25/06/2019
#
# by: Elizeu de Santana -------------------------------------------------------------------

# -----------------------------------------------------------------------------------------
                                                                         # (função BobMenu)
                                                    # usado com argumentos (nome dos menus)
# -----------------------------------------------------------------------------------------
function BobMenu(){
    # ---------------------------------------------------------------------------------------------
                                                                   if [ ${1} = "principal" ] ; then
    ### Entradas dos Menus ------------------------------------------------------------------------
    ### (menu) principal
    # ---------------------------------------------------------------------------------------------
        m=( "  Python  Django." 
            "  Services." 
            "  Web Radio." 
            "  Arquivos." 
            " ﰁ Cht.sh" #5
            " ﰁ Evolução bob" 
            "  xxxxxxx." 
            "   zz." 
            "  Configuração." 
            " 襁 Manutenção." #10
            "  Fluxograma Bob." 
            " ﰀ Limpar histórico." 
            " ${red}${reset} Sair." 
            "  Proteção de tela.")      
        e=( "MenuPython" 
            "_Services_" 
            "Inicia_radio"   
            "Principal.bob_texto_1" 
            "Cht" #5
            "Evolution__" 
            "Financeiro" 
            "DiversasZZ" 
            "Configurar" 
            "Manutencao" #10
            "Plota" 
            "rm ${log[0]}" 
            "Sair" 
            "Aquarium")  # configurar cron, capturar evento maouse ou outro
        h1(){
            e_note "Python Django é uma escolha para quem quer montar máquinas virtuais";
            e_note -c "desmontar criar novos aplicativos deletar aplicativos e aida modulos.";
            e_note -c "";
            e_note -c "";
            }
        h2(){
            oooO='_services';
            e_note "Semelhante a todos os outros sistemas operacionais, o Linux possui serviços e outros processos";
            e_note -c "executados em segundo plano para executar certas funções essenciais enquanto o sistema";
            e_note -c "está em execução. Quando o sistema inicializa, os serviços são iniciados automaticamente";
            e_note -c "e continuam sendo executados em segundo plano até que o sistema seja desligado.";
            e_note -c "Nesta opção você pode monitorar a execução e também iniciar/parar e reiniciar os serviços.";
            }
        h3(){
            oooO='_radio';
            e_note "Seu script de Rádio online. Você; irá encontrar os mais diversos gêneros musicais.";
            e_note -c "A lista de rádios são obtidas apartir da fonte https://www.internet-radio.com.";
            e_note -c "Para começar, escolha o seu gênero músical, clicando no botão 'Gêneros' ";
            e_note -c "Obs: Todas as informações contidas na lista, são sincronizadas com a fonte.";
            }
        h4(){
            # oooO='_bob_texto_1';
            e_note ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            e_note -c ""
            }
        h5(){
            oooO='_cht';
            e_note "Acesso unificado aos melhores repositórios de folhas de dicas orientadas pela comunidade do mundo."
            e_note -c "Vamos imaginar por um momento que existe uma 'cheat sheet' ideal. com o que isso deveria" 
            e_note -c "parecer? Quais recursos ele deve ter?"
            e_note -c "o Concise - Deve conter apenas as coisas que você precisa e nada mais."
            e_note -c "o Rápido - deve ser possível usá-lo instantaneamente."
            e_note -c "o Abrangente - Deve conter respostas para todas as perguntas possíveis."
            e_note -c "o Universal - Deve estar disponível em qualquer lugar, a qualquer momento, sem qualquer preparação."
            e_note -c "o Discreto - não deve distraí-lo da sua tarefa principal."
            e_note -c "o Explicações - Deve ajudá-lo a aprender o assunto."
            e_note -c "o Imperceptível - Deve ser possível usá-lo completamente despercebido."
            }
        h6(){
            oooO='_gource';
            e_note "Basicamente um sistema de controle de versão guarda datas "
            e_note -c "de modificação, arquivos modificados, o usuário de "
            e_note -c "versionamento e uma mensagem deste que submeteu a "
            e_note -c "mudança. Isso já parece ótimo para a maioria dos"
            e_note -c "programadores, e convenhamos, já é o suficiente."
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
    # ---------------------------------------------------------------------------------------------
                                                                elif [ ${1} = "contatos" ] ; then
    ### Entradas dos Menus ------------------------------------------------------------------------
    ### (menu) contatos
    # ---------------------------------------------------------------------------------------------
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
                Principal
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
    # ---------------------------------------------------------------------------------------------
                                                                elif [ ${1} = "lembretes" ] ; then
    ### Entradas dos Menus ------------------------------------------------------------------------
    ### (menu) lembretes
    # ---------------------------------------------------------------------------------------------
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
    # ---------------------------------------------------------------------------------------------
                                                                elif [ ${1} = "manutencao" ] ; then
    ### Entradas dos Menus ------------------------------------------------------------------------
    ### (menu) manutencao
    # ---------------------------------------------------------------------------------------------
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
            " Latencia" #25
            " Principal")
        h1(){
            oooO="_monitorix";
            e_note "Serviço de monitoração completo banco de dados, rede, kernel, etc."
            e_note -c "Click neste link ➜ http://localhost:8080/monitorix ( direito|abrir link)."
            e_note -c "parta utilizar seu browser padrão, ou (e) para utilizar o epiphany browser modular."
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
    # ---------------------------------------------------------------------------------------------
                                                                elif [ ${1} = "financeiro" ] ; then
    ### Entradas dos Menus ------------------------------------------------------------------------
    ### (menu) financeiro
    # ---------------------------------------------------------------------------------------------
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
    # ---------------------------------------------------------------------------------------------
                                                                elif [ ${1} = "instalacao" ] ; then
    ### Entradas dos Menus ------------------------------------------------------------------------
    ### (menu) instalação
    # ---------------------------------------------------------------------------------------------
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
    # ---------------------------------------------------------------------------------------------
                                          elif [ ${1} = "instalacao.MenuInstalarProgramas" ] ; then
    ### Entradas dos Menus ------------------------------------------------------------------------
    ### (sub menu) instalação -> [Programas div ... (2)] -> instalacao.MenuInstalarProgramas
    # ---------------------------------------------------------------------------------------------
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
    # ---------------------------------------------------------------------------------------------
                                                               elif [ ${1} = "compactacao" ] ; then
    ### Entradas dos Menus ------------------------------------------------------------------------
    ### (Sub menu)  //não chamado
    # ---------------------------------------------------------------------------------------------
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
    # ---------------------------------------------------------------------------------------------
                                                                elif [ ${1} = "bancodados" ] ; then
    ### Entradas dos Menus ------------------------------------------------------------------------
    ### (Menu) banco(d)ados
    # ---------------------------------------------------------------------------------------------
        local pic=""             # define picture default
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
            picwor=""
        else
            picwor=""
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
            e_note -c "quando o s é digitado, o menu é desmontado e inicia o processo para"
            e_note -c "outro menu ou a execução do comando."
            }
    # ---------------------------------------------------------------------------------------------
                                                    elif [ ${1} = "Principal.bob_texto_1" ] ; then         
    ### Entradas dos Menus ------------------------------------------------------------------------
    ### (sub menu) principal -> [arquivo (2)] -> bob_texto_1
    ### (sub menu) principal -> [arquivo (2)] -> [bob_texto_1 (1)] -> [bob_texto_2 (1)] -> bob_texto_1
    ### (sub menu) principal -> [arquivo (2)] -> [bob_texto_1 (1)] -> [bob_texto_3 (1)] -> bob_texto_1
    # ---------------------------------------------------------------------------------------------
        m=( "Sub menu bob_texto 2"
            "Sub menu bob_texto 3"
            "Seleciona o arquivo, objeto de trabalho." #1
            "Imprimir somente as linhas com uma determinada string." 
            "Imprimir somente a primeira ocorrência da linha com determinada string."
            "Imprimir a última ocorrência da linha com determinada string"  
            "Imprimir da primeira ocorrência da string até o final" #5                 
            "Imprimir da última ocorrência da string até o final"   
            "Apagar as linhas com uma determinada string"               
            "Apagar apenas a primeira linha com determinada string I"             
            "Apagar apenas a primeira linha com determinada string II"
            "Adicionar texto no início da linha"   #10
            "Adicionar texto no final da linha"    
            "Retirar linhas em branco"         
            "Incluir texto no início da linha N"         
            "Incluir texto no final da linha N"          
            "Incluir texto na linha N apagando o conteúdo existente"  #15
            "Incluir texto antes da linha N"   
            "Incluir linha após a última"                                  
            "Imprimir somente a linha N"                        
            "Retirar a linha N"                   
            "Extrair um trecho de uma linha" #20
            "Retirar espaços em branco repetidos"
            "Retirar espaços em branco no início da linha" ) #22
        e=( "Principal.bob_texto_2"
            "Principal.bob_texto_3"
            "SelecionaArquivo" #1
            "Linhas 0"
            "Linhas 1"
            "Linhas 2"
            "Linhas 3" #5
            "Linhas 4"
            "Linhas 5"
            "Linhas 6"
            "Linhas 7"
            "Linhas 8" #10
            "Linhas 9"
            "Linhas 10"
            "Linhas 11"
            "Linhas 12"
            "Linhas 13" #15
            "Linhas 14"
            "Linhas 15"
            "Linhas 16"
            "Linhas 17"
            "Linhas 18" #20
            "Linhas 19"
            "Linhas 20" )  #22  
        h1(){
            e_note "Abre o sub menu Principal -> Arquivo -> bob_texto 2"
            e_note -c ""
            }
        h2(){
            e_note "Abre o sub menu Principal -> Arquivo -> bob_texto 3"
            e_note -c ""
            }
        h3(){
            e_note "Abre a dialog para a seleção do arquivo objeto de traabalho deste menu."   #1
            e_note -c ""
            }
        h4(){
            e_note "Imprimir somente as linhas com uma determinada string."
            e_note -c "submodulo_sed[0]=$(sed -n "/${palavra}/p" ${arquivo})"
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
    # ---------------------------------------------------------------------------------------------
                                                     elif [ ${1} = "Principal.bob_texto_2" ] ; then         
    ### Entradas dos Menus ------------------------------------------------------------------------
    ### (sub menu) principal -> [arquivo (2)] -> [bob_texto_1 (1)] -> bob_texto_2
    ### (sub menu) principal -> [arquivo (2)] -> [bob_texto_1 (2)] -> [bob_texto_3 (2)] -> bob_texto_2
    # ---------------------------------------------------------------------------------------------
        m=( "Sub menu bob_texto 1"
            "Sub menu bob_texto 3"
            "Apagar uma string do início da linha "
            "Apagar do início da linha até uma string "
            "Apagar de uma string até o final da linha"
            "Apagar a última string da linha"
            "Colocar todas as linhas em uma só"
            "Juntar a linha com a próxima"       
            "Substituir caractere por outro até uma TAG"
            "Substituir caractere por outro entre TAGs"
            "Substituir string por outra somente em certas linhas"
            "Substituir string por outra somente em certas linhas II"
            "Substituir a última ocorrência de uma string por outra"             
            "Trocar a ordem das palavras (última vira prim. penúltima vira seg.)"
            "Trocar a ordem das letras (igual ao comando rev)" 
            "Trocar de maiúsculas para minúsculas"                    
            "Trocar de minúsculas para maiúsculas" )
        e=( "Principal.bob_texto_1"
            "Principal.bob_texto_3"
            "Linhas 21"
            "Linhas 22"
            "Linhas 23"
            "Linhas 24"
            "Linhas 25"
            "Linhas 26"
            "Linhas 27"
            "Linhas 28"
            "Linhas 29"
            "Linhas 30"
            "Linhas 31"
            "Linhas 32"
            "Linhas 33"
            "Linhas 34"
            "Linhas 35" )
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
    # ---------------------------------------------------------------------------------------------
                                                     elif [ ${1} = "Principal.bob_texto_3" ] ; then
    ### Entradas dos Menus ------------------------------------------------------------------------
    ### (sub menu) principal -> [arquivo (2)] -> [bob_texto_1 (2)] -> bob_texto_3
    ### (sub menu) principal -> [arquivo (2)] -> [bob_texto_1 (2)] -> [bob_texto_2 (2)] -> bob_texto_3
    # ---------------------------------------------------------------------------------------------
        m=( "Sub menu bob_texto 1"
            "Sub menu bob_texto 2"
            "Imprimir a linha antes de uma string"
            "Imprimir a linha antes de uma string e a linha da string"
            "Imprimir a linha após uma string"
            "Imprimir a linha após uma string e a linha da string"
            "Imprimir a linha anterior, posterior e a linha que contém uma string " #5
            "Imprimir a linha anterior e posterior a linha que contém uma string  "
            "Imprimir N linhas antes, a linha da string e M linhas após uma string I "
            "Imprimir N linhas antes, a linha da string e M linhas após uma string II "
            "Adicionar linha antes de uma string "
            "Adicionar linha após a linha com uma determinada string "              #10
            "Imprimir somente entre linha N e M "
            "Substituir uma string por outra somente entre determinadas linhas "
            "Imprimir linhas que contém uma ou outra string"
            "Imprimir linhas que contém uma e outra string "
            "Extrair um trecho do arquivo "                                         #15
            "Extrair trecho que pode ou não estar na mesma linha "
            "Extrair trecho que pode ou não estar na mesma linha tirando os delimitadores "
            "Apagar o que está entre delimitadores"
            "Apagar um trecho se ele contém um padrão"
            "Trocar de lugar a linha com a próxima (troca de lugar linha 1 com 2, 3 com 4...) I"    #20
            "Trocar de lugar a linha com a próxima (troca de lugar linha 1 com 2, 3 com 4...) II "
            "Retirar comandos HTML (tudo entre < e >)"
            "Pesquisar se existe algum usuário sem senha no /etc/passwd" )       #23
        e=( "Principal.bob_texto_1"
            "Principal.bob_texto_2"
            "Linhas 36"
            "Linhas 37"
            "Linhas 38"
            "Linhas 39"
            "Linhas 40"
            "Linhas 41"
            "Linhas 42"
            "Linhas 43"
            "Linhas 44"
            "Linhas 45"
            "Linhas 46"
            "Linhas 47"
            "Linhas 48"
            "Linhas 49"
            "Linhas 50"
            "Linhas 51"
            "Linhas 52"
            "Linhas 53"
            "Linhas 54"
            "Linhas 55"
            "Linhas 56"
            "Linhas 57"
            "Linhas 58" )
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
    fi
}
        #                        
        #                       ${red}廒${reset} Sair.
        #           ﯑ 
