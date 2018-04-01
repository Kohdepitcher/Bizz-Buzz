//
//  fizzBuzzCell.swift
//  Bizz-Buzz
//
//  Created by Kohde Pitcher on 21/9/17.
//  Copyright © 2017 Kohde Pitcher. All rights reserved.
//

import UIKit

class fizzBuzzCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var fizzBuzzCell: UILabel!
    
    /*func setCellText(text: fizzBuzzObj) {
        fizzBuzzCell.text = fizzBuzzObj.
    }*/
}
