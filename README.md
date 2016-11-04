# Open Thanks

[![Gitten](http://gittens.r15.railsrumble.com//badge/open-thanks/open-thanks)](http://gittens.r15.railsrumble.com/gitten/open-thanks/open-thanks)
[![Open Thanks](http://open-thanks.2016.rubyrampage.com/images/thanks-1.svg)](http://open-thanks.2016.rubyrampage.com/r/ytdkrigb)

![Logo](https://raw.githubusercontent.com/crazy-monkey-woodoo-priest/open-thanks/master/app/assets/images/potatko-1.jpg)

## Code Approach

Trying to follow [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide)
with alteration around writing private methods to comply with
[Scissors Rule](http://www.eq8.eu/blogs/16-scissors-rule-in-coding)

## Development

Application is relying on ENV variables (DB, Redis, ...). 

You can install [direnv](http://direnv.net/) and example env variables
are in file `.envrc.example`, copy it to `.envrc`. Don't forget to do
`direnv allow` after you done


Add `127.0.0.1 development.open-thanks` to `/etc/hosts`
and use `http://development.open-thanks` in browser.

