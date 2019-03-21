//#-hidden-code
import Foundation
//#-end-hidden-code
/*:
 ## Merge Sort
 Merge sort is a divide-and-conquer algorithm. It divides the array in half, and sorts each half through recursive calls. It always divides the array in two (until there are less than two items) and takes linear time to merge the two sorted arrays. The time complexity of Merge Sort is O(NlogN).
 */
// Number of values in array
let N = /*#-editable-code*/30/*#-end-editable-code*/
// Speed of animation, from 0 - 9 (inclusive)
let speed = /*#-editable-code*/9/*#-end-editable-code*/
/*:
 * callout(Swift Code):
 ![Image of code with highlighting](merge.png)
*/
//#-hidden-code
merge(N: N, speed: 10 - speed)
//#-end-hidden-code
