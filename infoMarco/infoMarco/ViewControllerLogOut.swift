//
//  ViewControllerLogOut.swift
//  infoMarco
//
//  Created by user188713 on 5/30/21.
//

import UIKit
import Firebase

class ViewControllerLogOut: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let firebaseAuth = Auth.auth()
        
        do {
            
            try firebaseAuth.signOut()
            let vistaLogIn = segue.destination as! ViewController
            vistaLogIn.loggedOut = true
            
        } catch let signOutError as NSError{
            
            print("Error al tratar de cerrar sesion: %@", signOutError)
            
        }
    }

}
