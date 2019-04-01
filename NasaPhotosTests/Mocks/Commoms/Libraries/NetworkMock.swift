//
//  NetworkMock.swift
//  NasaPhotosTests
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

@testable import NasaPhotos
import Alamofire

// MARK: Methods of NetworkInputMock
class NetworkInputMock: NetworkProtocolInput {
  
  weak var delegate: NetworkProtocolOutput?
  var functionCalled = false
  
  func request(url: URL, method: HTTPMethod, parameters: Parameters?) {
    self.functionCalled = true
  }
  
}

// MARK: Methods of NetworkOutputMock
class NetworkOutputMock: NetworkProtocolOutput {
  
  var functionCalled = false
  
  func success(response: Data) {
    self.functionCalled = true
  }
  
  func failure(error: Error) {
    self.functionCalled = true
  }
  
}
