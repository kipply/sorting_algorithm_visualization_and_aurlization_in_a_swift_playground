//#-hidden-code
import Foundation
//#-end-hidden-code
/*:
 ## Selection Sort
 Selection Sort is a simple sort that finds the smallest value in the array and then moves it to the end of a sorted array. It runs in O(N^2).
 */
// Number of values in array
let N = /*#-editable-code*/15/*#-end-editable-code*/
// Speed of animation, from 0 - 9 (inclusive)
let speed = /*#-editable-code*/8/*#-end-editable-code*/
/*:
 ```
 5 1 4 2 8 7 3
 1 5 4 2 8 7 3 // 1 and 5 are swapped as 1 is the smallest unsorted element
 1 2 4 5 8 7 3 // 2 and 5 are swapped as 2 is the smallest unsorted element
 1 2 3 5 8 7 4
 1 2 3 4 8 7 5
 1 2 3 4 5 7 8
 1 2 3 4 5 7 8 // check for 7, which is already at at the end of the sorted array
 1 2 3 4 5 7 8 // check for 8, the final element
 ```
 * callout(Swift Code):
 ![Image of code with highlighting](selection.png)
*/
//#-hidden-code
selection(N: N, speed: 10 - speed)
//#-end-hidden-code
