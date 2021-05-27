//
//  ViewControllerReservacion.swift
//  infoMarco
//
//  Created by user188713 on 5/11/21.
//

import UIKit

class ViewControllerReservacion: UIViewController {
    
    var unEvento: Evento!
    @IBOutlet weak var tfBoletos: UITextField!
    @IBOutlet weak var lbEventoTitulo: UILabel!
    @IBOutlet weak var tvContenido: UILabel!
    @IBOutlet weak var lbFecha: UILabel!
    @IBOutlet weak var imageEvento: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Reservaciones"
        lbEventoTitulo.text = unEvento.titulo
        tvContenido.text = unEvento.contenido
        lbFecha.text = unEvento.fecha
        let url = URL(string : unEvento.imagen)
        imageEvento.kf.setImage(with: url)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func regresar(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaConformacionReservacion = segue.destination as! ViewControllerConfirmacionReservacion
        vistaConformacionReservacion.boletos = tfBoletos.text
        vistaConformacionReservacion.nombreEvento = lbEventoTitulo.text
        vistaConformacionReservacion.horario = lbFecha.text
      
    }
    

}
