//
//  ViewControllerAdminPromoBeneficios.swift
//  infoMarco
//
//  Created by user188713 on 5/15/21.
//

import UIKit

class ViewControllerAdminPromoBeneficios: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var sBorrar = ["Prueba"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: Metodos del Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sBorrar.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaPromosBeneficiosAdmin")!
        
        cell.textLabel?.text = sBorrar[indexPath.row]
        
        return cell
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
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
