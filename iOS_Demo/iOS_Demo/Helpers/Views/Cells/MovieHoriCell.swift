//
//  MovieHoriCell.swift
//  iOS_Demo
//
//  Created by Infaz Ariff on 20/6/22.
//

import UIKit

//
// MARK: - Movie Cell
//
class MovieHoriCell: UITableViewCell {
    
    //
    // MARK: - Class Constants
    //
    static let identifier = "MovieHoriCell"
    let imgScrollView = UIScrollView()
    let imgStackView = UIStackView()
    
    /// configure MovieHoriCell
    /// - Parameter movieObj: movie details for hiorizontal List
    func configure(movieObjs: [MovieModel.MovieListModel]) {
        
        //Creating Horizontal Scrollview
        imgScrollView.addSubview(imgStackView)
        imgScrollView.backgroundColor = UIColor.black
        self.addSubview(imgScrollView)
        
        imgStackView.translatesAutoresizingMaskIntoConstraints = false
        imgScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        imgStackView.leadingAnchor.constraint(equalTo: imgScrollView.leadingAnchor).isActive = true
        imgStackView.trailingAnchor.constraint(equalTo: imgScrollView.trailingAnchor).isActive = true
        imgStackView.bottomAnchor.constraint(equalTo: imgScrollView.bottomAnchor).isActive = true
        imgStackView.topAnchor.constraint(equalTo: imgScrollView.topAnchor).isActive = true
        imgStackView.widthAnchor.constraint(greaterThanOrEqualTo: imgScrollView.widthAnchor).isActive = true
        
        imgScrollView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        imgScrollView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true

        imgScrollView.bottomAnchor.constraint(equalTo:self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        imgScrollView.leadingAnchor.constraint(equalTo:self.leadingAnchor).isActive = true
        imgScrollView.trailingAnchor.constraint(equalTo:self.trailingAnchor).isActive = true
        
        imgStackView.axis = .horizontal
        imgStackView.distribution = .equalCentering
        imgStackView.alignment = .center
        
        for movieObj in movieObjs {
            let imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 120, height: 180))
            imageView.contentMode = .scaleAspectFill
            imageView.downloaded(from: "\(EndpointItem.getImageMain.path)\(movieObj.poster_path ?? "")", placeholder: "no_preview")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(equalToConstant: imageView.frame.height).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: imageView.frame.width).isActive = true
            
            imgStackView.addArrangedSubview(imageView)
        }
        imgStackView.setNeedsLayout()
    }
}

