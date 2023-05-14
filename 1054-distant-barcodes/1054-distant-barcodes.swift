class Solution {
    func rearrangeBarcodes(_ barcodes: [Int]) -> [Int] {
        
        let n = barcodes.count
        guard n > 2 else { return barcodes }
        
        var counts = [Int: Int]()
        for barcode in barcodes {
            counts[barcode] = counts[barcode, default: 0] + 1
        }
        var res = [Int](repeating: 0, count: n)
        var evenIndex = 0, oddIndex = 1
        for var (num, count) in counts {

            while count > 0 && count * 2 <= n && oddIndex < n {
                res[oddIndex] = num
                oddIndex += 2
                count -= 1
            }
            
            while count > 0 {
                res[evenIndex] = num
                evenIndex += 2
                count -= 1
            }
        }
        
        return res
    }
}