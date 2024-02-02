//
//  HomeViewController.swift
//  UXApp-iOS-YakoDesign
//
//  Created by Jacobo Ramirez on 7/01/24.
//
import UIKit

class HomeViewController: UIViewController{
    
    @IBOutlet weak var lastesNewHorizontalStackView: UIStackView!
    @IBOutlet weak var categoryHorizontalStackView: UIStackView!
    @IBOutlet weak var newsVerticalTableView: UITableView!

    let buttonTitles = [
        "Technology", "Science", "Health", "Business", "Education", "Sports", "Politics", "Travel", "Fashion", "Entertainment"
    ]
    
    let newsContent: [NewsModel] = [
        NewsModel(title: "Crypto investors", author: "Author 1", date: "January 1, 2024", content: "Some content about crypto investors. Lorem ipsum dolor sit amet, consectetur adipiscing elit.", imageName: "news_image_01"),
        
        NewsModel(title: "New Technology Release", author: "Author 2", date: "January 2, 2024", content: "Details about the latest technology release. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", imageName: "news_image_02"),

        NewsModel(title: "Healthcare Innovations", author: "Author 3", date: "January 3, 2024", content: "Innovations in healthcare. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", imageName: "news_image_03"),

        NewsModel(title: "Fashion Trends 2024", author: "Author 4", date: "January 4, 2024", content: "Explore upcoming fashion trends for the year 2024. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", imageName: "news_image_04"),

        NewsModel(title: "Science Discoveries", author: "Author 5", date: "January 5, 2024", content: "Recent discoveries in the field of science. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", imageName: "news_image_04")
    ]

    
    
    func createCategoryButton(withTitle title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.buttonCol.cgColor
        button.layer.cornerRadius = 10
        return button
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLastestNews()
        setupButtons()
        setupCustomCell()
        
        newsVerticalTableView.delegate = self
        newsVerticalTableView.dataSource = self
    }
    
    
    func setupCustomCell(){
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        newsVerticalTableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    func setupLastestNews(){
        for content in newsContent {
            if let newView = Bundle.main.loadNibNamed("LatestNewController", owner: nil, options: nil)!.first as? LatestNewController {
                newView.translatesAutoresizingMaskIntoConstraints = false
                newView.configure(withTitle: content.title, description: content.content, imageName: content.imageName)
                lastesNewHorizontalStackView.addArrangedSubview(newView)
            }
        }
    }
    
    func setupButtons() {
        for title in buttonTitles {
            let button = createCategoryButton(withTitle: title)
            categoryHorizontalStackView.addArrangedSubview(button)
        }
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        if let title = sender.currentTitle {
            print("Boton de: \(title)")
        }
    }
}

extension HomeViewController: UITableViewDelegate ,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        
        let currentNews = newsContent[indexPath.row]
        cell.customCellTitleLabel?.text = currentNews.title
        cell.customCellAutorLabel?.text = currentNews.author
        cell.customCellDayLabel?.text = currentNews.date
        
        cell.customCellImageView?.image = UIImage(named: currentNews.imageName)
        cell.customCellImageView?.contentMode = .scaleAspectFill
        cell.customCellImageView?.clipsToBounds = true
        
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        
        return cell
    }
    
    func showDetails(forNewsAtIndex index: Int) {
        let detailsViewController = DetailViewController(title: "", date: "", content: "", imageName: "")
        let selectedNews = newsContent[index]
        detailsViewController.configure(withTitle: selectedNews.title, date: selectedNews.date, content: selectedNews.content, imageName: selectedNews.imageName)
        present(detailsViewController, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showDetails(forNewsAtIndex: indexPath.row)
        print("show detail")
    }

}
