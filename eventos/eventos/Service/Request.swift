//
//  Request.swift
//  eventos
//
//  Created by Enrique Dutra on 22/09/21.
//

import Foundation

class Request{
    
    let url: URL? = URL(string: "http://5f5a8f24d44d640016169133.mockapi.io/api/events") ?? nil
    
    func fullEventRequest(completion: @escaping () -> [Events]){
        
        guard let url = self.url else { return }
        
    }
}
