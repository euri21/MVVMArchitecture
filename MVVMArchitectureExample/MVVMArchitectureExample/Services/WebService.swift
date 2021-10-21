//
//  WebService.swift
//  MVVMArchitectureExample
//
//  Created by solution888 on 2021/10/21.
//

import UIKit
import Foundation

class WebService {
    func getArticles(_ url: URL, completion: @escaping([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
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
            completion(articleList?.articles)
        })
    }
}
