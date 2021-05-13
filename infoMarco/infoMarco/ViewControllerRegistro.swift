//
//  ViewControllerRegistro.swift
//  infoMarco
//
//  Created by Karina Amador Teran on 04/05/21.
//

import UIKit
import Firebase

class ViewControllerRegistro: UIViewController {
    
    
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfContrasena: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registrarse(_ sender: Any) {
        

        Auth.auth().createUser(withEmail: tfEmail.text!, password: tfContrasena.text!) { authResult, error in
          
            if let e = error {
//                AQUÍ PONER EL POP OVER
                print (e.localizedDescription)
            } else {
//                Ir a la página de eventos: viewControllerEventos
                self.performSegue(withIdentifier: "registroApp", sender: self)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
