//
//  Constants.swift
//  iOS_Demo
//
//  Created by Infaz Ariff on 20/6/22.
//

import Foundation

enum AlertTitle {
    static let successAlertTitle = "Success"
    static let defaultAlertTitle = "Warning"
    static let errorAlertTitle = "Error"
}

enum AlertBody {
    static let genericErrorMessage = "Something went wrong, please try again."
}

//Base URL for movies thumbnail images
enum BaseURL {
    static let dev = "https://image.tmdb.org/t/p/original"
}

//Based on Row type show different size of rows
enum TableRowHeight {
    static let nowPlayingRowHeight = 180.0
    static let mostPopularRowHeight = 100.0
}

enum TextOnScreens {
    static let playingNow = "Playing Now"
    static let mostPopular = "Most Popular"
}
