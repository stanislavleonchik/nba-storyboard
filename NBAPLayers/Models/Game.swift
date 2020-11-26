//
//  Game.swift
//  NBAPlayers
//
//  Created by Stanislav Leonchik on /2511/20.
//

import Foundation

struct Game: Decodable {
    let rowDate: String
    let homeTeamScore: Int
    let visitorTeamScore: Int
    let season: Int
    let period: Int
    let status: String
    let time: String
    let postseason: Bool
    let homeTeam: Team
    let visitorTeam: Team
    var name: String {
        return homeTeam.name + " vs " + visitorTeam.name
    }
    var date: String {
        return String(rowDate[..<rowDate.index(rowDate.startIndex, offsetBy: 10)])
    }
    
    enum CodingKeys: String, CodingKey {
        case rowDate = "date"
        case homeTeamScore = "home_team_score"
        case visitorTeamScore = "visitor_team_score"
        case season = "season"
        case period = "period"
        case status = "status"
        case time = "time"
        case postseason = "postseason"
        case homeTeam = "home_team"
        case visitorTeam = "visitor_team"
    }
}

struct GamesResponce: Decodable {
    let data: [Game]
}
