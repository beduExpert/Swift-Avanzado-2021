protocol MarioLifes {
  var numberLifes: Int { get }
  mutating func receivedDamage()
  mutating func incrementLife()
}

enum Mario: MarioLifes {
  case dead
  case alive(numberOfLifes: Int)
  
  var numberLifes: Int {
    switch self {
    case .dead: return 0
    case let .alive(numberLifes): return numberLifes
    }
  }
  
  mutating func receivedDamage() {
    switch self {
    case .dead:
      self = .alive(numberOfLifes:0)
    case let .alive(numberOfLifes):
      if numberOfLifes <= 0 {
        self = .dead
      } else {
        self = .alive(numberOfLifes: numberLifes - 1)
      }
    }
  }
  
  mutating func incrementLife() {
    self = .alive(numberOfLifes: numberLifes + 1)
  }
}

var mario = Mario.alive(numberOfLifes: 2)
mario.numberLifes
mario.receivedDamage()
mario.numberLifes
mario.receivedDamage()
mario.numberLifes
mario.receivedDamage()
mario.receivedDamage()
mario.receivedDamage()
print(mario.numberLifes)
mario.incrementLife()
print(mario.numberLifes)
