//
//  Player.swift
//  Ratings
//
//  Created by kpugame on 2019. 3. 28..
//  Copyright © 2019년 kpugame. All rights reserved.
//

import UIKit

struct Player {
    var name: String?
    var game: String?
    var rating: Int
    
    init(name: String?, game: String?, rating: Int) {
        self.name = name
        self.game = game
        self.rating = rating
    }
}
