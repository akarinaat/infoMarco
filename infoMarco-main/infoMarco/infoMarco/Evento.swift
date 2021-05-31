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
    var fecha : String
    var contenido : String
    var imagen : String
    
    init(titulo : String, fecha : String, contenido : String, imagen : String){
        
//        self.iD = iD
        self.titulo = titulo
        self.fecha = fecha
        self.contenido = contenido
        self.imagen = imagen
        
    }
}
