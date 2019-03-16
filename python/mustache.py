import pystache

def getRenderedTemplate(template,hash):
    str = pystache.render(template, hash)
    print(str)