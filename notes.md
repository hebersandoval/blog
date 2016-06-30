### `application_controller.rb` - is the heart and soul of a Sinatra app, handling all incoming requests to our app and sending back the appropiate responses to the client.

#### Defining a class that inherates from Sinatra::Base, any instance of this class will have all the functionality of the Sinatra class.
```
class ApplicationController < Sinatra::Base
  get '/' do
    erb :index
  end
end
```
#### 
