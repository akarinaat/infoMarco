//
//  ViewControllerEventos.swift
//  infoMarco
//
//  Created by Karina Amador Teran on 19/04/21.
//

import UIKit
import FirebaseDatabase

class ViewControllerEventos: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var ref: DatabaseReference?
    var arrEventos = [Evento]()
    
    
    
    @IBOutlet weak var imgCell: UIImageView!
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ref = Database.database().reference().child("marcoEvent")
        ref?.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount>0{

                for events in snapshot.children.allObjects as! [DataSnapshot] {
                    let eventObj = events.value as? [String:String]
                    let eventoTitulo = eventObj?["titulo"]
                    let eventoDescripcion = eventObj?["contenido"]
                   
                    
                    
                    let eventoMarco = Evento(titulo: eventoTitulo ?? "", contenido: eventoDescripcion ?? "")
//                    self.arrEventos.append(eventoTitulo!)
                
                    self.arrEventos.append(eventoMarco)
                    print(eventoTitulo)
                    print(eventoDescripcion)
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
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaEventos")!
        
        cell.textLabel?.text = arrEventos[indexPath.row].titulo
        
        return cell
        
    }
    
    // MARK: - Navigation

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let vistaReservaciones = segue.destination as!  ViewControllerReservacion
         let indice = tableView.indexPathForSelectedRow!
        vistaReservaciones.evento = arrEventos[indice.row].titulo
        vistaReservaciones.descripcion = arrEventos[indice.row].contenido
        
        // vistaReservaciones.evento = arrEventos[indice.row]
     }

}
