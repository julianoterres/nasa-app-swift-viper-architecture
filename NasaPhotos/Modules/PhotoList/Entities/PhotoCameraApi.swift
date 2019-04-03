//
//  PhotoCameraApi.swift
//  NasaPhotos
//
//  Created by Juliano Terres on 01/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

struct PhotoCameraApi: Decodable {
  let id: Int?
  let rover_id: Int?
  let full_name: String?
  let name: String?
}
