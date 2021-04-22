//
//  ViewControllerPromoBeneficios.swift
//  infoMarco
//
//  Created by Luis Mario Trujillo on 21/04/21.
//

import UIKit

class ViewControllerPromoBeneficios: UIViewController {

    @IBOutlet weak var lbPlatinum: UILabel!
    @IBOutlet weak var lbGold: UILabel!
    @IBOutlet weak var lbDiamond: UILabel!
    @IBOutlet weak var lbTitlePlatinum: UILabel!
    @IBOutlet weak var lbTitleGold: UILabel!
    @IBOutlet weak var lbTitleDiamond: UILabel!
    var current = 3

    @IBOutlet weak var platinumView: UIView!
    @IBOutlet weak var goldView: UIView!
    @IBOutlet weak var diamondView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dummyPlatinum = "Acceso al museo de lunes a jueves con el acceso inmediato a todas las salas. Acesso para 2 personas del museo (cualquier día de la semana.)"
        
        let dummyGold = "Beneficios de Platinum más: acceso al museo todos los días de la semana con permio incuñido de tomar fotografías. Acesso a eventos GOLD para dos personas."
        
        let dummyDiamond = "Beneficios de Gold más: regalo de cumpleaños. Invitación al evento anual más importante de MARCO. Acesso al museo las horas Diamond para disfrutarlo sin público en general."

        lbPlatinum.text = dummyPlatinum;
        lbGold.text = dummyGold;
        lbDiamond.text = dummyDiamond;
        
        switch(current){
        case 1:
            platinumView.backgroundColor = #colorLiteral(red: 0.5860883142, green: 1, blue: 0.5936284157, alpha: 1)
        case 2:
            goldView.backgroundColor = #colorLiteral(red: 0.5860883142, green: 1, blue: 0.5936284157, alpha: 1)
        case 3:
            diamondView.backgroundColor = #colorLiteral(red: 0.5860883142, green: 1, blue: 0.5936284157, alpha: 1)
        default:
            break
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
