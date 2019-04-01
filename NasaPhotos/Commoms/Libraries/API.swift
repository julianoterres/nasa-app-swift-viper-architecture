//
//  API.swift
//  NasaPhotos
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of APIProtocol
protocol APIProtocol: class {
  func urlRoversPhotos(sonda: String) -> URL
  func mountParameters(parameters: [String:Any]) -> [String:Any]
}

// MARK: Methods of API
class API: APIProtocol {
  
  private let baseUlr = "https://api.nasa.gov/mars-photos/api/v1/"
  
  func urlRoversPhotos(sonda: String) -> URL {
    return URL(string: baseUlr + "rovers/" + sonda + "/photos")!
  }
  
  func mountParameters(parameters: [String:Any]) -> [String:Any] {
    var parametersApiKey = ["api_key": "S8p6oZSmieZCTfoWUnorKgoXUwqMqBJi3nQbPiry"] as [String:Any]
    parametersApiKey.merge(dict: parameters)
    return parametersApiKey
  }
  
}
