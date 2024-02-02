//
//  LoginViewController.swift
//  UXApp-iOS-YakoDesign
//
//  Created by Jacobo Ramirez on 5/01/24.
//

import UIKit

class LoginViewController: UIViewController{
    
    @IBOutlet weak var contentLoginView: UIView!{
        didSet{
            contentLoginView.backgroundColor = UIColor.backgroundCol
            contentLoginView.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var iniciaSesionLabel: UILabel!{
        didSet{
            iniciaSesionLabel.font = UIFont(name: "Roboto-Regular", size: 30)
            iniciaSesionLabel.textColor = UIColor.textCol
        }
    }
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var forgetPasswordLabel: UILabel!
    @IBOutlet weak var loginNormalButton: UIButton!{
        didSet{
            loginNormalButton.setCornerRadius(5)
            loginNormalButton.tintColor = UIColor.textCol
            loginNormalButton.backgroundColor = UIColor.buttonCol
        }
    }
    @IBOutlet weak var loginGoogleButton: UIButton!{
        didSet{
            loginGoogleButton.setCornerRadius(5)
            loginGoogleButton.tintColor = UIColor.textCol
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(){
        super.init(nibName: "LoginViewController", bundle: Bundle.main)
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


