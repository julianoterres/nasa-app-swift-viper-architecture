
import Foundation

// MARK: Methods of PhotoListInteractor

class PhotoListInteractor {
  
  var worker: PhotoListWorkerProtocolOutput?
  weak var presenter: PhotoListPresenterProtocolInput?
  var date = Date()
  var probe = ""
  
}

// MARK: Methods of PhotoListInteractorProtocolInput

extension PhotoListInteractor: PhotoListInteractorProtocolOutput {

  func photosDidFetch(probe: String) {
    self.probe = probe
    self.worker?.photosDidFetch(probe: self.probe, date: self.date)
  }
  
}

// MARK: Methods of PhotoListInteractorProtocolInput

extension PhotoListInteractor: PhotoListInteractorProtocolInput {
  
  func photosDidFetch(photos: [PhotoApi]) {
    if photos.count > 0 {
      let photos = photos.map ({ (photo) -> PhotoView in
        return PhotoView(
          urlImage: photo.img_src,
          cameraName: photo.camera?.name
        )
      })
      self.date = Date()
      self.presenter?.photosDidFetch(photos: photos)
    } else {
      self.date = self.date.adding(.day, -1)
      self.worker?.photosDidFetch(probe: self.probe, date: self.date)
    }
  }
  
  func errorPhotosDidFetch(message: String) {
    self.presenter?.errorPhotosDidFetch(message: message)
  }
  
}
