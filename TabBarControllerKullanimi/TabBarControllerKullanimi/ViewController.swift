//
//  ViewController.swift
//  TabBarControllerKullanimi
//
//  Created by Batuhan Saygin on 29.09.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tabItems = tabBarController?.tabBar.items {
            let anasayfaItem = tabItems[0]
            let ayarlarItem = tabItems[1]
            
            //anasayfaItem.badgeColor = UIColor(red: 44, green: 44, blue: 44, alpha: 44)
            anasayfaItem.badgeValue = "1sss"
        }
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.systemMint
        
        //bütün iphone modellerinde düzgün görünmesi için
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance

        func renkDegistir(itemAppearance: UITabBarItemAppearance) {
            //Seçili durum
            itemAppearance.selected.iconColor = UIColor.systemPink
            itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemBrown]
            itemAppearance.selected.iconColor = UIColor.systemPurple

            //Seçili olmayan durum
            itemAppearance.normal.iconColor = UIColor.systemYellow
            itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.systemOrange]
            itemAppearance.normal.iconColor = UIColor.systemBlue
            
        }
    }


}

