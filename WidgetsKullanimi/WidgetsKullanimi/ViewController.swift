//
//  ViewController.swift
//  WidgetsKullanimi
//
//  Created by Batuhan Saygin on 29.09.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var labelSonuc: UILabel!
    
    @IBOutlet weak var textfieldGirdi: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func buttonResim1(_ sender: Any) {
        imageView.image = UIImage(named: "yildiz")
    }
    
    @IBAction func buttonResim2(_ sender: Any) {
        imageView.image = UIImage(named: "kalp")
    }
    
    @IBAction func buttonYap(_ sender: Any) {
        if let alinanVeri = textfieldGirdi.text {
            labelSonuc.text = alinanVeri
        }
    }
    
    @IBOutlet weak var mSwitch: UISwitch!
    
    @IBAction func switchControl(_ sender: UISwitch) {
        if sender.isOn {
            print("Switch ON")
        }
        else {
            print("Switch OFF")
        }
    }
    
    @IBAction func buttonGoster(_ sender: Any) {
        print("Switch son durum: \(mSwitch.isOn)")
    }
}

