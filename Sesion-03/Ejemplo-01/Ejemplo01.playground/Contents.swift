//: Playground - noun: a place where people can play

import UIKit

class LoginViewController: UIViewController {
    private let notificationCenter = NotificationCenter.default
    override func viewDidLoad() {
        super.viewDidLoad()
        //PASO 1.- Agregamos la notificación
        notificationCenter
            .addObserver(self,
                         selector:#selector(loginSuccess(_:)),
                         name: NSNotification.Name("com.user.login.success"),
                         object: nil)
    }
    
    //PASO 2.- Generamos la función requerida
    //MARK: - Receive User Details
    @objc func loginSuccess(_ notification: Notification) {
        print(notification.object as? [String: Any] ?? [:])
        print(notification.userInfo as? [String: Any] ?? [:])
        print(notification.userInfo?["userInfo"] as? [String: Any] ?? [:])
    }
   
    //PASO 3.- Generamos la destruccion de la suscripción de nuestra notificación
    //MARK: - Remove Notification
    deinit {
        notificationCenter
            .removeObserver(self,
                            name: NSNotification.Name("com.user.login.success"),
                            object: nil)
    }
}

class LoginManager: NSObject {
    private let notificationCenter = NotificationCenter.default
    
    func loginWith(_ loginDetails: [String: Any]){
        //PASO 4.- Aplicamos el post a nuestra notificación
        let loginResponse = ["userInfo": ["userID": 21, "userName": "Alex"]]
        notificationCenter
            .post(name: NSNotification.Name("com.user.login.success"),
                  object: loginDetails,
                  userInfo: loginResponse
            ) }
}


//PASO 5.- Invocamos el metodo donde se mandará llamar nuestra notificacion y vemos resultado
let ourClass = LoginViewController()
ourClass.viewDidLoad()


let login = LoginManager()
let loginData: [String: Any] = ["userID": 54, "userName": "Ivan"]
login.loginWith(loginData)
