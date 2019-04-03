//
//  PhotoListInteractorTests.swift
//  NasaPhotosTests
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Quick
import Nimble
@testable import NasaPhotos

// MARK: Methods of PhotoListInteractorTests
class PhotoListInteractorTests: QuickSpec {
  
  var interactor: PhotoListInteractor?
  var worker: PhotoListWorkerMock?
  var presenter: PhotoListPresenterMock?
  
  override func spec() {
    
    describe("When instance interactor") {
      
      beforeEach {
        self.worker = PhotoListWorkerMock()
        self.presenter = PhotoListPresenterMock()
        self.interactor = PhotoListInteractor()
        self.interactor?.worker = self.worker
        self.interactor?.presenter = self.presenter
      }
      
      context("and call the method fetchPhotos", {
        it("should call the fetchPhotos of worker", closure: {
          self.interactor?.fetchPhotos(sonda: "")
          expect(self.worker?.functionCalled) == true
        })
      })
      
      context("and call the method didFetchPhotos with photos", {
        it("should call the didFetchPhotos of presenter", closure: {
          let photoCameraApi = PhotoCameraApi(id: 1, rover_id: 2, full_name: "Full Name", name: "Name")
          let photoApi = PhotoApi(sol: 1, id: 2, earth_date: "2019-04-02", camera: photoCameraApi, img_src: "http://google.com")
          self.interactor?.didFetchPhotos(photos: [photoApi])
          expect(self.presenter?.functionCalled) == true
        })
      })
      
      context("and call the method didFetchPhotos without photos", {
        it("should call the didFetchPhotos of presenter", closure: {
          self.interactor?.didFetchPhotos(photos: [])
          expect(self.worker?.functionCalled) == true
        })
      })
      
      context("and call the method errorDidFetchPhotos", {
        it("should call the didFetchPhotos of presenter", closure: {
          self.interactor?.errorDidFetchPhotos(message: "")
          expect(self.presenter?.functionCalled) == true
        })
      })
      
    }
    
  }
  
}
