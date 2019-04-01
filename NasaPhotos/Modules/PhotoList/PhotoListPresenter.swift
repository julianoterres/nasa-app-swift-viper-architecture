//
//  PhotoListPresenter.swift
//  NasaPhotos
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of PhotoListPresenter
class PhotoListPresenter {
  
  // MARK: Variables of class
  weak var viewController: PhotoListViewControllerProtocol?
  var router: PhotoListRouterWireframe?
  var interactor: PhotoListInteractorProtocolOutput?
  let sondas = [SondaEnun.curiosity.rawValue, SondaEnun.opportunity.rawValue, SondaEnun.spirit.rawValue]
  
}

// MARK: Methods of PhotoListPresenterProtocolOutput
extension PhotoListPresenter: PhotoListPresenterProtocolOutput {
  
  func photosDidFetch(segmentIndex: Int) {
    self.interactor?.photosDidFetch(sonda: sondas[segmentIndex])
  }
  
  func didSelectPhoto(photo: PhotoView) {
    self.router?.pushToPhotoDetails(photo: photo)
  }
  
}

// MARK: Methods of PhotoListPresenterProtocolInput
extension PhotoListPresenter: PhotoListPresenterProtocolInput {
  
  func photosDidFetch(photos: [PhotoView]) {
    self.viewController?.reloadPhotos(photos: photos)
  }
  
  func errorPhotosDidFetch(message: String) {
    self.viewController?.errorFound()
  }
  
}
