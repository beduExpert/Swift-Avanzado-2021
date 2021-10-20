`Desarrollo Mobile` > `Swift Avanzado`


## Reto numero 3 - Quizz

### Objetivo: Integrar los conceptos aprendidos de metodos mutating en Enum, struct y protocolos.

###Requisistos 
Xcode 12.3

###Desarrollo.

En base al proyecto que se proporciona desarrollar un quizz que permita elegir de entre 3 posibles opciones.

En este proyecto se proporcionan una arquitectura MVC, con una parte de desarrollo, se espera el alumno concluya el proyecto desarrollando las funcionalidades y metodos que cumplan con los siguientes puntos.


Modelo de Datos

Desarrollar los siguientes metodos:

getScore() : permite obtener el score.
nextQuestion() permite obtener la siguiente pregunta.
checkAnswer() permite validar si la pregunta es correcta o no.

getQuestionText() permite obtener el texto de la pregunta.
getAnswers()  obtener las respuestas
getProgress() obtener el progeso  la formula seria numeroPregunta/ totalPreguntas

ViewController

En las acciones del boton answerButtonPressed realizar los siguientes puntos.

Validar cuando el usuario selecciona la respuesta correcta y cambiar el color del boton de las opciones.

en el metodo updateUI()

Colocar en los botones correspondientes cada una de las preguntas.
Colocar el score en la etiqueta correspondiente.

