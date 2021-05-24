//
//  ViewController.swift
//  infoMarco
//
//  Created by Karina Amador Teran on 19/04/21.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfContrasena: UITextField!
    @IBOutlet weak var switchBORRAR: UISwitch!
    
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
    
    // Determinar si se logeará un usuario o un administrador y evitar ejecucion de segue validando si se escribe un correo valido y una contrasenia
    @IBAction func AdminOrUser(_ sender: Any) {
        
        let correo = tfEmail.text!
        let contras = tfContrasena.text!
        
        if !switchBORRAR.isOn{
            
            //if identifier == "LogIn"{
            if validarCorreoContra(email: correo, contra: contras){
                    
                print("Valido") // Imprimir si el correo es valido
                
                Auth.auth().signIn(withEmail: correo, password: contras) {
                    (result, error) in
                    
                    if let result = result, error == nil {
                        
                        self.performSegue(withIdentifier: "LogIn", sender: self)
                        
                    } else {
                        
                        // Crear y desplegar alerta
                        let alerta = UIAlertController(title: "ERROR", message: "Correo inexistente o contraseña incorrecta", preferredStyle: .alert)
                        let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
                        alerta.addAction(accion)
                        self.present(alerta, animated: true, completion: nil)
                        
                    }
                }
                
            } else {
                
                print("Invalido") // Imprimir si el correo NO es valido
                
            }
            
        } else {
            
            //if identifier == "LogIn"{
            if validarCorreoContra(email: tfEmail.text!, contra: tfContrasena.text!){
            
            self.performSegue(withIdentifier: "LogInAdmin", sender: self)
            
            } else {
            
                print("Invalido") // Imprimir si el correo NO es valido
            
            }
            
        }
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { return UIInterfaceOrientationMask.landscape
    }
    override var shouldAutorotate: Bool {
            return false
    }
    
    
}

