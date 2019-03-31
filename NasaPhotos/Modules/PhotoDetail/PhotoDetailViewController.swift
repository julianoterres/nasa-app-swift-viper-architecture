import UIKit

// MARK: Methods of PhotoDetailViewController

class PhotoDetailViewController: UIViewController {
  
  // MARK: Elements of class
  private let img = UIImageView()
  private let label = UILabel()
  
  // MARK: Variables of class
  var photo: PhotoView?
  
  
  // MARK: Methods of init
  
  init() {
    super.init(nibName: nil, bundle: nil)
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
  }
  
  // MARK: Methods of class
  
  private func createElements() {
    self.view.addSubview(self.label)
    self.view.addSubview(self.img)
  }
  
  private func configElements() {
    self.view.backgroundColor = .white
    let tap = UITapGestureRecognizer(target: self, action: #selector(changeCameraName))
    self.label.text = self.photo?.cameraName ?? ""
    self.label.textAlignment = .left
    self.label.numberOfLines = 0
    self.label.textColor = .black
    self.label.isUserInteractionEnabled = true
    self.label.addGestureRecognizer(tap)
    self.img.contentMode = .scaleAspectFill
    self.img.clipsToBounds = true
    if let urlImage = self.photo?.urlImage, let url = URL(string: urlImage) {
      self.img.kf.setImage(with: url, options: [.transition(.fade(0.2))])
    }
  }
  
  private func setContrainsInElemens() {
    self.label.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.label.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 15),
      self.label.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15),
      self.label.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -15)
    ])
    self.img.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.img.topAnchor.constraint(equalTo: self.label.bottomAnchor, constant: 15),
      self.img.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
      self.img.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0),
      self.img.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
    ])
  }
  
  @objc func changeCameraName() {
    self.label.isUserInteractionEnabled = false
    self.label.text = self.photo?.cameraNameFull ?? ""
  }
  
}
