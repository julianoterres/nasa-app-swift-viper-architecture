
import UIKit

// MARK: Methods of PhotoListRouter

class PhotoListRouter: PhotoListRouterWireframe {
  
  weak var viewController: UIViewController?
  
  func build() -> UIViewController {
    let api = API()
    let network = Network()
    let worker = PhotoListWorker()
    let interactor = PhotoListInteractor()
    let presenter = PhotoListPresenter()
    let router = PhotoListRouter()
    let viewController = PhotoListViewController()
    viewController.presenter = presenter
    router.viewController = viewController
    presenter.viewController = viewController
    presenter.interactor = interactor
    presenter.router = router
    interactor.presenter = presenter
    interactor.worker = worker
    worker.interactor = interactor
    worker.network = network
    worker.api = api
    worker.network?.delegate = worker
    return viewController
  }
  
  func pushToPhotoDetails(photo: PhotoView) {
    let viewController = PhotoDetailRouter().build()
    self.viewController?.navigationController?.pushViewController(viewController, animated: true)
  }
  
}
