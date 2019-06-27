
# bob (   )
> Este repository, contem scripts que juntos formam o sistema    .
Que é um sitema de controle para instalação de programas no sistema linux ubuntu, este nasceu da necessidade
de instalar programas e configurações sempre que instalava o sistema linux (coisas pra fazer), então surgiu o 
prototipo de um script para o auxilio no startup do SO.

[![NPM Version][npm-image]][npm-url]
[![Build Status][travis-image]][travis-url]
[![Downloads Stats][npm-downloads]][npm-url]


Correndo ./bob_i.sh

[![bob_i][/img/1.gif]]

# Bob.sh
Este script é o principal todos os outros são auxiliares nas funções.  
O sistema tem uma organização MVC, e um menu quantico, as divisões das funções entre os arquivos segue
este padrão, o controler que é realizado por bob, os modulos lib's e as views que contém o que impresso
na tela.

![bob](/img/2.gif)

Os scripts estão distribuidos como segue.  

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

2. **Sistemnas adicionais inseridos em    ** - credits.

### bob_zzfuncao.sh
[funcoeszz](https://funcoeszz.net/)

### cht.sh
[cht.sh](http://cht.sh)

### datas.sh
[datas](https://thobias.org/datas/index.html)

## Installation

OS X & Linux:

```sh
cd ~ && mkdir bob && cd bob
clone https://github.com/elizeudesantana/bob.git tmp && mv tmp/.git . && rm -fr tmp && git reset --hard
```

## Exemplo de uso

Implemnetar

_Para mais exemplos, consulte a [Wiki][wiki]._ 

## Configuração para Desenvolvimento

Testes e Debug sendo codificado.

```sh
Em andamento
```

## Histórico de lançamentos

* 2019.01
	* Versão do sistema
* 1.0.0
    * Versão dos scripts

## Meta

Elizeu de Santana – [@elizeudesantan1](https://twitter.com/@elizeudesantan1) – elizeudesantana@hotmail.com

Distribuído sob a licença MIT. Veja `LICENSE` para mais informações.

[https://github.com/elizeudesantana/bob](https://github.com/elizeudesantana/bob)

## Contributing

1. Faça o _fork_ do projeto (<https://github.com/yourname/yourproject/fork>)
2. Crie uma _branch_ para sua modificação (`git checkout -b feature/fooBar`)
3. Faça o _commit_ (`git commit -am 'Add some fooBar'`)
4. _Push_ (`git push origin feature/fooBar`)
5. Crie um novo _Pull Request_

[npm-image]: https://img.shields.io/npm/v/datadog-metrics.svg?style=flat-square
[npm-url]: https://npmjs.org/package/datadog-metrics
[npm-downloads]: https://img.shields.io/npm/dm/datadog-metrics.svg?style=flat-square
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[wiki]: https://github.com/seunome/seuprojeto/wiki