//
//  SearchInteractor.swift
//  MyMusic
//
//  Created by Роман Лабунский on 29/02/2020.
//  Copyright (c) 2020 Роман Лабунский. All rights reserved.
//

import UIKit

protocol SearchBusinessLogic {
  func makeRequest(request: Search.Model.Request.RequestType)
}

class SearchInteractor: SearchBusinessLogic {

    var networcService = NetworkService()
  var presenter: SearchPresentationLogic?
  var service: SearchService?
  
  func makeRequest(request: Search.Model.Request.RequestType) {
    if service == nil {
      service = SearchService()
    }
    
    switch request {
    case .some:
        print("interacton .some")
        presenter?.presentData(response: Search.Model.Response.ResponseType.some)
    case .getTrack(let searchTerm):
        print("interactor .getTrack")
        networcService.fetchTracks(searchText: searchTerm) { [weak self] (searchResponse) in
            self?.presenter?.presentData(response: Search.Model.Response.ResponseType.presentTracks(searchResponse: searchResponse!))

        }
      }
    }
}
