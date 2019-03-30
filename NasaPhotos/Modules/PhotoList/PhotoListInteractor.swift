
import Foundation

// MARK: Methods of PhotoListInteractor

class PhotoListInteractor {
  
  private let worker: PhotoListWorkerProtocolOutput
  weak var presenter: PhotoListPresenterProtocolInput?
  
  init(worker: PhotoListWorkerProtocolOutput) {
    self.worker = worker
  }
  
}

// MARK: Methods of PhotoListInteractorProtocolInput

extension PhotoListInteractor: PhotoListInteractorProtocolOutput {

  func photosDidFetch(probe: String) {
    self.worker.photosDidFetch(probe: probe, date: Date())
  }
  
}

// MARK: Methods of PhotoListInteractorProtocolInput

extension PhotoListInteractor: PhotoListInteractorProtocolInput {
  
  func photosDidFetch(photos: [PhotoEntityApi]) {
    let photos = photos.map ({ (photo) -> PhotoEntityView in
      return PhotoEntityView(
        urlImage: photo.img_src,
        cameraName: photo.camera?.name
      )
    })
    self.presenter?.photosDidFetch(photos: photos)
  }
  
  func errorPhotosDidFetch(message: String) {
    self.presenter?.errorPhotosDidFetch(message: message)
  }
  
}
