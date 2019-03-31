
import Foundation

final class API {
  
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
