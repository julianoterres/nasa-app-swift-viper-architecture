
import Foundation

// MARK: Methods of PhotoListInteractor

class PhotoListInteractor {
  
  private let worker: PhotoListWorkerProtocolOutput
  weak var presenter: PhotoListPresenterProtocolInput?
  
  init(worker: PhotoListWorkerProtocolOutput) {
    self.worker = worker
    self.worker.interactor = self
  }
  
}

// MARK: Methods of PhotoListInteractorProtocolInput

extension PhotoListInteractor: PhotoListInteractorProtocolOutput {

  func fetchPhotos(probe: String) {
    self.worker.fetchPhotos(probe: probe)
  }
  
}

// MARK: Methods of PhotoListInteractorProtocolInput

extension PhotoListInteractor: PhotoListInteractorProtocolInput {
  
  func receivePhotos(photos: [PhotoEntityApi]) {
    let photos = photos.map ({ (photo) -> PhotoEntityView in
      return PhotoEntityView(
        urlImage: photo.img_src,
        cameraName: photo.camera?.name
      )
    })
    self.presenter?.receivePhotos(photos: photos)
  }
  
  func errorReceivePhotos(message: String) {
    self.presenter?.errorReceivePhotos(message: message)
  }
  
}
