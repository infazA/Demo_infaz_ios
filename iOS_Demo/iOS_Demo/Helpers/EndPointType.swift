//
//  EndPointType.swift
//  iOS_Demo
//
//  Created by Infaz Ariff on 20/6/22.
//

import Foundation
import Alamofire

protocol EndPointType {
    
    // MARK: - Vars & Lets
    
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
}

enum EndpointItem {
    case getCurrentlyPlayingMovies
    case getPopularMovies
    case getImageMain
}

// MARK: - Extensions
// MARK: - EndPointType

extension EndpointItem: EndPointType {
    
    var baseAPIKey: String {
           return "55957fcf3ba81b137f8fc01ac5a31fb5"
       }
    
    var baseURL: String {
        switch APIManager.networkEnviroment {
        case .dev: return "https://api.themoviedb.org/3/movie/"
        case .production: return "https://api.themoviedb.org/3/movie/"
        case .stage: return "https://api.themoviedb.org/3/movie/"
        }
    }
    
    var path: String {
        switch self {
        case .getCurrentlyPlayingMovies:
            return "now_playing?language=en-US&page=1&api_key=\(baseAPIKey)"
        case .getPopularMovies:
            return "popular?api_key=\(baseAPIKey)&language=en-US&page=1"
        case .getImageMain:
            return "https://image.tmdb.org/t/p/original"
        }
        
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var headers: HTTPHeaders? {
        return ["Content-Type": "application/json"]
    }
    
    var url: URL {
        switch self {
        default:
            return URL(string: self.baseURL + self.path)!
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        default:
            return JSONEncoding.default
        }
    }
}

enum NetworkEnvironment {
    case dev
    case production
    case stage
}
