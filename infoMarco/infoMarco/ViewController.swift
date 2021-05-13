//
//  ViewController.swift
//  infoMarco
//
//  Created by Karina Amador Teran on 19/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfContrasena: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Funcion para validar que los tf tengan datos y que el tf de correo tenga el formato correcto
    func validarCorreoContra(email : String, contra : String) -> Bool {
        
        // Verificar si hay tf vacios
        if email == "" || contra == "" {
            
            // Crear y desplegar alerta
            let alerta = UIAlertController(title: "ERROR", message: "No puedes dejar campos en blanco", preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alerta.addAction(accion)
            present(alerta, animated: true, completion: nil)
            
            return false
            
        } else { // Verificar formato del correo escrito usando Regex
        
            let emailREx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-}]+\\.[A-Za-z]{2,64}"
            
            let predicate = NSPredicate(format: "SELF MATCHES %@", emailREx)
            
            if predicate.evaluate(with: email) {
                
                return true
                
            } else {
            
                // Crear y desplegar alerta
                let alerta = UIAlertController(title: "ERROR", message: "Formato de correo inaceptable", preferredStyle: .alert)
                let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alerta.addAction(accion)
                present(alerta, animated: true, completion: nil)
                
                return false
                
            }
        }
    }
    
    // MARK: - Navigation
    
    // Evitar ejecucion de segue validando si se escribe un correo valido y una contrasenia
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if validarCorreoContra(email: tfEmail.text!, contra: tfContrasena.text!){
            
            print("Valido") // Imprimir si el correo es valido
            return true
            
        } else {
            
            print("Invalido") // Imprimir si el correo NO es valido
            return false
            
        }
    }
}

