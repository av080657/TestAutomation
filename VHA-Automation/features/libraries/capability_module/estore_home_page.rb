def estore_global_header(estoreglobalheader)
  $user = HomePage.new(@browser)
  case estoreglobalheader
    when "SHOP"
      $user.shop.click
    when "MY VODAFONE"
      $user.my_vodafone.click
    when "SUPPORT"
      $user.support.click
    when "BUSINESS"
      $user.business_link.click
    when "PERSONAL"
      $user.personal_link.click
    when "ABOUT VODAFONE"
      $user.vodafone_icon.click
    when "MOBILE PHONES"
      $user.mobile_phones.click
    else
      abort("No Navigation link has been specified in shop_global_header")
  end
end

def shop_mobile_category_selection(filter)
  # $user = EMobileLandingPage.new(@browser)
  case filter
    when "APPLE"
      # $user.apple
      @browser.select_list.when_present(6).select("Apple")
    when "HTC"
      # $user.htc
      @browser.select_list.when_present.select("HTC")
    when "SAMSUNG"
      # $user.samsung
      @browser.select_list.when_present.select("Samsung")
    when "Huawei"
      # $user.huawei
      @browser.select_list.when_present.select("Huawei")
    when "SONY"
      # $user.sony
      @browser.select_list.when_present.select("Sony")
    else
      abort("Provided Phone Category is not available")
  end
end


def extra_plan_pack(packtype)
  $user = ShoppingCartPage.new(@browser)
  case packtype
    when "Small"
      $user.small_pack.click
    when "Medium"
      $user.medium.click
    when "Large"
      $user.large.click
    else
      abort("No Extra Plan Plan available for this plan")
  end
end