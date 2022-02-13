package newsapp.redux

import news.data.NewsItem
import newsapp.service.ErrorResponse

interface NewsActionType {
    fun refresh(forceLoad: Boolean)
    fun selectItem(feed: NewsItem?)
    fun data(feeds: List<NewsItem>)
    fun error(error: ErrorResponse)
}