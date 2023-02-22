//
//  NotificationVC.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 22/11/22.
// UICollectionViewDelegateFlowLayout

import UIKit
import Resolver
//import RxSwift
//import RxCocoa

class NotificationVC: BaseVC , UITableViewDelegate {
   
    @Injected var viewModel: NotificationViewModel
    
    @IBOutlet var headerRight: [UIImageView]!
    
    @IBOutlet weak var tableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refreshData), for:.valueChanged)
        tableView.refreshControl?.tintColor = UIColor.orange
    }
   
    @objc func refreshData(){
        tableView.refreshControl?.endRefreshing()
        print("loading")
    }
    
    private func setupTableView() {
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        let nib = UINib(nibName: "NotificationListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "notificationid")
        
        viewModel.list()
            .bind(to: tableView.rx.items(cellIdentifier: "notificationid", cellType: NotificationListTableViewCell.self)){ (row, item, cell) in
                cell.setupCell(with: item)
            }.disposed(by: disposeBag)
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("123")
        // go to detail of notification
    }
    
}
