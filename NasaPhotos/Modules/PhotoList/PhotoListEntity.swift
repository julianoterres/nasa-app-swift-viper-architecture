
import Foundation

struct PhotoListEntityApi: Decodable {
  let photos: [PhotoEntityApi]
}

struct PhotoEntityApi: Decodable {
  let sol: Int?
  let id: Int?
  let earth_date: String?
  let camera: PhotoCameraEntityApi?
  let img_src: String?
}

struct PhotoCameraEntityApi: Decodable {
  let id: Int?
  let rover_id: Int?
  let full_name: String?
  let name: String?
}

struct PhotoEntityView {
  let urlImage: String?
  let cameraName: String?
}
