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
if [ -f "${utilsLocation}" ]; then
    source "${utilsLocation}";
else
    e_error "Erro carregando ${utilsLocation}"; Sair;
fi
# -----------------------------------------------------------------------------------------
if [ -f "${lembramontanteLocation}" ]; then
    source "${lembramontanteLocation}";
else
    e_error "Erro carregando ${lembramontanteLocation}"; Sair;
fi
# -----------------------------------------------------------------------------------------
# Função Agenda
# -----------------------------------------------------------------------------------------
# 08/06 implentado banco de dados para agenda ###
# 22/06 implentado novo menu e lembretes ###
# -----------------------------------------------------------------------------------------
function Agenda(){
    h=$(date '+%m'); a=$(date '+%y'); source "${datasLocation}" $h 20$a; printf "\n"
    e_header "::\d $(date) :: Você pode fazer as seguintes escolhas."
}
# -----------------------------------------------------------------------------------------
# Função Bob_Lembrete
# -----------------------------------------------------------------------------------------
### Chave para lembretes ###
# -----------------------------------------------------------------------------------------
function Bob_Lembrete(){
	case ${1} in
		a) 
			Titulo_Inicial; printf "\n\n"; h=$(date '+%m'); a=$(date '+%y'); ./datas $h 20$a
			e_arrow " Adicionar lembretes."; printf "\n"
			
			printf "Lembrete : "; read lembre
			printf "Dia : "; read d
			printf "Mês : "; read ms
			seek_confirmation "Deseja incluir o cadastro do lembrete:\n ${lembre}. ?" 
			if is_confirmed; then
				$sql_user "insert into $lembrete_tabela values('$d','$ms','$lembre');" $agenda_DB
				[ "$?" = "0" ] && e_success "Operacao pronta." || e_error "Operação falhou."
			fi
			Agenda lembretes ;;
		e) 
			Titulo
			echo -e "${ctm} \n Editar contato : ${dlc}";
			echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
			echo -ne "${ctr} Procura : ${dlc}"; read n
			#EditaRegistro $n
			$sql_user "select * from $agenda_tabela where nome like '%${n}%'" $agenda_DB
			
			echo -ne "${ctr} Contato : ${dlc}"; read n
			$sql_user "select * from $agenda_tabela where nome = '${n}'" $agenda_DB
            echo -ne "${ctr} Campos -> (n)ome, (t)elefone, (e)mail,(a)niversario : ${dlc}"; read opt
            case $opt in		
                n)
					read -p "Nome       : " no
					$sql_user "update $agenda_tabela set nome = '${no}' where nome = '${n}'" $agenda_DB ;;                        
				t)
					read -p "Telefone   : " fone
					$sql_user "update $agenda_tabela set telefone = '${fone}' where nome = '${n}'" $agenda_DB ;;                        
				e)
					read -p "E-Mail     : " mail
					$sql_user "update $agenda_tabela set email = '${mail}' where nome = '${n}'" $agenda_DB ;;
				a)
					read -n2 -p "Aniversário (dia/mes/ano): " dia
					read -n2 -p "/" mes
					read -n4 -p "/" ano
					dados="$ano/$mes/$dia"
		            echo 
		            checa_data "$dados" || { echo "ERRO: Data de aniversário inválida";Agenda; }
                    $sql_user "update $agenda_tabela set aniversario = '${dados}' where nome = '${n}'" $agenda_DB ;;
				*) ;;
			esac
			Agenda lembretes ;;
		d) 
			Titulo;
			echo -e "${ctm} \n Apagar contato : ${dlc}";
			echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
			echo -ne "${ctr} Procura : ${dlc}"; read n
   			$sql_user "select * from $agenda_tabela where nome like '%${n}%'" $agenda_DB
            echo -ne "${ctr} Contato : ${dlc}"; read n
			$sql_user "select * from $agenda_tabela where nome = '${n}'" $agenda_DB
            echo -ne "${ctr} Certeza para apagar o registro (s/n)? ${dlc}"; read opt
            if [ ${opt} == "s" ] ; then
				$sql_user "delete from $agenda_tabela where nome = '${n}'" $agenda_DB
			else
				Agenda lembretes
			fi 
			#DeletaRegistro $nome				
            
			Agenda lembretes ;;
		l) 
			Titulo_Inicial; printf "\n\n"; h=$(date '+%m'); a=$(date '+%y'); ./datas $h 20$a
			printf "\n"; e_arrow " Listar tudo."; printf "\n"
			$sql_user "select * from $lembrete_tabela \G" $agenda_DB; 
			printf "\n"; e_arrow " Listar tudo, completo.$(e_success)"; printf "\n"
			e_note "Pressione qualquer tecla para retornar a agenda."; read; Agenda lembretes ;;
		q)
			Titulo;
			echo -e "${ctm} Procurar contato : ${dlc}";		
			echo -ne "${ctr} Contato:  ${dlc}"; read n
			#SearchRegistro $n
			$sql_user "select * from $agenda_tabela where nome like '%${n}%'" $agenda_DB
			
			echo -ne "${ctm} (s)air menu bob, (i)r para menu agenda : ${dlc}"; read opt
			
			if [ ${opt} == "s" ] ; then
				. 'bob.sh'
			else
				Agenda lembretes
			fi 
			Agenda lembretes ;;
		f) 
			Titulo;
			echo -e "${ctm} \n Apagar agenda : ${dlc}";
			echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
			echo -e "${ctr} Tem certeza que deseja apagar todas as entradas da agenda? (s/n) ${dlc}";
			read confirma
			
			if [ $confirma = "s" -o $confirma = "S" ]; then
				echo
			fi
			Agenda lembretes ;;
	esac
}

# by: Elizeu de Santana / 20-06-2019 -------------------------------------------------------
function Bob_Agenda(){
	### recebe a escolha do usuario e implementa ###
	case ${1} in
		c) criaBD ;;
		a) 
			Titulo_Inicial; printf "\n\n"; h=$(date '+%m'); a=$(date '+%y'); ./datas $h 20$a
			e_arrow " Adicionar contato."; printf "\n"
			
			read -p "  Nome       : " nome
			read -p "  Telefone   : " fone
			read -p "  E-Mail     : " mail
			read -n2 -p "  Aniversário (dia/mes/ano): " dia
			read -n2 -p "/" mes
			read -n4 -p "/" ano
			aniver="$ano/$mes/$dia"  
			if [ "$ano" -o "$mes" -o "$dia" ];then 
				checa_data "$aniver" || { e_error "Data de aniversário inválida!"; Agenda; }
			fi			
			[ "$nome" ] || { e_error "Nome inválido"; Agenda; } 
			seek_confirmation "Deseja incluir o cadastro de ${nome}. ?" 
			if is_confirmed; then
				$sql_user "insert into $agenda_tabela values('$nome','$fone','$mail','$aniver');" $agenda_DB
				[ "$?" = "0" ] && e_success "Operacao pronta." || e_error "Operação falhou."
			fi
			Agenda contatos;;
		e) 
			Titulo
			echo -e "${ctm} \n Editar contato : ${dlc}";
			echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
			echo -ne "${ctr} Procura : ${dlc}"; read n
			#EditaRegistro $n
			$sql_user "select * from $agenda_tabela where nome like '%${n}%'" $agenda_DB
			
			echo -ne "${ctr} Contato : ${dlc}"; read n
			$sql_user "select * from $agenda_tabela where nome = '${n}'" $agenda_DB
            echo -ne "${ctr} Campos -> (n)ome, (t)elefone, (e)mail,(a)niversario : ${dlc}"; read opt
            case $opt in		
                n)
					read -p "Nome       : " no
					$sql_user "update $agenda_tabela set nome = '${no}' where nome = '${n}'" $agenda_DB ;;                        
				t)
					read -p "Telefone   : " fone
					$sql_user "update $agenda_tabela set telefone = '${fone}' where nome = '${n}'" $agenda_DB ;;                        
				e)
					read -p "E-Mail     : " mail
					$sql_user "update $agenda_tabela set email = '${mail}' where nome = '${n}'" $agenda_DB ;;
				a)
					read -n2 -p "Aniversário (dia/mes/ano): " dia
					read -n2 -p "/" mes
					read -n4 -p "/" ano
					dados="$ano/$mes/$dia"
		            echo 
		            checa_data "$dados" || { echo "ERRO: Data de aniversário inválida";Agenda; }
                    $sql_user "update $agenda_tabela set aniversario = '${dados}' where nome = '${n}'" $agenda_DB ;;
				*) ;;
			esac
			Agenda contatos ;;
		d) 
			Titulo;
			echo -e "${ctm} \n Apagar contato : ${dlc}";
			echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
			echo -ne "${ctr} Procura : ${dlc}"; read n
   			$sql_user "select * from $agenda_tabela where nome like '%${n}%'" $agenda_DB
            echo -ne "${ctr} Contato : ${dlc}"; read n
			$sql_user "select * from $agenda_tabela where nome = '${n}'" $agenda_DB
            echo -ne "${ctr} Certeza para apagar o registro (s/n)? ${dlc}"; read opt
            if [ ${opt} == "s" ] ; then
				$sql_user "delete from $agenda_tabela where nome = '${n}'" $agenda_DB
			else
				Agenda contatos
			fi 
			#DeletaRegistro $nome				
            
			Agenda contatos ;;
		l) 
			Titulo_Inicial; printf "\n\n"; h=$(date '+%m'); a=$(date '+%y'); ./datas $h 20$a
			printf "\n"; e_arrow " Listar tudo."; printf "\n"
			$sql_user "select * from $agenda_tabela \G" $agenda_DB; 
			printf "\n"; e_arrow " Listar tudo, completo.$(e_success)"; printf "\n"
			e_note "Pressione qualquer tecla para retornar a agenda."; read; Agenda contatos ;;
		q)
			Titulo;
			echo -e "${ctm} Procurar contato : ${dlc}";		
			echo -ne "${ctr} Contato:  ${dlc}"; read n
			#SearchRegistro $n
			$sql_user "select * from $agenda_tabela where nome like '%${n}%'" $agenda_DB
			
			echo -ne "${ctm} (s)air menu bob, (i)r para menu agenda : ${dlc}"; read opt
			
			if [ ${opt} == "s" ] ; then
				. 'bob.sh'
			else
				Agenda contatos
			fi 
			;;
		f) 
			Titulo;
			echo -e "${ctm} \n Apagar agenda : ${dlc}";
			echo -e "${cls} ---------------------------------------------------------------------- ${dlc}"
			echo -e "${ctr} Tem certeza que deseja apagar todas as entradas da agenda? (s/n) ${dlc}";
			read confirma
			
			if [ $confirma = "s" -o $confirma = "S" ]; then
				echo
			fi
			Agenda contatos ;;
	esac
}



