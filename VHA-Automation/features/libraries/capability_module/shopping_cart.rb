module ExtraPlanPack
  def small_pack
    # @browser.radio(:id, /addon-sku1347990416mdl4/).wait_until_present($timeout)
    @browser.radio(:id, /addon-sku1347990416mdl4/)
  end

  def medium
    # @browser.span(:text, /Medium/i)
    @browser.radio(:id, /addon-sku1347990417mdl4/)
  end

  def large
    # @browser.span(:text, /Large/i)
    @browser.radio(:id, /addon-sku1347990418mdl4/)
  end

end