//
//  ViewControllerReservacion.swift
//  infoMarco
//
//  Created by user188713 on 5/11/21.
//

import UIKit

class ViewControllerReservacion: UIViewController {
    
    var evento: String!
    
    @IBOutlet weak var tfBoletos: UITextField!
    @IBOutlet weak var lbEventoTitulo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Reservaciones"
        lbEventoTitulo.text = evento
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btBacktoEvents(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaConformacionReservacion = segue.destination as! ViewControllerConfirmacionReservacion
        vistaConformacionReservacion.boletos = tfBoletos.text
        vistaConformacionReservacion.nombreEvento = lbEventoTitulo.text
    }
    

}
