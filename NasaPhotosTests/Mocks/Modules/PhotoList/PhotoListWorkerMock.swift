//
//  PhotoListWorkerMock.swift
//  NasaPhotosTests
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

@testable import NasaPhotos
import Foundation

// MARK: Methods of PhotoListWorker
class PhotoListWorkerMock {
  
  weak var interactor: PhotoListInteractorProtocolInput?
  var network: NetworkProtocolInput?
  var api: API?
  var functionCalled = false
  
}

// MARK: Methods of PhotoListWorkerProtocolOutput
extension PhotoListWorkerMock: PhotoListWorkerProtocolOutput {
  
  func fetchPhotos(sonda: String, date: Date) {
    self.functionCalled = true
  }
  
}

// MARK: Methods of NetworkProtocol
extension PhotoListWorkerMock: NetworkProtocolOutput {
  
  func success(response: Data) {
    self.functionCalled = true
  }
  
  func failure(error: Error) {
    self.functionCalled = true
  }
  
}

