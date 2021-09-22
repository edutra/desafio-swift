//
//  Request.swift
//  eventos
//
//  Created by Enrique Dutra on 22/09/21.
//

import Foundation

class Request{
    
    let url: URL? = URL(string: "http://5f5a8f24d44d640016169133.mockapi.io/api/events") ?? nil
    
    func fullEventRequest(completion: @escaping () -> [Event]){
        
        guard let url = self.url else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                print(data)
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        
        task.resume()
        
    }
}
