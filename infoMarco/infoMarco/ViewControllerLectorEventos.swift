//
//  ViewControllerLectorEventos.swift
//  infoMarco
//
//  Created by Gerardo Ángeles Hernández on 22/04/21.
//

import UIKit
import FirebaseDatabase

struct Registro {
    var ID: String!
    var userID: String!
    var eventID: String!
    var numBoletosRequeridos: String!
}

class ViewControllerLectorEventos: UIViewController {
    
    @IBOutlet weak var tfQRCode: UITextField!
    @IBOutlet weak var lbEventoName: UILabel!
    @IBOutlet weak var buttonVery: UIButton!
    
    var qrCodeString: String!
    var nombreEvento = ""
    var ref: DatabaseReference?
    var userID: String!
    var eventID: String!
    var numBoletosRequeridos: Int!
    var boolean = false
    
    var regArr = [Registro]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbEventoName.text = nombreEvento
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func unwindToLectorEventosScreen(segue: UIStoryboardSegue){
        
        tfQRCode.text = qrCodeString!
        
    }
    
    @IBAction func qrVerify(_ sender: Any) {
        boolean = false
        qrCodeString = tfQRCode.text
        ref = Database.database().reference().child("reservaciones")
        ref?.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount>=0{
                for reservacion in snapshot.children.allObjects as! [DataSnapshot] {
                    let reserObj = reservacion.value as? [String:String]
                    let IDS = reservacion.key
                    let userIDObj = reserObj?["userID"]
                    let eventIDObj = reserObj?["eventID"]
                    let numBolObj = reserObj?["numBoletosRequeridos"]
                    let registro = Registro.init(ID: IDS, userID: userIDObj, eventID: eventIDObj, numBoletosRequeridos: numBolObj)
                    self.regArr.append(registro)
                }
            }
        })
        buttonVery.backgroundColor = UIColor.green
    }
    
    @IBAction func botonVerificar(_ sender: UIButton) {
        
        
        
    }
    

    // MARK: - Navigation

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         
         if segue.identifier == "accesoOrNot" {
             
             let vistaAccessOrNot = segue.destination as!  AccesoViewController
            vistaAccessOrNot.arrRegistros = regArr
            vistaAccessOrNot.StringCompare = qrCodeString
            
             
         }
         
     }

}
