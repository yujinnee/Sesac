//
//  PhotoViewModel.swift
//  UnsplashProject
//
//  Created by 이유진 on 2023/09/12.
//

import Foundation

class PhotoViewModel {
    
    var list = Observable(Photo(total: 0, total_pages: 0, results: []))
    
    var rowCount: Int {
        return list.value.results?.count ?? 0
    }
    
    func fetchPhoto(text: String) {
        APIService.shared.searchPhoto(query: text) {photo in
            guard let photo = photo else {
                return
            }
            self.list.value = photo
           
        }
    }
    func cellForRowAt(at indexPath: IndexPath) -> PhotoResult {
        return list.value.results![indexPath.row]
    }
//    func cellForRowAtImageUrl(at indexPath: IndexPath) -> URL {
//        return URL(string:list.value.results![indexPath.row].urls.thumb)!
//    }
//    
    func imageURL(at indexPath: IndexPath) -> String {
        return cellForRowAt(at: indexPath).urls.full
    }
}
