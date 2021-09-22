//
//  Request.swift
//  eventos
//
//  Created by Enrique Dutra on 22/09/21.
//

import Foundation

class Request{
    
    let url: URL? = URL(string: "http://5f5a8f24d44d640016169133.mockapi.io/api/events") ?? nil
    
    func eventRequest(by id: Int, completion: @escaping (Event) -> ()){
        if let url = URL(string: self.url!.description + "/" + String(id)) {
            
            let task = URLSession.shared.dataTask(with: url) {(nsData, urlResponse, error) in
                
                if error == nil {
                    if let backData = nsData {
                        do {
                            let jsonResult = try JSONSerialization.jsonObject(with: backData, options: .allowFragments)
                            
                            if let event = jsonResult as? [String : Any] {
                                
                                let eventObject = Event(id: event["id"] as! Int, longitude: event["longitude"] as! Float, latitude: event["latitude"] as! Float, price: event["price"] as! Float, image: event["image"] as! String, title: event["title"] as! String, description: event["description"] as! String, date: Date(), people: [])
                                completion(eventObject)
                                
                                
                            }
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
                
            }
            task.resume()
        }
    }
    
    func eventsRequest(completion: @escaping ([Event]) -> ()){
        
        if let url = self.url{
            let task = URLSession.shared.dataTask(with: url) { (nsData, urlResponse, error) in
                
                var events: [Event] = []
                if error == nil{
                    if let backData = nsData {
                        do{
                            let jsonResult = try JSONSerialization.jsonObject(with: backData, options: .allowFragments)
                            
                            if let eventJson = jsonResult as? [[String : Any]] {
                                for event in eventJson{
                                    
                                    // Alterar date: Date() por conversão do timestamp
                                    let eventObject = Event(id: event["id"] as! Int, longitude: event["longitude"] as! Float, latitude: event["latitude"] as! Float, price: event["price"] as! Float, image: event["image"] as! String, title: event["title"] as! String, description: event["description"] as! String, date: Date(), people: [])
                                    
                                    events.append(eventObject)
                                }
                            }
                        } catch {
                            print(error.localizedDescription)
                        }
                        completion(events)
                    }
                }
            }
            task.resume()
        }
    }
}
