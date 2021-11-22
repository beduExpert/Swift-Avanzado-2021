
`Desarrollo Mobile` > `Swift Avanzado`

## Mapear respuestas con AlamoFire

### OBJETIVO

- Aprendera a generar los modelos aptor para el mapeo con Alamofire

#### REQUISITOS

1. xCode

#### DESARROLLO

Desarrollar un proyecto nuevo
Descargar Alamofire
Generar modelos
Mapear la respuesta de servicio

<details>

        Solucion
        
        Con el proyecto nuevo obtendremos la respuesta de un json para mapearlo con nuestro modelo
        La URL del json es:
        https://gist.githubusercontent.com/richimf/0d18f9ba3e028fca677b39949fd92185/raw/c9b355b816864d3aa79bcacb93493a6608d841b8/file.json
        Imprimiremos en consola el resultado
        
        Nuestro modelo tendra esta estructura:
        
        ```
        import Foundation
        import ObjectMapper

        struct User: Mappable {

          var firstName: String?
          var lastName :String?
          var age: Int?
          var address: Address?

          init?(map: Map) {}

          mutating func mapping(map: Map) {
            self.firstName <- map["firstName"]
            self.lastName  <- map["lastName"]
            self.age       <- map["age"]
            self.address   <- map["address"]
          }
        }

        struct Address: Mappable {

          var streetAddress: String?
          var city: String?
          var state: String?
          var postalCode: Int?

          init?(map: Map) {}

          mutating func mapping(map: Map) {
            self.streetAddress <- map["streetAddress"]
            self.city  <- map["city"]
            self.state <- map["state"]
            self.postalCode <- map["postalCode"]
          }
        }
        ```
</details>



