
import UIKit

// MARK: Methods of PhotoDetailRouter

class PhotoDetailRouter: PhotoDetailRouterWireframe {
  
  weak var viewController: UIViewController?
  
  func build(photo: PhotoView) -> UIViewController {
    let viewController = PhotoDetailViewController()
    viewController.photo = photo
    return viewController
  }
  
}

