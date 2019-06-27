#    

Este repository, contem scripts que juntos formam o sistema    .
Que é um sitema de controle para instalação de programas no sistema linux ubuntu, este nasceu da necessidade
de instalar programas e configurações sempre que instalava o sistema linux (coisas pra fazer), então surgiu o 
prototipo de um script para o auxilio no startup do SO.

# Bob.sh
Este script é o principal todos os outros são auxiliares nas funções.  
O sistema tem uma organização MVC, e um menu quantico, as divisões das funções entre os arquivos segue
este padrão, o controler que é realizado por bob, os modulos lib's e as views que contém o que impresso
na tela.

Eles estão distribuidos como segue.  

1. **Scripts** -  Lista de todos os scripts.  E suas respectivas descrições: 
	* **bob_i** - Inicializa o sistema, instalando algumas depêndencias e fontes além de configurar o `bob`.
	* **/bin/bob** - Sistema de fluxo e controle
	* **/lib/bob_util** - 
	* **/lib/bob_bancodados** - 
	* **/lib/bob_financeiro** - 
	* **/lib/bob_financeiroDB** - 
	* **/lib/bob_instalacao** - 
	* **/lib/bob_lembra** - 
	* **/lib/bob_lembra_montante** - 
	* **/lib/bob_manutencao** - 
	* **/lib/bob_programas** - 
	* **/lib/bob_python** - 
	* **/lib/bob_servidor** - 
	* **/lib/bob_shellfonts** - 
	* **/lib/bob_texto** - 
	* **/lib/bob_util_conf** - 
	* **/lib/bob_util_montante** - 
	* **/lib/bob_cht** - 
	* **/lib/bob_fluxograma** - 
	* **/lib/bob_manutencao** - 

2. **Sistemnas adicionais inseridos em    ** - This script reads a list of additional files and sources them.

# bob_zzfuncao.sh
https://funcoeszz.net/ e https://github.com/funcoeszz/funcoeszz

# cht.sh
http://cht.sh

# datas.sh
https://thobias.org/datas/index.html

