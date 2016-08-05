Given(/^I load www\.vodafone\.com\.au webpage$/) do

  $browsertype=ENV['browsertype']
  $env_url = 'http://www.vodafone.com.au/'

  if $browsertype == 'chrome'
    @browser=Watir::Browser.new :chrome
    $browser = @browser
  elsif $browsertype == 'firefox' or 'ff'
     profile = Selenium::WebDriver::Firefox::Profile.new
     @browser = Watir::Browser.new :firefox
     Watir::always_locate = true
     $browser = @browser
  else
    profile = Selenium::WebDriver::Firefox::Profile.new
    @browser = Watir::Browser.new :firefox
    Watir::always_locate = true
    $browser = @browser
  end

  @browser.goto($env_url)

  # Maximize the browser window
  @browser.driver.manage.window.maximize
  # sleep(2)
  # @browser.driver.manage.window.resize_to(320, 480)

end

And(/^I click on "([^"]*)" link in the Home Page Global Header$/) do |estoreglobalheader|
  puts 'Clicking on : '+ estoreglobalheader
  estore_global_header(estoreglobalheader)
end

And(/^I click on "([^"]*)" in the Bundles Shop Menu$/) do |estoreglobalheader|
  puts 'Clicking on : '+ estoreglobalheader
  estore_global_header(estoreglobalheader)
end

When(/^I select "([^"]*)" from filter$/) do |filter|
  puts 'Selecting filter : '+ filter
  shop_mobile_category_selection(filter)
end

And(/^I click on shop button of Handset "([^"]*)"$/) do |purchasetype|

  @phonename=$host_config["mobiles"][purchasetype]["phonename"]
  @planname=$host_config["mobiles"][purchasetype]["planname"]
  @phonecolour=$host_config["mobiles"][purchasetype]["phonecolour"]
  @phonecapacity=$host_config["mobiles"][purchasetype]["phonecapacity"]
  @phonehref=$host_config["mobiles"][purchasetype]["phonehref"]
  @purchasetype=purchasetype

  puts 'Selecting the Phone: ' + @phonename
  puts 'Selecting the Plan: ' + @planname
  puts 'Selecting the Color: ' + @phonecolour
  puts 'Selecting the Capacity: ' + @phonecapacity

  @browser.link(:href, /#{@phonehref}/).when_present.click
  @browser.div(:class, "color-selectors").button(:name, @phonecolour).when_present.click
  @browser.div(:class, "device-capacity device-selector").label(:for, /#{@phonecapacity}/).when_present($timeout).click
  sleep(3)
  @browser.div(:class, "device-capacity device-selector").label(:for, /#{@phonecapacity}/).when_present($timeout).click

  if @browser.button(:id, 'decline_chat').present?
    @browser.button(:id, 'decline_chat').when_present($timeout).click
  end

  @browser.send_keys :space
  @browser.send_keys :space

  if @browser.button(:id, 'decline_chat').present?
    @browser.button(:id, 'decline_chat').when_present($timeout).click
  end

  @browser.span(:text, /#{@planname}/i).when_present($timeout).click
  @browser.button(:text, /Add to cart/i).when_present($timeout).click

end

And(/^I click to select plan extras "([^"]*)"$/) do |packtype|
  puts 'Selecting Extra Plan Pack : '+ packtype
  # @browser.radio(:id, /addon-sku1347990416mdl4/).click
  extra_plan_pack(packtype)
end

And(/^I click to select insurance and warranty$/) do
  sleep(5)
  if @browser.button(:id, 'decline_chat').present?
    @browser.button(:id, 'decline_chat').when_present($timeout).click
  end
  @browser.div(:id, 'insuranceItem').button(:text, /Add/i).when_present($timeout).click
  @browser.checkbox(:name, 'insurancetc').wait_until_present($timeout)
  @browser.checkbox(:name, 'insurancetc').when_present($timeout).click
  puts 'Selecting Insurance and Warranty'
end

Then(/^I click on checkout button$/) do
  @browser.button(:text, /Check/i).when_present.click
end

And(/^I select the type of customer "([^"]*)"$/) do |arg|
  if @browser.div(:class, "vha-lightbox-dialog").present?
      if arg == 'Join'
         @browser.button(:text, /Join/i).click
      elsif arg == 'Upgrade'
        @browser.button(:text, /Upgrade/i).click
      elsif arg == 'Add to account'
        @browser.button(:text, /Upgrade/i).click
      else
        puts "Unable to click on any of the buttons in the pop up"
      end
  else
      puts "No option displayed for customer"
  end
end

And(/^I click on continue$/) do
  if @browser.button(:id, 'decline_chat').present?
     @browser.button(:id, 'decline_chat').when_present($timeout).click
  end
  @browser.button(:text, /Continue/i).when_present($timeout).click
end


And(/^I enter all basic "([^"]*)" details$/) do |customerinfo|
  @fname=$host_config["basics"][customerinfo]["fname"]
  @mname=$host_config["basics"][customerinfo]["mname"]
  @sname=$host_config["basics"][customerinfo]["sname"]
  @contact=$host_config["basics"][customerinfo]["contact"]
  @email=$host_config["basics"][customerinfo]["email"]
  @customerinfo=customerinfo

  @browser.text_field(:id, 'fname').when_present($timeout).set(@fname)
  @browser.text_field(:id, 'mname').when_present.set(@mname)
  @browser.text_field(:id, 'sname').when_present.set(@sname)
  @browser.text_field(:id, 'email').when_present.set(@email)
  @browser.text_field(:id, 'contact-number').when_present.set(@contact)

  @browser.checkbox(:id, 'notificationToSMS').click
  @browser.text_field(:id, 'delivery-comm-mobile-number').when_present.set(@contact)
  @browser.text_field(:id, 'delivery-comm-email').when_present.set(@email)
  @browser.radio(:id, 'marketing-optin-yes').click

  step "I click on continue"

end

And(/^I enter address for service and validate$/) do
  @address=$host_config["basics"]["customerdetails"]["address"]
  @browser.text_field(:id, 'homeAddress-QAS-input').when_present.set(@address)
  sleep(2)
  @browser.text_field(:id, 'homeAddress-QAS-input').send_keys :tab
  sleep(2)
  step "I click on continue"
end

And(/^I enter personal details$/) do
  sleep(2)
  if @browser.button(:id, 'decline_chat').present?
    @browser.button(:id, 'decline_chat').when_present($timeout).click
  end
  @dob=$host_config["basics"]["customerdetails"]["dob"]
  sleep(2)
  @browser.checkbox(:id, 'creditCheckConsent').click
  @browser.text_field(:id, 'dateOfBirth').when_present.set(@dob)
  @browser.radio(:id, 'residential-yes').click

  @browser.select(:id, 'residential-status').select("Renting")
  @browser.select(:id, 'currentAddress-time-year').select("3 years")
  @browser.select(:id, 'currentAddress-time-month').select("2 months")
  @browser.select(:id, 'occupation').select("Retired")
  if @browser.button(:id, 'decline_chat').present?
    @browser.button(:id, 'decline_chat').when_present($timeout).click
  end
  step "I click on continue"
end
