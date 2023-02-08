from flask import Flask

# Si el archivo es el archivo principal del proyecto su valor de la variable __name__ sera '__main__' caso contrario sera None (vacio)
app = Flask(__name__)
# patron de diseno de software (Singleton)

# un decorador se usa con el '@' y sirve para poder modificar ciertos metodos de una clase, sin la necesidad de modificar el funcionamiento natural (es una modificacion parcial)
# luego de utilizar el decorador se crea una funcion que sera la nueva funcionalidad de ese metodo
@app.route('/')
def inicio():
    return 'Hola desde mi servidor de Flaskkkkkk'



# debug > cada vez que modifiquemos algun archivo del proyecto y guardamos,, se reiniciara el servidor
app.run(debug=True)