package newsapp.threads

import kotlin.coroutines.CoroutineContext

expect val uiDispatcher: CoroutineContext

expect val ioDispatcher: CoroutineContext