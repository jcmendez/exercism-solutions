//Solution goes in Sources
class BinarySearchTree {
    var data: Int
    var left: BinarySearchTree?
    var right: BinarySearchTree?
    
    init(_ data: Int) {
        self.data = data
    }
    
    func insert(_ data: Int) {
        if data <= self.data {
            if let left = left {
                left.insert(data)
            } else {
                left = BinarySearchTree(data)
            }
        } else {
            if let right = right {
                right.insert(data)
            } else {
                right = BinarySearchTree(data)
            }
        }
    }
    
    func allData() -> [Int] {
        var result = [data]
        if let left = left {
            result.insert(contentsOf: left.allData(), at: 0)
        }
        if let right = right {
            result.append(contentsOf: right.allData())
        }
        return result
    }
}