
func kilocalories(fats: Double, proteins: Double, carbohydrates:Double) -> Double {
    return 4 * (carbohydrates + proteins) + 9 * fats
    
}

print("kilocalories == \(kilocalories(fats: 20,proteins: 15,carbohydrates: 32))")
