//
//  ViewControllerAdminNoticias.swift
//  infoMarco
//
//  Created by user188713 on 5/15/21.
//

import UIKit
import FirebaseDatabase


class ViewControllerAdminNoticias: UIViewController, UITableViewDelegate, UITableViewDataSource, protocoloAgregaNoticia  {
    func agregarNoticia(not: Noticia) {
//        sdf
    }

    var ref: DatabaseReference?
    var arrNoticias = [Noticia]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        ref = Database.database().reference().child("Noticias")
        ref?.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount>=0{
                for noticias in snapshot.children.allObjects as! [DataSnapshot] {
                    let noticiaObj = noticias.value as? [String:String]
                    let noticiaTitulo = noticiaObj?["titulo"]
                    let noticiaContenido = noticiaObj?["contenido"]
                let noticiaFecha = noticiaObj?["fecha"]
                  
                    let noticiasMarco = Noticia(titulo: noticiaTitulo ?? "", fecha: noticiaFecha ?? "", contenido: noticiaContenido ?? "")
                    self.arrNoticias.append(noticiasMarco)}
            }
            self.tableView.reloadData()
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
        return 140
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaNoticiasAdmin", for: indexPath) as! CustomTableViewCellNoticias
        cell.lbTitulo.text = arrNoticias[indexPath.row].titulo
        cell.lbFecha.text = arrNoticias[indexPath.row].fecha
        cell.tvContenido.text = arrNoticias[indexPath.row].contenido
        
        return cell
        
    }
    
    // MARK: - Navigation

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaPublicar = segue.destination as! ViewControllerAdminPublicarNoticia
        vistaPublicar.delegado = self
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


