from camelcase import CamelCase

instancia = CamelCase()

texto = 'hola yo deberia estar aca'

resultado = instancia.hump(texto)

print(resultado)