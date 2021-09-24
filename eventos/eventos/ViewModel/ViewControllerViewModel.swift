//
//  ViewControllerViewModel.swift
//  eventos
//
//  Created by Enrique Dutra on 22/09/21.
//

import Foundation

protocol ViewControllerViewModelDelegate{
    func startRequest()
    func endRequest()
    
}
extension ViewControllerViewModelDelegate{
    func stopRequest(){}
}

class ViewControllerViewModel{
    
    var delegate: ViewControllerViewModelDelegate?
    let request = Request()
    var events: [Event]?
    
    func startLoading(){
        self.delegate?.startRequest()
        request.eventsRequest { events in
            self.events = events
            self.delegate?.endRequest()
        }
        
    }
    
    
}
