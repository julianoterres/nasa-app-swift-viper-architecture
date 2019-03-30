
protocol PhotoListViewControllerProtocol: class {
  func reloadPhotos(photos: [PhotoEntityView])
  func error(message: String)
}

protocol PhotoListPresenterProtocolOutput: class {
  var viewController: PhotoListViewControllerProtocol? { get set }
  func fetchPhotos(probe: String)
}

protocol PhotoListPresenterProtocolInput: class {
  func receivePhotos(photos: [PhotoEntityView])
  func errorReceivePhotos(message: String)
}

protocol PhotoListInteractorProtocolOutput: class {
  var presenter: PhotoListPresenterProtocolInput? { get set }
  func fetchPhotos(probe: String)
}

protocol PhotoListInteractorProtocolInput: class {
  func receivePhotos(photos: [PhotoEntityApi])
  func errorReceivePhotos(message: String)
}

protocol PhotoListWorkerProtocolOutput: class {
  var interactor: PhotoListInteractorProtocolInput? { get set }
  func fetchPhotos(probe: String)
}
