//
//  ViewController.swift
//  Sesion2
//
//  Created by Ivan Alejandro Hernandez Sanchez on 25/10/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var data = [MyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.FillData()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    func FillData() {
        self.data.append(MyObject(image: "1", text1: "Titulo 1", text2: "Subtitulo 1"))
        self.data.append(MyObject(image: "2", text1: "Titulo 2", text2: "Subtitulo 2"))
        self.data.append(MyObject(image: "3", text1: "Titulo 3", text2: "Subtitulo 3"))

        self.tableView.reloadData()

    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyTableViewCell else {return UITableViewCell()}
        cell.texto1.text = data[indexPath.row].text1
        cell.texto2.text = data[indexPath.row].text2
        cell.imagen.image = UIImage(named: data[indexPath.row].image)

        return cell
    }
}

struct MyObject {
    var image:String
    var text1:String
    var text2:String
}
