//
//  Event.swift
//  eventos
//
//  Created by Enrique Dutra on 22/09/21.
//

import Foundation

struct Event {
    var id: Int
    var longitude, latitude, price: Float
    var image: String
    var title: String
    var description: String
    var date: Date
    var people: [People]
    
}
