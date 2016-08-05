module EMobileFilter
  def apple
    @browser.select_list.when_present.select("Apple")
  end

  def htc
    @browser.select_list.when_present.select("HTC")
  end

  def samsung
    @browser.select_list.when_present.select("Samsung")
  end

  def huawei
    @browser.select_list.when_present.select("Huawei")
  end

  def sony
    @browser.select_list.when_present.select("Sony")
  end
end