//
//  Message.swift
//  breakpoint
//
//  Created by Tomek Klocek on 2019-12-20.
//  Copyright © 2019 Tomek Klocek. All rights reserved.
//

import Foundation

class Message {
    private var _content: String
    private var _senderId: String
    
    var content: String {
        return _content
    }
    
    var senderId: String {
        return _senderId
    }
    
    init(content: String, senderId: String) {
        self._content = content
        self._senderId = senderId
    }
    
}
