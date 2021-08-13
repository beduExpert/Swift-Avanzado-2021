
import UIKit

protocol RequestImages {}
struct ImageProvider: RequestImages {
  fileprivate let downloadQueue =
    DispatchQueue(label: "com.bedu.download.images", qos: DispatchQoS.background)
  
  //MARK: - Fetch image from URL and Images cache
  func loadImages(from url: URL, completion: @escaping (_ image: UIImage) -> Void) {
    downloadQueue.async(execute: { () -> Void in
      do{
        let data = try Data(contentsOf: url)
        if let image = UIImage(data: data) {
          DispatchQueue.main.async { completion(image) }
        } else { print("Could not decode image") }
      }catch { print("Could not load URL: \(url): \(error)") }
    })
  }
}


//extension RequestImages where Self == ImageProvider{
//  func requestImage(from url: URL, completion: @escaping (_ image: UIImage) -> Void){
//    //calling here another function and returning data completion
//    loadImages(from: url, completion: completion)
//  }
//}
