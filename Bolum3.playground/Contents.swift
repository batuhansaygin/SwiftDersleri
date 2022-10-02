import UIKit

// array ile set arasındaki fark -> array da sıra sıra ekler, sette karışık ekler, set aynı elemanı tekrar eklemez, dictinary de önemli



// array kullanımı

var numaralar = [10, 20, 30]
var meyveler = [String]()

// veri ekleme

meyveler.append("Muz")
meyveler.append("elma") // append sonuna ilave eder

print(meyveler)

// güncelle

meyveler[0] = "yeniElma"
print(meyveler)

// insert -> herhangibir yere ekleme

meyveler.insert("deneme", at: 1)

print(meyveler)

// veri okuma

let m = meyveler[2]
print(m)

print(meyveler.isEmpty) // boş mu?

print(meyveler.count) // kaç edet meyve var

print(meyveler.first!) // ilk index elemanı

print(meyveler.last!) // son index elemanı

//print(meyveler.firstIndex(of: "Muz")!)

print(meyveler.contains("Muz"))


for meyve in meyveler{
    print("Meyveler:  \(meyve)")
}

for (indeks, meyve) in meyveler.enumerated(){
    print("\(indeks+1) \(meyve)")
}

meyveler.remove(at: 1)
print(meyveler)
meyveler.removeAll()
print(meyveler)

// array nesne tabanlı kullanımı

class Urunler {
    var id:Int?
    var ad:String?
    var fiyat:Int?
    
    init (id:Int, ad:String, fiyat:Int){
        self.id = id
        self.ad = ad
        self.fiyat = fiyat
    }
    
    var u1 = Urunler(id : 1, ad: "tv", fiyat: 22)
    var u2 = Urunler(id : 2, ad: "laptop", fiyat: 232)
    var u3 = Urunler(id : 3, ad: "klima", fiyat: 122)
    
    /*
    var urunlerListesi = [Urunler]()
    urunlerListesi.append(u1)
    urunlerListesi.append(u2)
    urunlerListesi.append(u3)
    
    for u in urunlerListesi {
        print("\(u.id) \(u.ad) \(u.fiyat)")
    }
    
    // filtreleme
    
    var f1 = urunlerListesi.filter($0.fiyat! > 10 && $0.fiyat! < 100)
    for u in f1 {
        print("\(u.id) \(u.ad) \(u.fiyat)")
    }
    
    */
    // sort - sıralama
    
    // set kullanımı
    
    
}

var meyveler1 = Set<String>()

// veri ekleme

meyveler1.insert("elma")
meyveler1.insert("armut")
meyveler1.insert("kiraz")

print(meyveler1)

meyveler1.insert("kiraz")

// dictionary - map : json modeline benzer

var iller = [Int:String]()

//veri ekleme

iller[16] = "bursa"
iller[35] = "izmir"
iller[45] = "manisa"

print(iller)

// veri okuma
print(iller[45]!)

// veri güncelleme

iller[45] = "akhisar"

for (anahtar, deger) in iller {
    print("\(anahtar) -> \(deger)")
}

// veri silme

iller.removeValue(forKey: 16)
print(iller)

// guard kullanımı -> if'in tersidir ve fonksiyon içerisinde kullanmak zorundayız

func kisiTanimaIf(ad:String){
    if ad == "ahmet" {
        print("merhaba ahmet")
    }
    else{
        print("kişi tanınmadı")
    }
}

kisiTanimaIf(ad: "ahmetx")

func kisiTanimaGuard(ad:String){
    guard ad == "ahmet" else { //amaç kodlamaları daha sade hale getirmektir. mesela login işlemlerinde bunu pratik olarak kullanabiliriz
        print("kişi tanınmadı")
        return
    }
    print("merhaba ahmet")
}

kisiTanimaGuard(ad: "ahmet")

//hata ayıklama

//1. derleme hatası (compile error)

let c = 4
//c = "batu"

// 2. Hata (runtime exception)
enum Hatalar:Error {
    case SifiraBolunmeHatasi
}

func bolme(s1:Int, s2:Int) throws -> Int {
    if s2 == 0 {
        throw Hatalar.SifiraBolunmeHatasi
    }
    return s1 / s2
}



do{
    let sonuc = try bolme(s1: 3, s2: 2)
    print(sonuc)
}catch Hatalar.SifiraBolunmeHatasi {
    print("sayı sıfıra bölünemez")
}

let sonuc1 = try? bolme(s1: 3, s2: 20)

if let temp = sonuc1 {
    print(temp)
}
else {
    print("sayı sıfıra bölünmez")
}
