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
    var databaseHandle: DatabaseHandle?
    var arrEventos = [String]()
    
    
    
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
                
                  
                    
                    self.arrEventos.append(eventoTitulo!)
                }
                self.tableView.reloadData()
            }
        }
        
        
//        databaseHandle = ref?.child("marcoEvent").observe(DataEventType.value, with: { (snapshot) in
////            convierto el vaor de los datos en un string
//            let post = snapshot.value as? String
//            if let actualPost = post{
//                self.arrEventos.append(actualPost)
//
//                self.tableView.reloadData()
//            }
//        }
//   )
        
     )
    }
    
    
    // MARK: Metodos del Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrEventos.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaEventos")!
        
        cell.textLabel?.text = arrEventos[indexPath.row]
        
        return cell
        
    }
    // MARK: - Navigatio
 // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let vistaReservaciones = segue.destination as!  ViewControllerReservacion
         let indice = tableView.indexPathForSelectedRow!
         
         vistaReservaciones.evento = arrEventos[indice.row]
         
     
     }

}
