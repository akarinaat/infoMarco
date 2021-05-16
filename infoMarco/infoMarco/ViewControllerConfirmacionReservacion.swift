//
//  ViewControllerConfirmacionReservacion.swift
//  infoMarco
//
//  Created by Karina Amador Teran on 16/05/21.
//

import UIKit

class ViewControllerConfirmacionReservacion: UIViewController {

    var boletos: String!
    var nombreEvento: String!
    
    @IBOutlet weak var lbNoBletos: UILabel!
    
    @IBOutlet weak var lbNombreEvento: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbNoBletos.text = boletos
        lbNombreEvento.text = nombreEvento
        // Do any additional setup after loading the view.
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
