//
//  ViewController.swift
//  Image Viewer App
//
//  Created by Adwaith V V on 14/02/23.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassWord: UITextField!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var userNameView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var btnView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialiseViewController()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - View initialisation
    
    func initialiseViewController(){
        self.mainView.layer.cornerRadius = 40
        self.userNameView.layer.cornerRadius = 20
        self.passwordView.layer.cornerRadius = 20
        self.btnView.layer.cornerRadius = 25
        self.txtUserName.layer.shadowColor = UIColor.black.cgColor
        self.txtUserName.layer.shadowRadius = 1
        self.txtUserName.layer.shadowOpacity = 0.50
        self.txtUserName.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.txtPassWord.layer.shadowColor = UIColor.black.cgColor
        self.txtPassWord.layer.shadowRadius = 1
        self.txtPassWord.layer.shadowOpacity = 0.50
        self.txtPassWord.layer.shadowOffset = CGSize(width: 0, height: 1)
        
    }
    
    
    // MARK: - Functions
    
    func validateFields(){
        guard txtUserName.text != "" else{
            Common.snackBar(message: "Username Cannot Be Empty")
            return
        }
        guard txtPassWord.text != "" else{
            Common.snackBar(message: "Password Cannot Be Empty")
            return
        }
        guard txtPassWord.text!.count >= 5 else{
            Common.snackBar(message: "Password Must Be Atleast 5 characters")
            return
        }
        DefaultsSecureBank.shared.userName = self.txtUserName.text ?? ""
        DefaultsSecureBank.shared.userPass = self.txtPassWord.text ?? ""
        print(txtUserName.text!)
        print(txtPassWord.text!)
        let nextVc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController")as! HomeViewController
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    // MARK: - Button Actions

    @IBAction func didSignUpButtonTapped(_ sender: UIButton){
        self.validateFields()
    }
    
    
    @IBAction func didAlreadyHaveAccountButtonTapped(_ sender: UIButton){
        
        let nextVc = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController")as! LoginViewController
        self.navigationController?.pushViewController(nextVc, animated: false)

    }

}

