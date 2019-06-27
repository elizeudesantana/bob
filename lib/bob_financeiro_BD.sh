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

#. "bob_util.sh"
# by: Elizeu de Santana / 16-06-2019 -------------------------------------------------------
function Indice(){
    ### Definições dos termos financeiros ###
    declare -a alfabeto=( 
        "Aposentadoria_integral" "Aposentadoria_especial" "Abono" "Ajuda_financeira" \
        "Atraso_no_pagamento" "Aporte_inicial_ou_aplicacao_inicial" "Apolice_de_seguros" \
        "Anuidade_ou_taxa_do_cartao_de_credito" "Aconselhamento_financeiro" "Auditoria" \
        "Ativo_fixo" "Ativos" "Ativo_circulante" "Arbitragem_Ano_Fiscal" "Amortizacao" \
        "Ajuste_fiscal" "agio_AGE" "Administrador_de_fundos" "Administracao_passiva" \
        "Administracao_ativa" "Acionista_minoritario" "Acionista_majoritario" \
        "Acoes" "Acordo_de_divida" "Ajuda_financeira_do_governo" "Ajuda_financeira_on-line"
        "Beneficios" "Beneficio_assistencial" "Banco_Fiat" "Banco_GMAC" "Banco_Volkswagen" \
        "Boa_Vista " "Banco_Ibi" "BMG_BV" "Financeira_Bradesco" "Boletos" "BM&FBovespa" \
        "Beneficiario" "Bandeira" "Custo_Efetivo_Total_CET" "credito_Direto_ao_Consumidor_CDC" 
        "credito_consignado" "Cheque_especial" "Cartao_de_credito" "Cursos_on-line" "Crediario" \
        "Contribuicao_comprovantes" "Cheques" "Carregamento" "Capitalizacao" "Calculo" "Citibank" \
        "Caixa_Economica_Federal" "Compras_no_carne" "Compras_coletivas" "Compras_pela_internet" "Carne-leao" \
        "Carencia" "Conta_poupanca" "Cartoes_pre-pagos_compras_parceladas" "Compras_a_vista" "Compras_a_prazo" \
        "Caixa_eletronico_compensacao_de_cheque_modernizada" "Conta_corrente" "PJ" "Cooperativa_de_credito" \
        "Conta_universitaria" "Conta_conjunta" "Cancelamento_de_cartao_de_credito" "credito" \
        "credito_Rotativo" "Consórcio" "CLT_Consolidacao_das_Leis_do_Trabalho" "CDI_Certificado_de_depósito_Interbancario" \
        "Cartao_de_debito" "Cartao_adicional" "Caderneta_de_poupanca" "Calculo_de_juros_abusivos" \
        "Cancelamento_de_cartao_de_credito_com_dividas" "Cartao_de_credito_bloqueado" "Controle_de_gastos_mensais_compra_de_dividas" \
        "Consultor_de_financas_bancario" "Conselhos_de_ajuda_financeira" "Consultor_financeiro_on-line_gratis" \
        "Consultor_financeiro_pessoal" "Consultoria_financeira_pessoal_gratuita" \
        "Controle_de_financas_pessoais_on-line" "Controle_de_despesas_de_viagem" "Controle_financeiro_domestico" \
        "Controle_financeiro_familiar_gratis" "Controle_financeiro_iPhone" "Android Controle_financeiro_pessoal_gratis" \
        "Controle_financeiro_pessoal" "Linux" "Controle_financeiro_pessoal_das_mulheres" "Controle_Generico" \
        "Controle_Pessoal" "Curso_de_planejamento_financeiro_pessoal" "Consultoria_financeira" \
        "Controle_financeiro_familiar" "Calculo_de_gastos_de_gasolina" "CLT_decimo_terceiro_salario" \
        "despesas_debito_automatico_em_conta" "debito_direto_Autorizado_DDA" "Dividas" "Dividas_altas" \
        "Dividas_com_agiotas" "Dividas_de_banco" "dividas_de_financiamento_de_carros" "Dividas_de_IPTU" \
        "Dividas_em_atraso" "Dividas_fiscais" "Dividas_no_SPC" "Divida_on-line" "divida_de_boleto" \
        "Endividamento_Estruturados" "Encerramento_de_contas" "Extrato_bancario Emprego" "Endividamento" \
        "Empregado_domestico" "Emprestimo_Caixa" "Emprestimo_consignado" "Emprestimos_mais_baratos" \
        "Emprestimo_pessoa_juridica" "Emprestimo_pessoal_sem_cheque" "Emprestimo_urgente" "Emprestimos_bancarios" \
        "emprestimos_empresariais" "emprestimos_para_negativados" "Emprestimos_pela_internet" "Emprestimo_pessoal" \
        "Financiamento" "Fundos_de_pensao" "Fundos_imobiliarios" "Fiador" "Fatura" "Fianca" "FGTS_Fundo_de_garantia_por_Tempo_de_Servico" \
        "Financeira_de_emprestimos" "Fundo_de_garantia" "Gerenciadores_Financeiros" "Garantia_minima" \
        "Gestao_do_tempo" "HSBC" "Invalidez" "Itaú" "Internet_Banking" "IOF_Imposto_sobre_Operacões_Financeiras" \
        "Inadimplencia" "INSS_Instituto_Nacional_do_Seguro_Social" "Inflacao" "indice_de_precos" "Imposto_sobre_Servicos" \
        "Imposto_sobre_Operacões_Financeiras" "Imposto_de_renda" "Juntar_dinheiro" "Juros_altos" "Juro_simples" \
        "Juro_rotativo" "Juro_real" "Juro_por_atraso" "Juro_nominal" "Juro_composto" "Juros_abusivos" \
        "Juros_de_dividas" "Losango" "Leasing" "Letra_de_credito_Imobiliario_LCI" "Limite_do_cartao" \
        "Malha_fina" "Nota_fiscal" "Negociacao_de_dividas" "Ofertas_Iniciais_de_acões" \
        "Prestacao" "Penhora" "Parcelamentos_de_fatura" "Parcelamento_Prazos" "Portabilidade" "pensões" \
        "Pedagio" "Pernambucanas" "Financiadora" "Pregao" "Politica_economica" "Politica_monetaria" \
        "Politica_fiscal" "PIS" "Pessoa_juridica" "Pessoa_fisica" "Plano_de_contas" "Procon" \
        "Previdencia_Complementar" "Planilha_de_controle_financeiro" "Programas_para_controle_financeiro_pessoal_para_Windows" \
        "Programa_para_controle_financeiro_pessoal_para_Mac" "Programa_de_controle_financeiro_pessoal"  \
        "Previdencia_privada" "Planilhas_de_orcamento_de_imobiliarias" "Planilha_de_gastos_individuais"  \
        "Planilha_Excel_gratis" "Planilha_de_orcamento_familiar" "Planilha_de_gastos_quinzenal"  \
        "Planilha_de_gastos_pessoais" "Planilha_de_gastos_mensais" "Planilha_de_gastos_gratis"  \
        "Planilha_de_gastos_diarios" "Planilha_de_gastos" "Planilha_de_controle_financeiro_pessoal"  \
        "Planejamento_financeiro_pessoal" "Planejamento_financeiro_familiar" "Planejamento_financeiro_domestico_Excel"  \
        "Planejamento_de_viagens" "Planejamento_de_compras" "Parcelamento_de_dividas" "Pagamento_de_dividas" \
        "Regularizacao" "Recebimentos" "Recessao" "Razao_social" "Rentabilidade" "renda_Variavel" "Renegociacao_de_divida_fiscal"  \
        "Regularizando_dividas" "Reducao_de_juros" "Reducao_de_gastos_no_setor_financeiro" \
        "Reducao_de_divida" "Saque" "Saldos" "2ª_via_de_boleto" "SPC_Servico_de_protecao_ao_credito" "Safra" \
        "Santander" "SELIC" "Salario_minimo" "Sucessao_de_bens" "Serasa" "Software_de_financas_e_investimentos" \
        "Software_de_financas" "Sites_de_controle_de_financas_pessoais" "Simulacao_de_emprestimo" \
        "Simulacao_de_controle_financeiro_domestico" "Tributacao" "Transferencia_Automatica_de" "Salario" \
        "Tipos_de_contas" "Tempo_de_contribuicao" "Taxa_de_administracao" "Tabua_atuarial" "Taxas_de_desemprego" \
        "Titulo_de_capitalizacao" "Tarifas_bancarias" "Transferencia_de_dinheiro" "Taxa_de_juro" \
        "Tabelas_de_graficos_financeiros" "Tabela_de_gastos_mensais" "Tabela_financeira_pessoa_juridica" \
        "Tabela_de_financas" "Venda_de" "imóveis" "Venda_de_bens" )
    declare -a def=(
        "
        Aposentadoria integral - 
        Chegando perto do encerramento das atividades profissionais, uma preocupação natural é se vamos receber a aposentadoria integral ou não. Como saber antes que seja tarde qual é o tipo de benefício que irei receber?
        Existem basicamente quatro tipos de aposentadoria: por idade, por invalidez, especial e por tempo de contribuição. Falaremos agora desta última, que apresenta-se nas categorias de aposentadoria integral ou proporcional. Para receber a aposentadoria integral, o trabalhador precisa comprovar que contribuiu para a previdência social por 35 anos, no caso dos homens, e no das mulheres, por 30. Além disto, é preciso ter cumprido o período de carência, cujo valor é diferente dependendo da época de inscrição: quem começou a pagar a partir de 25 de julho de 1991 precisa comprovar 180 contribuições mensais. Se a filiação é de data mais antiga, é preciso conferir a tabela progressiva, disponível no site da Previdência, para saber qual o tempo de carência para receber a aposentadoria integral. Um detalhe: não é preciso parar de trabalhar para receber a aposentadoria por tempo de serviço.
        O requerimento deve ser feito através da Central 135, do portal da Previdência Social na internet ou pessoalmente nas Agências da Previdência Social. Você vai precisar dos seguintes documentos: Número de Identificação do Trabalhador (NIT), um Documento de Identificação (Carteiras de Identidade, de Trabalho ou da Previdência) e seu CPF. Quem prestou serviço militar pode incluir o período apresentando o Certificado de Reservista.
        "   
        "
        Aposentadoria especial
        Aposentadoria especial é um benefício que todo trabalhador tem direito, caso tenha exercido atividade remunerada, onde sua integridade física esteve comprometida de alguma forma. Quem deseja recebê-la deve comprovar que, durante o trabalho, esteve permanentemente exposto a agentes nocivos químicos, físicos, biológicos, ergométricos ou uma associação de todos eles. Esta comprovação é requerida através do preenchimento do formulário denominado Perfil Profissiográfico Previdenciário (PPP), onde constará um Laudo Técnico de Condições Ambientais de Trabalho (LTCAT), feito por um médico ou um engenheiro de segurança trabalhistas.
        Além disto, para ter direito à aposentadoria especial é preciso cumprir um período de carência: para os inscritos a partir de 25 de julho de 1991, este período compreende um mínimo de 180 contribuições mensais, ou seja, 15, mas também 20 ou 25 anos, dependendo da profissão.
        Situações como muito ruído no trabalho, calor e frio ou risco constante de contato com vírus podem ser fatores que dão direito à aposentadoria especial. Antigamente, o exercício de algumas profissões dava ao trabalhador o direito automático à aposentadoria especial, ou seja, não era exigido o laudo LTCAT.
        A partir da mudança na Lei Trabalhista em 1995, a coisa não é mais assim, mas alguns exemplos de profissões onde se tem mais chance de receber a aposentadoria especial segundo o tempo de contribuição prévia são: carregador de rochas e muitas profissões exercidas no subterrâneo (15 anos), laminadores de chumbo ou extrator de mercúrio (20 anos), eletricista, enfermeiros, jornalista, médico, motorista de ônibus, professor, telefonista, costureiros, metalúrgicos e maquinistas de trem (25 anos).
        "
        "
        Abono
        Segundo o site do governo brasileiro, o abono salarial compreende um benefício pago ao trabalhador que recebe até dois salários mínimos. É concedido aos funcionários de empresas que contribuem para o Programa de Integração Social (PIS), ou então para o Programa de Formação do Patrimônio do Servidor Público. Este benefício tem valor de um salário minimo e é garantido pela Legislação Trabalhista desde 1970, constando no artigo 239 da Constituição Federal, e sua lei mais atual é a de Nr. 7.998, de 11 de janeiro de 1990.
        Segundo esta lei, este direito é concedido tanto a trabalhadores do setor público quanto do setor privado, e pode ser recebido por quem trabalhou por pelo menos 30 dias do ano considerado para a apuração. Para ter direito ao abono salarial também é preciso estar cadastrado no Cadastro Nacional do Trabalhador ou no Fundo de Participação PIS/PASEP há pelo menos 5 anos. Além disto, é preciso que seus dados estejam informados corretamente na Relação Anual de Informações Sociais (ANAIS).
        Como faço para receber meu abono salarial?
        Na verdade, a empresa com a qual você tem vínculo é que informa o Ministério do Trabalho na data prevista, e a Caixa Econômica Federal responsabiliza-se pelo pagamento. Se você tiver um Cartão Cidadão, pode usá-lo para sacar o abono: as datas de pagamento são informadas no site da Caixa. Se seu empregador tiver convênio CAIXA-Pis Empresa, o pagamento é feito diretamente no seu contracheque. Você pode também optar pelo crédito direto em conta, bastando para isto dirigir-se a uma agência da Caixa e fazendo o requerimento.
        "
        "
        Ajuda financeira
        É comum e até esperado que em alguma fase da vida a grana aperte e que seja necessário recorrer à alguma ajuda financeira para superar o momento infelizmente negativo. O caminho mais fácil e nem sempre burocrático para conseguir dinheiro em curto prazo é buscar um empréstimo em bancos.
        A ajuda financeira concedida por uma instituição bancária é um tipo muito comum de dívida, que se não bem gerida pode prejudicar a vida financeira de muita gente. Não honrar pagamento é arriscado.
        Imagine que precise de R$ 2.000 para comprar medicamentos. Salvo algumas excessões, é difícil ter esse dinheiro tão rápido e à vista, não é? Portanto, um bom jeito é recorrer à instituição bancária onde você é correntista – que passa, agora, a se chamar credora e você, devedor.
        Quando o valor emprestado é finalmente concedido, o devedor está ciente de que além dos R$ 2000 que conseguiu precisará arcar com as taxas de juros em vigência.
        Pedir ajuda financeira não é algo muito fácil, psicologicamente falando, e até certo ponto desestimulante. Porém, ao se programar e pagar essa despesa mensalmente e, de preferência, sem atrasos, você consegue quitar a dívida de R$ 2000 com muita tranquilidade, sem sentir o bolso pesar no final do mês.
        Essa ajuda em forma de dinheiro é muito mais comum do que se consegue imaginar e é um fato que tem crescido muito no Brasil nos últimos anos. Sendo o devedor um bom pagador, dificilmente lhe será negada qualquer ajuda que seja.        
        "
        "
        Atraso no pagamento
        A maioria das pessoas não deixa de pagar conta porque quer, primeiramente porque o nome pode ficar sujo na praça, depois em função das multas sobre o valor da fatura. Para ajudar a orientar o consumidor nessa questão de atraso no pagamento, a Fundação Procon de São Paulo dá algumas orientações.
        Segundo o Código de Defesa do Consumidor, quando uma pessoa contrata um serviço ou então adquire produto financiado (parcelado), as multas de mora (ou multas por atraso no pagamento) não podem exceder 2% do valor da prestação. Se você comprou um televisor em 12 vezes de R$ 200, o custo da parcela após o vencimento não pode exceder R$ 204. O mesmo se você tiver financiado uma casa própria, um veículo automotor ou adquirido um empréstimo.
        Quer saber de outros casos onde isso é aplicável? Em convênio médico e em mensalidades escolares, além de luz, água e consórcio. Ainda, segundo o Procon-SP, desde 2003 essa regra se aplica ao atraso no pagamento de despesas de condomínio.
        Não existe obrigatoriedade em relação a cursos feitos livremente (de música, dança e idiomas, por exemplo). Obviamente, é importante ficar atento para evitar abusos!
        O mais indicado é evitar atrasos, pois quase sempre essa regra deixa de ser aplicada no mercado, justamente porque existem contratos firmados de acordo com interesses das empresas – que estão sempre amparadas, de alguma forma, pela justiça. Se vir algo errado procure imediatamente os seus direitos. Atrasar não significa que você não tem seus direitos. Então, nunca se sinta constrangido.
        "
    )
    c=0; l=${#alfabeto[@]}
    echo $l
    for ((i=0;i<l;i++))
    do 
        clicked[${i}]="[ ]" 
    done 
    while true ; do
		Titulo
        for ((i=0;i<l;i++))
        do       
             echo -e "${ctr} $((${i}+1))) ${clicked[${i}]} ${alfabeto[${i}]} ${dlc}"
             echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
        done
        echo -ne "${ctr} (s)air | Número [ 1 .. $i ] : ${dlc}"; read opt
        if [ "${opt}" = "s" ] ; then
            break
        else
            t=$((opt-1))
            
            if [ "${clicked[${t}]}" = "[ ]" ] ; then
                clicked[${t}]="[x]"
            else
                clicked[${t}]="[ ]"
            fi
        fi 
	done
    l=${#clicked[@]} 
    for ((i=0;i<l;i++))
    do
        Titulo
        if [ "${clicked[${c}]}" = "[x]" ] ; then
            echo -e "${ctr} \n$((${c}+1))) ${clicked[${c}]} ${alfabeto[${c}]} ${dlc}"
            echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
            p=0
            for ((i=0;i<${#def[c]};i++))
            do               
                echo -e "${ctr} ${def[c]:$p:71} ${dlc}"               
                p=$((i= ${i} + 70))
            done
            echo -e "${cls} ---------------------------------------------------------------- ${dlc}"
            read
        fi
        let $((++c))
    done
    Financeiro
}