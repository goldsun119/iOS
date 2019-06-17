//
//  ScrollViewContainer.swift
//  Ratings
//
//  Created by kpugame on 2019. 4. 11..
//  Copyright © 2019년 kpugame. All rights reserved.
//

import UIKit

class ScrollViewContainer: UIView {

    @IBOutlet var scrollView: UIScrollView!
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        if let theView = view{
            if theView == self{
                return scrollView
            }
        }
        return view
    }

}
