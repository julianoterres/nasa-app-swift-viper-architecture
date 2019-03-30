
import Foundation

// MARK: Methods of PhotoListPresenter

class PhotoListPresenter {
  
  // MARK: Variables of class
  weak var viewController: PhotoListViewControllerProtocol?
  private let interactor: PhotoListInteractorProtocolOutput
  
  init(interactor: PhotoListInteractorProtocolOutput) {
    self.interactor = interactor
    self.interactor.presenter = self
  }
  
}

// MARK: Methods of PhotoListPresenterProtocolOutput

extension PhotoListPresenter: PhotoListPresenterProtocolOutput {
  
  func fetchPhotos(probe: String) {
    self.interactor.fetchPhotos(probe: probe)
  }
  
}

// MARK: Methods of PhotoListPresenterProtocolInput

extension PhotoListPresenter: PhotoListPresenterProtocolInput {
  
  func receivePhotos(photos: [PhotoEntityView]) {
    self.viewController?.reloadPhotos(photos: photos)
  }
  
  func errorReceivePhotos(message: String) {
    self.viewController?.error(message: message)
  }
  
}
