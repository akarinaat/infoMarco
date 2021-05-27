//
//  CustomTableViewCellNoticias.swift
//  infoMarco
//
//  Created by Karina Amador Teran on 27/05/21.
//

import UIKit

class CustomTableViewCellNoticias: UITableViewCell{
    
    
    @IBOutlet weak var lbTitulo: UILabel!
    
    @IBOutlet weak var lbFecha: UILabel!
    
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
