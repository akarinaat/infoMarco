//
//  ViewControllerPromoBeneficios.swift
//  infoMarco
//
//  Created by Luis Mario Trujillo on 21/04/21.
//

import UIKit

class ViewControllerPromoBeneficios: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var sBorrar = ["Prueba"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaNoticias")!
        
        cell.textLabel?.text = sBorrar[indexPath.row]
        
        return cell
        
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
