//
//  SceneryCell.swift
//  Project 11 - StretchyHeader
//
//  Created by 陈炯 on 16/9/13.
//  Copyright © 2016年 Jiong. All rights reserved.
//

import UIKit

struct Scenery {
    
    let image: String
    let name: String
    let summary: String
    let nameColor: UIColor
    
    init(image: String, name: String, summary: String, nameColor: UIColor) {
        
        self.image = image
        self.name = name
        self.summary = summary
        self.nameColor = nameColor
    }
}

class SceneryCell: UITableViewCell {
    
    @IBOutlet weak var sceneImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
