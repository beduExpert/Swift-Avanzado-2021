//
//  ViewController.swift
//  Ejemplo01
//
//  Created by Arlen Peña on 30/11/21.
//

import UIKit

class ViewController: UIViewController {
    var names: [String] = []
    
    @IBAction func Agregar(_ sender: Any) {
        print("Entro")
        
        let alert = UIAlertController(title: "Nombre",
                                        message: "Agregar una nueva persona",
                                        preferredStyle: .alert)
        
        let saveAction2 = UIAlertAction(title: "save", style: .default) { resp in
            
            guard let textField = alert.textFields?.first,
              let nameToSave = textField.text else { return }
            self.names.append(nameToSave)
            self.myList.reloadData()
        }
          let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
          alert.addTextField()
          alert.addAction(saveAction2)
          alert.addAction(cancelAction)
          present(alert, animated: true)
            
        
    }
    @IBOutlet weak var myList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mi lista"
        myList.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        myList.dataSource = self
    }
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = names[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    
}
