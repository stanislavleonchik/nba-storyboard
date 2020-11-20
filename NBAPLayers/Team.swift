import Foundation
struct Team: Decodable {
    let name: String
    let city: String
    let conference: String
    var fullName: String {return city + " " + name}
    }

let lakers = Team(name: "Lakers", city: "Los Angeles", conference: "West")
let heat = Team(name: "Heat", city: "Miami", conference: "East")
