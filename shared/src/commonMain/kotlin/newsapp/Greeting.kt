package newsapp

class Greeting {
    fun greeting(): String {
        return "Hello, ${Platform().platform}!"
    }
}