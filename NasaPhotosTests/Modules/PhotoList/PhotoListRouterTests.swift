//
//  PhotoListRouterTests.swift
//  NasaPhotosTests
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import NasaPhotos

// MARK: Methods of PhotoListRouterTests
class PhotoListRouterTests: QuickSpec {
  
  var router: PhotoListRouterSpy!
  var photo: PhotoView!
  
  override func spec() {
    
    describe("When instance router") {
      
      beforeEach {
        self.photo = PhotoView(
          urlImage: "http://google.com",
          cameraName: "Nome Camera",
          cameraNameFull: "Nome Camera Full Name"
        )
        self.router = PhotoListRouterSpy()
      }
      
      context("and call method", {
        
        it("build, check if is called", closure: {
          let _ = self.router.build()
          expect(self.router.functionCalled) == true
        })
        
        it("pushToPhotoDetails, check if is called", closure: {
          let _ = self.router.pushToPhotoDetails(photo: self.photo)
          expect(self.router.functionCalled) == true
        })
        
      })
      
    }
    
  }
  
}

// MARK: Methods of PhotoListRouterSpy
final class PhotoListRouterSpy: PhotoListRouterWireframe {
  
  var functionCalled = false
  var viewController: UIViewController?
  
  func build() -> UIViewController {
    self.functionCalled = true
    return PhotoListViewController()
  }
  
  func pushToPhotoDetails(photo: PhotoView) {
    self.functionCalled = true
  }
  
}


