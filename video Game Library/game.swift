//
//  game.swift
//  video Game Library
//
//  Created by Kirk Brown on 9/10/18.
//  Copyright © 2018 Kirk Brown. All rights reserved.
//

import Foundation

class Game {
    var title: String
    var checkedIn : Bool = true
    var dueDate: Date?
    init(title: String,dueDate: Date? ) {
        self.title = title
    
    }
}
