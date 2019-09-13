require 'rails_helper'

RSpec.describe RegistrationMailer, type: :mailer do
  let(:email){ Capybara::Node::Simple.new(email.body.to_s)}

  it "Sends registration link" do
    user = create(:user)
    email_addr = user.emails.create!(email: 'test@test.com', password: 'test')

    email = RegistrationMailer.register(user)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['from@example.com'], email.from
    assert_equal [user.emails.first.email], email.to
    assert_equal 'Activate Your Account', email.subject
  end
end
