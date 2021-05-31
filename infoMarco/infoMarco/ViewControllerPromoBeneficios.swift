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

class ViewControllerPromoBeneficios: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var ref: DatabaseReference?
    var arrPromos = [Promo]()
    
    @IBOutlet weak var tableViewPromos: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference().child("Promociones")
        ref?.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount>=0{

                for promos in snapshot.children.allObjects as! [DataSnapshot] {
                    let promoObj = promos.value as? [String:String]
                    let promoTitulo = promoObj?["titulo"]
                    let promoContenido = promoObj?["contenido"]
                   
                    
                    let promoMarco = Promo.init(titulo: promoTitulo ?? "", contenido: promoContenido ?? "")
                    self.arrPromos.append(promoMarco)
                }
                self.tableViewPromos.reloadData()
            }
        }
        
        
     )
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPromos.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableViewPromos.dequeueReusableCell(withIdentifier: "celdaPromociones", for: indexPath) as! CustomTableViewCellPromoUser
        cell.lbTitulo.text = arrPromos[indexPath.row].titulo
        cell.tvContenido.text = arrPromos[indexPath.row].contenido
        
        
        return cell
       
    }
    

 
               
         
}


