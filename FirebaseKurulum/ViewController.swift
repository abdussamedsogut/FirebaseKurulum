//
//  ViewController.swift
//  FirebaseKurulum
//
//  Created by Abdüssamed Söğüt on 14.03.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    var ref: DatabaseReference?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()

       // kisiEkle()
       // kisiSil()
       // kisiGuncelle()
       // tumKisiler()
       // kisiEqualSorgu()
       // kisiLimitSorgu()
        kisiDegerAraligiSorgu()
    }


    
    func kisiEkle()  {

        let yeniKisi = Kisiler(kisi_ad: "Talat", kisi_yas: 14)
        
        let dict:[String:Any] = ["kisi_ad": yeniKisi.kisi_ad!, "kisi_yas": yeniKisi.kisi_yas!]
        
        let newRef = ref?.child("kisiler").childByAutoId()
        
        newRef?.setValue(dict)
        
    }
    
    
    func kisiSil() {
        
        ref?.child("kisiler").child("-NQTzD8igprFi9Ke5H2T").removeValue()
        
    }

    func kisiGuncelle() {
        
        let dict:[String:Any] = ["kisi_ad": "Yeni Ahmet", "kisi_yas": 99]
        
        ref?.child("kisiler").child("-NQTz3nTPzHlKy0LTDJa").updateChildValues(dict)
        
    }

    
    func tumKisiler()  {
        
        ref?.child("kisiler").observe(.value, with: { snapshot in
            
            if let gelenButunVeri = snapshot.value as? [String:AnyObject] {
                
                for gelenSatirVerisi in gelenButunVeri {
                    
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary {
                        
                        let key = gelenSatirVerisi.key
                        let kisi_ad = sozluk["kisi_ad"] as? String ?? ""
                        let kisi_yas = sozluk["kisi_yas"] as? Int ?? 0
                        
                        print("key : \(key)")
                        print("Ad  : \(kisi_ad)")
                        print("Yaş : \(kisi_yas)")
                        print("************")
                    }
                }
            }
        })
        
    }
    
    
    
    func kisiEqualSorgu()  {
        
        let sorgu = ref?.child("kisiler").queryOrdered(byChild: "kisi_ad").queryEqual(toValue: "Talat")
        
        sorgu!.observe(.value, with: { snapshot in
            
            if let gelenButunVeri = snapshot.value as? [String:AnyObject] {
                
                for gelenSatirVerisi in gelenButunVeri {
                    
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary {
                        
                        let key = gelenSatirVerisi.key
                        let kisi_ad = sozluk["kisi_ad"] as? String ?? ""
                        let kisi_yas = sozluk["kisi_yas"] as? Int ?? 0
                        
                        print("key : \(key)")
                        print("Ad  : \(kisi_ad)")
                        print("Yaş : \(kisi_yas)")
                        print("************")
                    }
                }
            }
        })
        
    }
    
    
    
    func kisiLimitSorgu()  {
        
        let sorgu = ref?.child("kisiler").queryLimited(toLast: 1)
        
        sorgu!.observe(.value, with: { snapshot in
            
            if let gelenButunVeri = snapshot.value as? [String:AnyObject] {
                
                for gelenSatirVerisi in gelenButunVeri {
                    
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary {
                        
                        let key = gelenSatirVerisi.key
                        let kisi_ad = sozluk["kisi_ad"] as? String ?? ""
                        let kisi_yas = sozluk["kisi_yas"] as? Int ?? 0
                        
                        print("key : \(key)")
                        print("Ad  : \(kisi_ad)")
                        print("Yaş : \(kisi_yas)")
                        print("************")
                    }
                }
            }
        })
        
    }
    
    
    func kisiDegerAraligiSorgu()  {
        
        let sorgu = ref?.child("kisiler").queryOrdered(byChild: "kisi_yas").queryStarting(atValue: 18).queryEnding(atValue: 100)
        
        sorgu!.observe(.value, with: { snapshot in
            
            if let gelenButunVeri = snapshot.value as? [String:AnyObject] {
                
                for gelenSatirVerisi in gelenButunVeri {
                    
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary {
                        
                        let key = gelenSatirVerisi.key
                        let kisi_ad = sozluk["kisi_ad"] as? String ?? ""
                        let kisi_yas = sozluk["kisi_yas"] as? Int ?? 0
                        
                        print("key : \(key)")
                        print("Ad  : \(kisi_ad)")
                        print("Yaş : \(kisi_yas)")
                        print("************")
                    }
                }
            }
        })
        
    }
    
    
    
    
    
    
    
}

