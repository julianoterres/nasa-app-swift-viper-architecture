
import UIKit

// MARK: Methods of PhotoListViewController

class PhotoListViewController: UIViewController {
  
  // MARK: Elements of class
  private let segmentedControl = UISegmentedControl(items: [ProbeEnun.curiosity.rawValue, ProbeEnun.opportunity.rawValue, ProbeEnun.spirit.rawValue])
  private let collectionViewLayout = UICollectionViewFlowLayout()
  private var collectionView: UICollectionView!
  private let loader = UIActivityIndicatorView()
  
  // MARK: Variables of class
  private let presenter: PhotoListPresenterProtocolOutput
  private var photos = [PhotoEntityView]()
  
  // MARK: Methods of init
  
  init(presenter: PhotoListPresenterProtocolOutput) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
    self.presenter.viewController = self
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("\(#file) \(#function) not implemented")
  }
  
  // MARK: Methods of life cicle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.createElements()
    self.configElements()
    self.setContrainsInElemens()
    self.fetchPhotos()
  }
  
  // MARK: Methods of class
  
  private func createElements() {
    self.collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
    self.view.addSubview(self.loader)
    self.view.addSubview(self.segmentedControl)
    self.view.addSubview(self.collectionView)
    
  }
  
  private func configElements() {
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
    self.loader.color = .black
    self.loader.startAnimating()
  }
  
  private func setContrainsInElemens() {
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
      self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
    ])
    self.loader.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.loader.topAnchor.constraint(equalTo: self.segmentedControl.bottomAnchor, constant: 0),
      self.loader.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
      self.loader.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0),
      self.loader.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
    ])
  }
  
  @objc func fetchPhotos() {
    if let title = self.segmentedControl.titleForSegment(at: self.segmentedControl.selectedSegmentIndex) {
      self.showLoader(status: true)
      self.presenter.fetchPhotos(probe: title)
    }
  }
  
  func showLoader(status: Bool) {
    self.collectionView.isHidden = status
    if status {
      self.loader.startAnimating()
    }
  }
  
}

// MARK: Methods of PhotoListViewControllerProtocol

extension PhotoListViewController: PhotoListViewControllerProtocol {
  
  func reloadPhotos(photos: [PhotoEntityView]) {
    self.photos = photos
    self.collectionView.reloadData()
    self.showLoader(status: false)
  }
  
  func error(message: String) {
    self.showLoader(status: false)
    let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alertViewController.addAction(UIAlertAction(title: "OK", style: .default))
    self.present(alertViewController, animated: true, completion: nil)
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

