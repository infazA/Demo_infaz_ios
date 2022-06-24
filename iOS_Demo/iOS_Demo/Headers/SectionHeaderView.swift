//
//  SectionHeaderView.swift
//  iOS_Demo
//
//  Created by Infaz Ariff on 20/6/22.
//

import UIKit

class SectionHeaderView: UIView {
    
    //
    // MARK: - IBOutlets
    //
    @IBOutlet weak var lblSectionTitle: UILabel!
    
    class func instanceFromNib(index : Int) -> UIView {
        return UINib(nibName: "SectionHeaderView", bundle: nil).instantiate(withOwner: self, options: nil)[index] as! UIView
    }
    
    /// Configure title for section header
    /// - Parameter sectionTitle: title of section header
    func configure(sectionTitle: String) {
        lblSectionTitle.text = sectionTitle
    }
}
