//
//  MovieModel.swift
//  iOS_Demo
//
//  Created by Infaz Ariff on 20/6/22.
//

import Foundation

enum MovieModel {
    
    struct MovieModelRes: Codable {
        let page : Int?
        let total_pages : Int?
        let total_results : Int?
        let results : [MovieListModel]?
    }
      
    struct MovieListModel: Codable {
        let id : Int?
        let vote_count : Int?
        let popularity : Double?
        let vote_average : Double?
        let backdrop_path : String?
        let original_title : String?
        let overview : String?
        let poster_path : String?
        let release_date : String?
        let title : String?
        let original_language:  String?
    }
}
