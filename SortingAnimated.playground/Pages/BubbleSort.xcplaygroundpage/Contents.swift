//#-hidden-code
import Foundation
//#-end-hidden-code

/*:
 ## Bubble Sort
 Bubble sort is one of the simplest sorting algorithms that works by repeatedly swapping elements if they are in the wrong order. Time complexity of O(N * N), with best case of O(N) (already sorted).
*/
// Number of values in array
let N = /*#-editable-code*/15/*#-end-editable-code*/
// Speed of animation, from 0 - 9 (inclusive)
let speed = /*#-editable-code*/8/*#-end-editable-code*/
/*:
    ```
    // First Pass
    5 1 4 2 8
    1 5 4 2 8
    1 4 5 2 8
    1 4 2 5 8

    // Second Pass
    1 4 2 5 8
    1 4 2 5 8
    1 2 4 5 8
    ```
 
 * callout(Swift Code):
 ![Image of code with highlighting](bubble.png)
*/
//#-hidden-code
bubble(N: N, speed: 10 - speed)
//#-end-hidden-code
