//
//  NewsDetailViewController.swift
//  JustLoginCodingTest
//
//  Created by Christopher Sonny on 13/11/24.
//

import UIKit
import Kingfisher

class NewsDetailViewController: UIViewController {

    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var updateAtDateLabel: UILabel!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    var news: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let news = news else { return }
        setupView(news: news)
        // Do any additional setup after loading the view.
    }
    
    func setupView(news: News) {
        newsLabel.text = news.content
        newsTitleLabel.text = news.title
        KF.url(URL(string: news.image ?? "")).set(to: newsImage)
        updateAtDateLabel.text = news.updatedAt
        publishedDateLabel.text = news.publishedAt
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
