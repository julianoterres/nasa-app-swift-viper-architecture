
import UIKit

// MARK: Methods of PhotoDetailRouter

class PhotoDetailRouter: PhotoDetailRouterWireframe {
  
  weak var viewController: UIViewController?
  
  func build() -> UIViewController {
    let viewController = PhotoDetailViewController()
    return viewController
  }
  
}

