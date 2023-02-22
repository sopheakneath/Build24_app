//
//  CategoryProductPost.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 20/12/22.
//

import UIKit
import RxSwift
import Resolver
//import RxCocoa

class CategoryProductPostVC: BaseVC, UITableViewDelegate , UITableViewDataSource {
  
   // @Injected var viewModel : CategoryProductPostViewModel
    @Injected var viewModel : CategoryViewModel
    @Injected var mockData : CategoryProductPostViewModel
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "CategoryPostTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CategoryPostTableViewCell")
        getData()
       
        view.backgroundColor = .red
    }
    
    private func getData() {
        viewModel.fetchList()
             .observe(on: MainScheduler.instance)
             .subscribe{ list in
                 self.viewModel.categorylist = list
                 print("DATA: \(self.viewModel.categorylist)")
                 self.tableView.reloadData()
             }.disposed(by: disposeBag)
     }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
       return viewModel.categorylist.count
        //return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"CategoryPostTableViewCell" , for: indexPath) as! CategoryPostTableViewCell
//        let category = viewModel.subcategorylist[indexPath.item]
//        cell.setUpData(with: category)
        cell.setUpData(with: viewModel.categorylist[indexPath.item])
        cell.didPressed = { [weak self] in
            let storyboard = UIStoryboard(name: "FormPost", bundle: nil)
            let formPost = storyboard.instantiateViewController(withIdentifier: "FormPostVC") as! FormPostVC
            formPost.hidesBottomBarWhenPushed = true
            self?.show(formPost, sender: nil)
        }
        
        print("COUNT: \(self.viewModel.categorylist)")
        print("2222: \(self.viewModel.categorylist)")
        return cell
    }

}

