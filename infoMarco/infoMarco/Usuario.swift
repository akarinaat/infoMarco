//
//  Usuario.swift
//  infoMarco
//
//  Created by user188713 on 5/26/21.
//

import UIKit

class Usuario: NSObject {
    
    var ID_Miembro : String
    var ID_CAT : String
    var sNombres : String
    var sApellidos : String
    var sCategoria : String
    var sEmail : String
    var sFecha_Ing : String
    var sMiembro_Desde : String
    var sFecha_Ven : String
    
    init(ID_Miembro : String, ID_CAT : String, sNombres : String, sApellidos : String, sCategoria : String, sEmail : String, sFecha_Ing : String, sMiembro_Desde : String, sFecha_Ven : String) {
        
        self.ID_Miembro = ID_Miembro
        self.ID_CAT = ID_CAT
        self.sNombres = sNombres
        self.sApellidos = sApellidos
        self.sCategoria = sCategoria
        self.sEmail = sEmail
        self.sFecha_Ing = sFecha_Ing
        self.sMiembro_Desde = sMiembro_Desde
        self.sFecha_Ven = sFecha_Ven
        
    }
}
