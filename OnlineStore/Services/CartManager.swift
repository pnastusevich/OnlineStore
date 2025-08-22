

import SwiftUI
import Combine

protocol CartManagerProtocol {
    var productsPulisher: AnyPublisher<[Product], Never> { get }
    var countPublisher: AnyPublisher<Int, Never> { get }
    var totalPricePublisher: AnyPublisher<Double, Never> { get }
    var totalDiscountedPricePublisher: AnyPublisher<Double, Never> { get }
        
    func addProduct(_ product: Product)
    func increaseCountOfItem(of product: Product)
    func decreaseCountOfItem(of product: Product)
    func deleteProduct(_ product: Product)
    func deleteAllProducts()
    func toggleSelection(for product: Product)
    func toggleAllSelection()
}

final class CartManager: CartManagerProtocol {

    private var products = [Product]() {
        didSet {
            updatePublishers()
        }
    }
    private let productsSubject = CurrentValueSubject<[Product], Never>([])
    private let countSubject = CurrentValueSubject<Int, Never>(0)
    private let totalPriceSubject = CurrentValueSubject<Double, Never>(0.0)
    private let totalDiscountedPriceSubject = CurrentValueSubject<Double, Never>(0.0)
    
    var countPublisher: AnyPublisher<Int, Never> {
        countSubject.eraseToAnyPublisher()
    }
    
    var totalPricePublisher: AnyPublisher<Double, Never> {
        totalPriceSubject.eraseToAnyPublisher()
    }
    
    var totalDiscountedPricePublisher: AnyPublisher<Double, Never> {
        totalDiscountedPriceSubject.eraseToAnyPublisher()
    }
    
    var productsPulisher: AnyPublisher<[Product], Never> {
        productsSubject.eraseToAnyPublisher()
    }
    
    private func updatePublishers() {
        productsSubject.send(products)
        countSubject.send(products.reduce(0) { $0 + $1.count })
        
        let selectedProducts = products.filter { $0.isSelectedInCart }

        let totalWithoutDiscount = selectedProducts.reduce(0.0) { $0 + ($1.price * Double($1.count)) }
        totalPriceSubject.send(totalWithoutDiscount)
        
        let totalWithDiscount = selectedProducts.reduce(0.0) { partialResult, product in
                    let finalPrice = product.price * (1 - product.discountedPrice / 100)
                    return partialResult + (finalPrice * Double(product.count))
                }
        totalDiscountedPriceSubject.send(totalWithDiscount)
    }
    
    // MARK: - Actions
    func toggleSelection(for product: Product) {
        guard let index = products.firstIndex(where: { $0.id == product.id }) else { return }
        products[index].isSelectedInCart.toggle()
    }
    
    func toggleAllSelection() {
        let allSelected = products.allSatisfy { $0.isSelectedInCart }
        for index in products.indices {
            products[index].isSelectedInCart = !allSelected
        }
    }
    
    func addProduct(_ product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].count += 1
        } else {
            var prod = product
            if prod.count == 0 { prod.count = 1 }
            prod.isSelectedInCart = true
            products.append(prod)
        }
    }

    func deleteProduct(_ product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products.remove(at: index)
        }
    }
    
    func deleteAllProducts() {
        products.removeAll()
    }
    
    func increaseCountOfItem(of product: Product) {
        guard let index = products.firstIndex(of: product) else { return }
        products[index].count += 1
    }
    
    func decreaseCountOfItem(of product: Product) {
        guard let index = products.firstIndex(of: product) else { return }
        if products[index].count > 1 {
            products[index].count -= 1
        } else {
            products.remove(at: index)
        }
    }
}
