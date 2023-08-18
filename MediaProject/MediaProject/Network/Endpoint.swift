//
//  Endpoint.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/12.
//

import Foundation

enum Endpoint{
    case trend
    case credit(Int)
   /*어떻게 활용할까
    enum TimeWindow{
        case week
        case day
    }
    enum Genre{
        case all
        case movie
        
    }
    */
    
    var requestURL: String {
        switch self {
        case .credit(let id) : return URL.makeEndpointString("/movie/\(id)/credits?api_key=\(APIKeys.tmdbKey)")
        case .trend :return URL.makeEndpointString("/trending/all/week?api_key=\(APIKeys.tmdbKey)")
            
        }
    }
    
}
