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

// MARK: Methods of PhotoListInteractorProtocolOutput
extension PhotoListInteractor: PhotoListInteractorProtocolOutput {
  
  func fetchPhotos(sonda: String) {
    self.sonda = sonda
    self.worker?.fetchPhotos(sonda: self.sonda, date: self.date)
  }
  
}

// MARK: Methods of PhotoListInteractorProtocolInput
extension PhotoListInteractor: PhotoListInteractorProtocolInput {
  
  func didFetchPhotos(photos: [PhotoApi]) {
    
    if photos.isEmpty {
      self.date = self.date.adding(.day, -1)
      self.worker?.fetchPhotos(sonda: self.sonda, date: self.date)
      return
    }
     
    let photos = photos.map ({ (photo) -> PhotoView in
      return PhotoView(
        urlImage: photo.img_src,
        cameraName: photo.camera?.name,
        cameraNameFull: photo.camera?.full_name
      )
    })
    self.date = Date()
    self.presenter?.didFetchPhotos(photos: photos)
    
  }
  
  func errorDidFetchPhotos(message: String) {
    self.presenter?.errorDidFetchPhotos(message: message)
  }
  
}
