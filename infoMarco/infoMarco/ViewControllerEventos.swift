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
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ref = Database.database().reference()
        
//        retrieve posts
        
        databaseHandle = ref?.child("marcoEvent2").observe(.childAdded, with: { (snapshot) in
//            convierto el vaor de los datos en un string
            let post = snapshot.value as? String
            if let actualPost = post{
                self.arrEventos.append(actualPost)
                
                self.tableView.reloadData()
            }
            
            
            
        })
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

    
    
    // MARK: - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let vistaReservaciones = segue.destination as!  ViewControllerReservacion
         let indice = tableView.indexPathForSelectedRow!
         
         vistaReservaciones.evento = arrEventos[indice.row]
         
     
     }

}
