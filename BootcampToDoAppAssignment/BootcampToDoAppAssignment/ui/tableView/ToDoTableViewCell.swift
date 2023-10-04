//
//  ToDoTableViewCell.swift
//  BootcampToDoAppAssignment
//
//  Created by furkan sakız on 1.10.2023.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var labelToDoTitle: UILabel!
    @IBOutlet weak var labelToDoText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
