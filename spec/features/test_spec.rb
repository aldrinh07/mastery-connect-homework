describe 'the-internet-heroku' do
    before :each do
        @driver.navigate.to('http://the-internet.herokuapp.com/')
    end

    it 'form authentication' do
        @driver.find_element(:link_text, 'Form Authentication').click
        @driver.find_element(:id, 'username').send_keys('tomsmith')
        @driver.find_element(:id, 'password').send_keys('SuperSecretPassword!')
        @driver.find_element(:css, 'button[type="submit"]').click
        expect(@driver.find_element(:css, '.flash.success')).to be_truthy
    end

    it 'checkboxes' do
            @driver.find_element(:link_text, 'Checkboxes').click
            expect(@driver.find_element(:css, '#checkboxes input[type="checkbox"]')).to be_truthy          #make sure at least 1 checkbox is found
            @driver.find_elements(:css, '#checkboxes input[type="checkbox"]').each { |checkbox|
                  checkbox.click if checkbox.selected? == false
                  expect(checkbox.selected? == true).to be_truthy
            }
    end

    it 'javascript alerts' do
            @driver.find_element(:link_text, 'JavaScript Alerts').click
            @driver.find_element(:css, 'button[onClick="jsAlert()"]').click
            @driver.switch_to.alert.accept
            expect(@driver.find_element(:xpath,"//*[contains(.,'You successfuly clicked an alert')]")).to be_truthy
    end
end