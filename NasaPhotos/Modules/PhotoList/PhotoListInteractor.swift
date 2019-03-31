
import Foundation

// MARK: Methods of PhotoListInteractor

class PhotoListInteractor {
  
  var worker: PhotoListWorkerProtocolOutput?
  weak var presenter: PhotoListPresenterProtocolInput?
  
}

// MARK: Methods of PhotoListInteractorProtocolInput

extension PhotoListInteractor: PhotoListInteractorProtocolOutput {

  func photosDidFetch(probe: String) {
    self.worker?.photosDidFetch(probe: probe, date: Date())
  }
  
}

// MARK: Methods of PhotoListInteractorProtocolInput

extension PhotoListInteractor: PhotoListInteractorProtocolInput {
  
  func photosDidFetch(photos: [PhotoApi]) {
    let photos = photos.map ({ (photo) -> PhotoView in
      return PhotoView(
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
