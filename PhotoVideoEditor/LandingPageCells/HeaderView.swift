//
//  HeaderView.swift
//  PhotoVideoEditor
//
//  Created by Даниил on 13.09.2018.
//  Copyright © 2018 Даниил. All rights reserved.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var sectionTitleLabel: UILabel!
    @IBOutlet weak var dividerView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    
    static var identifier = "HeaderView"
    fileprivate let startColor = UIColor(red: 101 / 255, green: 134 / 255, blue: 255 / 255, alpha: 1)
    fileprivate let endColor = UIColor(red: 158 / 255, green: 80 / 255, blue: 243 / 255, alpha: 1)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dividerView.applyGradient(colours: [startColor,endColor])
    }
}
