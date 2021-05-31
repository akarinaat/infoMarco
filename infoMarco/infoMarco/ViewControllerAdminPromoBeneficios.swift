//
//  ViewControllerAdminPromoBeneficios.swift
//  infoMarco
//
//  Created by user188713 on 5/15/21.
//

import UIKit
import FirebaseDatabase

class ViewControllerAdminPromoBeneficios: UIViewController, UITableViewDelegate, UITableViewDataSource,protocoloAgregaPromocion {
    
    var ref: DatabaseReference?
    var arrPromos = [Promo]()
    
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference().child("Promociones")
        ref?.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount>=0{
                self.arrPromos.removeAll(keepingCapacity: false)
                for promos in snapshot.children.allObjects as! [DataSnapshot] {
                    let promoObj = promos.value as? [String:String]
                    let promoTitulo = promoObj?["titulo"]
                    let promoContenido = promoObj?["contenido"]
                    let promocionesMarco = Promo(titulo: promoTitulo ?? "", contenido: promoContenido ?? "")
                    self.arrPromos.append(promocionesMarco)}
            }
            self.tableView.reloadData()
        })
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    // MARK: Metodos del Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrPromos.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaPromosBeneficiosAdmin") as!
            CustomTableViewCellPromo
        
        cell.lbTitulo.text = arrPromos[indexPath.row].titulo
       
        cell.tvContenido.text = arrPromos[indexPath.row].contenido
        
        return cell
      
        
    }
    
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func agregarPromocion(not: Promo) {
        arrPromos.append(not)
        tableView.reloadData()
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


