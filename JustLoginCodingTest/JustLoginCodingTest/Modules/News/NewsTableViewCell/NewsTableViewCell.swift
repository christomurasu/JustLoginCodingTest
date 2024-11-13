//
//  NewsTableViewCell.swift
//  JustLoginCodingTest
//
//  Created by Christopher Sonny on 13/11/24.
//

import UIKit
import Kingfisher
class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsSubtitleLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var thumbnailImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView(news: News) {
        newsTitleLabel.text = news.title
        newsSubtitleLabel.text = news.title
        KF.url(URL(string: news.thumbnail ?? "")).set(to: thumbnailImage)
        publishedDateLabel.text = news.updatedAt
    }
    
}
