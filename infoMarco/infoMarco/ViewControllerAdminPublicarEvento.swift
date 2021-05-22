//
//  ViewControllerAdminPublicarEvento.swift
//  infoMarco
//
//  Created by user188713 on 5/15/21.
//

import UIKit
import FirebaseDatabase

class ViewControllerAdminPublicarEvento: UIViewController {

    let database = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func regresar(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func publicarButton(_ sender: UIButton) {
        let object: [String: Any] = [ "nombre": "Vida de Frida Kahlo",
                                      "descripcion": "La emocionante vida de esta mujer"
        ]
        database.child("Evento 1").setValue(object)
        
        
    }
    // LA VISTA NO ES MODAL, NO ES NECESARIO UN UNWIND
    // Aunque puedo equivocarme, sería revoltoso visualmente hablando
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
