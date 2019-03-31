
import Foundation
import UIKit

protocol PhotoListViewControllerProtocol: class {
  func reloadPhotos(photos: [PhotoView])
  func errorFound()
}

protocol PhotoListPresenterProtocolOutput: class {
  var router: PhotoListRouterWireframe? { get set }
  var interactor: PhotoListInteractorProtocolOutput? { get set }
  var viewController: PhotoListViewControllerProtocol? { get set }
  func photosDidFetch(probe: String)
  func didSelectPhoto(photo: PhotoView)
}

protocol PhotoListPresenterProtocolInput: class {
  func photosDidFetch(photos: [PhotoView])
  func errorPhotosDidFetch(message: String)
}

protocol PhotoListInteractorProtocolOutput: class {
  var worker: PhotoListWorkerProtocolOutput? { get set }
  var presenter: PhotoListPresenterProtocolInput? { get set }
  func photosDidFetch(probe: String)
}

protocol PhotoListInteractorProtocolInput: class {
  func photosDidFetch(photos: [PhotoApi])
  func errorPhotosDidFetch(message: String)
}

protocol PhotoListWorkerProtocolOutput: class {
  var api: API? { get set }
  var network: NetworkProtocolInput? { get set }
  var interactor: PhotoListInteractorProtocolInput? { get set }
  func photosDidFetch(probe: String, date: Date)
}

protocol PhotoListRouterWireframe: class {
  var viewController: UIViewController? { get set }
  func build() -> UIViewController
  func showAlert(title: String, message: String)
  func pushToPhotoDetails(photo: PhotoView)
}
