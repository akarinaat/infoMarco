//
//  ViewController.swift
//  infoMarco
//
//  Created by Karina Amador Teran on 19/04/21.
//

import UIKit
import Firebase


class ViewController: UIViewController {
    
//    Este es el view controller del login
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfContrasena: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func loginPressed(_ sender: Any) {
        if let email = tfEmail.text, let password = tfContrasena.text{
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
//                AQUI EL POP OVER
                if let e = error {
                    print (e)
                } else {
                    self.performSegue(withIdentifier: "loginApp", sender: self)
                }
              // ...
            }
        }
        
        
        
    }
    
    
    
}

 
