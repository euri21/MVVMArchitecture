//
//  ViewController.swift
//  MVVMArchitectureExample
//
//  Created by solution888 on 2021/10/21.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    private var viewModel: ArticleListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setup()
    }

    private func setup() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=e9b514c39c5f456db8ed4ecb693b0040") else {
            return
        }
        
        WebService().getArticles(url) { articles in
            guard articles != nil else {
                return
            }
            
            self.viewModel = ArticleListViewModel(articles: articles!)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension NewsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.numbersOfRowsInSection(section) ?? 0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel?.numberOfSections ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "Cell")
        let articleVM = self.viewModel?.articleAtIndex(indexPath.row)
        cell.textLabel?.text = String("\(articleVM?.title):\(articleVM?.description)")
        
        return cell
    }
}

