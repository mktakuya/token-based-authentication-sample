//
//  CourseViewController.swift
//  ios-client
//
//  Created by Takuya Mukohira on 2018/07/18.
//  Copyright © 2018年 Takuya Mukohira. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CourseViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var instructorLabel: UILabel!
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    var course_id: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let course_id = course_id else {
            return
        }

        Alamofire.request("http://localhost:3000/courses/\(course_id)", method: .get).responseJSON { response in
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

            self.nameLabel.text = course.name!
            self.codeLabel.text = "科目コード: \(course.code!)"
            self.instructorLabel.text = "教員: \(course.instructor!)"
            self.creditLabel.text = "単位数: \(course.credit!)"
            self.contentLabel.text = course.content!
        }
    }

    override func didReceiveMemoryWarning() {
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
