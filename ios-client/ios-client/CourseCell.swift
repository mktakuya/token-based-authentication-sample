//
//  CourseCell.swift
//  ios-client
//
//  Created by Takuya Mukohira on 2018/07/18.
//  Copyright © 2018年 Takuya Mukohira. All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell {
    @IBOutlet weak var nameAndInstructorLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var creditLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
