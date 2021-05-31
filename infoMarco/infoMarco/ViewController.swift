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
    var loggedOut = false

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
        Database.database().reference().child("memberUsrs").observeSingleEvent(of: .value, with: {(snapshot) in
            if snapshot.childrenCount>0{
                for miembros in snapshot.children.allObjects as! [DataSnapshot] {

                    let miembroObj = miembros.value as? [String:Any]
                    
                    let mApellidos = miembroObj?["apellidos"]
                    let mCategoria = miembroObj?["categoria"]
                    let mEmail = miembroObj?["email"]
                    let mFecha_Ing = miembroObj?["fecha_ing"]
                    let mFecha_Ven = miembroObj?["fecha_ven"]
                    let mID_CAT = miembroObj?["id_cat"]
                    let mID_Miembro = miembroObj?["id_miembro"]
                    let mMiembro_Desde = miembroObj?["miembro_desde"]
                    let mNombres = miembroObj?["nombres"]

                    let miembroMarco = Usuario(ID_Miembro: mID_Miembro as? String ?? "",
                                               ID_CAT: mID_CAT as? String ?? "",
                                               sNombres: mNombres as? String ?? "",
                                               sApellidos: mApellidos as? String ?? "",
                                               sCategoria: mCategoria as? String ?? "",
                                               sEmail: mEmail as? String ?? "",
                                               sFecha_Ing: mFecha_Ing as? String ?? "",
                                               sMiembro_Desde: mMiembro_Desde as? String ?? "",
                                               sFecha_Ven: mFecha_Ven as? String ?? "")
                                    
                    self.arrMiembros.append(miembroMarco)
                }
            }
        }
        )
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
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
    
    @IBAction func quitarTeclado(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
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
                        
                        // Verificar que el usuario existe en el segundo registro
                        if usr != nil {
                        
                            // Guardar la info del usuario en user defaults
                            let defaults = UserDefaults.standard
                            
                            let nombreCompleto = usr!.sNombres + " " + usr!.sApellidos
                            
                            defaults.setValue(nombreCompleto, forKey: "NombreCompleto")
                            defaults.set(usr!.sEmail, forKey: "user")
                            defaults.set(usr!.sMiembro_Desde, forKey: "MiembroDesde")
                            defaults.set(usr!.sCategoria, forKey: "TipoMemb")
                            defaults.set(usr!.sFecha_Ven, forKey: "FechaRenov")
                            
                            // Ejecutar segue para el usuario
                            self.performSegue(withIdentifier: "LogIn", sender: self)
                            
                        } else {
                            
                            // Crear y desplegar alerta
                            let alerta = UIAlertController(title: "ERROR", message: "Correo inexistente o contraseña incorrecta", preferredStyle: .alert)
                            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            
                            alerta.addAction(accion)
                            self.present(alerta, animated: true, completion: nil)
                            
                        }
                            
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
    
    @IBAction func unwindToLogOut(_ unwindSegue: UIStoryboardSegue) {
        //let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
        loggedOut = false
        tfEmail.text = ""
        tfContrasena.text = ""
        
    }
    
}

