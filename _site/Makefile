.PHONY: init

init: clean
	gem install bundler
	bundle install
	npm install
	sudo npm install -g bower grunt
	bower install

gather:
	./scripts/gather.rb

clean:
	rm -rf node_modules bower_components
