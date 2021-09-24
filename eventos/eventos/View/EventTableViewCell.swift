//
//  EventTableViewCell.swift
//  eventos
//
//  Created by Enrique Dutra on 22/09/21.
//

import Foundation
import UIKit

class EventTableViewCell: UITableViewCell{
    let eventNameLabel = UILabel()
    let eventPriceLabel = UILabel()
    
    
    var event: Event?{
        didSet{
            eventNameLabel.text = event?.title
            eventNameLabel.font = UIFont(name: "system", size: 32)
            eventPriceLabel.text = event?.price.description
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let stackView = UIStackView(arrangedSubviews: [eventNameLabel, eventPriceLabel])
        stackView.axis = .vertical
        eventNameLabel.translatesAutoresizingMaskIntoConstraints = false
        eventPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(stackView)
        
        stackView.anchor(top: self.contentView.topAnchor, leading: self.contentView.leadingAnchor, bottom: self.contentView.bottomAnchor, trailing: self.contentView.trailingAnchor)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
