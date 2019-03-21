//#-hidden-code
import Foundation
//#-end-hidden-code
/*:
 # Heap Sort
 Heap Sort is an efficient sort based on Binary Trees. It finds the maximum element and then moves it to the end in a similar manner as an Insertion Sort. However, it is optimized with the use of a Binary Tree. Binary Heaps are *Complete Binary Trees* (you may want to look into them elsewhere) and contain data such that each parent node in the tree is larger than both of its' child nodes (max heap, min heap would have smaller parents than children). Heap Sort builds a Max Heap, and then generates the sorted array. The sort runs in O(NlogN). 
*/
// Number of values in array
let N = /*#-editable-code*/30/*#-end-editable-code*/
// Speed of animation, from 0 - 9 (inclusive)
let speed = /*#-editable-code*/8/*#-end-editable-code*/
/*:
 * callout(Swift Code):
 ![Image of code with highlighting](heap.png)
*/
//#-hidden-code
heap(N: N, speed: 10 - speed)
//#-end-hidden-code
