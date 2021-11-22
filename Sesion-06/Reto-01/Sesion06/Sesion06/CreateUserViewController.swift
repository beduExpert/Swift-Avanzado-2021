//
//  CreateUserViewController.swift
//  Sesion06
//
//  Created by Ivan Alejandro Hernandez Sanchez on 15/11/21.
//

import UIKit

class CreateUserViewController: UIViewController {

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var mailLabel: UITextField!
    @IBOutlet weak var genderLabel: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createAction(_ sender: UIButton) {
        let user = UserModel(name: nameLabel.text, gender: genderLabel.text, email: mailLabel.text, status: "active", id: nil)
        
        RestServiceManager.shared.GoToInfo(responseType: CreateUserResponseModel.self, method: .post, endpoint: "users", body: user) { status, data in
            if let response = data, let _ = response.data {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
