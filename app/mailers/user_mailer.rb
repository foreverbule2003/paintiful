class UserMailer < ApplicationMailer
  def confirmation_instructions(record, token, opts={})
    headers["Custom-header"] = "Bar"
    opts[:subject] = ''
    super
  end
end
