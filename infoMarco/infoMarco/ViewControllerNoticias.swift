//
//  ViewControllerNoticias.swift
//  infoMarco
//
//  Created by user188713 on 5/11/21.
//

import UIKit

class ViewControllerNoticias: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var listaNoticias = [
        Noticia(titulo: "Conociendo a Van Gogh", descripcion: "Conoce mas sobre el artista holandes en su exhibicion temporal", foto: UIImage(named: "vangogh"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: Metodos del Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listaNoticias.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaNoticias")  as! TableViewCellNoticias
        
        cell.lbTitulo.text = listaNoticias[indexPath.row].titulo
        cell.lbContenido.text = listaNoticias[indexPath.row].descripcion
        cell.imgFoto.image = listaNoticias[indexPath.row].foto
        
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
