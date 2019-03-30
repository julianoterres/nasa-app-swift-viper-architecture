
import Foundation

protocol PhotoListViewControllerProtocol: class {
  func reloadPhotos(photos: [PhotoEntityView])
  func errorFound(message: String)
}

protocol PhotoListPresenterProtocolOutput: class {
  var viewController: PhotoListViewControllerProtocol? { get set }
  func photosDidFetch(probe: String)
}

protocol PhotoListPresenterProtocolInput: class {
  func photosDidFetch(photos: [PhotoEntityView])
  func errorPhotosDidFetch(message: String)
}

protocol PhotoListInteractorProtocolOutput: class {
  var presenter: PhotoListPresenterProtocolInput? { get set }
  func photosDidFetch(probe: String)
}

protocol PhotoListInteractorProtocolInput: class {
  func photosDidFetch(photos: [PhotoEntityApi])
  func errorPhotosDidFetch(message: String)
}

protocol PhotoListWorkerProtocolOutput: class {
  var interactor: PhotoListInteractorProtocolInput? { get set }
  func photosDidFetch(probe: String, date: Date)
}
