//
//  ViewControllerInformacionPersonal.swift
//  infoMarco
//
//  Created by Gerardo Ángeles Hernández on 21/04/21.
//

import UIKit
import Firebase

class ViewControllerInformacionPersonal: UIViewController {

    @IBOutlet weak var qrCodeImage: UIImageView!
    @IBOutlet weak var lbNombre: UILabel!
    @IBOutlet weak var lbMiembroDesde: UILabel!
    @IBOutlet weak var lbTipoMemb: UILabel!
    @IBOutlet weak var lbFechaRenov: UILabel!
    
    var usuario : Usuario!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cargaUsuario()
        generarQRCode()
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    func cargaUsuario(){
        
        let defaults = UserDefaults.standard
        
        if let nombre = defaults.value(forKey: "NombreCompleto") as? String {
            lbNombre.text = nombre
        }
        if let miembroDesde = defaults.value(forKey: "MiembroDesde") as? String {
            lbMiembroDesde.text = miembroDesde
        }
        if let tipoMemb = defaults.value(forKey: "TipoMemb") as? String {
            lbTipoMemb.text = tipoMemb
        }
        if let fechaRenov = defaults.value(forKey: "FechaRenov") as? String {
            lbFechaRenov.text = fechaRenov
        }
        
    }
    
    func generarQRCode (){
        //en myString debemos poner el valor que queremos
        //desplegar en el codigo QR
        let myString = "https://www.marco.org.mx/"
        let data = myString.data(using: String.Encoding.ascii)
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return }
        qrFilter.setValue(data, forKey: "inputMessage")
        guard let qrImage = qrFilter.outputImage else { return }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledQrImage = qrImage.transformed(by: transform)
        let context = CIContext()
        guard let cgImage = context.createCGImage(scaledQrImage, from: scaledQrImage.extent) else { return }
        let processedImage = UIImage(cgImage: cgImage)
        qrCodeImage.image = processedImage
    }
    
    
    /*@IBAction func logOut(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        
        do {
            
            try firebaseAuth.signOut()
            self.performSegue(withIdentifier: "LogIn", sender: self)
            
        } catch let signOutError as NSError{
            
            print("Error al tratar de cerrar sesion: %@", signOutError)
            
        }
    }*/
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier != "renovar" {
        
            let firebaseAuth = Auth.auth()
        
            do {
            
                try firebaseAuth.signOut()
                let vistaLogIn = segue.destination as! ViewController
                vistaLogIn.loggedOut = true
            
            } catch let signOutError as NSError{
            
                print("Error al tratar de cerrar sesion: %@", signOutError)
            
            }
        } else {
            
        }
        
    }


}
