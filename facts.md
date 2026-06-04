1. Notifier delegates( a person chosen or elected to represent, speak, or act on behalf of a larger group to othera) work or work to injected dependencies through their public interface, reflects the result as state, and never bypasses or controls the dependency's internal behavior.

2. should not use Build Context inside notifier cause then notifier depends on context which refers a specific widget, whereas notifier in independent as it can be accessible from anywhere

3.build() runs immediately the moment any provider or widget first reads the notifier — it does not wait for any method call. So any late variable that hasn't been set before that moment will crash with LateInitializationError.

4.  Stream Must Be Consumed Internally, Subscription Must Be Cancelled

A notifier method should never return a Stream to the outside. The notifier's job is to subscribe to the stream internally, update state on each event, and cancel the subscription when the provider is disposed via ref.onDispose().

5. rethrow: use when you throw your own exception inside try,
   prevents it being caught by the generic catch below

6. Cancel before new → always cancel existing subscription before starting new one

// above is about user repo
