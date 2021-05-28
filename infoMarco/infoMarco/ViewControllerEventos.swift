//
//  ViewControllerEventos.swift
//  infoMarco
//
//  Created by Karina Amador Teran on 19/04/21.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import FirebaseFirestore
import Kingfisher

class ViewControllerEventos: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var ref: DatabaseReference?
    var arrEventos = [Evento]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference().child("marcoEvent")
        ref?.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount>=0{

                for events in snapshot.children.allObjects as! [DataSnapshot] {
                    let eventObj = events.value as? [String:String]
                    let eventoTitulo = eventObj?["titulo"]
                    let eventoContenido = eventObj?["contenido"]
                    let eventoFecha = eventObj?["fecha"]
                    let eventoImgURLString = eventObj?["imagenUid"]
                    let eventoMarco = Evento.init(titulo: eventoTitulo ?? "", fecha: eventoFecha ?? "", contenido: eventoContenido ?? "", imagen: eventoImgURLString ?? "")
                    self.arrEventos.append(eventoMarco)
                }
                self.tableView.reloadData()
            }
        }
        
        
     )
    }
    
    
    // MARK: Metodos del Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrEventos.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaEventos", for: indexPath) as! CustomTableViewCellUser
        cell.lbTitulo.text = arrEventos[indexPath.row].titulo
        cell.lbFecha.text = arrEventos[indexPath.row].fecha
        cell.tvContenido.text = arrEventos[indexPath.row].contenido
        if arrEventos[indexPath.row].imagen != "nil" {
            let url = URL(string : arrEventos[indexPath.row].imagen)
            print(arrEventos[indexPath.row].imagen)
            cell.imgEvento.kf.setImage(with: url)
        }
        return cell
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    // MARK: - Navigation

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let vistaReservaciones = segue.destination as!  ViewControllerReservacion
         let indice = tableView.indexPathForSelectedRow!
        vistaReservaciones.unEvento = arrEventos[indice.row]
        
        // vistaReservaciones.evento = arrEventos[indice.row]
     }

}
