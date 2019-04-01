//
//  PhotoDetailProtocols.swift
//  NasaPhotos
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation
import UIKit

protocol PhotoDetailViewControllerProtocol: class {
  var photo: PhotoView? { get set }
  func createElements()
  func configElements()
  func setContrainsInElemens()
  func changeCameraName()
}

protocol PhotoDetailRouterWireframe: class {
  var viewController: UIViewController? { get set }
  func build(photo: PhotoView) -> UIViewController
}
