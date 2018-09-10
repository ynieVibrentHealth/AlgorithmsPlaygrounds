import UIKit

var str = "Hello, playground"

var myArray = [4,5,3,82,74,45,36,37,43,49,11, 9, 34, 86]

extension Array where Element: Comparable {
    func bubbleSort() -> [Element] {//O(n^2)
        var data = self
        for i in 0..<(data.count - 1) {
            for j in 0..<(data.count - i - 1) {
                if data[j] > data[j + 1] {
                    var first = data[j]
                    var second = data[j + 1]
                    swap(i: &first, j: &second)
                    data[j] = first
                    data[j + 1] = second
                }
            }
        }
        return data
    }
    
    private func swap<T:Comparable>(i: inout T, j: inout T) {
        let temp = i
        i = j
        j = temp
    }
    
    func insertionSort() -> [Element] {//O(n^2)
        var data = self
        for i in 0..<(data.count - 1) {
            let key = data[i]
            var j = i - 1
            
            while j >= 0, data[j]>key {
                data[j+1] = data[j]
                j = j - 1
            }
            data[j + 1] = key
        }
        return data
    }
    
    func selectionSort() -> [Element]{//O(n^2)
        var data = self
        for j in 0..<(data.count - 1) {
            var iMin = j
            for i in j+1..<data.count {
                if data[i] < data[iMin] {
                    iMin = i
                }
            }
            if(iMin != j) {
                let temp = data[j]
                data[j] = data[iMin]
                data[iMin] = temp
            }
        }
        return data
    }
    
    func mergeSort<T:Comparable>(_ array:[T]) -> [T]{
        guard array.count > 1 else {return self as! [T]}
        let middleIndex = array.count / 2
        
        let leftArray:[T] = Array<T>(array[0..<middleIndex])
        let rightArray:[T] = Array<T>(array[middleIndex...])
        
        return merge(leftPile: leftArray, rightPile: rightArray)
    }
    
    private func merge<T:Comparable>(leftPile: [T], rightPile: [T]) -> [T] {
        var leftIndex = 0
        var rightIndex = 0
        var orderedPile = [T]()
        while leftIndex < leftPile.count && rightIndex < rightPile.count {
            if leftPile[leftIndex] < rightPile[rightIndex] {
                orderedPile.append(leftPile[leftIndex])
                leftIndex += 1
            } else if leftPile[leftIndex] > rightPile[rightIndex] {
                orderedPile.append(rightPile[rightIndex])
                rightIndex += 1
            } else {
                orderedPile.append(leftPile[leftIndex])
                leftIndex += 1
                orderedPile.append(rightPile[rightIndex])
                rightIndex += 1
            }
        }
        while leftIndex < leftPile.count {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < rightPile.count {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
        
        return orderedPile
    }
}

myArray = myArray.mergeSort(myArray)
print(myArray)
