//
//  PhotoDetailRouterTests.swift
//  NasaPhotosTests
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import NasaPhotos

// MARK: Methods of PhotoDetailRouterTests
class PhotoDetailRouterTests: QuickSpec {
  
  var router: PhotoDetailRouterSpy!
  var photo: PhotoView!
  
  override func spec() {
    
    describe("When instance router") {
      
      beforeEach {
        self.photo = PhotoView(
          urlImage: "http://google.com",
          cameraName: "Nome Camera",
          cameraNameFull: "Nome Camera Full Name"
        )
        self.router = PhotoDetailRouterSpy()
      }
      
      context("and call method build", {
        
        it("check if is called", closure: {
          let _ = self.router.build(photo: self.photo)
          expect(self.router.functionCalled) == true
        })
        
      })
      
    }
    
  }
  
}

// MARK: Methods of PhotoDetailRouterSpy
final class PhotoDetailRouterSpy: PhotoDetailRouterWireframe {
  
  var functionCalled = false
  var viewController: UIViewController?
  
  func build(photo: PhotoView) -> UIViewController {
    self.functionCalled = true
    return PhotoDetailViewController()
  }
  
}

