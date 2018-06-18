#!/usr/bin/ruby

require 'watir-classic'
require '.\browser_extensions'

class Watir::IE
  include BrowserExtensions
end

browser = Watir::IE.new 
browser.goto 'http://www.goodreads.com/'
browser.log_in

begin
  ARGV.each do |a|
    browser.get_books("http://www.goodreads.com/giveaway?page=#{a}&sort=ending_soon&tab=ending_soon")
  end 
end
