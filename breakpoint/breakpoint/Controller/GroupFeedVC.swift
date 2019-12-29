//
//  GroupFeedVC.swift
//  breakpoint
//
//  Created by Tomek Klocek on 2019-12-29.
//  Copyright © 2019 Tomek Klocek. All rights reserved.
//

import UIKit

class GroupFeedVC: UIViewController {

    // Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var membersLbl: UILabel!
    @IBOutlet weak var sendBtnView: UIView!
    @IBOutlet weak var messageTextField: InsetTextField!
    @IBOutlet weak var sendBtn: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtnView.bintToKeyboard()
        
    }
    
    @IBAction func sendBtnWasPressed(_ sender: Any) {
    
    
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
