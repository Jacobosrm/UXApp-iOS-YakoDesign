//
//  NewLoginViewController.swift
//  UXApp-iOS-YakoDesign
//
//  Created by Jacobo Ramirez on 5/01/24.
//

import UIKit

class NewLoginViewController: UIViewController{
    
    
    @IBOutlet weak var contentLoginView: UIView!{
        didSet{
            contentLoginView.backgroundColor = UIColor.white
            contentLoginView.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var bienvenidoLabel: UILabel!{
        didSet{
            bienvenidoLabel.font = UIFont(name: "Roboto-Regular", size: 16)
            bienvenidoLabel.textColor = UIColor.textCol
        }
    }
    @IBOutlet weak var iniciaSesionLabel: UILabel!{
        didSet{
            iniciaSesionLabel.font = UIFont(name: "Roboto-Bold", size: 30)
            iniciaSesionLabel.textColor = UIColor.titleTextCol
        }
    }
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var forgetPasswordLabel: UILabel!{
        didSet{
            forgetPasswordLabel.font = UIFont(name: "Roboto-Normal", size: 12)
            forgetPasswordLabel.textColor = UIColor.textCol
        }
    }
    @IBOutlet weak var loginNormalButton: UIButton!{
        didSet{
            loginNormalButton.setCornerRadius(5)
            loginNormalButton.tintColor = UIColor.buttonTextCol
            loginNormalButton.backgroundColor = UIColor.buttonCol
        }
    }
    @IBOutlet weak var loginGoogleButton: UIButton!{
        didSet{
            loginGoogleButton.setCornerRadius(5)
            loginGoogleButton.tintColor = UIColor.buttonTextCol
            loginGoogleButton.backgroundColor = UIColor.textCol
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(){
        super.init(nibName: "NewLoginViewController", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBAction func loginNormalButtonPressed(_ sender: Any) {
        presentHomeViewController()
        print("present")    }
    
    @IBAction func loginGoogleButtonPressed(_ sender: Any) {
        switchToHomeViewController()
        print("rootViewController")
    }
    
    private func presentHomeViewController() {
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        present(homeViewController, animated: true, completion: nil)
    }
    
    private func switchToHomeViewController() {
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        UIApplication.shared.keyWindow?.rootViewController = homeViewController
    }
}

