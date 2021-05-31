//
//  AccesoViewController.swift
//  infoMarco
//
//  Created by Gerardo Ángeles Hernández on 26/05/21.
//

import UIKit

class AccesoViewController: UIViewController {

    @IBOutlet weak var YesOrNo: UILabel!
    @IBOutlet weak var userID: UILabel!
    @IBOutlet weak var eventID: UILabel!
    @IBOutlet weak var numBol: UILabel!
    @IBOutlet weak var imgAccess: UIImageView!
    
    var arrRegistros = [Registro]()
    var StringCompare: String!
    var boolean: Bool!
    var eventIDString: String!
    var userIDString: String!
    var numBoletos: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boolean = false
        print (arrRegistros.count)
        for reg in arrRegistros {
            if reg.ID == StringCompare{
                boolean = true
                userIDString = reg.userID
                eventIDString = reg.eventID
                numBoletos = reg.numBoletosRequeridos
            }
        }
        
        if boolean {
            YesOrNo.text = "Acceso Consedido"
            userID.text = userIDString
            eventID.text = eventIDString
            numBol.text = numBoletos
            imgAccess.image = UIImage(named: "green")
        } else {
            YesOrNo.text = "Acceso DENEGADO"
            userID.text = "No usuario registrado"
            eventID.text = "No registro"
            numBol.text = "0"
            imgAccess.image = UIImage(named: "red")
        }
        
        // Do any additional setup after loading the view.
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }

    // MARK: - Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//
//        }
//
//    }

}
