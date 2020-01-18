//
//  UserDetails.swift
//  breakpoint
//
//  Created by Tomek Klocek on 2020-01-01.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import UIKit

class UserDetails {
    
    private var _image: UIImage?
    private var _description: String
    
    var image: UIImage? {
        return _image
    }
    
    var description: String {
        return _description
    }
    
    init(image: UIImage?, description: String) {
        self._image = image
        self._description = description
    }
    
}
