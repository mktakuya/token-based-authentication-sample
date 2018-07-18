//
//  ViewController.swift
//  ios-client
//
//  Created by Takuya Mukohira on 2018/07/17.
//  Copyright © 2018年 Takuya Mukohira. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    var courses = [Course]()

    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request("http://localhost:3000/courses", method: .get).responseJSON { response in
            guard let object = response.result.value else {
                return
            }
            let json = JSON(object)
            json.forEach { (_, data) in
                let course = Course()
                course.id = data["id"].intValue
                course.name = data["name"].stringValue
                course.code = data["code"].stringValue
                course.credit = data["credit"].intValue
                course.instructor = data["instructor"].stringValue
                course.content = data["content"].stringValue

                self.courses.append(course)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

