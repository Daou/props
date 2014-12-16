# Props
[![](http://img.shields.io/codeclimate/github/netguru/props.svg?style=flat-square)](https://codeclimate.com/github/netguru/props)
[![](http://img.shields.io/codeclimate/coverage/github/netguru/props.svg?style=flat-square)](https://codeclimate.com/github/netguru/props)
[![](http://img.shields.io/gemnasium/netguru/props.svg?style=flat-square)](https://gemnasium.com/netguru/props)

## General info

This app is called **PROPS**. The idea behind it is to express saying 'thank you!'
in a geeky way.

## Technologies

* Ruby on Rails 4.2
* Ruby 2.1
* Postgres

## Setup

Copy database settings:

```
cp config/database.yml.sample config/database.yml
```

Create DB user:

```
createuser -s -r props
```

Setup database:

```
bin/rake db:setup
```

Setup config file for your environment:

```
cp config/sec_config.yml.sample config/sec_config.yml
```

Generate omniauth credentials for your application by going to [Google Developer
Console](https://code.google.com/apis/console) and creating new project there.

When you have the credentials, put them in the `config/sec_config.yml` file
under `omniauth_provider_key` and `omniauth_provider_secret` values.

## Tests

We use RSpec 3 for testing backend.

## Common problems/bugs

Nothing yet. YAY.

## Notes

Please follow Ruby style guide available [here](https://github.com/bbatsov/ruby-style-guide).

## Contributing

If you make improvements to this application, please share with others.

* Fork the project on GitHub.
* Make your feature addition or bug fix.
* Commit with Git.
* Send the author a pull request.

If you add functionality to this application, create an alternative
implementation, or build an application that is similar, please contact
me and I’ll add a note to the README so that others can find your work.

## License

MIT. See LICENSE.
