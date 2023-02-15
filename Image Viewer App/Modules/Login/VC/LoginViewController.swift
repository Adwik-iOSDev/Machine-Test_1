//
//  LoginViewController.swift
//  Image Viewer App
//
//  Created by Adwaith V V on 14/02/23.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var txtLoginUserName: UITextField!
    @IBOutlet weak var txtLoginPassword: UITextField!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var btnView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialiseViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        self.txtLoginUserName.text = DefaultsSecureBank.shared.userName
    }
    
    // MARK: - View initialisation
    
    func initialiseViewController(){
        self.mainView.layer.cornerRadius = 40
        self.txtLoginUserName.layer.shadowColor = UIColor.black.cgColor
        self.txtLoginUserName.layer.shadowRadius = 1
        self.txtLoginUserName.layer.shadowOpacity = 0.50
        self.txtLoginUserName.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.txtLoginPassword.layer.shadowColor = UIColor.black.cgColor
        self.txtLoginPassword.layer.shadowRadius = 1
        self.txtLoginPassword.layer.shadowOpacity = 0.50
        self.txtLoginPassword.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.btnView.layer.cornerRadius = 25
        
    }
    
    // MARK: - Functions
    
    func validateFields(){
        guard txtLoginUserName.text == DefaultsSecureBank.shared.userName else{
            Common.snackBar(message: "Enter A Valid Username")
            return
        }
        guard txtLoginPassword.text == DefaultsSecureBank.shared.userPass else{
            Common.snackBar(message: "Enter A Valid Password")
            return
        }
        let nextVc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController")as! HomeViewController
        self.navigationController?.pushViewController(nextVc, animated: true)

    }
    
    // MARK: - Button Actions

    @IBAction func didLoginButtonTapped(_ sender: UIButton){
        self.validateFields()
    }
    
    @IBAction func didDidntHaveAccountTapped(_ sender: UIButton){
        let nextVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController")as! ViewController
        self.navigationController?.pushViewController(nextVc, animated: false)
    }
    

}
