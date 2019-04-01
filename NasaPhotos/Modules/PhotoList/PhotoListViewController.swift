//
//  PhotoListViewController.swift
//  NasaPhotos
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of PhotoListViewController
class PhotoListViewController: UIViewController {
  
  // MARK: Elements of class
  private let segmentedControl = UISegmentedControl(items: [SondaEnun.curiosity.rawValue, SondaEnun.opportunity.rawValue, SondaEnun.spirit.rawValue])
  private let collectionViewLayout = UICollectionViewFlowLayout()
  private var collectionView: UICollectionView!
  private let loaderStackView = UIStackView()
  private let loader = UIActivityIndicatorView()
  private let labelLoader = UILabel()
  private let viewRetry = UIView()
  private let labelRetry = UILabel()
  private let retryButton = UIButton()
  
  // MARK: Variables of class
  var presenter: PhotoListPresenterProtocolOutput?
  var photos = [PhotoView]()
  
  // MARK: Methods of life cicle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.createElements()
    self.configElements()
    self.setContrainsInElemens()
    self.fetchPhotos()
  }
  
  // MARK: Methods of class
  func createElements() {
    self.collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
    self.loaderStackView.addArrangedSubview(self.labelLoader)
    self.loaderStackView.addArrangedSubview(self.loader)
    self.viewRetry.addSubview(self.labelRetry)
    self.viewRetry.addSubview(self.retryButton)
    self.view.addSubview(self.loaderStackView)
    self.view.addSubview(viewRetry)
    self.view.addSubview(self.segmentedControl)
    self.view.addSubview(self.collectionView)
  }
  
  func configElements() {
    self.view.backgroundColor = .white
    self.title = "Mars Rovers Photos"
    self.segmentedControl.selectedSegmentIndex = 0
    self.segmentedControl.addTarget(self, action: #selector(fetchPhotos), for: .valueChanged)
    self.collectionViewLayout.minimumLineSpacing = 15
    self.collectionViewLayout.minimumInteritemSpacing = 0
    self.collectionView.delegate = self
    self.collectionView.dataSource = self
    self.collectionView.isHidden = true
    self.collectionView.collectionViewLayout = self.collectionViewLayout
    self.collectionView.backgroundColor = .white
    self.collectionView.register(PhotoListCell.self, forCellWithReuseIdentifier: "PhotoListCell")
    self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 15, right: 15)
    self.loaderStackView.axis = .vertical
    self.loaderStackView.distribution = .fill
    self.loaderStackView.alignment = .center
    self.loaderStackView.spacing = 15
    self.labelLoader.text = "Aguarde, estamos pesquisando\nas imagens para você"
    self.labelLoader.textAlignment = .center
    self.labelLoader.numberOfLines = 0
    self.loader.color = .black
    self.loader.startAnimating()
    self.viewRetry.backgroundColor = .white
    self.labelRetry.text = "Ocorreu algum erro na nossa pesquisa."
    self.labelRetry.textAlignment = .center
    self.labelRetry.numberOfLines = 0
    self.labelRetry.textColor = .black
    self.retryButton.setTitle("Tentar novamente", for: .normal)
    self.retryButton.backgroundColor = UIColor(red:0.00, green:0.46, blue:0.97, alpha:1.0)
    self.retryButton.addTarget(self, action: #selector(fetchPhotos), for: .touchUpInside)
    self.self.viewRetry.isHidden = true
  }
  
  func setContrainsInElemens() {
    self.segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.segmentedControl.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 15),
      self.segmentedControl.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15),
      self.segmentedControl.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -15),
      self.segmentedControl.heightAnchor.constraint(equalToConstant: 50)
      ])
    self.collectionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.collectionView.topAnchor.constraint(equalTo: self.segmentedControl.bottomAnchor, constant: 15),
      self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
      self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0),
      self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
      ])
    self.loaderStackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.loaderStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      self.loaderStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
      self.loaderStackView.heightAnchor.constraint(equalToConstant: 100)
      ])
    self.viewRetry.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.viewRetry.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      self.viewRetry.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
      self.viewRetry.heightAnchor.constraint(equalToConstant: 170),
      self.viewRetry.widthAnchor.constraint(equalToConstant: 250)
      ])
    self.labelRetry.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.labelRetry.topAnchor.constraint(equalTo: self.viewRetry.topAnchor, constant: 0),
      self.labelRetry.leftAnchor.constraint(equalTo: self.viewRetry.leftAnchor, constant: 0),
      self.labelRetry.rightAnchor.constraint(equalTo: self.viewRetry.rightAnchor, constant: 0),
      self.labelRetry.bottomAnchor.constraint(equalTo: self.retryButton.topAnchor, constant: 0)
      ])
    self.retryButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.retryButton.topAnchor.constraint(equalTo: self.labelRetry.bottomAnchor, constant: 15),
      self.retryButton.leftAnchor.constraint(equalTo: self.viewRetry.leftAnchor, constant: 0),
      self.retryButton.rightAnchor.constraint(equalTo: self.viewRetry.rightAnchor, constant: 0),
      self.retryButton.bottomAnchor.constraint(equalTo: self.viewRetry.bottomAnchor, constant: 0),
      self.retryButton.heightAnchor.constraint(equalToConstant: 70)
      ])
  }
  
}

// MARK: Methods of PhotoListViewControllerProtocol
extension PhotoListViewController: PhotoListViewControllerProtocol {
  
  @objc func fetchPhotos() {
    self.viewRetry.isHidden = true
    self.collectionView.isHidden = true
    self.presenter?.fetchPhotos(segmentIndex: self.segmentedControl.selectedSegmentIndex)
  }
  
  func reloadPhotos(photos: [PhotoView]) {
    self.photos = photos
    self.collectionView.reloadData()
    self.collectionView.isHidden = false
  }
  
  func errorFound() {
    self.collectionView.isHidden = true
    self.viewRetry.isHidden = false
  }
  
}


// MARK: Methods of UICollectionViewDataSource and UICollectionViewDelegate
extension PhotoListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.photos.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoListCell", for: indexPath) as? PhotoListCell {
      cell.setup(photo: self.photos[indexPath.row])
      return cell
    }
    return UICollectionViewCell()
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    self.presenter?.didSelectPhoto(photo: self.photos[indexPath.row])
  }
  
}

// MARK: Methods of UICollectionViewDelegateFlowLayout
extension PhotoListViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = ((self.collectionView.frame.width / 2) - 22.5)
    let height = (width * 1.5)
    return CGSize(width: width, height: height)
  }
  
}
