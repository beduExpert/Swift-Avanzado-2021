`Desarrollo Mobile` > `Swift Avanzado`

## Integración Alamofire con App galeria/fotos

### OBJETIVO

- En la vista principal, alimentar el CollectionView con fotos descargadas de internet mediante peticiones `GET`.

#### REQUISITOS

1. Xcode 11
2. Proyecto de App que permita tomar fotos.

#### DESARROLLO

1.- Tener funcionando la última versión del proyecto de la App.

2.- Agregar la configuración de `AppTransportSecurity` para poder integrar peticiones HTTP.

3.- Crear una capa de DataManager que se encargue de las peticiones.

4.- Con el patrón delegate enviar la respuesta del servicio a la vista principal.

