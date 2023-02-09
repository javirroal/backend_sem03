from flask import Flask, request
from flask_cors import CORS

# Si el archivo es el archivo principal del proyecto su valor de la variable __name__ sera '__main__' caso contrario sera None (vacio)
app = Flask(__name__)

# ahora configuramos nuestros CORS (Control de acceso de Recursos cruzados)
# origins = '*'
# methods = '*'
CORS(app=app, origins=['http://127.0.0.1:5500'], methods=['GET', 'POST'])

# patron de diseno de software (Singleton)
usuarios = [
    {
        'nombre': 'Eduardo',
        'apellido': 'Juarez'
    },
    {
        'nombre': 'Juana',
        'apellido': 'Rodriguez'
    },
    {
        'nombre': 'Roberto',
        'apellido': 'Williams'
    }
]

# un decorador se usa con el '@' y sirve para poder modificar ciertos metodos de una clase, sin la necesidad de modificar el funcionamiento natural (es una modificacion parcial)
# luego de utilizar el decorador se crea una funcion que sera la nueva funcionalidad de ese metodo
@app.route('/')
def inicio():
    return 'Hola desde mi servidor de Flaskkkkkk'


# ENDPOINT (punto final) declaracion de la finalizacion de la URL que indicara que accion se debe de realizar
@app.route('/mostrar-hora', methods=['GET', 'POST'])
def mostrarHora():
    # El request solo se puede ejecutar dentro de un controlador -> como concepto se usa para darnos la informacion que viene desde el cliente
    # CONTROLLER (controlador) -> es la funcionabilidad que se realizara dentro de un determinado endpoint
    print(request.method)
    if request.method == 'GET':
        return {
            'content': 'Me hiciste GET'
        }
    elif request.method == 'POST':
        return {
            'content': 'Me hiciste POST'
        }
    # esta parte del codigo sera inaccesible ya que los metodos para acceder siempre seran GET o POST definidos mas arriba
    # no se suele retornar strings (cadena de texto) sino que se utiliza diccionarios
    return {
        'content': '22:50:15'
    }

@app.route('/usuarios', methods=['GET', 'POST'])
def gestionUsuario():
    if request.method == 'GET':
        # devolvemos los usuarios
        return {
            'message': 'Los usuarios son',
            'content': usuarios
        }
    elif request.method == 'POST':
        # agregar un nuevo usuario
        # request.data -> mostrara la informacion previamente del body en formato bytes
        # request.json() -> convierte el body entrante en un diccionario
        print(request.get_json())
        data = request.get_json()
        usuarios.append(data)
        return {
            'message':'Usuario agregado exitosamente'
        }


# debug > cada vez que modifiquemos algun archivo del proyecto y guardamos,, se reiniciara el servidor
app.run(debug=True)