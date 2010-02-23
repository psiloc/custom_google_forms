Given /^I have a Google Form with slug "([^\"]*)"$/ do |slug|
  steps <<-CUCUMBER
    Given I am on the new forms page
    When I fill in "Slug" with "#{slug}"
    And I fill in "Form Key" with "dFRUNHpLZmZHbVRrdlpMRnlJclBLc0E6MA"
    And I press "Create"
    Then I should see "You can view the published form here:"
  CUCUMBER
  
  sample_form = File.read(File.join(Rails.root, "features", "fixtures", "sample_form.html"))
  
  FakeWeb.register_uri(:get, "http://spreadsheets.google.com/viewform?formkey=dFRUNHpLZmZHbVRrdlpMRnlJclBLc0E6MA", :body => sample_form)
end

