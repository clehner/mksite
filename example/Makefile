#include $(shell which mksite)
include ../mksite

deploy: .
	rsync -avz . me@example.org:/srv/www/
