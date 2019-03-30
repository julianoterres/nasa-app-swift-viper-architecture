
import Foundation

// MARK: Methods of PhotoListPresenter

class PhotoListPresenter {
  
  // MARK: Variables of class
  weak var viewController: PhotoListViewControllerProtocol?
  private let interactor: PhotoListInteractorProtocolOutput
  
  init(interactor: PhotoListInteractorProtocolOutput) {
    self.interactor = interactor
  }
  
}

// MARK: Methods of PhotoListPresenterProtocolOutput

extension PhotoListPresenter: PhotoListPresenterProtocolOutput {
  
  func photosDidFetch(probe: String) {
    self.interactor.photosDidFetch(probe: probe)
  }
  
}

// MARK: Methods of PhotoListPresenterProtocolInput

extension PhotoListPresenter: PhotoListPresenterProtocolInput {
  
  func photosDidFetch(photos: [PhotoEntityView]) {
    self.viewController?.reloadPhotos(photos: photos)
  }
  
  func errorPhotosDidFetch(message: String) {
    self.viewController?.errorFound(message: message)
  }
  
}
