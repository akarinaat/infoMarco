//
//  Evento.swift
//  infoMarco
//
//  Created by Gerardo Ángeles Hernández on 17/05/21.
//

import UIKit

class Evento: NSObject {
    
//    var iD : String
    var titulo : String
    var contenido : String
//    var imagen : UIImage
    
    init(titulo : String, contenido : String){
        
//        self.iD = iD
        self.titulo = titulo
        self.contenido = contenido
//        self.imagen = imagen
        
    }
}
