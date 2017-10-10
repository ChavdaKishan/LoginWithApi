//
//  ViewController.swift
//  WebServiceWithAPI
//
//  Created by iFlame on 8/31/17.
//  Copyright © 2017 LCCA. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var UsernameTxt: UITextField!
    @IBOutlet weak var PasswordTxt: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func LoginClick(_ sender: Any)
    {
        let request = NSMutableURLRequest(url: NSURL(string: "")! as URL)
        request.httpMethod = "POST"
        
        /*
        let dicParameters = ["key": "dsfhkjlkj","uname": "abc","pwd": "password"]
        do
        {
            let jsonObject = try JSONSerialization.data(withJSONObject: dicParameters, options: [])
            request.httpBody = jsonObject
        }
        catch
        {
            
        }
//        URL: http:.....
//        TYPe : POST
//        Content Type : application/json
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        */
        
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
            
            if (responseString?.contains("error"))!
            {
                DispatchQueue.main.async
                    {
                        print("Fails")
                        let alert = UIAlertController(title: "LoginFail", message: "Username or Password Check!!!!", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true,completion: nil)
                }
            }
            else
            {
                DispatchQueue.main.async
                    {
                        print("Success")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignOutView") as! SignOutViewController
                        self.present(vc, animated: true, completion: nil)
                }
            }
        }
        task.resume()
    }
    
    @IBAction func SignUpClick(_ sender: Any)
    {
        let reg = self.storyboard?.instantiateViewController(withIdentifier: "RegistrationView") as! RegistrationViewController
        self.navigationController?.pushViewController(reg, animated: true)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
