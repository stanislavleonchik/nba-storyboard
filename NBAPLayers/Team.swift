//
//  Team.swift
//  NBAPLayers
//
//  Created by Stanislav Leonchik on /1111/20.
//

import Foundation
struct Team {
    let name: String
    let city: String
    let conference: String
    // Computed property 
    var fullName: String {
        return name + " " + city
    }
}
let lakers = Team(name: "Lakers", city: "Los Angeles", conference: "West")
let heat = Team(name: "Heat", city: "Miami", conference: "East")
