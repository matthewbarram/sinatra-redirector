This is a very simple Sinatra app for redirecting URLs from one site to
another.

We used to use `.htaccess` files for this. Now we deploy Sinatra applications
on Heroku.

## Instructions

```bash
git clone git://github.com/joliss/sinatra-redirector.git
cd sinatra-redirector
```

Edit `redirector.rb` to your liking, then commit and deploy to Heroku:

```bash
git commit -am 'Updated redirector'

heroku create
heroku domains:add your-redirecting-site.com
git push heroku master
```

Finally, in your DNS, point the CNAME for `your-redirecting-site.com` to the
Heroku app name that was output by `heroku create` (`foo-1234.herokuapp.com`).
