//
//  PhotoDetailProtocols.swift
//  NasaPhotos
//
//  Created by Juliano Terres on 01/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation
import UIKit

protocol PhotoDetailViewControllerProtocol: class {
  func changeCameraName()
}

protocol PhotoDetailPresenterProtocolOutput: class {
  
}

protocol PhotoDetailPresenterProtocolInput: class {
  
}

protocol PhotoDetailInteractorProtocolOutput: class {
  
}

protocol PhotoDetailInteractorProtocolInput: class {
  
}

protocol PhotoDetailWorkerProtocolOutput: class {
  
}

protocol PhotoDetailWorkerProtocolInput: class {
  
}

protocol PhotoDetailRouterWireframe: class {
  var viewController: UIViewController? { get set }
  func build(photo: PhotoView) -> UIViewController
}
