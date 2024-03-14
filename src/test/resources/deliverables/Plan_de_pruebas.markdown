# AUTOMATIZACIÓN DE PRUEBAS A SERVICIOS WEB - RESTFUL - BOOKER

### 📄 Contexto:
RestFul Booker, es una API que puede utilizar para obtener más información sobre API Testing o probar
herramientas de API Testing. RestFul-Booker contiene end-points que permiten Crear, Leer, Actualizar y
Eliminar reservas. El API REST viene con funciones de autenticación y errores para que pueda explorar.
La API viene precargada con 10 registros para que pueda trabajar y se restablece cada 10 minutos a ese
estado predeterminado.

### 🚩 Problemática:
Actualmente en la aplicación de reservas RESTFUL - BOOKER se están detectando diferentes errores
funcionales a nivel de la GUI, pero al detectarlos en este nivel no se puede dar feedback temprano a los
desarrolladores. Por lo que se requiere que se automaticen pruebas a nivel de integración, por eso se
requiere implementar pruebas automatizadas a los servicios web.

### 💡 Solución:
Con el objetivo de identificar y abordar de forma precoz los distintos fallos funcionales 
en la interfaz gráfica de usuario de la aplicación, se sugiere la implementación de conjuntos de pruebas automatizadas 
enfocadas en la integración de los servicios web utilizados. Esto facilitará la evaluación periódica y eficiente de la API. 
Lo que permitira detectar la mayor parte de los errores durante la etapa de desarrollo.

***
# ✅ PLAN DE PRUEBAS FUNCIONAL
(NIVEL API TESTING)

### RESUMEN

> **FEATURE TEST PLAN**: | Restful - Booking | Crear, modificar, actualizar y eliminar reservas del sistema.
>
>*Como usuario de booking logueado,  
Quiero crear, consultar, actualizar y eliminar reservas  
Para agendar mis próximos viajes*

* El Plan de pruebas se llevará a cabo a nivel de **Pruebas de integración**.
* El Plan de pruebas se llevará a cabo en **Postman** de manera manual por medio de una collection.
* El Plan de pruebas se llevará a cabo con **Karate** para la automatizacion de apis, **cucumber** como herramienta de desarrollo BDD y **Java** como lenguaje de programación

### OBJETIVO
Validar las funcionalidades básicas que puede realizar un usuario con una reserva (Auth, Booking y Ping), usando cucumber como lenguaje BDD en y Karate para automatizar el proceso.

### SUPUESTOS
* La api se encuentra siempre en funcionamiento.
* Acceso a la página web donde está la documentación de la API.
* Herramientas de pruebas como IDE (Intellij Idea, Visual Studio Code, etc) y Postman correctamente instalados y configurados.
* Conocimientos en API Testing.

### COBERTURA
* Capacidad de alcanzar las funcionalidades de Auth, Booking y Ping.
* No obstante, se podrá realizar pruebas adicionales en caso de tener ventaja para validar más funciones.
* Seguir las reglas de negocio sobre la creación, consulta, actualización y eliminación de las reservas.
* Contemplar mínimo un **_HAPPY PATH_** y **_UNHAPPY PATH_** por método HTTP (GET,POST,PUT,DELETE).
* No se validarán los escenarios que no fueron contemplados en los flujos a probar.

### RIESGOS
| Riesgo                                                  | Mitigación                                                                                                  |
|:--------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| No conocer el funcionamiento o arquitectura de la API   | Ir a la documentación oficial de [RESTFUL - BOOKER](https://restful-booker.herokuapp.com/apidoc/index.html) |
| No se puede generar el TOKEN de autenticación de la API | Utilizar el mock de Authorization descrito en la documentación                                              |
| QA Environment está caído                               | Usar el recurso **/ping** para validar cuando la api esté UP.                                                   |
***
### RECURSOS
* **Postman**: como herramienta de apoyo para hacer pruebas de los recursos de la API.
* **Karate**: Framework principal para realizar la automatización de los scripts de pruebas.
* **Plan de pruebas**: Documento para la planificación de las pruebas.
* **Documentación API**: Página web de [RESTFUL - BOOKER](https://restful-booker.herokuapp.com/apidoc/index.html)

### CONFIGURACIÓN DEL AMBIENTE
* Las pruebas se realizaran en el ambiente de **QA**.
* Las pruebas serán ejecutadas con la API de **RESTFUL - BOOKER**.
* Las pruebas seran en la versión **v1.0.0** de **RESTFUL - BOOKER**.
* El endpoint de pruebas será: `https://restful-booker.herokuapp.com`

#### 🔗 API Endpoints
| HTTP Verbs | Endpoints    | Acción                                                                                           |
|------------|--------------|--------------------------------------------------------------------------------------------------|
| POST       | /auth        | Crea un nuevo token de autenticación para acceder a PUT y DELETE                                 |
| GET        | /booking     | Devuelve los id de todas las reservas que existen dentro de la API.                              |
| GET        | /booking/:id | Devuelve una reserva específica basada en la identificación de la reserva proporcionada          |
| POST       | /booking     | Crea una nueva reserva en la API                                                                 |
| GET        | /booking/:id | Actualiza una reserva actual                                                                     |
| PATCH      | /booking/:id | Actualiza una reserva actual con una carga útil parcial                                          |
| DELETE     | /booking/:id | Elimina una reserva actual en la API                                                             |
| GET        | /ping        | Un punto final de verificación de estado simple para confirmar si la API está en funcionamiento. |
***
### NIVELES Y TIPOS DE PRUEBA
**Niveles de pruebas:**
* Pruebas de integración

**Tipos de pruebas:**
* Pruebas funcionales: En este tipo de pruebas vamos a validar las funcionalidades de la API (Ej: códigos de estado)
* Pruebas de integración: Para validar la integración de todos los recursos de la API.

### CONSIDERACIONES DE LAS PRUEBAS
- [ ] Crear una colección en postman que permita realizar pruebas manuales a los servicios web.
- [ ] Automatizar las funcionalidades de: Auth, Booking y Ping.
- [ ] Considerar en la automatización de pruebas los métodos http: POST, GET, PUT, PATCH,
  DELETE.
- [ ] Considerar la creación de escenarios Happy Paths y UnHappy Paths.
- [ ] Considerar en la automatización todas las aserciones posibles.


### FLUJOS A PROBAR (dentro de alcance)

Test diseñados para validar los escenarios **Happy Paths** 😃
***
> **✨ FEATURE**: Verify the creation of a new auth token
> - [x] Verify token with valid username and password
>
> **✨ FEATURE**: Creates a new booking in the AP
> - [x] Create a new booking
> - [x] Create a new booking without name
> - [x] Create a new booking without lastname
> - [x] Create a new booking without price
> - [x] Create a new booking without checkin
> - [x] Create a new booking without checkout
>
> **✨ FEATURE**: Returns a specific booking based upon the booking id provided
> - [x] Returns booking by valid ID
> - [x] Verify that doesn't return booking if ID not exist
>
> **✨ FEATURE**: Returns the ids of all the bookings that exist
> - [x] Returns booking by name
> - [x] Returns booking by date
>
> **✨ FEATURE**: Updates a current booking
> - [x] Update a current booking
> - [x] Update id not exist
>
> **✨ FEATURE**: Updates a current booking with a partial payload
> - [x] Update only name of current booking
>
> **✨ FEATURE**: Delete a current booking
> - [x] Delete a current booking

***
Test diseñados para validar los escenarios **UNHappy Paths** 🤡

> **✨ FEATURE**: Verify the creation with incorrect credentials
> - [x] Verify token with incorrect username
> - [x] Verify token with incorrect password
> - [x] Verify token with empty username
> - [x] Verify token with empty password
> - [x]  Verify token with empty username and password
***

### CRITERIOS DE SALIDA
> ✅ Las pruebas han terminado con los siguientes defectos:
> * Al enviar la solicitud del token sin parametros arroja un codigo 200 cuando en esos cosas deberia ser un 400
> * Permite realizar la creción de una reserva enviandole los campos nombre, apellido o precio vacios y arroja codigo 200 cuando deberia ser un 400


### ENTEGRABLES DE PRUEBAS
> ☑️ Colección en postman, la ruta de su ubicación es: `resources/deliverables/restful_booker.postman_collection.json`  
> ☑️ El plan de pruebas actual, la ruta de su ubicación es: `resources/deliverables/PLAN_DE_PRUEBAS.markdown`  
> ☑️ El informe del resultado de pruebas, la ruta de su ubicación es: `target\cucumber-html-reports`   
> ☑️ El repositorio en GitHub con los scripts desarrollados: [test_restful_booker](https://github.com/FranceCastillo/test_restful_booker)
***

### ❗ INFORMACIÓN ADICIONAL
>*Toda la información relacionada a la estructura del proyecto se especifica en el archivo README.md*
***