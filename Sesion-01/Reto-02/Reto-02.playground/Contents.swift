
import Foundation

enum CharacterType {
  case Mario
  case Luigi
}

protocol Damage {
  mutating func receivedDamage()
}

protocol Lifes: Damage {
  var numberLifes: Int { get set }
  mutating func receivedDamage()
}
extension Lifes {
  mutating func receivedDamage() {
    numberLifes = 0
  }
}

// Mario
protocol MarioLifes: Lifes {
  var type: CharacterType { get }
}
extension MarioLifes {
  var type: CharacterType {
    .Mario
  }
}

// Luigi
protocol LuigiLifes: Lifes {
  var type: CharacterType { get }
}
extension LuigiLifes {
  var type: CharacterType {
    .Luigi
  }
}

// Implementation
enum Mario: MarioLifes {
  var numberLifes: Int {
    get {
      return 8
    }
    set {}
  }
}

enum Luigi: LuigiLifes {
  var numberLifes: Int {
    get {
      return 2
    }
    set {}
  }
}
