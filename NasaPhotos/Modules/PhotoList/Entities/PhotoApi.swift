
import Foundation

struct PhotoApi: Decodable {
  let sol: Int?
  let id: Int?
  let earth_date: String?
  let camera: PhotoCameraApi?
  let img_src: String?
}
