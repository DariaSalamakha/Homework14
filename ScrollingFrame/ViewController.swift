    //
    //  ViewController.swift
    //  ScrollingFrame
    //
    //  Created by Daria Salamakha on 10.02.2022.
    //

    import UIKit

    class ViewController: UIViewController {

        // MARK: - Outlet
        @IBOutlet weak var scrollView: UIScrollView!
        @IBOutlet weak var firstNameTextField: UITextField!
        @IBOutlet weak var surnameTextField: UITextField!
        @IBOutlet weak var addressTwoTextField: UITextField!
        @IBOutlet weak var addressOneTextField: UITextField!
        @IBOutlet weak var cityTextField: UITextField!
        @IBOutlet weak var stateTextField: UITextField!
        @IBOutlet weak var zipCodeTextField: UITextField!
        @IBOutlet weak var phoneNumberTextField: UITextField!
        
        // MARK: - Properties
        var user: User?
        
        // MARK: - Life cycle methods
        override func viewDidLoad() {
        
            super.viewDidLoad()
            registerForKeyboardNotifications()

             let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            view.addGestureRecognizer(tap)
        }

        @objc func dismissKeyboard() {
            view.endEditing(true)
        }

        // MARK: - Custom methods
        func registerForKeyboardNotifications() {
            NotificationCenter.default.addObserver(self, selector:
                #selector(keyboardWasShown(_:)),
                name: UIResponder.keyboardDidShowNotification,
                object: nil)
                NotificationCenter.default.addObserver(self, selector:
                #selector(keyboardWillBeHidden(_:)),
                name: UIResponder.keyboardWillHideNotification,
                object: nil)
            }

        @objc func keyboardWasShown(_ notificiation: NSNotification) {
            guard let info = notificiation.userInfo,
                let keyboardFrameValue =
                info[UIResponder.keyboardFrameBeginUserInfoKey]
                as? NSValue else { return }
            
            let keyboardFrame = keyboardFrameValue.cgRectValue
            let keyboardSize = keyboardFrame.size
            
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0,
            bottom: keyboardSize.height, right: 0.0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        }

        @objc func keyboardWillBeHidden(_ notification:
           NSNotification) {
            let contentInsets = UIEdgeInsets.zero
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        }
        
        func updateView() {
            guard let user = user else {return}

            firstNameTextField.text = user.name
            surnameTextField.text = user.surname
            addressOneTextField.text = user.adress1
            addressTwoTextField.text = user.adress2
            cityTextField.text = user.city
            stateTextField.text = user.state
            zipCodeTextField.text = user.zipCode
            phoneNumberTextField.text = user.phoneNumber
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard segue.identifier == "InfornamionAboutUser" else { return }
            guard let destination = segue.destination as? UserViewController else { return }
                    destination.user = user
        }
        
        // MARK: - Action
  
        @IBAction func saveButtonTapped(_ sender: UIButton) {
            
            guard let name = firstNameTextField.text,
                let surname = surnameTextField.text,
                let address1 = addressOneTextField.text,
                let address2 = addressTwoTextField.text,
                let city = cityTextField.text,
                let state = stateTextField.text,
                let zipCode = zipCodeTextField.text,
                let phoneNumber = phoneNumberTextField.text else {return}
            
            let userArr = [name, surname, address2, address1, city, state, zipCode, phoneNumber]
            var somethingEmpty = false
            
            for info in userArr {
                if info == "" {
                    somethingEmpty = true
                    break
                }
            }
            
            user = User(name: name, surname: surname, adress1: address1, adress2: address2, city: city, state: state, zipCode: zipCode, phoneNumber: phoneNumber, somethingEmpty: somethingEmpty)

            performSegue(withIdentifier: "InfornamionAboutUser", sender: self)
            
        }
    }

