import pystache

str = pystache.render('Hi {{person}}!', {'person': 'Mom'})

print(str)