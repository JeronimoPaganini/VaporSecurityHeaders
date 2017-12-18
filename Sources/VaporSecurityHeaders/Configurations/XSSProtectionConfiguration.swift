import Vapor

public struct XSSProtectionConfiguration: SecurityHeaderConfiguration {

    public enum Options {
        case disable
        case enable
        case block
    }

    private let option: Options

    public init(option: Options) {
        self.option = option
    }

    func setHeader(on response: Response, from request: Request) {
        switch option {
        case .disable:
            response.headers[HTTPHeaders.xXssProtection] = "0"
        case .enable:
            response.headers[HTTPHeaders.xXssProtection] = "1"
        case .block:
            response.headers[HTTPHeaders.xXssProtection] = "1; mode=block"
        }
    }
}
