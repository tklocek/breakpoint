//
//  InsertTextView.swift
//  breakpoint
//
//  Created by Tomek Klocek on 2020-01-01.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import UIKit

class InsetTextView: UITextView {

    private var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)

    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      textContainerInset = padding
    }
    
}
