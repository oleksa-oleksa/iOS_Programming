enum Barcode {
	case UPCA(int, int, Int)
	case QRCode(String)
}


// Type define
//var productBarcode = Barcode?
// define
productBarcode = UPCA(8, 85909, 3)

// one line 
productBarcode = Barcode.UPCA(8, 85909, 3)

var toductBarcoe = Barcode.QRCode("DJHJAJJ"

// structure
let hd = Resolution(width: 1920, height: 1080)
let cinema = hd
cinema.width = 2048
println("cinema is now\(cinema.width) pixel wide") // 2048
println("hd is still \(hd.width) pixels wide") // 1920