//
//  MovieCell.swift
//  iOS_Demo
//
//  Created by Infaz Ariff on 20/6/22.
//

import UIKit

//
// MARK: - Movie Cell
//
class MovieCell: UITableViewCell {
    
    //
    // MARK: - Class Constants
    //
    static let identifier = "MovieCell"
    //
    // MARK: - IBOutlets
    //
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var rating: UIView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var poster: UIImageView!
    
    var count: CGFloat = 0
    var progressView: RatingView!
    var timer: Timer!
        
    
    /// configure MovieCell
    /// - Parameter movieObj: movie details
    func configure(movieObj: MovieModel.MovieListModel) {
        title.text = movieObj.title
        releaseDate.text = movieObj.release_date
        poster.layer.borderColor = UIColor.gray.cgColor
        poster.layer.borderWidth = 1.0
        poster.downloaded(from: "\(EndpointItem.getImageMain.path)\(movieObj.poster_path ?? "")", placeholder: "no_preview")
        
        let position = CGPoint(x: rating.bounds.midX, y: rating.bounds.midY)
        
        _ = rating.layer.sublayers?.popLast()
        
        //yellow tint for movie ratings less than 50% and Green for 50% and above.
        let votePercentage = Int(movieObj.vote_average! * 10)
        let progressColor : UIColor = votePercentage > 50 ? UIColor.green : UIColor.yellow
        
        progressView = RatingView.init(radius: 15, position: position, innerTrackColor: progressColor, outerTrackColor: UIColor.gray, lineWidth: 3, progress: votePercentage)
        rating.layer.addSublayer(progressView)
    }
}
