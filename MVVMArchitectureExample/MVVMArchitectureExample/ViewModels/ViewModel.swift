//
//  ViewModel.swift
//  MVVMArchitectureExample
//
//  Created by solution888 on 2021/10/21.
//

import UIKit

struct ArticleListViewModel {
    let articles: ArticleList
}

extension ArticleListViewModel {
    var numberOfSections: Int {
        return 1
    }
    
    func numbersOfRowsInSection(_ section: Int) -> Int {
        return self.articles.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        return ArticleViewModel(self.articles.articles[index])
    }
}

struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String? {
        return self.article.title
    }
    var description: String? {
        return self.article.description
    }
}
