import pystache

str = pystache.render('Hello {{person}}!', {'person': 'World'})

print(str)