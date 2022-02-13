package newsapp

import newsapp.network.NetworkClient
import newsapp.service.NewsService
import kotlin.native.concurrent.ThreadLocal

class DI {
    @ThreadLocal
    companion object {
        val instance = DI()
    }

 val networkClient: NetworkClient by lazy {
     NetworkClient()
 }

    val newsService: NewsService by lazy {
        NewsService(networkClient)
    }
}