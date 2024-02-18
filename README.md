# cryptocurrecy-app

Esta aplicacion es desarrollada con flutter version 3.19.0 , canal  estable , version de dart 3.3.0

## Requerimientos funcionales 

Pantalla 0: Inicio de sesión con correo y contraseña.
usuarios para ingresar.

crypto@test.com - 123456
crypto1@test.com - 123456

Pantalla 1: Listado de criptomonedas , posee opción de ordenar ascendente o descendente, en la parte superior un campo de entrada de texto para filtrar por coincidencias, a su vez se observa el estado de comparación,
en esta opción se puden haber tres estados (por comparar, comparando , comparar con), ademas se puede presionar el icono de estrella para guardar la criptomoneda como favorita.
Pantalla 2: Listado de cryptomonedas guardadas como favoritas.
Pantalla 3: Comparación de criptomonedas elegidas en la pantalla 1.

(https://drive.google.com/file/d/1cyk9J1fFjWEW7iGyM5EDPfnK5D5OmDTJ/view?usp=sharing)

## Requerimientos no funcionales 

El app fue codificada teniendo en cuenta requerimientos no funcionales como testeabilidad, mantenibilidad y escalabilidad, usando clean architecture. 
Se dividen las pantallas por features con sus respetivos nombres representativos.

![Screenshot 2024-02-18 at 5 01 31 PM](https://github.com/davidC1991/cryptocurrency/assets/41081349/31b9f892-05c0-478c-aabd-bc854825fee6)

En la anterior imagen se observa la ilustración de la arquitecura usada en cada modulo. Fuente de la imagen: https://medium.com/@flutterdynasty/solid-principles-in-flutter-b868fb5ef60e

Manejador de estado: flutter bloc
Patrones de diseño implementados: bloc, repository, singleton, observable.

Package usados:

| Paquete              | Versión           |
|----------------------|-------------------|
| get_it               | ^7.1.3            |
| dartz                | ^0.10.0-nullsafety.2 |
| equatable           | ^2.0.2            |
| http                 | ^0.13.3           |
| bloc                 | ^8.1.1            |
| flutter_bloc         | ^8.1.4            |
| fluttertoast         | ^8.0.8            |
| phosphor_flutter     | ^2.0.1            |
| debounce_throttle    | ^2.0.0            |
| cloud_firestore     | ^4.13.6           |
| firebase_auth        | ^4.16.0           |
| firebase_core        | ^2.24.2           |
| mocktail             | ^1.0.3            |
| bloc_test            | ^9.1.3            |
| test                 | ^1.16.6           |

Se realiza las pruebas unitarias de las siguiente capas del feature cryptocurrencies (Pantalla del listado de cryptomonedas):
1. data
2. dominio
3. presentacion
   bloc
   widget testing (home_screen)

       



