import Foundation

struct Student: Equatable {
    let id: Int
    let name : String
    var score : Double
}
class StudentManager {
    private var studentArray : [Student] = []
    private var nextId = 1
    
    func addStudent(name: String, score: Double) {
        
        guard !name.isEmpty else {
            print("Tên không hợp lệ")
            return
        }
        
        guard (0...10).contains(score) else {
            print("Không hợp lệ")
            return
        }
        let newStudent = Student(id: nextId, name: name, score: score)
        studentArray.append(newStudent)
        nextId += 1
    }
    
    func printStudents() {
        print("DANH SÁCH SINH VIÊN")
        studentArray.forEach { st in
            let status = st.score > 5 ? "PASS" : "FAILURE"
            print("\(st.name) - \(status)")
        }
    }
    func averageScore() -> Double {
        var sum : Double = 0
        for student in studentArray {
            sum += student.score
        }
        return sum / Double(studentArray.count)
    }
    
    
    
    
    
    
    func updateScore(id: Int, newScore : Double) {
        guard let index = studentArray.firstIndex(where: { $0.id == id }) else {
            return 
        }
        studentArray[index].score = newScore
    }
    func passedStudents() -> [Student] {
        return studentArray.filter{Student in Student.score > 5}
    }
    func failedStudents() -> [Student] {
        return studentArray.filter{Student in Student.score <= 5}
    }
}


let manager = StudentManager()
manager.addStudent(name: "a", score: 2)
manager.addStudent(name: "b", score: 4)
manager.addStudent(name: "c", score: 10)
manager.printStudents()
print(manager.averageScore())
manager.updateScore(id: 2, newScore: 8)
manager.printStudents()
print("Danh Sách Sinh Viên Pass:")
manager.passedStudents().forEach{ Student in
    print("\(Student.name) - \(Student.score)")}
print("Danh Sách Sinh Viên Rớt:")
manager.failedStudents().forEach{Student in
    print("\(Student.name) - \(Student.score)")}






struct Todo {
    let id: Int
    let title: String
    var isCompleted: Bool
}
class TodoManager {
    private var todos: [Todo] = []
    private var nextId : Int = 1
    
    func addTodo(title: String) {
        let trimedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimedTitle.isEmpty else {
            print("Title không được rỗng!!!")
            return
        }
        let todo = Todo(id: nextId, title: trimedTitle, isCompleted: false)
        todos.append(todo)
        nextId += 1
    }
    func togggleTodo(id: Int) {
        guard let index = todos.firstIndex(where: { $0.id == id}) else {
            return
        }
        todos[index].isCompleted.toggle()
    }
    func removeTodo(id : Int) {
        guard let index = todos.firstIndex(where: {$0.id == id}) else {
            return
        }
        todos.remove(at: index)
    }
    func countCompletedTodos() -> Int {
        return todos.filter{$0.isCompleted }.count
    }
    func printTodos() {
        todos.forEach{Todo in
            let item = Todo.isCompleted ? "PAS" : "False"
            print("\(item) - \(Todo.id) - \(Todo.title)")}
    }
}
let Manager = TodoManager()
Manager.addTodo(title: "Chiên gà:)))")
Manager.addTodo(title: "homework")
Manager.addTodo(title: "Làm việc nhà")
Manager.printTodos()
Manager.togggleTodo(id: 1)
print("Công việc hoàn thành:")
Manager.printTodos()
Manager.countCompletedTodos()
print("Xóa id số 3")
Manager.removeTodo(id: 3)
Manager.printTodos()
