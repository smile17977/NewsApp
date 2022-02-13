package newsapp.service

import news.data.NewsList
import newsapp.network.NetworkClient

class NewsService constructor(val networkClient: NetworkClient) {
    suspend fun getNewsList():ContentResponse<NewsList> {
        return networkClient.getData(Urls.NEWS_LIST)
    }

    companion object Urls {
        const val NEWS_LIST = "v2/top-headlines?language=en"
    }
}