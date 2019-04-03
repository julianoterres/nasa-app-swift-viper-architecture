//
//  PhotoListRouter.swift
//  NasaPhotos
//
//  Created by Juliano Terres on 01/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of PhotoListRouter
class PhotoListRouter: PhotoListRouterWireframe {
  
  // MARK: Variables of class
  weak var viewController: UIViewController?
  
  // MARK: Methods of class
  func build() -> UIViewController {
    let api = API()
    let network = Network()
    let worker = PhotoListWorker()
    let interactor = PhotoListInteractor()
    let presenter = PhotoListPresenter()
    let router = PhotoListRouter()
    let viewController = PhotoListViewController()
    viewController.presenter = presenter
    router.viewController = viewController
    presenter.viewController = viewController
    presenter.interactor = interactor
    presenter.router = router
    interactor.presenter = presenter
    interactor.worker = worker
    worker.interactor = interactor
    worker.network = network
    worker.api = api
    worker.network?.delegate = worker
    return viewController
  }
  
  func pushToPhotoDetails(photo: PhotoView) {
    if let viewController = PhotoDetailRouter().build(photo: photo) as? PhotoDetailViewController{
      self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
  }
  
}
