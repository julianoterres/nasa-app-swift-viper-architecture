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
  
  override func spec() {
    
    describe("When instance interactor") {
      
      context("and call methods input", {
        
        it("photosDidFetch, check if is called", closure: {
          let presenter = PhotoListPresenterInputSpy()
          presenter.photosDidFetch(photos: [])
          expect(presenter.functionCalled) == true
        })
        
        it("errorPhotosDidFetch, check if is called", closure: {
          let presenter = PhotoListPresenterInputSpy()
          presenter.errorPhotosDidFetch(message: "")
          expect(presenter.functionCalled) == true
        })
        
      })
      
      context("and call methods output", {
        
        it("photosDidFetch, check if is called", closure: {
          let presenter = PhotoListPresenterOutputSpy()
          presenter.photosDidFetch(segmentIndex: 0)
          expect(presenter.functionCalled) == true
        })
        
        it("didSelectPhoto, check if is called", closure: {
          let presenter = PhotoListPresenterOutputSpy()
          let photoView = PhotoView(
            urlImage: "http://google.com",
            cameraName: "Nome Camera",
            cameraNameFull: "Nome Camera Full Name"
          )
          presenter.didSelectPhoto(photo: photoView)
          expect(presenter.functionCalled) == true
        })
        
      })
      
    }
    
  }
  
}

// MARK: Methods of PhotoListPresenterInputSpy
final class PhotoListPresenterInputSpy: PhotoListPresenterProtocolInput {
  
  var functionCalled = false
  
  func photosDidFetch(photos: [PhotoView]) {
    self.functionCalled = true
  }
  
  func errorPhotosDidFetch(message: String) {
    self.functionCalled = true
  }
  
}

// MARK: Methods of PhotoListPresenterOutputSpy
final class PhotoListPresenterOutputSpy: PhotoListPresenterProtocolOutput {
  
  var functionCalled = false
  var router: PhotoListRouterWireframe?
  var interactor: PhotoListInteractorProtocolOutput?
  var viewController: PhotoListViewControllerProtocol?
  
  func photosDidFetch(segmentIndex: Int) {
    self.functionCalled = true
  }
  
  func didSelectPhoto(photo: PhotoView) {
    self.functionCalled = true
  }
  
}
