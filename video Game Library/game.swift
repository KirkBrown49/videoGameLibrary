//
//  game.swift
//  video Game Library
//
//  Created by Kirk Brown on 9/10/18.
//  Copyright © 2018 Kirk Brown. All rights reserved.
//

import Foundation

class Game {
    let title: String
    var checkedIn : Bool = true
    var dueDate: Date?
    
    init(title: String) {
        self.title = title
    }
}
