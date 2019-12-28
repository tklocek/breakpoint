//
//  GroupCell.swift
//  breakpoint
//
//  Created by Tomek Klocek on 2019-12-29.
//  Copyright © 2019 Tomek Klocek. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var groupDescLbl: UILabel!
    @IBOutlet weak var memberCountLbl: UILabel!
    
    func configureCell(title: String, description: String, memberCount: Int){
        self.groupTitleLbl.text = title
        self.groupDescLbl.text = description
        self.memberCountLbl.text = "\(memberCount) members."
    }
}
