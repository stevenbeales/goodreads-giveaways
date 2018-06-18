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
  70.downto(61) do |i|
    browser.get_books("http://www.goodreads.com/giveaway?page=#{i}&sort=ending_soon&tab=ending_soon")
  end
ensure 
  begin
    60.downto(51) do |i|
      browser.get_books("http://www.goodreads.com/giveaway?page=#{i}&sort=ending_soon&tab=ending_soon")
    end
  ensure
    begin
      50.downto(41) do |i|
        browser.get_books("http://www.goodreads.com/giveaway?page=#{i}&sort=ending_soon&tab=ending_soon")
      end
    ensure
      begin
        40.downto(31) do |i|
          browser.get_books("http://www.goodreads.com/giveaway?page=#{i}&sort=ending_soon&tab=ending_soon")
        end
      ensure
        begin
          30.downto(21) do |i|
            browser.get_books("http://www.goodreads.com/giveaway?page=#{i}&sort=ending_soon&tab=ending_soon")
          end
        ensure
          begin
            20.downto(11) do |i|
              browser.get_books("http://www.goodreads.com/giveaway?page=#{i}&sort=ending_soon&tab=ending_soon")
            end
          ensure
            10.downto(1) do |i|
              browser.get_books("http://www.goodreads.com/giveaway?page=#{i}&sort=ending_soon&tab=ending_soon")
            end 
          end
        end   
      end
    end    
  end 
  browser.goto 'http://www.goodreads.com/user/sign_out'
end
