//
//  ApiTestVC.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 19/12/22.
//

import UIKit
import SDWebImage
import Resolver
import RxSwift
import RxCocoa

class ApiTestVC: BaseVC , UITableViewDelegate , UITableViewDataSource{
    
    

    @IBOutlet weak var tableView: UITableView!
    //  let viewModel = PhotoViewModel(coder: DataService)
    @Injected var viewModel : CategoryViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categorylist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

//    private func attemptFetchPhoto(withId id: Int) {
//           viewModel.fetchPhoto(withId: id)
//
//           viewModel.updateLoadingStatus = {
//               let _ = self.viewModel.isLoading ? self.activityIndicatorStart() : self.activityIndicatorStop()
//           }
//
//           viewModel.showAlertClosure = {
//               if let error = self.viewModel.error {
//                   print(error.localizedDescription)
//               }
//           }
//
//           viewModel.didFinishFetch = {
//               self.titleLabel.text = self.viewModel.titleString
//               self.subtitleLabel.text = self.viewModel.albumIdString
//
//           }
//       }
//
//       // MARK: - UI Setup
//       private func activityIndicatorStart() {
//           // Code for show activity indicator view
//           // ...
//           print("start")
//       }
//
//       private func activityIndicatorStop() {
//           // Code for stop activity indicator view
//           // ...
//           print("stop")
//       }
}
