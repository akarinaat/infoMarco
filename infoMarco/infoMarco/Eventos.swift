//
//  Eventos.swift
//  infoMarco
//
//  Created by Karina Amador Teran on 21/04/21.
//

import UIKit

class Evento: NSObject {
    var titulo: String = ""
    var descripcion: String = ""
    var foto: UIImage!
    var boton: UIButton!
 
    
    init(titulo: String,descripcion: String, foto: UIImage!, boton: UIButton!){
        
        self.titulo = titulo
        self.descripcion = descripcion
        self.foto = foto
        self.boton = boton
        
    }
}
