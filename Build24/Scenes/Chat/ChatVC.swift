//
//  ChatVC.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 22/11/22.
//

import UIKit
import RxSwift
import Resolver
import RxCocoa

class ChatVC: BaseVC , UITableViewDelegate {
    
    
    @IBOutlet weak var segmentView: UISegmentedControl!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var verticalView: UIStackView!
    @IBOutlet weak var TableView: UITableView!
     
    @Injected var viewModel : ChatViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text = "Chat"
        setupTableView()

    }
   
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            headerLabel.text = "Chat"
            
        } else {
            headerLabel.text = "Comment"
            
        }
    }
    
    private func setupTableView() {
        
        let chatNib =  UINib(nibName: "ChatTableViewCell", bundle: nil)
        TableView.register(chatNib, forCellReuseIdentifier: "chatid")
        let commentNib = UINib(nibName: "CommentTableViewCell", bundle: nil)
        TableView.register(commentNib, forCellReuseIdentifier: "commentid")
        TableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        viewModel.list()
            .bind(to: TableView.rx.items(cellIdentifier:"chatid", cellType: ChatTableViewCell.self )) {(row , item ,cell) in
                cell.setupCell(with: item)
            }.disposed(by: disposeBag)
   
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let storyboard = UIStoryboard(name: "ChatDetail", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "ChatDetailVC")
        let vc = ChatDetailVC.instantiate()
        show(vc, sender: nil)
        print("hello")
    }
}
