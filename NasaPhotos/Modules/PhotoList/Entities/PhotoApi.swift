//
//  PhotoApi.swift
//  NasaPhotos
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

struct PhotoApi: Decodable {
  let sol: Int?
  let id: Int?
  let earth_date: String?
  let camera: PhotoCameraApi?
  let img_src: String?
}
