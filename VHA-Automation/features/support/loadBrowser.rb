#loading the required browser
def loadBrowser arg1
  case arg1
    when 'firefox47'
      ENV['BROWSER'] = 'firefox'
      ENV['REPORTNAME'] = 'firefox'
      ENV['BROWSER_VERSION'] = '47'
      ENV['platform'] = 'WINDOWS'
    when 'chrome51'
      ENV['BROWSER'] = 'chrome'
      ENV['REPORTNAME'] = 'chrome'
      ENV['BROWSER_VERSION'] = '51'
      ENV['platform'] = 'WINDOWS'
    else
      puts "Must enter browser details to execute. Supported browsers are \n firefox47 \n chrome51"
      exit
  end
end
