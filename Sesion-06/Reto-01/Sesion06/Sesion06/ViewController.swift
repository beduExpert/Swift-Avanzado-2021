//
//  ViewController.swift
//  Sesion06
//
//  Created by Ivan Alejandro Hernandez Sanchez on 12/11/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var usersData = [UserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        getData()
    }
    
    @IBAction func createAction(_ sender: UIButton) {
        performSegue(withIdentifier: "createUserSegue", sender: nil)
    }
    
    

    func getData() {
        RestServiceManager.shared.GoToInfo(responseType: GenericUserResponseModel.self, method: .get, endpoint: "users") { status, data in
            if let response = data, let dataResponse = response.data {
                self.usersData = dataResponse
                self.tableView.reloadData()
            }
        }
    }
    
    func deleteData(idUser:Int) {
        RestServiceManager.shared.GoToInfo(responseType: GenericUserResponseModel.self, method: .delete, endpoint: "users/\(idUser)") { status, data in
            if let response = data, let dataResponse = response.data {
                self.usersData = dataResponse
                self.tableView.reloadData()
                
            }
            self.getData()
        }
        
        
    }

    fileprivate func ShowAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

        self.present(alert, animated: true)
    }

    //MARK: - TABLEVIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.usersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SongsViewCell else { return SongsViewCell() }
        
        let item = usersData[indexPath.row]
        
        cell.nameLabel.text = item.name
        cell.mailLabel.text = item.email
        cell.genderLabel.text = item.gender
        cell.statusLabel.text = item.status
        

        let showInfo = UIAction(title: "Info", image: UIImage(systemName: "tray.and.arrow.down.fill")) { (action) in
            self.ShowAlert(title: "Info", message: "Name: \(item.name ?? "") \nMail: \(item.email ?? "")")
        }

        let deleteItem = UIAction(title: "Delete", image: UIImage(systemName: "delete.left.fill")) { (action) in
            self.deleteData(idUser: item.id ?? 0)
        }
                
        let menu = UIMenu(title: "Menu", options: .displayInline, children: [showInfo, deleteItem])
                
        cell.actionButton.menu = menu
        cell.actionButton.showsMenuAsPrimaryAction = true
        
        return cell
    }
}
