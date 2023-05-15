//
//  AutorizationViewController.swift
//  NewsPaper
//
//  Created by Marat Guseynov on 12.05.2023.
//

import UIKit

class AutorizationViewController: UIViewController {
    
    let wavingHand: Character = "\u{1F44B}"
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "I am happy to see you again. You can continue where you left off by logging in."
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .lightGray
        return label
    }()
    //MARK: - Email textfield config
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 12
        textField.leftViewMode = .always
        textField.delegate = self
        textField.setLeftPaddingPoints(64)
        textField.placeholder = "Email Adress"
        textField.textColor = .black
        return textField
    }()
    private let emailTextFieldImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "mailIcon")
        return image
    }()
    private let emailTextFieldImageActivate: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "mailIconActivate")
        return image
    }()
    
    //MARK: - Password textfield config
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 12
        textField.leftViewMode = .always
        textField.delegate = self
        textField.setLeftPaddingPoints(64)
        textField.placeholder = "Password"
        textField.textColor = .black
        return textField
    }()
    private let passwordTextFieldImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "passwordIcon")
        return image
    }()
    private let passwordTextFieldImageActivate: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "passwordIconActivate")
        return image
    }()
    
    //MARK: - Secure entry button config
    
    private lazy var toggleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage.init(systemName: "eye"), for: .normal)
        button.tintColor = .systemGray3
        button.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        return button
    }()
    private var toggleObserver = true
    @objc func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
        if toggleObserver {
            toggleButton.setBackgroundImage(UIImage.init(systemName: "eye.slash"), for: .normal)
            toggleButton.tintColor = UIColor(named: "purplePrimary")
            toggleObserver = false
        } else {
            toggleButton.setBackgroundImage(UIImage.init(systemName: "eye"), for: .normal)
            toggleButton.tintColor = UIColor(named: "purplePrimary")
            toggleObserver = true
        }
    }
    //MARK: - Sign in button config
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "purplePrimary")
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        return button
    }()
    @objc private func signInButtonPressed(sender: UIButton) {
        sender.alpha = 0.3
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
        
    }
    //MARK: - Sign Up label and button config
    
    private let signUpLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Don't have an account?"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(UIColor(named: "purplePrimary"), for: .normal)
        button.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        return button
    }()
    @objc private func signUpButtonPressed(sender: UIButton) {
        sender.alpha = 0.3
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
        navigationController?.pushViewController(RegistrationViewController(), animated: true)
    }
    
    private func addViewLayout() {
        view.addSubview(descriptionLabel)
        view.addSubview(emailTextField)
        emailTextField.addSubview(emailTextFieldImage)
        view.addSubview(passwordTextField)
        passwordTextField.addSubview(passwordTextFieldImage)
        passwordTextField.addSubview(toggleButton)
        view.addSubview(signInButton)
        view.addSubview(signUpLabel)
        view.addSubview(signUpButton)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            //MARK: - Email textfield constraint
            emailTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 56),
            
            emailTextFieldImage.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor, constant: 18),
            emailTextFieldImage.centerYAnchor.constraint(equalTo: emailTextField.centerYAnchor),
            //MARK: - Password textfield constraint
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 56),
            
            passwordTextFieldImage.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor, constant: 18),
            passwordTextFieldImage.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            
            toggleButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -20),
            toggleButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            //MARK: - Sign in button
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 64),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signInButton.heightAnchor.constraint(equalToConstant: 56),
            //MARK: - Sign up label and button
            signUpLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -42),
            signUpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 66),
            
            signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -36),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -66),
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addViewLayout()
        
        //MARK: - large font nav bar
        self.title = "Wellcome back\(wavingHand)"
        // Create large title font
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24),
            NSAttributedString.Key.paragraphStyle: {
                let style = NSMutableParagraphStyle()
                style.firstLineHeadIndent = 0.0
                return style
            }()
        ]
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    //MARK: - Hide back button text in next vc
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // hide text "Back"
        let backButton = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
    }
}

extension AutorizationViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "purplePrimary")?.cgColor
        textField.backgroundColor = .white
        
        if textField == emailTextField {
            emailTextField.addSubview(emailTextFieldImageActivate)
            NSLayoutConstraint.activate([
                emailTextFieldImageActivate.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor, constant: 18),
                emailTextFieldImageActivate.centerYAnchor.constraint(equalTo: emailTextField.centerYAnchor)
            ])
        } else if textField == passwordTextField {
            toggleButton.tintColor = UIColor(named: "purplePrimary")
            passwordTextField.addSubview(passwordTextFieldImageActivate)
            NSLayoutConstraint.activate([
                passwordTextFieldImageActivate.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor, constant: 18),
                passwordTextFieldImageActivate.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor)
            ])
        }
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}