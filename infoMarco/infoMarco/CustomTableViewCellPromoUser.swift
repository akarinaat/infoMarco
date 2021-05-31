//
//  CustomTableViewCellPromoUser.swift
//  infoMarco
//
//  Created by Karina Amador Teran on 30/05/21.
//

//
//
//
import UIKit

class CustomTableViewCellPromoUser: UITableViewCell{
    
    
    @IBOutlet weak var lbTitulo: UILabel!
    @IBOutlet weak var tvContenido: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)
         
       }
}
