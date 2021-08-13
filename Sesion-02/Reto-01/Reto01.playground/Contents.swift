import UIKit

protocol ProtocolName {
    func doSomething()
}
extension ProtocolName where Self: UIViewController {
    func blah() {
        print("Blah")
    }
}

class ViewController : UIViewController, ProtocolName {
    func doSomething() {
        print("Do Something");
    }
}

class MyClass: NSObject, ProtocolName {
    func doSomething() {
        print("Do Something");
    }
}

let m: MyClass = MyClass()
m.doSomething()
