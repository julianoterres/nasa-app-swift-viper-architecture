//
//  DictionaryExtension.swift
//  NasaPhotos
//
//  Created by Juliano Terres on 02/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//


import Foundation

extension Dictionary {
  
  mutating func merge(dict: [Key: Value]){
    for (k, v) in dict {
      updateValue(v, forKey: k)
    }
  }
  
}
