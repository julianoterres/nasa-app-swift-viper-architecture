
import UIKit

// MARK: Methods of PhotoListRouter

class PhotoListRouter {
  
  init() {
    
  }
  
  func root() {
    
    if let appDelegate = UIApplication.shared.delegate as? AppDelegate, let window = appDelegate.window {
      let network = Network()
      let worker = PhotoListWorker(network: network)
      let interactor = PhotoListInteractor(worker: worker)
      let presenter = PhotoListPresenter(interactor: interactor)
      let viewController = PhotoListViewController(presenter: presenter)
      let navigationController = UINavigationController()
      navigationController.viewControllers = [viewController]      
      window.rootViewController = navigationController
      window.makeKeyAndVisible()
    }
    
  }
  
}
