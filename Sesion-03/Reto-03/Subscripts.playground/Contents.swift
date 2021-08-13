
enum Currency {
  case MXN
  case USD
}
extension Currency {
  subscript(key: String) -> String? {
    if key == "Mexico" {
      return "Pesos Mexicanos MXN"
    }
    if key == "Dolares" {
      return "US Dolars"
    }
    return nil
  }
}

var c = Currency.MXN
c["Mexico"]




