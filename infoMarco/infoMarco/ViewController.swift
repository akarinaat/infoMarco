//
//  ViewController.swift
//  infoMarco
//
//  Created by Karina Amador Teran on 19/04/21.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfContrasena: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func registrarse(_ sender: Any) {
        Auth.auth().createUser(withEmail: tfEmail.text!, password: tfContrasena.text!) { authResult, error in
          
            if let e = error{
                print (e)
            } else {
//                Ir a la página de eventos: viewControllerEventos
                self.performSegue(withIdentifier: "registroApp", sender: self)
            }
        }
    }
    
}

 
