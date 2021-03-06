//
//  SearchViewController.swift
//  MyMusic
//
//  Created by Роман Лабунский on 29/02/2020.
//  Copyright (c) 2020 Роман Лабунский. All rights reserved.
//

import UIKit

protocol SearchDisplayLogic: class {
  func displayData(viewModel: Search.Model.ViewModel.ViewModelData)
}

class SearchViewController: UIViewController, SearchDisplayLogic {

  var interactor: SearchBusinessLogic?
  var router: (NSObjectProtocol & SearchRoutingLogic)?
    
    
    @IBOutlet weak var table: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
  
  // MARK: Setup
  
  private func setup() {
    let viewController        = self
    let interactor            = SearchInteractor()
    let presenter             = SearchPresenter()
    let router                = SearchRouter()
    viewController.interactor = interactor
    viewController.router     = router
    interactor.presenter      = presenter
    presenter.viewController  = viewController
    router.viewController     = viewController
  }
  
  // MARK: Routing
  

  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    
    setupTableView()
    setupSearchBar()
  }
    
    private func setupSearchBar() {
           navigationItem.searchController = searchController
           navigationItem.hidesSearchBarWhenScrolling = false
           searchController.searchBar.delegate = self
       }
    
    private func setupTableView() {
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }
  
  func displayData(viewModel: Search.Model.ViewModel.ViewModelData) {
    
    switch viewModel {
    case .some:
        print("viewModel .some")
    case .displayTracks:
         print("viewModel .displayTracks")
    }
  }
  
}
    // MARK: UITableViewDelegate, UITableViewDataSource

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = "indexPath \(indexPath)"
        return cell
    }
    
    
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        interactor?.makeRequest(request: Search.Model.Request.RequestType.getTrack(searchTerm: searchText))
    }
}
