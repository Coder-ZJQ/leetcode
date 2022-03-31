/**
 * @param {number} num
 * @return {boolean}
 */
 var checkPerfectNumber = function(num) {
    if (num == 1) return false
    const sqrt = Math.sqrt(num)
    let sum = 1
    for (let i = 2; i < sqrt; i++) {
        if (num % i == 0) {
            sum += i + num / i
        }
    }
    
    return sum == num
};