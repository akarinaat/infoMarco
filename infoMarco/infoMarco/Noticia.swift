//
//  Noticia.swift
//  infoMarco
//
//  Created by Luis Mario Trujillo on 17/05/21.
//

import UIKit

class Noticia: NSObject {
    var titulo: String
    var descripcion: String
    var foto : UIImage!
        
    init(titulo: String, descripcion: String, foto: UIImage!) {
        self.titulo = titulo
        self.descripcion = descripcion
        self.foto = foto
    }
    
}
