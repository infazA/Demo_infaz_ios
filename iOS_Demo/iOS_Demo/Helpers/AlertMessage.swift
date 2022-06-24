//
//  AlertMessage.swift
//  iOS_Demo
//
//  Created by Infaz Ariff on 20/6/22.
//

import Foundation

class AlertMessage: Error {
    
    var title = AlertTitle.defaultAlertTitle
    var body = AlertTitle.defaultAlertTitle
    
    init(title : String,body : String) {
        self.title = title
        self.body = body
        print("title \(title) : body \(body)")
    }
}
