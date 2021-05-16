//
//  ViewControllerInformacionPersonal.swift
//  infoMarco
//
//  Created by Gerardo Ángeles Hernández on 21/04/21.
//

import UIKit

class ViewControllerInformacionPersonal: UIViewController {

    @IBOutlet weak var qrCodeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generarQRCode()
        
    }
    
    func generarQRCode (){
        //en myString debemos poner el valor que queremos
        //desplegar en el codigo QR
        let myString = "https://www.marco.org.mx/"
        let data = myString.data(using: String.Encoding.ascii)
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return }
        qrFilter.setValue(data, forKey: "inputMessage")
        guard let qrImage = qrFilter.outputImage else { return }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledQrImage = qrImage.transformed(by: transform)
        let context = CIContext()
        guard let cgImage = context.createCGImage(scaledQrImage, from: scaledQrImage.extent) else { return }
        let processedImage = UIImage(cgImage: cgImage)
        qrCodeImage.image = processedImage
    }
    
    
    
 
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vistaRenovar = segue.destination as! ViewControllerRenovacion
//        vistaRenovar.tipoMembresia = lbTipoMembresia.text!
//        
//    }
    

}
