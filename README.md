= UserRemarks

This gem serves as a tool to collect user remarks from your app.
This is better to have it in one place instead of hundreds of random inprecise bug report emails ;-)

The gem provides form to input the message (title and description), it also reports user object and URL where the form was called.

It reports remarks to Slack and email.

== Setup
This gem works fine with Rails > 3.2 (including Rails 4.2).

1. Add gem to gemfile

```ruby
gem 'user_remarks', github: 'matfiz/user_remarks'
```

2. Add initializer to config/initializers:

```ruby
UserRemarks.user_class = 'User'
UserRemarks.layout = 'admin'
secrets_yml = File.expand_path('../../secrets.yml', __FILE__)
secrets_config = YAML.load(ERB.new(File.read(secrets_yml)).result)['slack']
UserRemarks.slack_team = secrets_config['team']
UserRemarks.slack_token = secrets_config['token']
UserRemarks.slack_channel = '#user_remarks'
UserRemarks.mount_subdomain = 'users' #remove if not mounted inside subdomain
```

3. Mount engine in your app routes:

```ruby
mount UserRemarks::Engine, at: '/remarks', as: 'user_remarks'
```

If you decide to mount it inside subdomain, remember to set UserRemarks.mount_subdomain in initializer.

This project rocks and uses MIT-LICENSE.
