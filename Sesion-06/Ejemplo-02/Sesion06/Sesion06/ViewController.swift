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
        
        return cell
    }
}
