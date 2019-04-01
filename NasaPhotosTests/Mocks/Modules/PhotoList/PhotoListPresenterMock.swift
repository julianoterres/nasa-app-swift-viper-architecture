//
//  PhotoListPresenterMock.swift
//  NasaPhotosTests
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

@testable import NasaPhotos
import Foundation

// MARK: Methods of PhotoListPresenterMock
class PhotoListPresenterMock {
  
  // MARK: Variables of class
  weak var viewController: PhotoListViewControllerProtocol?
  var router: PhotoListRouterWireframe?
  var interactor: PhotoListInteractorProtocolOutput?
  var functionCalled = false
  
}

// MARK: Methods of PhotoListPresenterProtocolOutput
extension PhotoListPresenterMock: PhotoListPresenterProtocolOutput {
  
  func fetchPhotos(segmentIndex: Int) {
    self.functionCalled = true
  }
  
  func didSelectPhoto(photo: PhotoView) {
    self.functionCalled = true
  }
  
}

// MARK: Methods of PhotoListPresenterProtocolInput
extension PhotoListPresenterMock: PhotoListPresenterProtocolInput {
  
  func didFetchPhotos(photos: [PhotoView]) {
    self.functionCalled = true
  }
  
  func errorDidFetchPhotos(message: String) {
    self.functionCalled = true
  }
  
}

