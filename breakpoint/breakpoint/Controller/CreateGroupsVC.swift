//
//  CreateGroupsVC.swift
//  breakpoint
//
//  Created by Tomek Klocek on 2019-12-23.
//  Copyright © 2019 Tomek Klocek. All rights reserved.
//

import UIKit

class CreateGroupsVC: UIViewController {

    // Outlets
    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var groupMemberLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var doneBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func doneBtnWasPressed(_ sender: Any) {
    
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
    
    }
    


}
