//
//  PhotoListViewControllerTests.swift
//  NasaPhotosTests
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import NasaPhotos

// MARK: Methods of PhotoListViewControllerTests
class PhotoListViewControllerTests: QuickSpec {
  
  var viewController: PhotoListViewController!
  var presenter: PhotoListPresenterMock!
  
  override func spec() {
    
    describe("When instance viewController") {
      
      beforeEach {
        self.viewController = PhotoListViewController()
        self.presenter = PhotoListPresenterMock()
        self.viewController.presenter = self.presenter
        self.viewController.viewDidLoad()
      }
      
      context("and call method fetchPhotos", {
        it("should call the fetchPhotos of presenter", closure: {
          self.viewController?.fetchPhotos()
          expect(self.presenter?.functionCalled) == true
        })
      })
      
      context("and call method reloadPhotos", {
        it("should call the fetchPhotos of presenter", closure: {
          let photos = [PhotoView(urlImage: "http://google.com", cameraName: "Nome Camera", cameraNameFull: "Nome Camera Full Name")]
          self.viewController?.reloadPhotos(photos: photos)
          expect(self.viewController.photos.count) == 1
          expect(self.viewController.photos[0].urlImage) == "http://google.com"
          expect(self.viewController.photos[0].cameraName) == "Nome Camera"
          expect(self.viewController.photos[0].cameraNameFull) == "Nome Camera Full Name"
        })
        
      })
      
    }
    
  }
  
}
