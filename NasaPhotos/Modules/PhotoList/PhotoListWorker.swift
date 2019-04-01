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
  var api: APIProtocol?
  
}

// MARK: Methods of PhotoListWorkerProtocolOutput
extension PhotoListWorker: PhotoListWorkerProtocolOutput {
  
  func fetchPhotos(sonda: String, date: Date) {
    let parametersMerge = ["earth_date": date.convert_to_yyyy_mm_dd]
    if let url = self.api?.urlRoversPhotos(sonda: sonda), let parameters = self.api?.mountParameters(parameters: parametersMerge) {
      self.network?.request(url: url, method: .get, parameters: parameters)
    } else {
      self.interactor?.errorDidFetchPhotos(message: "Error load api")
    }
  }
  
}

// MARK: Methods of NetworkProtocol
extension PhotoListWorker: NetworkProtocolOutput {
  
  func success(response: Data) {
    do {
      let listPhotos = try JSONDecoder().decode(PhotoListApi.self, from: response)
      self.interactor?.didFetchPhotos(photos: listPhotos.photos)
    } catch let error {
     self.interactor?.errorDidFetchPhotos(message: error.localizedDescription)
    }
  }
  
  func failure(error: Error) {
    self.interactor?.errorDidFetchPhotos(message: error.localizedDescription)
  }
  
}
