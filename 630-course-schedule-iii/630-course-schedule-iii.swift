class PriorityQueue<Element: Comparable> {
    
    private var array = [Element]()
    var count: Int {
        array.count
    }

    func enqueue(_ element: Element) {
        var left = 0, right = array.count - 1
        while left <= right {
            let mid = left + (right - left) >> 1
            if array[mid] < element {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        array.insert(element, at: left)
    }
    
    func dequeue() -> Element {
        array.removeLast()
    }
}

class Solution {
    func scheduleCourse(_ courses: [[Int]]) -> Int {
        let sortedCourses = courses.sorted {
            $0[1] < $1[1]
        }
        var time = 0, queue = PriorityQueue<Int>()
        for course in sortedCourses {
            let duration = course[0], lastDay = course[1]
            time += duration
            queue.enqueue(duration)
            if time > lastDay {
                time -= queue.dequeue()
            }
        }
        return queue.count
    }
}
