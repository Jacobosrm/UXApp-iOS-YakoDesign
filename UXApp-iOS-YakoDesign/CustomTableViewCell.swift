//
//  CustomTableViewCell.swift
//  UXApp-iOS-YakoDesign
//
//  Created by Jacobo Ramirez on 9/01/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var customCellTitleLabel: UILabel!
    @IBOutlet weak var customCellAutorLabel: UILabel!
    @IBOutlet weak var customCellDayLabel: UILabel!
    @IBOutlet weak var customCellImageView: UIImageView!{
        didSet{
            customCellImageView.layer.cornerRadius = 10
            customCellImageView.clipsToBounds = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
