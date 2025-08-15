
import Foundation
import Combine

protocol DataServiceProtocol {
    func getData<T>(_ type: T.Type) -> AnyPublisher<T, Error> where T: Decodable
}

final class MockDataService: DataServiceProtocol {
    
    func getData<T>(_ type: T.Type) -> AnyPublisher<T, Error> where T: Decodable {
        return Future { promise in
            let data = self.request(type: T.self)
            promise(.success(data))
        }
        .eraseToAnyPublisher()
    }
    func request<T: Decodable>(type: T.Type) -> T {
        let data = MockModel.sample
        return data as! T
    }
}
