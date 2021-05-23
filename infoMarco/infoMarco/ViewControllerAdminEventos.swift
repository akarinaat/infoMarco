//
//  ViewControllerAdminEventos.swift
//  infoMarco
//
//  Created by user188713 on 5/15/21.
//

import UIKit

class ViewControllerAdminEventos: UIViewController, UITableViewDelegate, UITableViewDataSource, protocoloAgregaEvento, protocoloActualizasEvento {
    
    var counter = 0
    var listaEventos = [Evento]()
    
    @IBOutlet weak var tableViewEventos: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Lista Eventos"
    }
    
    // MARK: Metodos del Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listaEventos.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaEventosAdmin", for: indexPath) as! CustomTableViewCell
        
        cell.lbTitulo.text = listaEventos[indexPath.row].titulo
        cell.tvContenido.text = listaEventos[indexPath.row].contenido
        cell.imgEvento.image = listaEventos[indexPath.row].imagen
        cell.lbCodigo.text = listaEventos[indexPath.row].iD
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 219
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "editarEvento" {
            let vistaEditar = segue.destination as! ViewControllerAdminEventosDetalle
            let indice = tableViewEventos.indexPathForSelectedRow!
            vistaEditar.unEvento = listaEventos[indice.row]
            vistaEditar.delegado = self
        }
        else {
            let vistaPublicar = segue.destination as! ViewControllerAdminPublicarEvento
            vistaPublicar.counterEvent = counter
            vistaPublicar.delegado = self
        }
        
    }
    
    // MARK: - Metodos del protocolo Agregar Evento
    func agregarEvento(ev : Evento){
        listaEventos.append(ev)
        counter += 1
        tableViewEventos.reloadData()
    }
    
    // MARK: - Metodos del protocolo Actualiza Evento
    func actualizaEvento(ev: Evento) {
        let indice = tableViewEventos.indexPathForSelectedRow!
        listaEventos[indice.row] = ev
        tableViewEventos.reloadData()
    }

}
