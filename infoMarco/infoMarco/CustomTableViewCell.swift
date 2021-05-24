//
//  CustomTableViewCell.swift
//  infoMarco
//
//  Created by Gerardo Ángeles Hernández on 23/05/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbTitulo: UILabel!
    @IBOutlet weak var tvContenido: UITextView!
    @IBOutlet weak var imgEvento: UIImageView!
    @IBOutlet weak var lbCodigo: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
  
    
}


