struct Weapon: Codable {
    var name = ""
    var type = ""
    var origin = ""
    var image = ""
    var favorite = false
    var bullet = 0.0
    var mv = 0
    var text = ""
    var rating = ""

    
    init(name: String, type: String, origin: String, image: String, favorite: Bool, bullet: Double, mv: Int, text: String) {
        self.name = name
        self.type = type
        self.origin = origin
        self.image = image
        self.favorite = favorite
        self.bullet = bullet
        self.mv = mv
        self.text = text
    }
}

struct WeaponSpecs: Codable {
    var types = [String]()
    var bullets = [Double]()
}

struct Origin: Codable {
    var continent = ""
    var countries = [String]()
}


