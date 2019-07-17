import spacy

nlp=spacy.load('pt_core_news_sm')

arq = open(r'arq/trabalho.txt')#, conding = 'utf8')
doc = nlp(arq.read())

#doc = nlp(u'Aqui vai o texto que você pretende extrair entidades.')

print([(entity, entity.label_) for entity in doc.ents])
