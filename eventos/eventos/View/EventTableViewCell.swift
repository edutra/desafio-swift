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
    let eventImage = UIImageView()
    
    var event: Event?{
        didSet{
            eventNameLabel.text = event?.title
            eventNameLabel.font = UIFont(name: "system", size: 32)
            eventPriceLabel.text = event?.price.description
            
            guard let eventImageUrl = event?.image else {return}
            eventImage.downloaded(from: eventImageUrl, contentMode: .scaleAspectFit)
            
            
            
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let labelsStackView = UIStackView(arrangedSubviews: [eventNameLabel, eventPriceLabel])
        let stackView = UIStackView(arrangedSubviews: [eventImage, labelsStackView])
        labelsStackView.axis = .vertical
        stackView.axis = .horizontal
        eventNameLabel.translatesAutoresizingMaskIntoConstraints = false
        eventPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        addSubview(stackView)
        
        
        stackView.anchor(top: self.contentView.topAnchor, leading: self.contentView.leadingAnchor, bottom: self.contentView.bottomAnchor, trailing: self.contentView.trailingAnchor)
        
       
       
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


// MARK:- UIImageView
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
