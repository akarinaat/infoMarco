//
//  CustomTableViewCellPromo.swift
//  infoMarco
//
//  Created by Karina Amador Teran on 30/05/21.
//

import UIKit

class CustomTableViewCellPromo: UITableViewCell{
    
    @IBOutlet weak var lbTitulo: UILabel!
    @IBOutlet weak var tvContenido: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

