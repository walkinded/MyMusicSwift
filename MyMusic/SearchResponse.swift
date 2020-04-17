//
//  SearchResponse.swift
//  MyMusic
//
//  Created by Роман Лабунский on 22/02/2020.
//  Copyright © 2020 Роман Лабунский. All rights reserved.
//

import Foundation

struct SearchResponse: Decodable {
    var resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
    var trackName: String
    var collectionName: String?
    var artistName: String
    var artworkUrl100: String?
}
