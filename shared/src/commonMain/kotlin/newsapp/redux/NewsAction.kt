package newsapp.redux

import news.data.NewsItem
import newsapp.service.ErrorResponse

sealed class NewsAction : Action {
    data class Refresh(val forceLoad: Boolean) : NewsAction()
    data class SelectItem(val feed: NewsItem?) : NewsAction()
    data class Data(val feeds: List<NewsItem>) : NewsAction()
    data class Error(val error: ErrorResponse) : NewsAction()
}