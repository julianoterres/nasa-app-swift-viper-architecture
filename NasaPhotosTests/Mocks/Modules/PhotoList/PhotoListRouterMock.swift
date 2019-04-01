//
//  PhotoListRouterMock.swift
//  NasaPhotosTests
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

@testable import NasaPhotos
import UIKit

// MARK: Methods of PhotoListRouterMock
class PhotoListRouterMock: PhotoListRouterWireframe {
  
  // MARK: Variables of class
  var viewController: UIViewController?
  var functionCalled = false
  
  // MARK: Methods of class
  func build() -> UIViewController {
    self.functionCalled = true
    return UIViewController()
  }
  
  func pushToPhotoDetails(photo: PhotoView) {
    self.functionCalled = true
  }
  
}

