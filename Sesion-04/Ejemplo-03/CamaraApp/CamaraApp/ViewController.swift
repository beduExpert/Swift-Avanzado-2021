//
//  1.- Creamos una session con AVCaptureSession().
//
//  2.- Creamos una instancia de AVCapturePhotoOutput().
//
//  3.- Agregamos a la sesión el output mediante la función addOutput().
//
//  4.- Creamos un commit de la sesión mediante commitConfiguration().
//
//  5.- La acción de tomar foto se ejecuta en un DispatchQueue.
//
//  6.- Por último, la foto tomada será recibida como tipo Data en funciones Delegate.
//
import UIKit
import AVFoundation
import Photos

class ViewController: UIViewController {
  
  @IBOutlet private weak var previewView: PreviewView!
  
  private let session = AVCaptureSession()
  private let sessionQueue = DispatchQueue(label: "com.bedu.photo")
  private let photoOutput = AVCapturePhotoOutput()
  private var photoData: Data?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    previewView.session = session
    
    sessionQueue.async {
      self.configureSession()
      self.session.startRunning()
    }
  }
  
  private func configureSession() {
    session.beginConfiguration()
    
    // Add video input.
    do {
      let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
      let videoDeviceInput = try AVCaptureDeviceInput(device: videoDevice!)
      session.addInput(videoDeviceInput)
    }
    catch {
      print("Couldn't create video device input: \(error)")
      session.commitConfiguration()
      return
    }
    
    // Add photo output.
    session.addOutput(photoOutput)
    session.commitConfiguration()
  }
  
  @IBAction private func capturePhoto(_ photoButton: UIButton) {
    self.sessionQueue.async {
      self.photoOutput.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
    }
  }
}

extension ViewController: AVCapturePhotoCaptureDelegate{
  func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
    if let error = error {
      print("Error capturing photo: \(error)")
    } else {
      photoData = photo.fileDataRepresentation()
    }
  }

//  func photoOutput(_ output: AVCapturePhotoOutput, didFinishCaptureFor resolvedSettings: AVCaptureResolvedPhotoSettings, error: Error?) {
//    if let error = error {
//      print("Error capturing photo: \(error)")
//      return
//    }
//
//    guard let photoData = photoData else {
//      print("No photo data resource")
//      return
//    }
//
//    PHPhotoLibrary.requestAuthorization { status in
//      if status == .authorized {
//        PHPhotoLibrary.shared().performChanges({
//          let options = PHAssetResourceCreationOptions()
//          let creationRequest = PHAssetCreationRequest.forAsset()
//          creationRequest.addResource(with: .photo, data: photoData, options: options)
//
//        }, completionHandler: { _, error in
//          if let error = error {
//            print("Error occurred while saving photo to photo library: \(error)")
//          }
//        })
//      }
//    }
//  }
}

