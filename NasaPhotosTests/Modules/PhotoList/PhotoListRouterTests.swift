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
  
  var router: PhotoListRouter!
  var viewController: PhotoListViewControllerMock!
  var photo: PhotoView!
  
  override func spec() {
    
    describe("When instance router") {
      
      beforeEach {
        self.photo = PhotoView(urlImage: "http://google.com", cameraName: "Nome Camera", cameraNameFull: "Nome Camera Full Name")
        self.viewController = PhotoListViewControllerMock()
        self.router = PhotoListRouter()
        self.router.viewController = self.viewController
      }
      
      context("and call method build", {
        it("should return a viewController", closure: {
          let viewController = self.router.build()
          expect(viewController).to(beAKindOf(UIViewController.self))
        })
      })
      
    }
    
  }
  
}
