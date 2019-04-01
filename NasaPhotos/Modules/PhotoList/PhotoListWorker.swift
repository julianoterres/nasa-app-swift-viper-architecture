//
//  PhotoListWorker.swift
//  NasaPhotos
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of PhotoListWorker

class PhotoListWorker {
  
  weak var interactor: PhotoListInteractorProtocolInput?
  var network: NetworkProtocolInput?
  var api: API?
  
}

// MARK: Methods of PhotoListWorkerProtocolInput
extension PhotoListWorker: PhotoListWorkerProtocolOutput {
  
  func photosDidFetch(sonda: String, date: Date) {
    let parametersMerge = ["earth_date": date.convert_to_yyyy_mm_dd]
    if let url = self.api?.urlRoversPhotos(sonda: sonda), let parameters = self.api?.mountParameters(parameters: parametersMerge) {
      self.network?.request(url: url, method: .get, parameters: parameters)
    }
  }
  
}

// MARK: Methods of NetworkProtocol
extension PhotoListWorker: NetworkProtocolOutput {
  
  func success(response: Data) {
    do {
      let listPhotos = try JSONDecoder().decode(PhotoListApi.self, from: response)
      self.interactor?.photosDidFetch(photos: listPhotos.photos)
    } catch let error {
     self.interactor?.errorPhotosDidFetch(message: error.localizedDescription)
    }
  }
  
  func failure(error: Error) {
    self.interactor?.errorPhotosDidFetch(message: error.localizedDescription)
  }
  
}
