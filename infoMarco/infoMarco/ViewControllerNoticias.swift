//
//  ViewControllerNoticias.swift
//  infoMarco
//
//  Created by user188713 on 5/11/21.
//

import UIKit
import FirebaseDatabase

import FirebaseStorage
import FirebaseFirestore
import Kingfisher

class ViewControllerNoticias: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var ref: DatabaseReference?
    var arrNoticias = [Noticia]()
    
  
    @IBOutlet weak var tableViewNoticias: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference().child("Noticias")
        ref?.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount>=0{

                for noticias in snapshot.children.allObjects as! [DataSnapshot] {
                    let NoticiaObj = noticias.value as? [String:String]
                    let notTitulo = NoticiaObj?["titulo"]
                    let notContenido = NoticiaObj?["contenido"]
                    let notFecha = NoticiaObj?["fecha"]
                    let noticiaMarco = Noticia.init(titulo: notTitulo ?? "", fecha: notFecha ?? "", contenido: notContenido ?? "")
                    self.arrNoticias.append(noticiaMarco)
                    
                }
                self.tableViewNoticias.reloadData()
            }
        }
        
        
     )
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    
    // MARK: Metodos del Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrNoticias.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 219
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
          
        let cell = tableViewNoticias.dequeueReusableCell(withIdentifier: "celdaNoticias", for: indexPath) as! CustomTableViewCellNoticiasUser
        cell.lbTitulo.text = arrNoticias[indexPath.row].titulo
        cell.lbFecha.text = arrNoticias[indexPath.row].fecha
        cell.tvContenido.text = arrNoticias[indexPath.row].contenido
        
        return cell
        
    }
    
    // MARK: - Navigation

//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         let vistaReservaciones = segue.destination as!  ViewControllerReservacion
//         let indice = tableViewNoticias.indexPathForSelectedRow!
////        vistaReservaciones.unEvento = arrNoticias[indice.row]
//        
//        // vistaReservaciones.evento = arrEventos[indice.row]
//     }

}
