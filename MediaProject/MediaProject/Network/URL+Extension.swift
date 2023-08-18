//
//  URL+Extension.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/12.
//

import Foundation

extension URL {
    static let baseURL = "https://api.themoviedb.org/3"
    
    static func makeEndpointString(_ endpoint: String) -> String{
        return  baseURL + endpoint
    }

}
