import string

texto = input('Introduzca texto: ')
abc = string.ascii_letters
num = string.digits
car = string.punctuation
palabras = texto.split()
numero = 0
pal = 0
comp = 0
caract = 0
for x in palabras:
    a = False
    b = False
    c = False
    for y in x:
        if y in abc:
            a = True
        if y in num:
            b = True
        if y in car:
            c = True
    if a and b and c == False:
        print(x,', Es una palabra compuesta')
        comp += 1
    if a and b == False and c == False:
        print(x,', Es un palabra')
        pal += 1
    if b and a == False and c == False:
        print(x,', Es un numero')
        numero += 1
    if a and b and c:
        print(x,', Es una palabra compuesta con caracteres especiales')
        comp += 1
    if b and c and a == False :
        print(x,', Es un numero con caracteres especiales')
        comp += 1
    if b == False and c and a == False :
        print(x,', Es un caracter especial')
        caract += 1
    if b == False and c and a:
        print(x,', Es una palabra con caracter especial')
        comp += 1

print (numero,'- Numeros,', pal,'- Palabras,', comp, '- Palabras Compuestas,', caract, '- Caracteres especiales.')
