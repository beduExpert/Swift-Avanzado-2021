import UIKit

let handlerBlock: (Bool) -> Void = { value in
  if value {
    print("Condicion se cumple")
  }
}

func functionHandler(completion: (Bool) -> Void) {
  completion(false)
}

functionHandler { (doneWork) in
  if doneWork {
    print("Condición SI se cumple")
  } else {
    print("No...")
  }
}
