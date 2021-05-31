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
    @IBOutlet weak var buttonVeryBoleto: UIButton!
    
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
        buttonVeryBoleto.isEnabled = false
        
    }
    
    @IBAction func unwindToLectorEventosScreen(segue: UIStoryboardSegue){
        
        tfQRCode.text = qrCodeString!
        
    }
    
    @IBAction func qrVerify(_ sender: UIButton) {
        boolean = false
        sender.setTitleColor(UIColor.green, for: .normal)
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
        buttonVeryBoleto.isEnabled = true
    }
    
    
    @IBAction func quitarTeclado(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
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
