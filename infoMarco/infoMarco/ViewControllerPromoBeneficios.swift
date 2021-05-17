//
//  ViewControllerPromoBeneficios.swift
//  infoMarco
//
//  Created by Luis Mario Trujillo on 21/04/21.
//

import UIKit

class ViewControllerPromoBeneficios: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var listaPromocionesyBeneficios = [
        PromocionesyBeneficios(titulo: "Playera MARCO", descripcion: "La playera oficial del museo tiene un 20% de descuento en compras fisicas en la tienda oficial", foto: UIImage(named: "playera_marco")),
        PromocionesyBeneficios(titulo: "Té Verde", descripcion: "El té verde 'violet fields' con petalos de rosa, de girasol de 30g tiene 30% en la tienda gastronomica.", foto: UIImage(named: "te_marco"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaPromocionesyBeneficios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaNoticias", for: indexPath) as! TableViewCellPromocionesyBeneficios
        
        cell.lbTitulo.text = listaPromocionesyBeneficios[indexPath.row].titulo
        cell.lbContenido.text = listaPromocionesyBeneficios[indexPath.row].descripcion
        cell.imgFoto.image = listaPromocionesyBeneficios[indexPath.row].foto
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
