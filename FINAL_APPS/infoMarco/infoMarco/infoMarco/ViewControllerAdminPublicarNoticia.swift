//
//  ViewControllerAdminPublicarNoticia.swift
//  infoMarco
//
//  Created by user188713 on 5/16/21.
//


import UIKit
import FirebaseDatabase
import FirebaseStorage
import FirebaseFirestore
import Kingfisher

protocol protocoloAgregaNoticia {
    func agregarNoticia (not: Noticia)
}

class ViewControllerAdminPublicarNoticia: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var tfTitulo: UITextField!
    @IBOutlet weak var tfContenido: UITextView!
    @IBOutlet weak var tfFecha: UITextField!
    
    var delegado : protocoloAgregaNoticia!
    let database = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func regresar(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func quitaTeclado(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
    }    
    
    
    @IBAction func btPublicarNoticia(_ sender: UIButton) {
        
                if let titulo = self.tfTitulo.text, let contenido = self.tfContenido.text, let fecha = self.tfFecha.text {
                    let object: [String: Any] = ["titulo": titulo, "fecha": fecha, "contenido": contenido]
                    self.database.child("Noticias").childByAutoId().setValue(object)
                    
                }
    }
    
        
//
//
    
    // LA VISTA NO ES MODAL, NO ES NECESARIO UN UNWIND
    // Aunque puedo equivocarme, sería revoltoso visualmente hablando
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Metodos de delegado de UIImage Picker Controller

    
}
