//
//  Network.swift
//  NasaPhotos
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Alamofire

// MARK: Methods of NetworkProtocolOutput
protocol NetworkProtocolOutput: class {
  func success(response: Data)
  func failure(error: Error)
}

// MARK: Methods of NetworkProtocolInput
protocol NetworkProtocolInput: class {
  var delegate: NetworkProtocolOutput? { get set }
  func request(url: URL, method: HTTPMethod, parameters: Parameters?)
}

// MARK: Methods of Network
class Network: NetworkProtocolInput {
  
  weak var delegate: NetworkProtocolOutput?
  
  func request(url: URL, method: HTTPMethod, parameters: Parameters?) {
    Alamofire.request(url, method: method, parameters: parameters).validate().responseJSON(completionHandler: { response in
      self.logAlamofireRequest(response: response)
      switch response.result {
      case .success:
        if let data = response.data, let delegateReturn = self.delegate {
          delegateReturn.success(response: data)
        }
      case .failure(let error):
        if let delegateReturn = self.delegate {
          delegateReturn.failure(error: error)
        }
      }
    })
  }
  
  private func logAlamofireRequest(response: DataResponse<Any>) {
    guard let request = response.request else { return }
    guard let url = request.url else { return }
    guard let httpMethod = request.httpMethod else { return }
    
    print("->REQUEST(\(httpMethod))\n\(url)\n")
    
    if let requestHeaders = request.allHTTPHeaderFields, !requestHeaders.isEmpty {
      print("->HEADERS\n\(requestHeaders)\n")
    }
    
    if let httpBody = request.httpBody {
      do {
        let jsonBody = try JSONSerialization.jsonObject(with: httpBody)
        print("->BODY\n\(jsonBody)\n")
      } catch {
        print("Error in the print of the body")
      }
    }
    
    if let responseData = response.response {
      let statusCode = responseData.statusCode
      let statusCodeString = (statusCode != 0) ? "(\(statusCode))" : ""
      print("->RESPONSE" + statusCodeString)
    }
    
    if let values = response.result.value {
      print(String(data: try! JSONSerialization.data(withJSONObject: values, options: .prettyPrinted), encoding: .utf8)!)
    }
  }
  
}
