//
//  PhotoListInteractor.swift
//  NasaPhotos
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of PhotoListInteractor
class PhotoListInteractor {
  
  var worker: PhotoListWorkerProtocolOutput?
  weak var presenter: PhotoListPresenterProtocolInput?
  var date = Date()
  var sonda = ""
  
}

// MARK: Methods of PhotoListInteractorProtocolInput
extension PhotoListInteractor: PhotoListInteractorProtocolOutput {

  func photosDidFetch(sonda: String) {
    self.sonda = sonda
    self.worker?.photosDidFetch(sonda: self.sonda, date: self.date)
  }
  
}

// MARK: Methods of PhotoListInteractorProtocolInput
extension PhotoListInteractor: PhotoListInteractorProtocolInput {
  
  func photosDidFetch(photos: [PhotoApi]) {
    if photos.count > 0 {
      let photos = photos.map ({ (photo) -> PhotoView in
        return PhotoView(
          urlImage: photo.img_src,
          cameraName: photo.camera?.name,
          cameraNameFull: photo.camera?.full_name
        )
      })
      self.date = Date()
      self.presenter?.photosDidFetch(photos: photos)
    } else {
      self.date = self.date.adding(.day, -1)
      self.worker?.photosDidFetch(sonda: self.sonda, date: self.date)
    }
  }
  
  func errorPhotosDidFetch(message: String) {
    self.presenter?.errorPhotosDidFetch(message: message)
  }
  
}
