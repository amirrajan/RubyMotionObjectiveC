This repo shows how wrap an Objective C API so that it is more amicable to be called by RubyMotion.

1. Your wrapper code goes in the `vendor` directory. [Here is an example](https://github.com/amirrajan/RubyMotionObjectiveC/tree/master/vendor/CYAlert).
2. Add a reference to the vendor library in your Rakefile [like this](https://github.com/amirrajan/RubyMotionObjectiveC/blob/master/Rakefile#L54).
3. Invoke the wrapped api from your RubyMotion app. [Here is an example](https://github.com/amirrajan/RubyMotionObjectiveC/blob/master/app/app_delegate.rb#L14).
