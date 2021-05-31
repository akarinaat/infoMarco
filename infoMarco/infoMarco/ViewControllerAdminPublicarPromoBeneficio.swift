//
//  ViewControllerAdminPublicarPromoBeneficio.swift
//  infoMarco
//
//  Created by user188713 on 5/16/21.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import FirebaseFirestore
import Kingfisher

protocol protocoloAgregaPromocion {
    func agregarPromocion (not: Promo)
}

class ViewControllerAdminPublicarPromoBeneficio: UIViewController,UINavigationControllerDelegate {
    
//    OUTLETS DE VIEW
    
    @IBOutlet weak var tfTitulo: UITextField!
    @IBOutlet weak var tvContenido: UITextView!
    //    OUTLETS
    
    
    var delegado : protocoloAgregaPromocion!
    let database = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func regresar(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func quitarTeclado(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    @IBAction func botonPublicarPromocion(_sender: Any){
        if let titulo = self.tfTitulo.text, let contenido = self.tvContenido.text {
            let object: [String: Any] = ["titulo": titulo, "contenido": contenido]
            self.database.child("Promociones").childByAutoId().setValue(object)
            
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
