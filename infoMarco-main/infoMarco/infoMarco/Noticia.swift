//
//  Noticia.swift
//  infoMarco
//
//  Created by Karina Amador Teran on 27/05/21.
//

import UIKit

class Noticia: NSObject {
    
//    var iD : String
    var titulo : String
    var fecha : String
    var contenido : String
    
    init(titulo : String, fecha : String, contenido : String){
        
//        self.iD = iD
        self.titulo = titulo
        self.fecha = fecha
        self.contenido = contenido
        
    }
}

