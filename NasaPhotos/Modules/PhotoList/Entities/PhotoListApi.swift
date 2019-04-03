//
//  PhotoListApi.swift
//  NasaPhotos
//
//  Created by Juliano Terres on 01/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

struct PhotoListApi: Decodable {
  let photos: [PhotoApi]
}
