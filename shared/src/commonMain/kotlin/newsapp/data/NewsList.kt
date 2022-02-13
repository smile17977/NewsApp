package news.data

import kotlinx.serialization.Serializable

@Serializable
data class NewsList(
    var articles:List<NewsItem>
)