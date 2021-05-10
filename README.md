# Bug Tracker

Bug tracker was designed to help companies keep track of their software bugs

## Installation

* Clone the [GitHub Repo](LINK GOES HERE) using the link in the top right corner
* In terminal navigate to the folder you want to clone the repo to
* Run `git clone <paste_clone_link>`
* Navigate inside the directory and make sure you can see the config.ru file
* Run `bundle install` 
* Once finished run `rails s` to open server
* Go to `localhost:3000` from your browser
* You will be directed to choose if you are a client or an employee
* Once you choose, you will be prompted to login
* Note: 
  * If you want to use omniauth for Github or Google you will need to sign
    up for a key and secret on the respective sites.
  * You are then able to create a .env file (put that file in the .gitignore)
    to make sure you don't upload your key and secret to github
  * If you assign your google key and secret the below constant names, everything will
    connect automatically 
    GOOGLE_CLIENT_ID==
    GOOGLE_CLIENT_SECRET=
  * Likewise if you assign github key and secret the below constant names, evierthing will connect automatically
    GITHUB_KEY=
    GITHUB_SECRET=


## Build Status
There were many bugs and I am currently working through them.




## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Been There! Done That! project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ericlombardo/bug_tracker/blob/master/CODE_OF_CONDUCT.md).

## Attribution
