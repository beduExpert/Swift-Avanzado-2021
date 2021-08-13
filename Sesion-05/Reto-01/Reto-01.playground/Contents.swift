
import UIKit

protocol RequestImages {}
struct ImageProvider: RequestImages {
  fileprivate let downloadQueue =
    DispatchQueue(label: "com.bedu.download.images", qos: DispatchQoS.background)
  
  //MARK: - Fetch image from URL and Images cache
  func loadImages(from url: URL, completion: (_ image: UIImage) -> Void) {
    downloadQueue.async(execute: {})
  }
}
