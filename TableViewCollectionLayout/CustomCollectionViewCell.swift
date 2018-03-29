//
//  CustomCollectionViewCell.swift
//  TableViewCollectionLayout
//
//  Created by Karlo Pagtakhan on 03/28/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    //MARK:- Static constants
    static let reuseIdentifier = "CustomCollectionViewCell"
    
    //MARK:- Public variables
    var longText = ""
    var shortText = ""
    var mediumText = ""
    var label: UILabel!
    
    //MARK:- Lifecycle methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        addLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addLabel()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 5
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setTextThatFits(width: frame.width)
    }
}

//MARK:- Private methods
private extension CustomCollectionViewCell {
    func setTextThatFits(width: CGFloat) {
        guard label != nil else { return }
        
        label.text = longText
        if label.intrinsicContentSize.width > width {
            label.text = mediumText
            if label.intrinsicContentSize.width > width {
                label.text = shortText
            }
        }
        
        return
    }
    
    func addLabel() {
        label = UILabel()
        label.textColor = .black
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
