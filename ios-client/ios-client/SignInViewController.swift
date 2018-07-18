//
//  SignInViewController.swift
//  ios-client
//
//  Created by Takuya Mukohira on 2018/07/18.
//  Copyright © 2018年 Takuya Mukohira. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignInViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!

    var before_course_id = -1

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapLogInButton(_ sender: Any) {
        let userDefaults = UserDefaults.standard

        let name = self.nameField.text!
        let password = self.passwordField.text!

        let headers = [ "Content-Type": "application/json" ]
        let params: Parameters = [
            "name": name,
            "password": password
        ]

        Alamofire.request("http://localhost:3000/users/sign_in", method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            guard let object = response.result.value else {
                return
            }
            let json = JSON(object)

            if json["errors"] == JSON.null {
                let new_token = json["token"].stringValue
                userDefaults.setValue(new_token, forKey: "token")

                self.performSegue(withIdentifier: "toEditVCFromSignInVC", sender: nil)
            } else {
                print("Error")
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditCourseVCFromSignInVC" {
            let editCourseVC:EditCourseViewController = segue.destination as! EditCourseViewController
            editCourseVC.course_id = self.before_course_id
        }
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
