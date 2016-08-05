#------------IVS E2E Automation Environment variables List -------#
#                MANDATORY                                        #
#   envtype     --- Test environment for execution                #
#   browsertype --- browser name                                  #
#                                                                 #
#                OPTIONAL                                         #
#   runenv    --- Where to run the test (Grid, local)             #
#   portalenv --- OPT environments for oneportal                  #
#   domain    --- ALM Domain to update results                    #
#   project   --- ALM Project name                                #
#   qctestset --- ALM Testset name-uses regular expression to find#
#   qcpath    --- ALM Test set path                               #
#  Example::: qctestset=cycle1 qcpath='Root\Prepaid-unleashed'    #
#-----------------------------------------------------------------#


require "rubygems"
require 'selenium/webdriver'
require 'rspec/expectations'
require "watir-webdriver"
require "watir-webdriver/wait"
require "yaml"
require 'csv'
require 'pathname'
require 'rake'
require_relative './list_tags'
require_relative '../support/envSelect'
require 'tempfile'

$timeout=10000

def loadPhoneAndPlanData
  # Load environment specific data from file
  p "Loading plan and mobile config from host_config/phone_plan_selection.yml"
  host_config = YAML.load_file('host_config/phone_plan_selection.yml')
  $host_config = host_config
end

#loading data related to the test cases
loadPhoneAndPlanData
@@report_path = "html_reports"

def screenshot
  # Wait for everything to settle
  sleep 0.5

  # # Save as individual files...
  # filename = DateTime.now.strftime("%d%b%Y%H%M%S")
  png = @browser.driver.screenshot.save(:png)

  #Easiest way to get a unique filename is with Tempfile...
  file = Tempfile.new(["screenshot_", ".png"], @@report_path)
  filename = file.path
  file.close(true)

  # Write the screenshot & Embed img element
  File.open(filename, "wb") {|io| io.write(png)}
  Dir.chdir(File.dirname(filename))
  embed(File.basename(filename), 'image/png')
  # puts "Screenshot Name : " + File.basename(filename)
  # rootdir = File.expand_path("..",Dir.pwd)
  # Dir.chdir rootdir

end

Before do |scenario|
  #get all the tags associated with the scenario
  @scenario_tags = scenario.source_tag_names
  p " Current Browser value is :::::: #{$browser} :::Opening Browser now"
  $scenario = scenario

end

After do |scenario|

  begin
    # taking screenshots on failures
    if scenario.failed?
      screenshot
    end
    $browser.close
  rescue => e
    screenshot
    $browser.close
    p "Error occurred due to : #{e}"
  end
  p "Closed Browser"
end

