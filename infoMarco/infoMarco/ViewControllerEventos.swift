//
//  ViewControllerEventos.swift
//  infoMarco
//
//  Created by Karina Amador Teran on 19/04/21.
//

import UIKit

class ViewControllerEventos: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var sBorrar = ["Evento 1","Evento 2","Evento 3","Evento 4", "Evento 5"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: Metodos del Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sBorrar.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaEventos")!
        
        cell.textLabel?.text = sBorrar[indexPath.row]
        
        return cell
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaNavigation = segue.destination as! UINavigationController
        let vistaReservaciones = vistaNavigation.topViewController as! ViewControllerReservacion
        let indice = tableView.indexPathForSelectedRow!
        
        vistaReservaciones.evento = sBorrar[indice.row]
        
    
    }
    

}
