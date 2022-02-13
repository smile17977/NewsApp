package newsapp

import io.ktor.client.*
import io.ktor.client.engine.okhttp.*

fun AndroidHttpClient() = HttpClient(OkHttp) {
    engine {
        config{
            retryOnConnectionFailure(true)
        }
    }
}

actual fun createHttpClient():HttpClient {
    return AndroidHttpClient()
}