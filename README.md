ZOZOトップ10 (backend)
========
ZOZOTOWN Ranking

## Deployment on heroku
```
# One time only
heroku create [applicatin name]
heroku config:add TZ=Asia/Tokyo

git push heroku master
heroku run rails db:migrate
```

### Add ranking data
```
heroku run rails rank:fetch
```
