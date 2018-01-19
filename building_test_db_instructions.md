
heroku pg:backups:restore 'https://github.com/karengeerts/Art-up-your-life---rijksart/raw/master/db.dump' DATABASE_URL

pg_dump -Fc --no-acl --no-owner -h localhost -U karen 'https://github.com/karengeerts/Art-up-your-life---rijksart/raw/master/db.dump' > db.dump



b=Artobject.new
b.objectnumber="Not real"
b.title="Other news"
b.principalmaker="Ronald McDonald"
b.description="Short."
b.webimage="http://lh4.ggpht.com/ufTRnc1cU6b_nKKqCSWQxcszb3tuPhlZhr4YTr1gWTJSBAzVl1ka0nRxjKYaxmH7mIzKCPqfwbcKdMVaCmi-fOFzrQ=s0"
b.museumurl="https://www.rijksmuseum.nl/api/en/collection/RP-P-OB-202.951?key=YB4GHC25&format=json"
b.subject="other stuff"
b.colors="white, black"
b.save

f=Artobjects_favourite.new
f.user_id = 1
f.art_object_id = 1
f.save

f=Artobjects_favourite.new
f.user_id = 2
f.art_object_id = 1
f.save

f=Artobjects_favourite.new
f.user_id = 2
f.art_object_id = 2
f.save

t=Tag.new
t.label="stubby holder"
t.save

t=Tag.new
t.label="t-shirt"
t.save

t=Tag.new
t.label="art print"
t.save


t=Artobjects_tag.new
t.tag_id = 2
t.art_object_id = 2
t.save

t=Artobjects_tag.new
t.tag_id = 2
t.art_object_id = 1
t.save
