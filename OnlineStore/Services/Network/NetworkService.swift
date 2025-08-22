
import Foundation
import Combine

protocol NetworkServiceProtocol {
    func getCategories() -> AnyPublisher<[ProductCategory], NetworkError>
    func getProductByCategory(category: String) -> AnyPublisher<ProductsResponse, NetworkError>
}

final class NetworkService: NetworkServiceProtocol {
    
    private let builderURL: BuilderURLProtocol
    
    init(builderURL: BuilderURL) {
        self.builderURL = builderURL
    }
    
    func getCategories() -> AnyPublisher<[ProductCategory], NetworkError> {
        getData([ProductCategory].self, endpoint: Endpoint.allCategories)
    }
    
    func getProductByCategory(category: String) -> AnyPublisher<ProductsResponse, NetworkError> {
        getData(ProductsResponse.self, endpoint: Endpoint.productsByCategory(category: category))
    }
    
    private func getData<T: Decodable>(_ type: T.Type, endpoint: EnpointProtocol) -> AnyPublisher<T, NetworkError> {
        Deferred {
            Future { promise in
                Task {
                    do {
                        let reults: T = try await self.request(endpoint)
                        promise(.success(reults))
                    } catch let error as NetworkError {
                        promise(.failure(error))
                    } catch {
                        promise(.failure(.decodingFailed(error)))
                    }
                }
                
            }
        }
        .eraseToAnyPublisher()
    }
    
    private func request<T: Decodable>(_ endpoint: EnpointProtocol) async throws -> T {
        guard let url = builderURL.buildURL(enpoint: endpoint) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailed(error)
        }
    }
}





//
//final class MockDataService: NetworkServiceProtocol {
//    
//    func getData<T>(_ type: T.Type) -> AnyPublisher<T, Error> where T: Decodable {
//        return Future { promise in
//            let data = self.request(type: T.self)
//            promise(.success(data))
//        }
//        .eraseToAnyPublisher()
//    }
//    func request<T: Decodable>(type: T.Type) -> T {
//        let data = MockModel.sample
//        return data as! T
//    }
//}
