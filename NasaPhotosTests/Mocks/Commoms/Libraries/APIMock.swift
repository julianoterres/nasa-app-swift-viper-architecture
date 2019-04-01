//
//  APIMock.swift
//  NasaPhotosTests
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

@testable import NasaPhotos
import Alamofire

// MARK: Methods of APIMock
class APIMock: APIProtocol {
  
  func urlRoversPhotos(sonda: String) -> URL {
    return URL(string: "http://google.com")!
  }
  
  func mountParameters(parameters: [String:Any]) -> [String:Any] {
    return ["api_key": "S8p6oZSmieZCTfoWUnorKgoXUwqMqBJi3nQbPiry"] as [String:Any]
  }
  
}


