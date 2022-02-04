
NEWSXML_DIR?=i2p.newsxml

echo: 
	@echo "type 'make all' to build all files and copy them to the host"
	ls host || echo "host not found, please create a file called 'host' with the hostname or IP of the server you want to deploy to"

all: index i2p.newsxml update sign news copy add scp

index:
	echo "<html>" > index.html
	echo "<head>" >> index.html
	echo "	<title>I2P News</title>" >> index.html
	echo "	<link rel="stylesheet" href="/styles.css">" >> index.html
	echo "</head>" >> index.html
	echo "<body>" >> index.html
	pandoc -f markdown -t html README.md >> index.html
	echo "</body>" >> index.html
	echo "</html>" >> index.html

i2p.newsxml: "$(NEWSXML_DIR)"

"$(NEWSXML_DIR)":
	git clone https://i2pgit.org/i2p-hackers/i2p.newsxml "$(NEWSXML_DIR)"

update:
	cd "$(NEWSXML_DIR)" && git pull --all

sign:
	cd "$(NEWSXML_DIR)" && ./docker-news.sh

news:
	cd "$(NEWSXML_DIR)" && ./docker-newsxml.sh

copy:
	cp -r "$(NEWSXML_DIR)"/build build

add:
	git add build/*

scp:
	ls host || echo "host not found, please create a file called 'host' with the hostname or IP of the server you want to deploy to"
	scp -r build/* user@$(cat host):$(cat path)