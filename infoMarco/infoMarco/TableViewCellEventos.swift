//
//  TableViewCellEventos.swift
//  infoMarco
//
//  Created by Luis Mario Trujillo on 17/05/21.
//

import UIKit

class TableViewCellEventos: UITableViewCell {

    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var lbTitulo: UILabel!
    @IBOutlet weak var lbContenido: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
