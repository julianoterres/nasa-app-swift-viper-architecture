//
//  PhotoDetailPresenter.swift
//  NasaPhotos
//
//  Created by Juliano Terres on 01/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

// MARK: Methods of PhotoDetailPresenter
class PhotoDetailPresenter {
  
  weak var viewController: PhotoDetailViewControllerProtocol?
  var router: PhotoDetailRouterWireframe?
  var interactor: PhotoDetailInteractorProtocolOutput?
  
}

// MARK: Methods of PhotoDetailPresenterProtocolOutput
extension PhotoDetailPresenter: PhotoDetailPresenterProtocolOutput {
  
}

// MARK: Methods of PhotoDetailPresenterProtocolInput
extension PhotoDetailPresenter: PhotoDetailPresenterProtocolInput {
  
}
