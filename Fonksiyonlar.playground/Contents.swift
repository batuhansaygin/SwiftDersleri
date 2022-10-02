import UIKit

// Optional - Nullable - Null Safety

// ? !

// ?? Varsayılan değer ataması


var yazi:String?

yazi = "selam"

var str:String? = nil // nil -> null demek

var str1:String? // aynı şekilde kullanım

if yazi != nil{
    print(yazi!) // değişkenin sonuna ! işareti koyarak istediğimiz değere ulaşmaya unwrap denir
}
else{
    print("nil")
}

// Optional binding

if let temp = yazi {
    print(temp) // otomatik olarak unwrapping olur
}
else{
    print("yazı nil içeriyor")
}

if var temp = yazi {
    print(temp) // otomatik olarak unwrapping olur
    temp = "deneme"
    print(temp)
}
else{
    print("yazı nil içeriyor")
}

// Nesne tabanlı programlama

class Araba { // sınıfları isimlendirirken baş harfi büyük yazılır - referans tip
    var renk:String?
    var hiz:Int?
    var calisiyorMu:Bool?
    
    init(){ //constructor -> sınıftan nesne oluşturulduğunda burası çalışır - değer tip
        print("boş constructtor")
    }
    init(renk:String, hiz:Int, calisiyorMu:Bool){
        self.renk = renk // soldaki değer global, sağdaki localdir. bu yüzden self kullanılmalı #shadowing denir buna -> locali globalle eşleştirmedir
        self.hiz = hiz
        self.calisiyorMu = calisiyorMu
    }
    
    func calistir(){ // side effect -> bir fonksiyonun sınıf değişkenlerini etkilemesine denir
        calisiyorMu = true
        hiz = 5
    }
    
    func durdur(){
        calisiyorMu = false
        hiz = 0
    }
    
    func hizlan(kacKm:Int){
        hiz! += kacKm
    }
    
    func yavasla(kacKm:Int){
        hiz! -= kacKm
    }
    
    func bilgiAl(){
        print("*****")
        print("Renk: \(renk!)")
        print("Hız: \(hiz!)")
        print("Çalışıyor Mu: \(calisiyorMu!)")
    }
}

var bmw = Araba(renk: "Kırmızı", hiz: 170, calisiyorMu: true)

// değer atama
/*
var bmw = Araba()

bmw.renk = "British Racing Green"
bmw.hiz = 260
bmw.calisiyorMu = true

*/
bmw.bilgiAl()
bmw.hizlan(kacKm: 50)
bmw.bilgiAl()

var tofas = Araba()

tofas.renk = "Beyaz"
tofas.hiz = 0
tofas.calisiyorMu = false

tofas.bilgiAl()
tofas.calistir()
tofas.bilgiAl()
tofas.yavasla(kacKm: 20)
tofas.bilgiAl()


// Fonksiyonlar

class Fonksiyonlar {
    
    // Void : Geri dönüş değeri olmayan
    func selamla(){
        let sonuc = "Merhaba Void Fonksiyon"
        print(sonuc)
    }
    
    // Return : Geri dönüş değeri olan
    func selamla1() -> String {
        let sonuc = "Merhaba Return Fonksiyon"
        return sonuc
    }
    
    // Parametre kullanımı
    func selamla2(isim:String){
        let sonuc = "Merhaba Void Fonksiyon \(isim)"
        print(sonuc)
    }
    
    func toplama(sayi1:Int, sayi2:Int) -> Int {
        let toplam = sayi1 + sayi2
        return toplam
    }
    
    
    // overloading -> metotların tekrar aynı isimde kullanılmasıdır
    func carpma(sayi1: Int, sayi2: Int){
        print("Çarpma: \(sayi1 * sayi2)")
    }
    
    func carpma(sayi1: Double, sayi2: Double){
        print("Çarpma: \(sayi1 * sayi2)")
    }
    
    func carpma(sayi1: Int, sayi2: Int, isim: String){
        print("Çarpma: \(sayi1 * sayi2) - İşlemi Yapan: \(isim)")
    }
}

let f = Fonksiyonlar()
f.selamla()
    
let gelenSonuc = f.selamla1()
print(gelenSonuc)

f.selamla2(isim: "Deneme")

let gelenToplam = f.toplama(sayi1: 3, sayi2: 5)
print(gelenToplam)

f.carpma(sayi1: 4, sayi2: 6, isim: "Osman")

// Static - Kotlin (companion object)

class ASinifi{
    static var x = 10 // bu artık static değişken oldu
    
   static func metod(){ // fonksiyon artık static oldu
        print("Metod çalıştı")
    }
}

/*
let a = ASinifi()

print(ASinifi().x) // isimsiz sanal bir nesne oluşturduk - her kullanımda hafızayı şişirecektir çok doğru kullanım değildir

ASinifi().metod()
*/

print(ASinifi.x) // static kullanımında parantezsiz kullanım yapılır

ASinifi.metod()

// Enum -> enumeration (eşleştirme özelinde çalışan bir yapıdır)

enum KonserveBoyut { // yazılımcı bunlara göre işlemler yapacak. deneysel olarak tür belirtilebilir
    case kucuk
    case orta
    case buyuk
}

func ucretHesapla(boyut: KonserveBoyut, adet: Int){
    switch boyut{
        case .kucuk: print("Fiyat: \(adet*13) tl")
        case .orta: print("Fiyat: \(adet*22) tl")
        case .buyuk: print("Fiyat: \(adet*34) tl")
    }
}

ucretHesapla(boyut: .buyuk, adet: 3)


// Composition -> daha çok veritabanı modelleme işlemlerinde kullanılır
// bir sınıf içerisinde başka sınıftan bir nesne kullanmaya denir

class Kategoriler {
    var kategori_id:Int?
    var kategori_ad:String?
    
    init(kategori_id:Int, kategori_ad:String){
        self.kategori_id = kategori_id
        self.kategori_ad = kategori_ad
    }
}

class Yonetmenler {
    var yonetmen_id:Int?
    var yonetmen_ad:String?
    
    init(yonetmen_id:Int, yonetmen_ad:String){
        self.yonetmen_id = yonetmen_id
        self.yonetmen_ad = yonetmen_ad
    }
}

class Filmler {
    var film_id:Int?
    var film_ad:String?
    var film_yil:Int?
    var kategori:Kategoriler? //bir sınıf içerisinde başka sınıftan nesneler tanımladık örneğin FK için
    var yonetmen:Yonetmenler?
    
    init(film_id:Int, film_ad:String, film_yil:Int, kategori:Kategoriler, yonetmen:Yonetmenler){
        self.film_id = film_id
        self.film_ad = film_ad
        self.film_yil = film_yil
        self.kategori = kategori
        self.yonetmen = yonetmen
    }
}

let k1 = Kategoriler(kategori_id: 1, kategori_ad: "Dram")
let k2 = Kategoriler(kategori_id: 2, kategori_ad: "Komedi")

let y1 = Yonetmenler(yonetmen_id: 1, yonetmen_ad: "Batuhan")
let y2 = Yonetmenler(yonetmen_id: 1, yonetmen_ad: "Batuhan")

let f1 = Filmler(film_id: 1, film_ad: "Olsun", film_yil: 2013, kategori: k2, yonetmen: y1)

print(f1.film_ad!)

// Inheritance (kalıtım) - bir sınıf tek bir yerden kalıtım alabilir

class Ev{
    var pencereSayisi:Int?
    
    init(pencereSayisi:Int){
        self.pencereSayisi = pencereSayisi
    }
}

class Villa : Ev{
    var garajVarMi:Bool?
    
    init(garajVarMi:Bool, pencereSayisi:Int){
        self.garajVarMi = garajVarMi
        super.init(pencereSayisi: pencereSayisi)
    }
}

class Saray : Ev{
    var kuleSayisi:Int?
    
    init(kuleSayisi:Int, pencereSayisi:Int){
        self.kuleSayisi = kuleSayisi
        super.init(pencereSayisi: pencereSayisi)
    }
}

var topkapiSarayi = Saray(kuleSayisi: 5, pencereSayisi: 150)
var bogazVilla = Villa(garajVarMi: true, pencereSayisi: 50)

print(topkapiSarayi.pencereSayisi!)

// override olması için kalıtım olmak zorundadır
 
class Hayvan{
    func sesCikar(){
        print("Sesim yok")
    }
}

class Memeli : Hayvan{
    
}

class Kedi : Memeli{
    override func sesCikar() {
        print("miyav")
    }
}

class Köpek : Memeli{
    override func sesCikar() {
        print("hav")
    }
}

var hayvan = Hayvan()
var memeli = Memeli()
var kedi = Kedi()
var köpek = Köpek()

hayvan.sesCikar() // kalıtıım olmadan kendi metoduna erişim sağladı
kedi.sesCikar() //kalııtım yoluyla kendi metodlarına erişim sağladı
memeli.sesCikar() // önce kendisine baktı içi boş olduğu için daha sonra üst sınıftan gitti metodu çağırdı

// Nesne dönüşümleri -> ön koşul: kalıtım olmalıdır

// Upcasting
var ev = Saray(kuleSayisi: 3, pencereSayisi: 10) as Ev

// Downcasting
var saray = Ev(pencereSayisi: 4) as? Saray

//

/*
if ev is Ev{
    print("Nesne ev sınıfından türetilmiş")
}
else{
    print("nesne ev sınıfından türetilmemiştir")
}
*/
 
// protocol == interface (çok önemli iyi öğren) listeleme, veri transferi, sayfalar arası bağlantılar vs kullanılacak

protocol MyProtocol {
    var degisken:Int {get set}
    
    func metot1()
    func metot2() -> String
}

class ClassA : MyProtocol {
    var degisken: Int = 10
    func metot1() {
        print("metot1 çalıştı")
    }
    
    func metot2() -> String {
        return "metot2 çalıştı"
    }
}

var a = ClassA()

print(a.degisken)
a.metot1()
print(a.metot2())


// Extension

extension Int {
    func carp(sayi:Int) -> Int {
        return self * sayi
    }
}

let x = 3.carp(sayi: 5)

print(x)

// closure

let ifade = {
    print("Çalıştı")
}

ifade()

let topla = {
    (sayi1:Int, sayi2:Int) -> Int in
    return sayi1 + sayi2
}

let t = topla(4,5)
print(t)


