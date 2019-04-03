//
//  PhotoListPresenterTests.swift
//  NasaPhotosTests
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import NasaPhotos

// MARK: Methods of PhotoListInteractorTests
class PhotoListPresenterTests: QuickSpec {
  
  var presenter: PhotoListPresenter?
  var viewController: PhotoListViewControllerMock?
  var router: PhotoListRouterMock?
  var interactor: PhotoListInteractorMock?
  
  
  override func spec() {
    
    beforeEach {
      self.viewController = PhotoListViewControllerMock()
      self.router = PhotoListRouterMock()
      self.interactor = PhotoListInteractorMock()
      self.presenter = PhotoListPresenter()
      self.presenter?.viewController = self.viewController
      self.presenter?.router = self.router
      self.presenter?.interactor = self.interactor
    }
    
    describe("When instance presenter") {
      
      context("and call method fetchPhotos", {
        it("should call the fetchPhotos of interactor", closure: {
          self.presenter?.fetchPhotos(segmentIndex: 0)
          expect(self.interactor?.functionCalled) == true
        })
      })
      
      context("and call method didSelectPhoto", {
        it("should call the pushToPhotoDetails of router", closure: {
          let photo = PhotoView (urlImage: "http://google.com", cameraName: "Name", cameraNameFull: "Full Name")
          self.presenter?.didSelectPhoto(photo: photo)
          expect(self.router?.functionCalled) == true
        })
      })
      
      context("and call method didFetchPhotos", {
        it("should call the reloadPhotos of viewController", closure: {
          self.presenter?.didFetchPhotos(photos: [])
          expect(self.viewController?.functionCalled) == true
        })
      })
      
      context("and call method errorDidFetchPhotos", {
        it("should call the errorFound of viewController", closure: {
          self.presenter?.errorDidFetchPhotos(message: "")
          expect(self.viewController?.functionCalled) == true
        })
      })
      
    }
    
  }
  
}
