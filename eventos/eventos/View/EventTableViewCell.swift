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
    var eventImage = UIImageView()
    
    var event: Event?{
        didSet{
            eventNameLabel.text = event?.title
            eventNameLabel.font = UIFont(name: "system", size: 32)
            eventPriceLabel.text = event?.price.description
            
            
            guard let url = URL(string: event!.image) else {return}

            DispatchQueue.global().async {
                guard let data = try? Data(contentsOf: url) else { return }
                DispatchQueue.main.async {
                    let image = self.resizeImage(image: UIImage(data: data)!, targetSize: CGSize(width: 100.0, height: 100.0))
                    
                    self.eventImage.image = image
                }
                
            }
            
            
            
            
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let labelsStackView = UIStackView(arrangedSubviews: [eventNameLabel, eventPriceLabel])
//        let stackView = UIStackView(arrangedSubviews: [eventImage, labelsStackView])
        labelsStackView.axis = .vertical
//        stackView.axis = .horizontal
        eventNameLabel.translatesAutoresizingMaskIntoConstraints = false
        eventPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        addSubview(labelsStackView)
        addSubview(eventImage)
        
        eventImage.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: labelsStackView.leadingAnchor)
        
        
        labelsStackView.anchor(top: contentView.topAnchor, leading: eventImage.trailingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor)
        
        
       
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: newSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
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
