//
//  ViewControllerEventos.swift
//  infoMarco
//
//  Created by Karina Amador Teran on 19/04/21.
//

import UIKit

class ViewControllerEventos: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var listaEventos = [
        Eventos(titulo: "Desayuna en el museo", descripcion: "Prueba nuestras deliciosos chilaquiles rojos y verdes", foto: UIImage(named: "chilaquiles"))
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: Metodos del Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listaEventos.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaEventos") as! TableViewCellEventos
        
        cell.lbTitulo.text = listaEventos[indexPath.row].titulo
        cell.lbContenido.text = listaEventos[indexPath.row].descripcion
        cell.imgFoto.image = listaEventos[indexPath.row].foto
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

    
    
    // MARK: - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let vistaReservaciones = segue.destination as!  ViewControllerReservacion
         let indice = tableView.indexPathForSelectedRow!
         
        vistaReservaciones.evento = listaEventos[indice.row].descripcion
         
     
     }

}
