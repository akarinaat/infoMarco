//
//  ViewControllerEventos.swift
//  infoMarco
//
//  Created by Karina Amador Teran on 19/04/21.
//

import UIKit

class ViewControllerEventos: UIViewController, UITableViewDelegate, UITableViewDataSource  {
   
    

    var listaEventos = [
        Evento(titulo: "Conociendo a Van Gogh",descripcion:"Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",foto: UIImage(named: "noche"),boton: UIButton()),
        Evento(titulo: "Vida de Frida Kahlo",descripcion:"Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",foto: UIImage(named: "frida"),boton: UIButton()),
        Evento(titulo: "Desayuna en el museo",descripcion:"Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",foto: UIImage(named: "chila"),boton: UIButton()),
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Eventos"

        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaEventos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = listaEventos[indexPath.row].titulo
        cell.detailTextLabel?.text = listaEventos[indexPath.row].descripcion
        cell.imageView?.image = listaEventos[indexPath.row].foto!
//        cell. = listaEventos[indexPath.row].foto!
        
        return cell
    }
    
    


}
