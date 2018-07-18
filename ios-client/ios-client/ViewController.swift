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

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var courses = [Course]()
    @IBOutlet weak var tableView: UITableView!

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
                self.tableView.insertRows(at: [IndexPath(row: self.courses.count - 1, section: 0)], with: UITableViewRowAnimation.none)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.courses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell", for: indexPath) as! CourseCell
        let course = self.courses[indexPath.row]

        cell.nameAndInstructorLabel.text = "\(course.name!) （\(course.instructor!)）"
        cell.codeLabel.text = "科目コード: \(course.code!)"
        cell.creditLabel.text = "単位数: \(course.credit!)"

        return cell
    }

}

