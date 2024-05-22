//
//  GymDetalisTblCell.swift
//  FitFlex
//
//  Created by Mac on 27/06/23.
//

import UIKit

class GymDetalisTblCell: UITableViewCell {

    @IBOutlet weak var exersiceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
