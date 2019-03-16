import pystache

def getRenderedTemplate(template,hash):
    str = pystache.render(template, hash)
    print(str)


template = "Hello {{person}}!"

hash = {
    "person" : "world"
}

getRenderedTemplate(template,hash)