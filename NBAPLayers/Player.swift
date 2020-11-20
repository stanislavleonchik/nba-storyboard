import Foundation
// decodable заявляем что эта структура может быть декодированна из джсона
// тим тоже должна быть декодабл так как строингш и бул по умолч
struct Player: Decodable {
    let firstName: String
    let lastName: String
    var name: String {
        return firstName + " " + lastName
    }
    
    let heightFeet: Int?
    let heightInches: Int? // opcionalnoe znachenie tk mb null
    var height: String {
        if let heightFeet = heightFeet, let heightInches = heightInches {
            return "\(heightFeet)'\(heightInches)'"
        } else {
            return "Unknown"
        }
    }
    let position: String
    let team: Team
    
    // protocol decodabl pozvolayet first_name -> name
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case heightFeet = "lheight_feet"
        case heightInches = "height_inches"
        case position = "position"
        case team = "team"

    }
}
// создаем структуру для получения джсона
struct PlayersResponce: Decodable {
    let data: [Player]
    // повторяем структуру джсон ответа
}
