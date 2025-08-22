
enum NetworkError: Error {
    case noData
    case decodingFailed(Error)
    case invalidURL
    case errorInServer
}
