//
//  PhotoDetailWorker.swift
//  NasaPhotos
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of PhotoDetailWorker
class PhotoDetailWorker {
  
  weak var interactor: PhotoDetailInteractorProtocolInput?
  var network: NetworkProtocolInput?
  var api: API?
  
}

// MARK: Methods of PhotoDetailWorkerProtocolOutput
extension PhotoDetailWorker: PhotoDetailWorkerProtocolOutput {
  
}

// MARK: Methods of PhotoDetailWorkerProtocolInput
extension PhotoDetailWorker: PhotoDetailWorkerProtocolInput {
  
}

// MARK: Methods of NetworkProtocol
extension PhotoDetailWorker: NetworkProtocolOutput {
  
  func success(response: Data) {
    
  }
  
  func failure(error: Error) {
    
  }
  
}
