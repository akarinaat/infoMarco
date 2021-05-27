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
    var arrMiembros = [Usuario]()
    
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
        
        // Extraer usuarios miembros de la base de datos
        ref = Database.database().reference().child("memberUsrs")
        ref?.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount>0{

                for miembros in snapshot.children.allObjects as! [DataSnapshot] {
                    
                    let miembroObj = miembros.value as? [String:String]
                    
                    let mApellidos = miembroObj?["Apellidos"]
                    let mCategoria = miembroObj?["Categoria"]
                    let mEmail = miembroObj?["Email"]
                    let mFecha_Ing = miembroObj?["Fecha_Ing"]
                    let mFecha_Ven = miembroObj?["Fecha_Ven"]
                    let mID_CAT = miembroObj?["ID_CAT"]
                    let mID_Miembro = miembroObj?["ID_Miembro"]
                    let mMiembro_Desde = miembroObj?["Miembro_Desde"]
                    let mNombres = miembroObj?["Nombres"]
                    
                    let miembroMarco = Usuario(ID_Miembro: mID_Miembro ?? "", ID_CAT: mID_CAT ?? "", sNombres: mNombres ?? "", sApellidos: mApellidos ?? "", sCategoria: mCategoria ?? "", sEmail: mEmail ?? "", sFecha_Ing: mFecha_Ing ?? "", sMiembro_Desde: mMiembro_Desde ?? "", sFecha_Ven: mFecha_Ven ?? "")
                    
                    print(miembroMarco.sNombres)
                
                    self.arrMiembros.append(miembroMarco)
                    
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
    
    func findUser() -> Usuario! {
        
        for miembro in arrMiembros {
            if miembro.sEmail == tfEmail.text! {
                
                return miembro
                
            }
        }
        
        return nil
        
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
                        
                        // Guardar usuario en user defaults
                        
                        let usr = self.findUser()
                        
                        let defaults = UserDefaults.standard
                        
                        defaults.setValue(usr!.sNombres + usr!.sApellidos, forKey: "NombreCompleto")
                        defaults.setValue(usr!.sMiembro_Desde, forKey: "MiembroDesde")
                        defaults.setValue(usr!.sCategoria, forKey: "TipoMemb")
                        defaults.setValue(usr!.sFecha_Ven, forKey: "FechaRenov")
                        
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
    
    /*// Funcion para mandar datos a las otras vistas
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Verificar si vamos a pasar a una vista de miembro o de administrador
        if segue.identifier == "LogIn" {
            
            let usr = findUser()
            
            // Declarar referencia a las vistas destino y mandar usuario
            let destino = self.tabBarController?.viewControllers![1] as! ViewControllerEventos
            
            destino.usuario = usr

            /*let destino1 = self.tabBarController?.viewControllers![1] as! ViewControllerNoticias
            
            destino1.usuario = usr

            let destino2 = self.tabBarController?.viewControllers![1] as! ViewControllerPromoBeneficios
            
            destino2.usuario = usr

            let destino3 = self.tabBarController?.viewControllers![1] as! ViewControllerInformacionPersonal
            
            destino3.usuario = usr*/
            
        }
        
    }*/
    
    
    
    
}

