deploy:
		aws s3 sync build/web/ s3://landing.changecharity.io --acl public-read --delete