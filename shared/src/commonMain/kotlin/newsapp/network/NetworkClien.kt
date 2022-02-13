package newsapp.network

import newsapp.createHttpClient
import newsapp.service.ContentResponse
import io.ktor.client.request.*
import io.ktor.http.*
import kotlinx.serialization.decodeFromString

class NetworkClient {
    val httpClient = createHttpClient()

    suspend inline fun<reified T> getData(path: String):ContentResponse<T> {
       val contentResponse = ContentResponse<T>()
        val json = httpClient.get<String> {
            url {
                protocol = URLProtocol.HTTPS
                host = NetworkConfig.shared.apiUrl
                encodedPath = path
                header("X-Api-Key", NetworkConfig.shared.apiKey)
            }
        }
        print(json)
        val jsonDecoder = kotlinx.serialization.json.Json { ignoreUnknownKeys = true }
        val result = jsonDecoder.decodeFromString<T>(json)
        contentResponse.content = result
        return contentResponse
    }
}