import UIKit

protocol MarioLifes {
  var numberLifes: Int { get set }
  mutating func receivedDamage()
}
extension MarioLifes {
  mutating func receivedDamage() {
    numberLifes = 0
  }
}
enum Mario: MarioLifes {
  var numberLifes: Int {
    get {
      return 5
    }
    set {}
  }
}
