//
//  ViewControllerLectorEventos.swift
//  infoMarco
//
//  Created by Gerardo Ángeles Hernández on 22/04/21.
//

import UIKit

class ViewControllerLectorEventos: UIViewController {
    
    @IBOutlet weak var tfQRCode: UITextField!
    @IBOutlet weak var lbEventoName: UILabel!
    
    var qrCodeString: String!
    var nombreEvento = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbEventoName.text = nombreEvento
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToLectorEventosScreen(segue: UIStoryboardSegue){
        
        tfQRCode.text = qrCodeString!
        
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
