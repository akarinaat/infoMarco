//
//  ViewControllerAdminPublicarEvento.swift
//  infoMarco
//
//  Created by user188713 on 5/15/21.
//

import UIKit
import FirebaseDatabase

protocol protocoloAgregaEvento {
    func agregarEvento (ev: Evento)
}

class ViewControllerAdminPublicarEvento: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var tfTitulo: UITextField!
    @IBOutlet weak var tvContenido: UITextView!
    
    var delegado : protocoloAgregaEvento!
    var counterEvent = 0
  
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
    
    @IBAction func agregarFotoEvento(_ sender: UITapGestureRecognizer) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func botonPublicar(_ sender: UIButton) {
        
        let evento = Evento(iD: "marcoEvent"+String(counterEvent), titulo: tfTitulo.text!, contenido: tvContenido.text!, imagen: imgFoto.image!)
        delegado.agregarEvento(ev: evento)
        dismiss(animated: true, completion: nil)
        let object: [String: Any] = [ "nombre": "arreglo de errores merge", "descripcion": "esto debe subirse a la base de datos"]
        database.child("Evento 4").setValue(object)
        
    }
    
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let foto = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imgFoto.image = foto
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

}
