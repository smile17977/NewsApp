package newsapp

import io.ktor.client.*
import io.ktor.client.engine.ios.*

fun IOSHttpClient() = HttpClient(Ios) {
    engine {
        configureRequest {
            setAllowsCellularAccess(true)
        }
    }
}

actual fun createHttpClient():HttpClient {
    return IOSHttpClient()
}