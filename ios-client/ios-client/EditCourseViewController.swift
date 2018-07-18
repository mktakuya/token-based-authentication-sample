//
//  EditCourseViewController.swift
//  ios-client
//
//  Created by Takuya Mukohira on 2018/07/18.
//  Copyright © 2018年 Takuya Mukohira. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class EditCourseViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var codeField: UITextField!
    @IBOutlet weak var instructorField: UITextField!
    @IBOutlet weak var creditField: UITextField!
    @IBOutlet weak var contentView: UITextView!

    var course_id = -1

    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request("http://localhost:3000/courses/\(self.course_id)", method: .get).responseJSON { response in
            guard let object = response.result.value else {
                return
            }
            let json = JSON(object)

            let course = Course()
            course.id = json["id"].intValue
            course.name = json["name"].stringValue
            course.code = json["code"].stringValue
            course.credit = json["credit"].intValue
            course.instructor = json["instructor"].stringValue
            course.content = json["content"].stringValue

            self.nameField.text = course.name!
            self.codeField.text = course.code!
            self.instructorField.text = course.instructor!
            self.creditField.text = "\(course.credit!)"
            self.contentView.text = course.content!
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapSubmitButton(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        guard let token = userDefaults.string(forKey: "token") else {
            return
        }
        let headers = [ "Content-Type": "application/json", "Authorization": "Bearer \(token)" ]
        let params: Parameters = [
            "name": self.nameField.text!,
            "code": self.codeField.text!,
            "instructor": self.instructorField.text!,
            "credit": self.creditField.text!,
            "content": self.contentView.text!
        ]
        
        Alamofire.request("http://localhost:3000/courses/\(course_id)", method: .patch, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            guard let object = response.result.value else {
                return
            }
            let json = JSON(object)

            if json["errors"] == JSON.null {
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: UIViewController = (storyboard.instantiateInitialViewController())!
                self.present(next, animated: true, completion: nil)
            } else {
                let errors = json["errors"].arrayValue.map { $0.stringValue }
                let message = errors.joined(separator: "\n")
                let alertController = UIAlertController(title: "エラー", message: message, preferredStyle: UIAlertControllerStyle.alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
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
