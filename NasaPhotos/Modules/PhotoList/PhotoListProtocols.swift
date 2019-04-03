//
//  PhotoListProtocols.swift
//  NasaPhotos
//
//  Created by Juliano Terres on 01/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation
import UIKit

protocol PhotoListViewControllerProtocol: class {
  func fetchPhotos()
  func reloadPhotos(photos: [PhotoView])
  func errorFound()
}

protocol PhotoListPresenterProtocolOutput: class {
  var router: PhotoListRouterWireframe? { get set }
  var interactor: PhotoListInteractorProtocolOutput? { get set }
  var viewController: PhotoListViewControllerProtocol? { get set }
  func fetchPhotos(segmentIndex: Int)
  func didSelectPhoto(photo: PhotoView)
}

protocol PhotoListPresenterProtocolInput: class {
  func didFetchPhotos(photos: [PhotoView])
  func errorDidFetchPhotos(message: String)
}

protocol PhotoListInteractorProtocolOutput: class {
  var worker: PhotoListWorkerProtocolOutput? { get set }
  var presenter: PhotoListPresenterProtocolInput? { get set }
  func fetchPhotos(sonda: String)
}

protocol PhotoListInteractorProtocolInput: class {
  func didFetchPhotos(photos: [PhotoApi])
  func errorDidFetchPhotos(message: String)
}

protocol PhotoListWorkerProtocolOutput: class {
  var api: APIProtocol? { get set }
  var network: NetworkProtocolInput? { get set }
  var interactor: PhotoListInteractorProtocolInput? { get set }
  func fetchPhotos(sonda: String, date: Date)
}

protocol PhotoListRouterWireframe: class {
  var viewController: UIViewController? { get set }
  func build() -> UIViewController
  func pushToPhotoDetails(photo: PhotoView)
}
