//
//  ViewControllerAdminEventosDetalle.swift
//  infoMarco
//
//  Created by user188713 on 5/15/21.
//

import UIKit

protocol protocoloActualizasEvento {
    func actualizaEvento (ev : Evento)
}

class ViewControllerAdminEventosDetalle: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var unEvento : Evento!
    var delegado : protocoloActualizasEvento!

    @IBOutlet weak var lbTitulo: UITextField!
    @IBOutlet weak var tvEvento: UITextView!
    @IBOutlet weak var imgEvento: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Editar Evento"
        let url = URL(string : unEvento.imagen)
        imgEvento.kf.setImage(with: url)
        lbTitulo.text = unEvento.titulo
        tvEvento.text = unEvento.contenido
        
    }
    
    @IBAction func botonGuardar(_ sender: UIButton) {
        
        unEvento.titulo = lbTitulo.text!
        unEvento.contenido = tvEvento.text!
        //unEvento.imagen = imgEvento.image!
        delegado.actualizaEvento(ev: unEvento)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    // Funcionalidad de botón regresar
    @IBAction func regresar(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }

    @IBAction func cambiarFotoEvento(_ sender: UITapGestureRecognizer) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "lectorQR" {
            let vistaEditar = segue.destination as! ViewControllerLectorEventos
            vistaEditar.nombreEvento = lbTitulo.text!
            
        }
        
    }
    
    //MARK: - Métodos de delegado de UIImage Picker Controller
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let foto = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imgEvento.image = foto
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }


}
