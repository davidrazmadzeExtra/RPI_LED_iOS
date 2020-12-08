//
//  ViewController.swift
//  RaspberryPi_LED
//
//  Created by David Razmadze on 10/14/20.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK:- Properties
  
  let baseURL = "http://10.0.0.184:8080"
  
  @IBOutlet weak var onButton: UIButton!
  @IBOutlet weak var offButton: UIButton!
  
  // MARK:- Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    styleButtons()
  }
  
  // MARK:- IBAction(s)
  
  @IBAction func onPressed(_ sender: UIButton) {
    
    animationScaleEffect(button: onButton)
    
    let url = "\(baseURL)/ledYlw/on"
    let urlObj = URL(string: url)
    
    var urlRequest = URLRequest(url: urlObj!)
    urlRequest.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: urlObj!)
    task.resume()
  }
  
  
  @IBAction func offPressed(_ sender: UIButton) {
    
    animationScaleEffect(button: offButton)
    
    let url = "\(baseURL)/ledYlw/off"
    let urlObj = URL(string: url)
    
    var urlRequest = URLRequest(url: urlObj!)
    urlRequest.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: urlObj!)
    task.resume()
  }
  
  // MARK:- Helpers
  
  func styleButtons() {
    onButton.layer.cornerRadius = 5
    offButton.layer.cornerRadius = 5
  }
  
  func animationScaleEffect(button: UIButton) {
    //
    // Scale UIButton Animation
    // https://stackoverflow.com/a/31321914/9269225
    
    UIView.animate(withDuration: 0.5,
                   animations: {
                    button.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                   },
                   completion: { _ in
                    UIView.animate(withDuration: 0.5) {
                      button.transform = CGAffineTransform.identity
                    }
                   })
  }
  
}

