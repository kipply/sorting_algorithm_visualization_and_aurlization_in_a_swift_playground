//#-hidden-code
import Foundation
//#-end-hidden-code
/*:
 ## Quick Sort
 Quick Sort is a divide-and-conquer algorithm. It picks a pivot and then partitions the array around the pivot (such that smaller elements are on the left of the pivot and larger ones are on the right). The pivot can either be the first element, last element, random element or median. The worst case complexity is O(N^2), though the average case is O(NlogN). Quick Sort has a worse time complexity than Merge Sort and Heap Sort, but is still faster in practice.
 */
// Number of values in array
let N = /*#-editable-code*/30/*#-end-editable-code*/
// Speed of animation, from 0 - 9 (inclusive)
let speed = /*#-editable-code*/8/*#-end-editable-code*/
/*:
 * callout(Swift Code):
 ![Image of code with highlighting](quick.png)
 */
//#-hidden-code
quick(N: N, speed: 10 - speed)
//#-end-hidden-code
