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
  
  var interactor: PhotoListInteractorSpy?
  var worker: PhotoListWorkerMock?
  var presenter: PhotoListPresenterMock?
  
  override func spec() {
    
    describe("When instance interactor") {
      
      beforeEach {
        self.worker = PhotoListWorkerMock()
        self.presenter = PhotoListPresenterMock()
        self.interactor = PhotoListInteractorSpy()
        self.interactor?.worker = self.worker
        self.interactor?.presenter = self.presenter
      }
      
      context("and call the method", {
        
        it("fetchPhotos, should call the fetchPhotos of worker", closure: {
          self.interactor?.fetchPhotos(sonda: "")
          expect(self.interactor?.functionCalled) == true
          expect(self.worker?.functionCalled) == true
        })
        
        it("didFetchPhotos with photos, should call the didFetchPhotos of presenter", closure: {
          let photoCameraApi = PhotoCameraApi(id: 1, rover_id: 2, full_name: "Full Name", name: "Name")
          let photoApi = PhotoApi(sol: 1, id: 2, earth_date: "2019-04-02", camera: photoCameraApi, img_src: "http://google.com")
          self.interactor?.didFetchPhotos(photos: [photoApi])
          expect(self.interactor?.functionCalled) == true
          expect(self.presenter?.functionCalled) == true
        })
        
        it("didFetchPhotos without photos, should call the didFetchPhotos of presenter", closure: {
          self.interactor?.didFetchPhotos(photos: [])
          expect(self.interactor?.functionCalled) == true
          expect(self.worker?.functionCalled) == true
        })
        
        it("errorDidFetchPhotos, should call the didFetchPhotos of presenter", closure: {
          self.interactor?.errorDidFetchPhotos(message: "")
          expect(self.interactor?.functionCalled) == true
          expect(self.presenter?.functionCalled) == true
        })
        
      })
      
    }
    
  }
  
}

// MARK: Methods of PhotoListInteractorSpy
final class PhotoListInteractorSpy {
  
  var functionCalled = false
  var worker: PhotoListWorkerProtocolOutput?
  var presenter: PhotoListPresenterProtocolInput?
  
}

// MARK: Methods of PhotoListInteractorProtocolOutput
extension PhotoListInteractorSpy: PhotoListInteractorProtocolOutput {
  
  func fetchPhotos(sonda: String) {
    self.functionCalled = true
    self.worker?.fetchPhotos(sonda: "", date: Date())
  }
  
}

// MARK: Methods of PhotoListInteractorProtocolInput
extension PhotoListInteractorSpy: PhotoListInteractorProtocolInput {
  
  func didFetchPhotos(photos: [PhotoApi]) {
    self.functionCalled = true
    if photos.isEmpty {
      self.worker?.fetchPhotos(sonda: "", date: Date())
      return
    }
    self.presenter?.didFetchPhotos(photos: [])
  }
  
  func errorDidFetchPhotos(message: String) {
    self.functionCalled = true
    self.presenter?.errorDidFetchPhotos(message: "")
  }
  
}
