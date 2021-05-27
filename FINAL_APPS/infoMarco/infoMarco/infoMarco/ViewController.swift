//
//  ViewController.swift
//  infoMarco
//
//  Created by Karina Amador Teran on 19/04/21.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfContrasena: UITextField!
    
    var ref: DatabaseReference?
    var arrAdmins = [Administrador]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Extraer usuarios administradores de la base de datos
        ref = Database.database().reference().child("admnUsrs")
        ref?.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount>0{

                for admins in snapshot.children.allObjects as! [DataSnapshot] {
                    
                    let adminObj = admins.value as? [String:String]
                    let adminEmail = adminObj?["correo"]
                    
                    let adminMarco = Administrador(email: adminEmail ?? "")
                
                    self.arrAdmins.append(adminMarco)
                    
                }
            }
        }
        )
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
    
    func findAdmin (email: String) -> Bool {
        
        for admin in arrAdmins {
            
            if admin.email == email {
                
                return true
                
            }
        }
        
        return false
        
    }
    
    // MARK: - Navigation
    
    // Determinar si se logeará un usuario o un administrador y evitar ejecucion de segue validando si se escribe un correo valido y una contrasenia
    @IBAction func AdminOrUser(_ sender: Any) {
        
        let correo = tfEmail.text!                  // String con el correo del usuario (admin)
        let contras = tfContrasena.text!            // Strong con la contra del usuario (admin)

        // Verificar si el correo introducido es de un administrador
        if !findAdmin(email: correo) {
            
            // Validar formato de correo
            if validarCorreoContra(email: correo, contra: contras){
                    
                
                // Autenticar cuenta del usuario
                Auth.auth().signIn(withEmail: correo, password: contras) {
                    (result, error) in
                
                    if let result = result, error == nil {
                        
                        // Ejecutar segue para el usuario
                        self.performSegue(withIdentifier: "LogIn", sender: self)
                        
                    } else {
                        
                        // Crear y desplegar alerta
                        let alerta = UIAlertController(title: "ERROR", message: "Correo inexistente o contraseña incorrecta", preferredStyle: .alert)
                        let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
                        alerta.addAction(accion)
                        self.present(alerta, animated: true, completion: nil)
                        
                    }
                }
                
            }
            
        } else {
            
            // Validar formato de correo
            if validarCorreoContra(email: tfEmail.text!, contra: tfContrasena.text!){
                
            
                // Autenticar cuenta del usuario admin
                Auth.auth().signIn(withEmail: correo, password: contras) {
                    (result, error) in
                    
                    if let result = result, error == nil {
                        
                        // Ejecutar segue para el usuario admin
                        self.performSegue(withIdentifier: "LogInAdmin", sender: self)

                    } else {
                        
                        // Crear y desplegar alerta
                        let alerta = UIAlertController(title: "ERROR", message: "Correo inexistente o contraseña incorrecta", preferredStyle: .alert)
                        let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
                        alerta.addAction(accion)
                        self.present(alerta, animated: true, completion: nil)
                        
                    }
                }
            }
        }
    }
    
    
}

