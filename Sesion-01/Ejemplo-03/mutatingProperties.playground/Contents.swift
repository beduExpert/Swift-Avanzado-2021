import UIKit

struct Counter {
  private var value: Int
  private(set) var valueReadCount = 0
  private(set) var valueWriteCount = 0
  
  var debugDescription: String {
    return ("value: \(value) es leido \(valueReadCount) veces y escrito \(valueWriteCount) veces.")
  }

  var val : Int {
    mutating get {
      valueReadCount += 1
      return value
    }
    set {
      valueWriteCount += 1
      value = newValue
    }
  }
  
  init(value: Int) {
    self.value = value
  }
}

var counter = Counter.init(value: 5)
counter.val
print(counter.debugDescription)
counter.val = 10
print(counter.debugDescription)
