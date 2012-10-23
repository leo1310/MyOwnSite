Given /^I see Message menu is active$/ do
  find('ul.pull-right').find('li.active')['class'] === 'active'  
end

Given /^I click message$/ do
  find('td.tbl-item-rate').click
end

Given /^I should see new message$/ do
  find('tr.bold')['class'] === 'bold'
end

Given /^I should not see new message$/ do
  find('tr')['class'] === ''
end

