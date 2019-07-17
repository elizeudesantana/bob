#-*- coding: utf-8 -*-

from chatterbot.trainers import ListTrainer
from chatterbot import ChatBot
import os


bot = ChatBot('Bob')#, read_only=True)

#bot.set_trainer(ListTrainer)
trainer = ListTrainer(bot)
for arq in os.listdir('arq'):
	chats = open ('arq/' + arq, 'r').readlines()
	trainer.train(chats)

while True:
	resq = input('Você: ')

	resp = bot.get_response(resq)
     if float(resposta.confidence) > 0.5:
    	print('Bot: ' + str(resp))
     else:
         print('Bot: Ainda não sei responder esta pergunta.')
	

#conversa = ['Oi', 'Olá', 'Tudo bem?', 'Tudo ótimo', 'Você gosta de programar?', 'Sim, eu programo em Python']


#trainer.train(conversa)

# Treino baseado no corpus em Portugues 
#trainer.train("chatterbot.corpus.Portuguese")
# Treino baseado no corpus de saudações em Português
#trainer.train("chatterbot.corpus.Portuguese.greetings_pt-BR")
# Train based on the english conversations corpus
# Treino baseado no corpus de conversação em Português
#trainer.train("chatterbot.corpus.Portuguese.conversations_pt-BR")

# while True:
#     pergunta = input("Usuário: ")
#     resposta = bot.get_response(pergunta)
#     if float(resposta.confidence) > 0.5:
#         print('TW Bot: ', resposta)
#     else:
#         print('TW Bot: Ainda não sei responder esta pergunta')