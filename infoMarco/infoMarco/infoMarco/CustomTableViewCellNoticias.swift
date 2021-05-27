//
//  CustomTableViewCellNoticias.swift
//  infoMarco
//
//  Created by Karina Amador Teran on 26/05/21.
//


import UIKit

class CustomTableViewCellNoticias: UITableViewCell {
    
    @IBOutlet weak var lbTitulo: UILabel!
    @IBOutlet weak var tvContenido: UITextView!
    @IBOutlet weak var lbFecha: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
