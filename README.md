# deliver_asap

Adds a 'deliver_asap' method to Mail::Message. This method works as the 'deliver_now' method, but transmits the
mail in the background instead. Useful if one is not really at the stage where it makes sense to pay for a worker dyno
on Heroku, but wants a snappy user experience when sending a signup mail, for example.

## Usage

When creating a user you could send an email in the background without keeping the user who just signed up waiting by
doing:

```ruby
AccountMailer.welcome(@user, ...).deliver_asap
```

This assumes an AccountMailer that looks something like this:

```ruby
class AccountMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to a site')
  end
end
```

That is all.
