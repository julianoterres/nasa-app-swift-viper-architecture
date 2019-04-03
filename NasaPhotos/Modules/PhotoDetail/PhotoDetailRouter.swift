//
//  PhotoDetailRouter.swift
//  NasaPhotos
//
//  Created by Juliano Terres on 01/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of PhotoDetailRouter
class PhotoDetailRouter: PhotoDetailRouterWireframe {
  
  weak var viewController: UIViewController?
  
  func build(photo: PhotoView) -> UIViewController {
    let api = API()
    let network = Network()
    let worker = PhotoDetailWorker()
    let interactor = PhotoDetailInteractor()
    let presenter = PhotoDetailPresenter()
    let router = PhotoDetailRouter()
    let viewController = PhotoDetailViewController()
    viewController.presenter = presenter
    viewController.photo = photo
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
  
}
