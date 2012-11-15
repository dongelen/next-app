class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    BubbleWrap::HTTP.get("http://still-brook-6654.herokuapp.com/books.json") do |response|
      if response.ok?
          json = BW::JSON.parse(response.body.to_str)
          p json
      end
    end
    
    true
  end
end
