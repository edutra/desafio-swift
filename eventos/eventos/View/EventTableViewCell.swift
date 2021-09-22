//
//  EventTableViewCell.swift
//  eventos
//
//  Created by Enrique Dutra on 22/09/21.
//

import Foundation
import UIKit

class EventTableViewCell: UITableViewCell{
    let eventName = UILabel()
    
    var event: Event?{
        didSet{
            eventName.text = event?.title
            
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            eventName.translatesAutoresizingMaskIntoConstraints = false

            contentView.addSubview(eventName)
            

        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
         }
    
    
}
