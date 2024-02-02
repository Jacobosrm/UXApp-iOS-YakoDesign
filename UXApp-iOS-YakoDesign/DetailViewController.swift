//
//  DetailViewController.swift
//  UXApp-iOS-YakoDesign
//
//  Created by Jacobo Ramirez on 15/01/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    //    @IBOutlet weak var titleLabel: UILabel!
    //    @IBOutlet weak var descriptionLabel: UILabel!
    //    @IBOutlet weak var newsImageView: UIImageView!
    //
    //    // Configura la vista de detalles con los datos de la noticia
    //    func configure(withTitle title: String, description: String, imageName: String) {
    //        titleLabel.text = title
    //        descriptionLabel.text = description
    //        newsImageView.image = UIImage(named: imageName)
    //    }
    
    // Propiedades para recibir datos
    private var titleText: String?
    private var dateText: String?
    private var contentText: String?
    private var imageName: String?
    
    init(title: String, date: String, content: String, imageName: String) {
        super.init(nibName: nil, bundle: nil)
        self.titleText = title
        self.dateText = date
        self.contentText = content
        self.imageName = imageName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configura la interfaz de usuario con los datos recibidos
        setupUI()
    }
    
    // Función para configurar los datos
    func configure(withTitle title: String, date: String, content: String, imageName: String) {
        titleText = title
        dateText = date
        contentText = content
        self.imageName = imageName
    }
    
    private func setupUI() {
        // Crea y configura los elementos de la interfaz de usuario por código
        let titleLabel = UILabel()
        titleLabel.text = titleText
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 0 // Para permitir múltiples líneas
        titleLabel.textAlignment = .center // O ajusta según sea necesario
        
        let dateLabel = UILabel()
        dateLabel.text = dateText
        dateLabel.textColor = .gray
        dateLabel.textAlignment = .center // O ajusta según sea necesario
        
        let contentLabel = UILabel()
        contentLabel.text = contentText
        contentLabel.numberOfLines = 0 // Para permitir múltiples líneas
        contentLabel.textAlignment = .justified // O ajusta según sea necesario
        
        let newsImageView = UIImageView()
        if let imageName = imageName {
            newsImageView.image = UIImage(named: imageName)
            newsImageView.contentMode = .scaleAspectFill
            newsImageView.clipsToBounds = true
        }
        
        // Añade los elementos a la vista
        view.addSubview(titleLabel)
        view.addSubview(dateLabel)
        view.addSubview(contentLabel)
        view.addSubview(newsImageView)
        
        // Configura las restricciones de diseño (AutoLayout)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            // Puedes agregar más restricciones según tus necesidades
        ])
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            // Puedes agregar más restricciones según tus necesidades
        ])
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 16),
            contentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            // Puedes agregar más restricciones según tus necesidades
        ])
        
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 16),
            newsImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            newsImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            newsImageView.heightAnchor.constraint(equalToConstant: 200), // Ajusta la altura según tus necesidades
            // Puedes agregar más restricciones según tus necesidades
        ])
    }
}
