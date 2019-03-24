import Foundation

public func genData(length: Int) -> [Int] {
    var array = [Int]()
    for i in 1...length {
        array.append(i)
    }
    array.shuffle()
    return array
}

public func bubble(N: Int, speed: Int) {
    var numbers = genData(length: N)
    let arrayView = ArrayView(speed: speed)
    
    var swapped: Bool
    
    arrayView.update(with: numbers, -1)
    for i in 0..<N {
        swapped = false
        for j in 0..<N - i - 1 {
            arrayView.updateScan(with: j, N)
            if numbers[j] > numbers[j + 1] {
                numbers.swapAt(j, j + 1)
                arrayView.update(with: numbers, j + 1)
                swapped = true
            }
        }
        if !swapped {
            break
        }
    }
    arrayView.go()
}

public func merge(N: Int, speed: Int) {
    var numbers = genData(length: N)
    var arrayForDisplay = numbers
    let arrayView = ArrayView(speed: speed)
    
    arrayView.update(with: arrayForDisplay, -1)
    func merge(from start: Int, left: [Int], right: [Int]) -> [Int]{
        var l = 0
        var r = 0
        
        var sorted: [Int] = []
        
        while l < left.count && r < right.count {
            arrayView.updateScan(with: l, N)
            arrayView.updateScan(with: r, N)
            if left[l] < right[r] {
                sorted.append(left[l])
                l += 1
            } else if left[l] > right[r] {
                sorted.append(right[r])
                r += 1
            } else {
                sorted.append(left[l])
                l += 1
                sorted.append(right[r])
                r += 1
            }
            
            let newValues = sorted + Array(left[l ..< left.count]) + Array(right[r ..< right.count])
            let newSubRange = start..<(start + newValues.count)
            arrayForDisplay.replaceSubrange(newSubRange, with: newValues)
            
            arrayView.update(with: arrayForDisplay, (start + newValues.count - 1 + start) / 2)
        }
        
        if l < left.count {
            sorted += left[l ..< left.count]
        }
        
        if r < right.count {
            sorted += right[r ..< right.count]
        }
        
        return sorted
    }
    
    func mergeSort(from start: Int, a: inout [Int]) {
        arrayView.updateScan(with: start, N)
        if a.count <= 1 { return }
        
        let midIndex = a.count / 2
        var left = Array(a[0 ..< midIndex])
        var right = Array(a[midIndex ..< a.count])
        
        mergeSort(from: start, a: &left)
        mergeSort(from: start + midIndex, a: &right)
        
        a = merge(from: start, left: left, right: right)
    }
    
    mergeSort(from: 0, a: &numbers)
    arrayView.go()
}

public func quick(N: Int, speed: Int) {
    var numbers = genData(length: N)
    let arrayView = ArrayView(speed: speed)
    
    func quickSort(_ array: inout [Int], left: Int, right: Int) {
        if left >= right { return }
        
        let pivot = array[(left + right) / 2]
        
        let p = partition(&array, left: left, right: right, pivot: pivot)
        quickSort(&array, left: left, right: p)
        quickSort(&array, left: p + 1, right: right)
    }
    
    func partition(_ a: inout [Int], left: Int, right: Int, pivot: Int) -> Int {
        var i = left - 1
        var j = right + 1
        
        while true {
            repeat { i += 1 } while a[i] < pivot
            repeat { j -= 1 } while a[j] > pivot
            
            if i < j {
                a.swapAt(i, j)
                arrayView.update(with: a, j)
            } else {
                return j
            }
            arrayView.updateScan(with: j, N)
            arrayView.updateScan(with: i, N)
        }
    }
    
    quickSort(&numbers, left: 0, right: N - 1)
    arrayView.go()
}

public func insertion(N: Int, speed: Int) {
    var numbers = genData(length: N)
    let arrayView = ArrayView(speed: speed)
    
    arrayView.update(with: numbers, -1)
    for i in 1..<N {
        var y = i
        let temp = numbers[y]
        while y > 0 && temp < numbers[y - 1] {
            arrayView.updateScan(with: y, N)
            numbers[y] = numbers[y - 1]
            y -= 1
            arrayView.update(with: numbers, y)
        }
        numbers[y] = temp
        arrayView.update(with: numbers, y)
    }
    
    arrayView.go()
}

public func selection(N: Int, speed: Int) {
    var numbers = genData(length: N)
    let arrayView = ArrayView(speed: speed)
    
    arrayView.update(with: numbers, -1)
    for i in 0..<N {
        var min = Int.max
        var minIndex = 0
        for j in i..<N {
            arrayView.updateScan(with: j, N)
            if numbers[j] < min {
                min = numbers[j]
                minIndex = j
            }
        }
        numbers.swapAt(minIndex, i)
        arrayView.update(with: numbers, i)
    }
    
    arrayView.go()
}

public func bogo(N: Int, speed: Int) {
    var numbers = genData(length: N)
    let arrayView = ArrayView(speed: speed)
    let sorted = numbers.sorted()
    arrayView.update(with: numbers, -1)
    
    while (!(numbers == sorted)) {
        numbers.shuffle()
        arrayView.update(with: numbers, N - 1)
    }
    arrayView.go()
}

public func bitonic(N: Int, speed: Int) {
    var numbers = genData(length: N)
    let arrayView = ArrayView(speed: speed)
    arrayView.update(with: numbers, 0)
    
    func bitonicMerge(a: inout[Int], low: Int, count: Int, dir: Int) {
        if count > 1 {
            let k = count / 2
            for i in low ..< low + k {
                arrayView.updateScan(with: i, N)
                if (dir == 1 && a[i] > a[i + k]) || (dir == 0 && a[i] < a[i + k]) {
                    a.swapAt(i, i + k)
                    arrayView.update(with: numbers, i + k)
                }
            }
            bitonicMerge(a: &a, low: low, count: k, dir: dir)
            bitonicMerge(a: &a, low: low + k, count: k, dir: dir)
        }
    }
    
    func bitonicSort(a: inout[Int], low: Int, count: Int, dir: Int) {
        if count > 1 {
            let k = count / 2
            bitonicSort(a: &a, low: low, count: k, dir: 1)
            bitonicSort(a: &a, low: low + k, count: k, dir: 0)
            bitonicMerge(a: &a, low: low, count: count, dir: dir)
        }
    }
    bitonicSort(a: &numbers, low: 0, count: N, dir: 1)
    arrayView.go()
}

public func cocktail(N: Int, speed: Int) {
    var numbers = genData(length: N)
    let arrayView = ArrayView(speed: speed)
    arrayView.update(with: numbers, -1)
    
    var swapped: Bool = true
    var start = 0;
    var end = N - 1;
    while (swapped) {
        swapped = false
        
        for i in start ..< end {
            arrayView.updateScan(with: i, N)
            if numbers[i] > numbers[i + 1] {
                numbers.swapAt(i, i + 1)
                swapped = true
                arrayView.update(with: numbers, i + 1)
            }
        }
        
        if !swapped {
            break
        }
        
        swapped = false
        
        end -= 1
        for i in stride(from: end - 1, to: start - 1, by: -1) {
            arrayView.updateScan(with: i, N)
            if numbers[i] > numbers[i + 1] {
                numbers.swapAt(i, i + 1)
                swapped = true
                arrayView.update(with: numbers, i + 1)
            }
        }
        
        start += 1
    }
    arrayView.go()
}

public func gnome(N: Int, speed: Int) {
    var numbers = genData(length: N)
    let arrayView = ArrayView(speed: speed)
    arrayView.update(with: numbers, -1)
    
    var index = 0;
    
    while (index < N) {
        arrayView.updateScan(with: index, N)
        if index == 0 {
            index += 1
        }
        if numbers[index] >= numbers[index - 1] {
            index += 1
        } else {
            numbers.swapAt(index, index - 1)
            arrayView.update(with: numbers, index)
            index -= 1
        }
    }
    
    arrayView.go()
}

public func heap(N: Int, speed: Int) {
    var numbers = genData(length: N)
    let arrayView = ArrayView(speed: speed)
    arrayView.update(with: numbers, -1)
    
    func heapify(_ n: Int, root: Int) {
        arrayView.updateScan(with: root, N)
        
        var largest = root
        let l = 2 * root + 1
        let r = 2 * root + 2
        
        if l < n && numbers[l] > numbers[largest] {
            largest = l
        }
        if r < n && numbers[r] > numbers[largest] {
            largest = r
        }
        
        if largest != root {
            numbers.swapAt(root, largest);
            arrayView.update(with: numbers, largest)
            heapify(n, root: largest);
        }
    }
    
    for i in stride(from: N / 2 - 1, to: -1, by: -1) {
        arrayView.updateScan(with: i, N)
        heapify(N, root: i)
    }
    
    for i in stride(from: N - 1, to: -1, by: -1) {
        numbers.swapAt(0, i)
        arrayView.update(with: numbers, i)
        arrayView.updateScan(with: i, N)
        heapify(i, root: 0)
    }
    
    arrayView.go()
}
