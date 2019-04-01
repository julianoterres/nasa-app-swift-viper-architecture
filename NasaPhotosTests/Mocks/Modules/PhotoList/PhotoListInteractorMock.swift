//
//  PhotoListInteractorMock.swift
//  NasaPhotosTests
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

@testable import NasaPhotos
import Foundation

// MARK: Methods of PhotoListInteractorMock
class PhotoListInteractorMock {
  
  var worker: PhotoListWorkerProtocolOutput?
  var presenter: PhotoListPresenterProtocolInput?
  var functionCalled = false
  
}

// MARK: Methods of PhotoListInteractorProtocolOutput
extension PhotoListInteractorMock: PhotoListInteractorProtocolOutput {
  
  func fetchPhotos(sonda: String) {
    self.functionCalled = true
  }
  
}

// MARK: Methods of PhotoListInteractorProtocolInput
extension PhotoListInteractorMock: PhotoListInteractorProtocolInput {
  
  func didFetchPhotos(photos: [PhotoApi]) {
    self.functionCalled = true
  }
  
  func errorDidFetchPhotos(message: String) {
    self.functionCalled = true
  }
  
}

