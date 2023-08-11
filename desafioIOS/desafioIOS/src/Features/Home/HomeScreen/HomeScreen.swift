//
//  HomeScreen.swift
//  desafioIOS
//
//  Created by ALYSSON DODO on 09/08/23.
//

import UIKit
import Lottie

protocol HomeScreenProtocol: AnyObject {
    func tappedButton()
}

class HomeScreen: UIView {
    
    private weak var delegate : HomeScreenProtocol?
        
        func delegate(delegate : HomeScreenProtocol?){
            self.delegate = delegate
        }

    lazy var subImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage( named: LC.subImageView.text )
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    
    lazy var containerAnimationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var animationView: LottieAnimationView = {
        var animation = LottieAnimationView()
        animation.translatesAutoresizingMaskIntoConstraints = false
        animation = .init(name: LC.animationView.text)
        animation.contentMode = .scaleAspectFill
        animation.loopMode = .repeat(.infinity)
        animation.animationSpeed = 0.5
        animation.play()
        animation.backgroundColor = .clear
        animation.isHidden = false
        return animation
    }()
    

    lazy var countryTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress // defaut
        tf.placeholder = "country"
        tf.textColor = .darkGray
        tf.isSecureTextEntry = false
        return tf
    }()
    
    lazy var yearTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress // defaut
        tf.placeholder = "ano"
        tf.textColor = .darkGray
        tf.isSecureTextEntry = false
        return tf
    }()
    
    lazy var nextButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(LC.nextButton.text, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        btn.setTitleColor(.white, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius =  8
        btn.backgroundColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1.0)
        btn.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return btn
    }()
    
    func configTextFieldDelegate( delegate: UITextFieldDelegate){
          self.countryTextField.delegate = delegate
      }
    
    @objc func tappedButton(){
        delegate?.tappedButton()
    }
    
    private func addViews(){
        addSubview(subImageView)
        addSubview(containerAnimationView)
        containerAnimationView.addSubview(animationView)
        addSubview(yearTextField)
        addSubview(countryTextField)
        addSubview(nextButton)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
//
            subImageView.topAnchor.constraint(equalTo: topAnchor),
            subImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            subImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            subImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
    
            containerAnimationView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -200),
            containerAnimationView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            containerAnimationView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -450),
            containerAnimationView.heightAnchor.constraint(equalToConstant: 40),
            containerAnimationView.widthAnchor.constraint(equalToConstant: 40),
   
            yearTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            yearTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            yearTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            yearTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
 
            countryTextField.topAnchor.constraint(equalTo: yearTextField.bottomAnchor, constant: 10),
            countryTextField.leadingAnchor.constraint(equalTo: yearTextField.leadingAnchor),
            countryTextField.trailingAnchor.constraint(equalTo: yearTextField.trailingAnchor),

            nextButton.topAnchor.constraint(equalTo: countryTextField.bottomAnchor, constant: 10),
            nextButton.leadingAnchor.constraint(equalTo: countryTextField.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: countryTextField.trailingAnchor),
            
        ])
    }
}
