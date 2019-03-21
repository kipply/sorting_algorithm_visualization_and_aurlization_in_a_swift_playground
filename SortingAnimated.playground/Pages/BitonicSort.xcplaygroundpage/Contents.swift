//#-hidden-code
import Foundation
//#-end-hidden-code
/*:
 ## Bitonic Sort
 Bitonic Sort is an parallel, divide-and-conquer sorting algorithm. It uses bitonic sequences (increasing and then decreasing) and then converts that bitonic sequence into a sorted sequence. It is also called a Bitonic Merge Sort, and runs in O(log^2N).
 */
// Number of values in array
let N = /*#-editable-code*/32/*#-end-editable-code*/
// Speed of animation, from 0 - 9 (inclusive)
let speed = /*#-editable-code*/9/*#-end-editable-code*/
/*:
 * callout(Swift Code):
 ![Image of code with highlighting](bitonic.png)
 */
//#-hidden-code
bitonic(N: N, speed: 10 - speed)
//#-end-hidden-code
