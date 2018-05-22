//: Oleksandra Baga, 21.05.2018

import UIKit

class Employee {
    var name: String?
    var surname: String?
    var id: String?
    var startDate: Date?
    var workingHours: Double?
    
    init(name: String, surname: String, id: String, startDate: Date, workingHours: Double) {
        self.name = name
        self.surname = surname
        self.id = id
        self.startDate = startDate
        self.workingHours = workingHours
    }
    
    static var hourlyRate: Double = 10.0
    
    var yearsOfEmployment : Int {
        let calendar = NSCalendar.init(calendarIdentifier: NSCalendar.Identifier.gregorian)
        
        let currentYear = (calendar?.component(NSCalendar.Unit.year, from: Date()))!
        let employmentYear = (calendar?.component(NSCalendar.Unit.year, from: startDate!))!

        return currentYear - employmentYear
    }
    
    var myHourlyRate : Double {
        return Employee.hourlyRate + Double(yearsOfEmployment) * 0.75
    }
    
    
    lazy var salary : Double = workingHours! * myHourlyRate

}

let formatter = DateFormatter()
formatter.dateFormat = "yyyy/MM/dd"

let testPerson01 = Employee(name: "Oleksandra",
                            surname: "Baga",
                            id: "12-345",
                            startDate: (formatter.date(from: "2015/04/01"))!,
                            workingHours: 42.5)

let testPerson02 = Employee(name: "Kevin",
                            surname: "Calkin",
                            id: "ab123",
                            startDate: (formatter.date(from: "2016/04/01"))!,
                            workingHours: 42.5)

print(testPerson01.salary)
print(testPerson02.salary)

