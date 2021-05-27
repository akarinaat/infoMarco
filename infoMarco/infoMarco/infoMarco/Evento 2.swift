//
//  Evento.swift
//  infoMarco
//
//  Created by Gerardo Ángeles Hernández on 22/05/21.
//

import UIKit

class Evento: NSObject {

    var iD : String
    var titulo : String
    var contenido : String
    var imagen : UIImage

    init(iD : String, titulo : String, contenido : String, imagen : UIImage){

        self.iD = iD
        self.titulo = titulo
        self.contenido = contenido
        self.imagen = imagen

    }
}
