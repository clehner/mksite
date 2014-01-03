mksite
======

Static site builder based on a makefile.

- renders pages from markdown
- depends only on common shell tools
- is fast

## Get it

	git clone https://celehner.com/git/mksite

## Installation

	sudo make install

or, to change default prefix (/usr/local/):

	sudo make install PREFIX=/usr

## Usage

In your site directory, create a `_template.html`.

To make a page, create a `.md` Markdown file or `.content.html` HTML file.

To build your site, run `mksite`.

### More advanced usage

In your site directory, create a Makefile. Have it include `mksite`, and any
additional rules you need to build or deploy your site.

	$ cat Makefile
	include $(shell which mksite)

	deploy:
		rsync -avz . example.org:/path/to/www/

## Credits

Inspired by sw [suckless webframework](http://nibble.develsec.org/projects/sw.html).

Styles from [suckless.org](http://suckless.org)
and [garbe.us](http://garbe.us/).

Markdown renderer by Jesus Galan (yiyus).

## Todo

- Handle nested directories.
- Do something smart about the index page.
