//
//  ViewController.swift
//  JustLoginCodingTest
//
//  Created by Christopher Sonny on 13/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    let viewModel = NewsViewModel()
    var news: [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "news")
        viewModel.delegate = self
        viewModel.fetchNewsData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = newsTableView.dequeueReusableCell(withIdentifier: "news") as? NewsTableViewCell else { return UITableViewCell() }
        cell.setupView(news: news[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailViewController = storyboard.instantiateViewController(withIdentifier: "NewsDetailViewController") as? NewsDetailViewController else { return }
        detailViewController.news = news[indexPath.row]
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension ViewController: NewsViewModelDelegate {
    func onSuccessFetchNewsData() {
        news = viewModel.news
        newsTableView.reloadData()
    }
    
    func onFailFetchNewsData() {
        showErrorAlert()
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(title: "Error", message: "Error Fetching News Data", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

