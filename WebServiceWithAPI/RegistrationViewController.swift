//
//  RegistrationViewController.swift
//  WebServiceWithAPI
//
//  Created by iFlame on 8/31/17.
//  Copyright © 2017 LCCA. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController
{
    
    @IBOutlet weak var UsernameTxt: UITextField!
    @IBOutlet weak var PasswordTxt: UITextField!
    @IBOutlet weak var EmailTxt: UITextField!
    @IBOutlet weak var GenderTxt: UITextField!
    @IBOutlet weak var TypeTxt: UITextField!
    @IBOutlet weak var DOBTxt: UITextField!
    @IBOutlet weak var LocationTxt: UITextField!
    @IBOutlet weak var PhoneTxt: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SubmitClick(_ sender: Any)
    {
        let request = NSMutableURLRequest(url: NSURL(string: "")! as URL)
        request.httpMethod = "POST"
        
        let postString = ""
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest)
        {
            data, response, error in
            if error != nil
            {
                print("error=\(String(describing: error))")
                return
            }
            print("response=\(String(describing: response))")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString=\(String(describing: responseString))")
        }
        task.resume()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
