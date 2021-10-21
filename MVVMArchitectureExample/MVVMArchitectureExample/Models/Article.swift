//
//  Article.swift
//  MVVMArchitectureExample
//
//  Created by solution888 on 2021/10/21.
//

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String?
    let description: String?
}
