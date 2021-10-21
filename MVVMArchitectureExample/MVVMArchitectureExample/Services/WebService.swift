//
//  WebService.swift
//  MVVMArchitectureExample
//
//  Created by solution888 on 2021/10/21.
//

import UIKit
import Foundation

class WebService {
    static let NEWS_URL = "https://newsapi.org/v2/top-headlines?country=us&apiKey=e9b514c39c5f456db8ed4ecb693b0040"
    
    func getArticles(_ url: URL, completion: @escaping(ArticleList?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print(error?.localizedDescription)
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }
            let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
            completion(articleList)
        }.resume()
    }
}
