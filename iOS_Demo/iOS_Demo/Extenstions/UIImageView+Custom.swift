//
//  UIImageView+Custom.swift
//  iOS_Demo
//
//  Created by Infaz Ariff on 20/6/22.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    func downloaded(from link: String,placeholder: String, contentMode mode: UIView.ContentMode = .scaleAspectFill) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        let placeHolderImg = UIImage.init(named: placeholder )
        sd_setImage(with: URL(string: link),placeholderImage: placeHolderImg) { (dowloadedImage, error, SDWebImageRefreshCached, imageURL) in
            self.contentMode = .scaleAspectFill
            self.clipsToBounds = true
            if ((dowloadedImage) == nil) {
                self.image = placeHolderImg
            }else{
                self.image = dowloadedImage
            }
        }
    }
}
