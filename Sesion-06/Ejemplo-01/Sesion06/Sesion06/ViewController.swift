//
//  ViewController.swift
//  Sesion06
//
//  Created by Ivan Alejandro Hernandez Sanchez on 12/11/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var data = [SongModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        getData()
    }

    func getData() {
        RestServiceManager.shared.GoToInfo(responseType: [SongModel].self, method: .get, endpoint: "songs") { status, data in
            if let dataResponse = data {
                self.data = dataResponse
                self.tableView.reloadData()
            }
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SongsViewCell else { return SongsViewCell() }
        
        let item = data[indexPath.row]
        
        cell.songLabel.text = item.name
        cell.artistLabel.text = item.artist
        cell.genderLabel.text = item.genre
        cell.durationLabel.text = ""
        
        return cell
    }
    
}

