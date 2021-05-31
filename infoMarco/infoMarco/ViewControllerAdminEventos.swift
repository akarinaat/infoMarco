//
//  ViewControllerAdminEventos.swift
//  infoMarco
//
//  Created by user188713 on 5/15/21.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import FirebaseFirestore
import Kingfisher

class ViewControllerAdminEventos: UIViewController, UITableViewDelegate, UITableViewDataSource, protocoloAgregaEvento, protocoloActualizasEvento {
    
    var ref1: DatabaseReference?
    var listaEventos = [Evento]()
    
    @IBOutlet weak var tableViewEventos: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref1 = Database.database().reference().child("marcoEvent")
        ref1?.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount>=0{
                self.listaEventos.removeAll(keepingCapacity: false)
                for events in snapshot.children.allObjects as! [DataSnapshot] {
                    let eventObj = events.value as? [String:String]
                    let eventoTitulo = eventObj?["titulo"]
                    let eventoContenido = eventObj?["contenido"]
                    let eventoFecha = eventObj?["fecha"]
                    let eventoImgURLString = eventObj?["imagenUid"]
                    let eventoMarco = Evento.init(titulo: eventoTitulo ?? "", fecha: eventoFecha ?? "", contenido: eventoContenido ?? "", imagen: eventoImgURLString ?? "")
                    self.listaEventos.append(eventoMarco)
                }
                self.tableViewEventos.reloadData()
            }
        })
        
        title = "Lista Eventos"
    }
    
    // MARK: Metodos del Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listaEventos.count
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaEventosAdmin", for: indexPath) as! CustomTableViewCell
        
        cell.lbTitulo.text = listaEventos[indexPath.row].titulo
        cell.lbFecha.text = listaEventos[indexPath.row].fecha
        cell.tvContenido.text = listaEventos[indexPath.row].contenido
        if listaEventos[indexPath.row].imagen != "nil" {
            let url = URL(string : listaEventos[indexPath.row].imagen)
            cell.imgEvento.kf.setImage(with: url)
        }
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
            vistaPublicar.delegado = self
        }
        
    }
    
    // MARK: - Metodos del protocolo Agregar Evento
    func agregarEvento(ev : Evento){
        // arreglar pq esto edita directamente la table view
        // se debe editar la base de datos y despues actualizar
        // la table view
        listaEventos.append(ev)
        tableViewEventos.reloadData()
        
    }
    
    // MARK: - Metodos del protocolo Actualiza Evento
    func actualizaEvento(ev: Evento) {
        // arreglar pq esto edita directamente la table view
        // se debe editar la base de datos y despues actualizar
        // la table view
        
        /*
        let indice = tableViewEventos.indexPathForSelectedRow!
        listaEventos[indice.row] = ev
        tableViewEventos.reloadData()
        */
        
    }

}
