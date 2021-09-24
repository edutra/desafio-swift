//
//  Event.swift
//  eventos
//
//  Created by Enrique Dutra on 22/09/21.
//

import Foundation

struct Event {
    var id: Int
    var longitude, latitude: Float
    var price: Double
    var image: String
    var title: String
    var description: String
    var date: Date
    var people: [People]
    
}
