//
//  APIManager.swift
//  iOS_Demo
//
//  Created by Infaz Ariff on 20/6/22.
//
import Foundation
import Alamofire

public class APIManager {
    
    static let networkEnviroment: NetworkEnvironment = .dev
    
    //MARK: - Properities
    public class var sharedInstance: APIManager {
        struct Singleton {
            static let instance : APIManager = APIManager()
        }
        return Singleton.instance
    }
    
    
    /// Common API call
    /// - Parameters:
    ///   - type: End point type
    ///   - params: passing values
    ///   - handler: completion handler
    func call<T>(type: EndPointType, params: Parameters? = nil, handler: @escaping (Swift.Result<T, AlertMessage>) -> Void) where T: Codable {
        
        if isConnectedToInternet() == true {
            AF.request(type.url, method: type.httpMethod, parameters: params, encoding: type.encoding, headers: type.headers, interceptor: nil).validate().responseJSON { (data) in
                do {
                    guard let jsonData = data.data else {
                        throw AlertMessage(title: "Error", body: "No data")
                    }
                    do {
                        let data =  try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String:AnyObject]  // first of all convert json to the data
                        print(data ?? "Incorrect format")
                    } catch let myJSONError {
                        print(myJSONError)
                    }
                    
                    let result = try JSONDecoder().decode(T.self, from: jsonData)
                    handler(.success(result))
                } catch {
                    if let error = error as? AlertMessage {
                        return handler(.failure(error))
                    }
                    
                    handler(.failure(self.parseApiError(data: data.data)))
                }
            }
        }else{
            print("Internet not available")
        }
    }

    
    /// Check network available or not
    /// - Returns: true of network available
    private func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    ///  Error messages handler
    /// - Parameter data: error data
    /// - Returns: data for alert message
    private func parseApiError(data: Data?) -> AlertMessage {
        let decoder = JSONDecoder()
        if let jsonData = data, let error = try? decoder.decode(ErrorModel.self, from: jsonData) {
            return AlertMessage(title: AlertTitle.defaultAlertTitle, body: error.message ?? "Error")
        }
        return AlertMessage(title: AlertTitle.defaultAlertTitle, body: AlertBody.genericErrorMessage)
    }
}
