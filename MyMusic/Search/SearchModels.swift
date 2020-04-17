//
//  SearchModels.swift
//  MyMusic
//
//  Created by Роман Лабунский on 29/02/2020.
//  Copyright (c) 2020 Роман Лабунский. All rights reserved.
//

import UIKit

enum Search {
   
  enum Model {
    struct Request {
      enum RequestType {
        case some
        case getTrack(searchTerm: String)
      }
    }
    struct Response {
      enum ResponseType {
        case some
        case presentTracks(searchResponse: SearchResponse)
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case some
        case displayTracks
      }
    }
  }
  
}
