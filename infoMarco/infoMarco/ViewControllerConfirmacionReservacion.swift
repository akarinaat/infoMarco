//
//  ViewControllerConfirmacionReservacion.swift
//  infoMarco
//
//  Created by Karina Amador Teran on 16/05/21.
//

import UIKit
import FirebaseDatabase

class ViewControllerConfirmacionReservacion: UIViewController {

    var boletos: String!
    var nombreEvento: String!
    var horario: String!
    let database = Database.database().reference()
    
    @IBOutlet weak var lbNoBletos: UILabel!
    @IBOutlet weak var lbNombreEvento: UILabel!
    @IBOutlet weak var lbHorario: UILabel!
    @IBOutlet weak var imagenQR: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbNoBletos.text = boletos
        lbNombreEvento.text = nombreEvento
        lbHorario.text = horario
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func confirmarGenerarQR(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        let confString = defaults.value(forKey: "user") as? String
        imagenQR.image = generarCodigoQR(Name: confString!)
        if let nomEvento = lbNombreEvento.text, let user = defaults.value(forKey: "user") as? String, let numBoletos = lbNoBletos.text{
            let object : [String: Any] = ["userID": user, "eventID": nomEvento, "numBoletosRequeridos": numBoletos]
            self.database.child("reservaciones").childByAutoId().setValue(object)
        }
        
    }
    
    func generarCodigoQR(Name: String) -> UIImage?{
        let data_nombre = Name.data(using:String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator"){
            filter.setValue(data_nombre, forKey: "inputMessage")

            let transform = CGAffineTransform(scaleX: 3, y: 3)
            if let output = filter.outputImage?.transformed(by: transform){
                return UIImage(ciImage: output)
            }

        }
        return nil

    }

}
