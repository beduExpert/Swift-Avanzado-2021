//
//  ViewController.swift
//  AlamofireImageDownload
//
//  Copyright © 2020 Bedu. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
  
  
  @IBOutlet weak var imageView: UIImageView!
  
  var download: DownloadRequest?
  var resumeData: Data!
  var showedAlert = false
  
  let url = "https://github.com/beduExpert/C1-Swift-Avanzado/blob/master/Sesion-06/Reto-02/foto.jpg?raw=true"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    downloadImage()
    // Do any additional setup after loading the view.
  }
  
  func downloadImage() {
    self.download = AF.download(url).responseData { response in
      if let data = response.value {
        self.imageView.image = UIImage(data: data)
      }
    }
    .downloadProgress { progress in
      let prog = 100*progress.fractionCompleted
      if prog >= 50 {
        self.pause()
        self.showAlert()
        self.showedAlert = true
      }
      print("Download Progress: \(prog)")
    }
  }
  
  func pause() {
    self.download?.cancel { data in
      self.resumeData = data
    }
  }
  
  func resumeDownload() {
    AF.download(resumingWith: resumeData).responseData { response in
      if let data = response.value {
        self.imageView.image = UIImage(data: data)
      }
    }.downloadProgress { progress in
      let prog = 100*progress.fractionCompleted
      print("Continue Download Progress: \(prog)")
    }
  }
  
  func showAlert() {
    let alert = UIAlertController(title: "Downloading...", message: "La descarga va a un 50%, continuar?", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
      switch action.style{
      case .default:
        print("default")
        self.resumeDownload()
      case .cancel:
        print("cancel")
      case .destructive:
        print("destructive")
      }}
    ))
    self.present(alert, animated: true, completion: nil)
  }
}

