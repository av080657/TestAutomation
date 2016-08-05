 def envSelect scenarioTags

  client = Selenium::WebDriver::Remote::Http::Default.new
  client.timeout = 300 # seconds � default is 60
  #reading the browser details from the command line
  loadBrowser ENV['browsertype']

  Watir::always_locate = true
  $browser = browser

end




