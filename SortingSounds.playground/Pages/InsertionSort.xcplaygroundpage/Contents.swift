//#-hidden-code
import Foundation
//#-end-hidden-code
/*:
 [Back to home](Home)
 ## Insertion Sort
 Insertion Sort is a simple sort that traverses the array and moves each element to it's correct location in the array, similarly to how one might commonly sort a hand of cards. It runs in O(N^2).
 */
// Number of values in array
let N = /*#-editable-code*/15/*#-end-editable-code*/
// Speed of animation, from 0 - 9 (inclusive)
let speed = /*#-editable-code*/8/*#-end-editable-code*/
/*:
 ```
 5 1 4 2 8 7 3
 1 5 4 2 8 7 3 // 1 < 5 so it should be swapped
 1 4 5 2 8 7 3 // 4 < 5 and 4 > 1, so it's placed in between
 1 2 4 5 8 7 3
 1 2 4 5 8 7 3 // 8 is already in the right spot
 1 2 4 5 7 8 3
 1 2 3 4 5 7 8
 ```
 * callout(Swift Code):
 ![Image of code with highlighting](insertion.png)

 */
//#-hidden-code
insertion(N: N, speed: 10 - speed)
//#-end-hidden-code
