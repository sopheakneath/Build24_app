//
//  ABCViewController.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 2/12/22.
//

import UIKit
import RxCocoa
import RxSwift
import Resolver

class SearchViewController: BaseVC , UITableViewDelegate, UISearchResultsUpdating, UISearchBarDelegate {
   
    
    @Injected var searchModel: SearchViewModel
    
    @IBOutlet weak var tableView: UITableView!
    
    var searchControll = UISearchController(searchResultsController: nil )
    var searchResult  = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTabelView()
        BackButton(var: .orange)
        navigationItem.titleView = searchControll.searchBar
        searchControll.searchResultsUpdater = self
        
    
    }
    
   

    private func setupTabelView() {
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        let nib = UINib(nibName: "SearchTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SearchTableViewCell")
       
        searchModel.list()
            .bind(to: tableView.rx.items(cellIdentifier: "SearchTableViewCell" , cellType: SearchTableViewCell.self)){
                (row, item , cell) in
                cell.cellSetup(with: item)
            }.disposed(by: disposeBag)
        
    }
    
    

    func updateSearchResults(for searchController: UISearchController) {

        if  let text = searchController.searchBar.text , !text.isEmpty {
            
           print(text)
            if   searchController.searchBar.returnKeyType == UIReturnKeyType.search {
                let vc = ProductDetailVC.instantiate()
                show(vc, sender: text)
            }
          
//            searchController.searchBar.enablesReturnKeyAutomatically = false
//            searchController.searchBar.returnKeyType = UIReturnKeyType.search
//                    searchController.isActive = false
//                    searchController.searchBar.placeholder = "Search poetry, lyrics, arias ..."
//                    searchController.definesPresentationContext = true
//                    searchController.searchBar.delegate = self
//                    navigationItem.searchController = searchController
//                    navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            print("enter text")
        }


    }
    
}

// search result
// recent search
// replace search editing
// no data -> clear search history

