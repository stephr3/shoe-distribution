#  _Shoe Finder_
## *By Stephanie Gurung*

##### _With this application, a user can enter shoe store information, enter shoe brands, and display which brands a shoe store carries, and which stores carry a brand._

## Technologies Used

* **Application**: *Ruby, Sinatra*<br>
* **Testing**: *Rspec, Capybara*<br>
* **Database**: *Postgres, ActiveRecord*

Installation
------------

Install *Shoe Finder* by cloning the repository.  
```
$ git clone https://github.com/stephr3/shoe-finder
```

Install required gems:
```
$ bundle install
```

Run Postgres:
```
$ postgres
```

Navigate to project file and migrate database:
```
$ rake db:migrate
```

Start the Sinatra webserver:
```
$ ruby app.rb
```

Navigate to `localhost:4567` in your browser of choice.

License
-------
_This software is licensed under the MIT license._<br>
Copyright (c) 2016 **Stephanie Gurung**
