//
//  PhotoDetailRouter.swift
//  NasaPhotos
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of PhotoDetailRouter
class PhotoDetailRouter: PhotoDetailRouterWireframe {
  
  weak var viewController: UIViewController?
  
  func build(photo: PhotoView) -> UIViewController {
    let viewController = PhotoDetailViewController()
    viewController.photo = photo
    return viewController
  }
  
}
