//
//  ViewController.swift
//  TokenDecode-JWT
//
//  Created by apple on 19/07/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import JWTDecode

class ViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var tokenTextView: UITextView!
    @IBOutlet weak var resultsTextView: UITextView!
    @IBOutlet weak var decodeButton: UIButton!

    //get sample jwt token from https://jwt.io
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        
    }
    func textViewDidEndEditing(_ textView: UITextView) {

    }
    func textView(_ textView: UITextView, shouldChangeTextIn  range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
           
        }
        return true
    }

    @IBAction func decodeButtonClicked(_ sender: Any) {
        
        do {
            let jwt = try decode(jwt: tokenTextView.text!)
            // do something with data
            
            resultsTextView.text = "Results :- \n\n header : \(jwt.header)\n body: \(jwt.body)\n signature: \(jwt.signature)\n Audience : \(jwt.audience) \n Subject : \(jwt.subject) Identifier : \(jwt.identifier) \n Issuer : \(jwt.issuer) \n Not Before: \(jwt.notBefore)\n Issued At : \(jwt.issuedAt)\n Expiration Time: \(jwt.expiresAt)"
            
        } catch {
            print(error.localizedDescription)
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

