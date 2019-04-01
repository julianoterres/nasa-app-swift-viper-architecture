//
//  PhotoDetailInteractor.swift
//  NasaPhotos
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

// MARK: Methods of PhotoDetailInteractor
class PhotoDetailInteractor {
  
  var worker: PhotoDetailWorkerProtocolOutput?
  weak var presenter: PhotoDetailPresenterProtocolInput?
  
}

// MARK: Methods of PhotoDetailInteractorProtocolInput
extension PhotoDetailInteractor: PhotoDetailInteractorProtocolInput {
  
}

// MARK: Methods of PhotoDetailInteractorProtocolOutput
extension PhotoDetailInteractor: PhotoDetailInteractorProtocolOutput {
  
}
