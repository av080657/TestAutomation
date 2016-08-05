module GlobalHeader
  def personal_link
    @browser.ul(:class, 'sites spl-nav-mobile-hidden').link(:href, "http://www.vodafone.com.au/")
  end

  def business_link
    @browser.ul(:class, 'sites spl-nav-mobile-hidden').link(:text, /Business/i)
  end

  def about_us
    @browser.ul(:class, 'sites spl-nav-mobile-hidden').link(:text, /about/i)
  end

  def shop
    @browser.link(:text, /Shop/i)
  end

  def my_vodafone
    @browser.link(:text, /My Vodafone/i)
  end

  def support
    @browser.link(:text, /Support/i)
  end

  def vodafone_icon
    @browser.a(:class, "logo").link(:href, "http://www.vodafone.com.au/")
  end

  def mobile_phones
    @browser.link(:text, /Mobile Phones/i)
  end

end