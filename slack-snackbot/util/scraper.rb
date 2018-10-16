require 'Nokogiri'
require 'watir'

class Scraper

attr_accessor :parse_page, :browser

  def initialize(url)
    @browser = Watir::Browser.new :chrome
    @browser.goto(url)
    @parse_page ||= Nokogiri::HTML.parse(browser.html)
  end

  def get_price
    parse_page.css(".productOverviewColumn .effectivePrice").text.strip[1..-1].to_f
  end

  def get_name
    parse_page.css("gx-product-title > .title").text.strip
  end

  def close
    @browser.close
  end

  def add_to_shopping_cart
    log_in
    error_count = 0
    List.last.items.each do |item|
      browser.goto(item.url)
      btn = browser.button class: "addToCartButton"
      if btn.exists?
        btn.click
      else
        error_count += 1
      end
    end
    error_count
  end

  private

  def log_in
    a = browser.a class: "productLink mat-ripple mat-button mat-raised-button mat-primary ng-star-inserted"
    a.click
    input = browser.input id: "identifierId"
    input.send_keys(ENV['GOOGLE_EMAIL'])
    span = browser.span class: "RveJvd snByac"
    span.click
    password = browser.input({type: "password", class: "whsOnd zHQkBf"})
    password.send_keys(ENV['GOOGLE_PASSWORD'])
    div = browser.div id: "passwordNext"
    sleep 1
    div.click
    sleep 1
  end
end
