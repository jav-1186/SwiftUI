//
//  shows.swift
//  jveit-SwiftUI
//
//  Created by Jeffrey Veit on 5/16/21.
//

import Foundation

let shows = [
    Show(name: "Game of Thrones",
        type: .fantasy,
        shortDescription: "HBO",
        longDescription: "Nine noble families fight for control over the lands of Westeros, while an ancient enemy returns after being dormant for millennia."),
    
    Show(name: "Breaking Bad",
        type: .crime,
        shortDescription: "AMC",
        longDescription: "A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his family's future."),
    
    Show(name: "Friends",
        type: .comedy,
        shortDescription: "NBC",
        longDescription: "Follows the personal and professional lives of six twenty to thirty-something-year-old friends living in Manhattan."),
    
    Show(name: "SportsCenter",
        type: .sports,
        shortDescription: "ESPN",
        longDescription: "Recap of current Sports events snd highlights."),
    
    Show(name: "Westworld",
        type: .fantasy,
        shortDescription: "HBO",
        longDescription: "Set at the intersection of the near future and the reimagined past, explore a world in which every human appetite can be indulged without consequence."),
    
    Show(name: "American Horrory Story",
        type: .fantasy,
        shortDescription: "AMC",
        longDescription: "An anthology series centering on different characters and locations, including a house with a murderous past, an insane asylum, a witch coven, a freak show circus, a haunted hotel, a possessed farmhouse, a cult, the apocalypse, and a slasher summer camp."),
    
    Show(name: "Stranger Things",
        type: .fantasy,
        shortDescription: "Netflix",
        longDescription: "When a young boy disappears, his mother, a police chief and his friends must confront terrifying supernatural forces in order to get him back."),
    
    Show(name: "Cobra Kai",
        type: .sports,
        shortDescription: "Netflix",
        longDescription: "Decades after their 1984 All Valley Karate Tournament bout, a middle-aged Daniel LaRusso and Johnny Lawrence find themselves martial-arts rivals again."),
    
    
]

class Show : Identifiable {
    
    enum `Type`: String {
        case fantasy = "fantasy"
        case crime = "crime"
        case comedy = "comedy"
        case sports = "sports"
    }
    
    var name: String
    var type: Type
    var shortDescription: String
    var longDescription: String
    var id: String { name }
    
    init(name: String, type: Type, shortDescription: String, longDescription: String) {
        self.name = name
        self.type = type
        self.shortDescription = shortDescription
        self.longDescription = longDescription
    }
    
}
