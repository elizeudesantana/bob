#!/bin/bash
############################################################################################
#
# Bob utilities script bash 
#
version="2019.01"               											# Versão do Programa
#
scriptFileVersion="1.0.0" 													# Versão do script
#
# History:
# 	0.0.1    script version inicial, estrutura de diretorio.
#   2019.01  Dividido em diretorios criação de route e tipando de forma MVC (23/06/2019)
#
# Dependências:
#	function Dependencias()
#
# * Retorno: n/a
# * Data: n/a
#
# by: Elizeu de Santana -------------------------------------------------------------------

# -----------------------------------------------------------------------------------------
function Configurar(){
	### Configura parametros ###
	Titulo;
	echo -e "${ctm} \n 1 - Nome do Usuario: ${dlc} ${ctr} ${nmu}           		  			  ${dlc}";
	echo -e "${ctm} 2 - Logotipo do programa: ${dlc} ${ctr} ${lgt}			 				  ${dlc}";
	echo -e "${ctm} 3 - Relogio ativo: ${dlc} ${ctr} ${rlt}					 				  ${dlc}";
	echo -e "${ctm} 4 - Tela inicial: ${dlc} ${ctr} ${tle}					 				  ${dlc}";
	echo -e "${ctm} 5 - Configurações de cores :      										  ${dlc}";
	echo -e "${cls} \n ---------------------------------------------------------------------- ${dlc}";
	echo -ne "${ctm} Digite o número para mudar os parametro ou s para sair: ${dlc}";read conf
	case $conf in
		1) echo -ne "${ctr} \n Digite o novo Nome do Usuario: ${dlc}"; read nmu; ;;
		2) echo -ne "${ctr} \n Digite o novo Logotipo do Programa: ${dlc}"; read lgt; ;;
		3) echo -ne "${ctr} \n Digite (Sim ou Não) para ativar o relogio : ${dlc}"; read rlt; ;;
		4) echo -ne "${ctr} \n Digite (Sim ou Não) para ativar a tela inicial : ${dlc}"; read tle; ;;
		5) 
			echo -ne "${ctr} \n Configurar (t)odas ou uma (e)specifica ? : ${dlc}"; read opt
			if [ "$opt" = "t" ]; then	
				Titulo	
				. 'bob_zzfuncao.sh'; zzcores
				echo -e "${ctr} \n Recomenda-se (barra 033[0; + cor escolhida), para não trocar o backgraund, mais sinta-se a vontade para modificar como lhe agradar! ${dlc}";
				echo -ne "${ctr} \n Desliga_cores : ${dlc} ${ctm} $dlc ${dlc}"; read dlc
				echo -ne "${ctr} cor_linha_logo : ${dlc} ${ctm} $clt ${dlc}"; read clt
				echo -ne "${ctr} cor_linhas : ${dlc} ${ctm} $cls ${dlc}"; read cls
				echo -ne "${ctr} cor_texto_result : ${dlc} ${ctm} $ctr ${dlc}"; read ctr
				echo -ne "${ctr} cor_texto_menu : ${dlc} ${ctm} $ctm ${dlc}"; read ctm
				echo -ne "${ctr} cor_logo : ${dlc} ${ctm} $clg ${dlc}"; read clg
			else
				Titulo
				echo -e "${ctr} \n 1) Desligar cores : ${dlc} ${ctm} ${dlc} ${dlc}";
				echo -e "${ctr} 2) cor linha logo : ${dlc} ${ctm} ${clt} ${dlc}";
				echo -e "${ctr} 3) cor linhas : ${dlc} ${ctm} ${cls} ${dlc}";
				echo -e "${ctr} 4) cor texto result : ${dlc} ${ctm} ${ctr} ${dlc}";
				echo -e "${ctr} 5) cor texto menu : ${dlc} ${ctm} ${ctm} ${dlc}";
				echo -e "${ctr} 6) cor logo : ${dlc} ${ctm} ${clg} ${dlc}";
				echo -e "${cls} ---------------------------------------------------------------------- ${dlc}";
				echo -ne "${ctr} Escolha uma das opções apresentadas : ${dlc}"; read opt
				case $opt in
					1)
						Titulo
						. 'bob_zzfuncao.sh'; zzcores
						echo -e "${ctr} \n Acrescente (033[0; + cor escolhida). ${dlc}";
						echo -ne "${ctr} Desliga_cores : ${dlc} ${ctm} ${dlc} ${dlc}"; read dlc ;;
					2)
						Titulo
						. 'bob_zzfuncao.sh'; zzcores
						echo -e "${ctr} \n Acrescente (033[0; + cor escolhida). ${dlc}";
						echo -ne "${ctr} cor_linha_logo : ${dlc} ${ctm} ${clt} ${dlc}"; read clt ;;
					3)
						Titulo
						. 'bob_zzfuncao.sh'; zzcores
						echo -e "${ctr} \n Acrescente (033[0; + cor escolhida). ${dlc}";
						echo -ne "${ctr} cor_linhas : ${dlc} ${ctm} ${cls} ${dlc}"; read cls ;; 
					4)
						Titulo
						. 'bob_zzfuncao.sh'; zzcores
						echo -e "${ctr} \n Acrescente (033[0; + cor escolhida). ${dlc}";
						echo -ne "${ctr} cor_texto_result : ${dlc} ${ctm} ${ctr} ${dlc}"; read ctr ;; 
					5)
						Titulo
						. 'bob_zzfuncao.sh'; zzcores
						echo -e "${ctr} \n Acrescente (033[0; + cor escolhida). ${dlc}";
						echo -ne "${ctr} cor_texto_menu : ${dlc} ${ctm} ${ctm} ${dlc}"; read ctm ;;
					6)
						Titulo
						. 'bob_zzfuncao.sh'; zzcores
						echo -e "${ctr} \n Acrescente (033[0; + cor escolhida). ${dlc}";
						echo -ne "${ctr} cor_logo : ${dlc} ${ctm} ${clg} ${dlc}"; read clg ;;
					*) echo -e "${ctr} Escolha não recnhecida! ${dlc}";Configurar ;;
				esac
			fi
			;;
		's') clear;	. 'bob.sh';	Principal; ;;				#retorna ao fluxo
		*) echo -ne "${ctm} \n Opção desconhecida ${dlc}"; Configurar; ;;
	esac; 
	conf=$(cat <<EOF
#########################################################
#
# Arquivo de Configuração do App de controle Bob
#
# Em: 07-06-2019
# by: Elizeu de Santana 
#
# Configurações Gerais
# Versão beta 2019.0.1
#

#[Configurações gerais Bob]
Nome_do_Usuario="$nmu"
Logotipo_Titulo="$lgt"
Relogio_tela="$rlt"
Tela_Entrada="$tle"

#[Configurações de Cor Bob]
Desliga_cores="$dlc"            # Não modififcar este setpoint <--------------------------------
Cor_linha_logotipo="$clt"
Cor_linhas="$cls"
Cor_texto_result="$ctr"
Cor_texto_Menu="$ctm"
Cor_logo="$clg"
EOF
)	
	echo "${conf}" > bob.conf; . 'bob.sh';	Principal;				#retorna ao fluxo
}