require 'active_support'
require 'cucumber/rspec/doubles'

include ActiveSupport::NumberHelper

Given("I have many values") do  
   #@values = [ 122365.24, 599.00, 850139.99, 23329.50, 566.27]   
   values_obj = []
   values_obj << instance_double("Value", :value =>122365.24) 
   values_obj << instance_double("Value", :value =>599.00) 
   values_obj << instance_double("Value", :value =>850139.99) 
   values_obj << instance_double("Value", :value =>23329.50)    
   values_obj << instance_double("Value", :value =>566.27) 
   
   @values = []
   values_obj.each do |obj|
      @values << obj.value
   end 
end

When("I goto {string}") do |string|
  # visit root_path, visit "/#{place}"
  visit "https://salty-savannah-33557.herokuapp.com/values"
end

Then("I should see the right number of values appear on the screen") do
   page_str = page.body
   currency_array =  page_str.scan(/\$\d+\,?\d+\.\d{2}/)  
   count_on_screen = currency_array.length - 1  # subtract the last balance value    
   expect(count_on_screen).to eq(@values.length)
end

Then("I should see the values on the screen are greater than {int}") do |int|
   page_str = page.body
   currency_array =  page_str.scan(/\$\d+\,?\d+\.\d{2}/)  
   # convert currency array to float
   values_float =[]
   currency_array.each do |cur_val|
      # keep the digits and dot, others to nil
      values_float << cur_val.to_s.gsub(/[^\d\.]/, '').to_f
   end
   values_float.each do  |val| 
      expect(val).to be > int
   end
end

Then("I should see the total balance is correct based on the values listed on the screen") do
   page_str = page.body
   currency_array =  page_str.scan(/\$\d+\,?\d+\.\d{2}/)  
   # convert currency array to float
   values_float =[]
   currency_array.each do |cur_val|
      # keep the digits and dot, others to nil
      values_float << cur_val.to_s.gsub(/[^\d\.]/, '').to_f
   end
   balance_on_screen = values_float.pop
   sum_values = values_float.reduce(:+)
   expect(sum_values).to eq(balance_on_screen)  
end

Then("I should see the values are formatted as currencies") do
   page_str = page.body
   @values.each do |val| 
      currency_val = number_to_currency(val)
      expect(page_str).to include(currency_val) 
   end
end
 
Then("I should see total balance matches the sum of the values") do
   page_str = page.body
   currency_array =  page_str.scan(/\$\d+\,?\d+\.\d{2}/)
   balance_on_screen = currency_array.pop.to_s.gsub(/[^\d\.]/, '').to_f
   sum_values = @values.reduce(:+)
   expect(balance_on_screen).to eq(sum_values)   
end
