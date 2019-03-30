
import Foundation

// MARK: Methods of PhotoListWorker

class PhotoListWorker {
  
  weak var interactor: PhotoListInteractorProtocolInput?
  private let network: NetworkProtocolInput
  private let api = API()
  
  init(network: NetworkProtocolInput) {
    self.network = network
    self.network.delegate = self
  }
  
}

// MARK: Methods of PhotoListWorkerProtocolInput

extension PhotoListWorker: PhotoListWorkerProtocolOutput {
  
  func photosDidFetch(probe: String, date: Date) {
    let parametersMerge = ["earth_date": "2015-06-03"]
    let url = self.api.urlRoversPhotos(probe: probe)
    let parameters = self.api.mountParameters(parameters: parametersMerge)
    self.network.request(url: url, method: .get, parameters: parameters)
  }
  
}

// MARK: Methods of NetworkProtocol

extension PhotoListWorker: NetworkProtocolOutput {
  
  func success(response: Data) {
    do {
      let listPhotos = try JSONDecoder().decode(PhotoListEntityApi.self, from: response)
      self.interactor?.photosDidFetch(photos: listPhotos.photos)
    } catch let error {
     self.interactor?.errorPhotosDidFetch(message: error.localizedDescription)
    }
  }
  
  func failure(error: Error) {
    self.interactor?.errorPhotosDidFetch(message: error.localizedDescription)
  }
  
}
