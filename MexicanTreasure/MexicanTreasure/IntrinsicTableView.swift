//
//  SelfSizedTableView.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 7/19/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

//Thank you Dushyant Bansal: https://medium.com/@dushyant_db/swift-4-recipe-self-sizing-table-view-2635ac3df8ab


import UIKit

class IntrinsicTableView: UITableView {
    
    class IntrinsicTableView: UITableView {
        
        override var contentSize:CGSize {
            didSet {
                self.invalidateIntrinsicContentSize()
            }
        }
        
        override var intrinsicContentSize: CGSize {
            self.layoutIfNeeded()
            return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
        }
        
    }
    
}
