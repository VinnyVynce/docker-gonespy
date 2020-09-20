FROM openjdk:8-jre

MAINTAINER VinnyVynce (https://github.com/VinnyVynce)

# Updating container
RUN apt-get update && \
	apt-get install apt-utils --yes && \
	apt-get upgrade --yes --allow-remove-essential && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# Setting workdir
WORKDIR /gonespy

# Changing user to root
USER root

# Creating user and downloading files
RUN wget --no-check-certificate https://github.com/gonespy/bstormps3/raw/master/release/bstormps3-0.1.zip && \
	unzip bstormps3-0.1.zip && \
	mv bstormps3-0.1/* . && \
	rm bstormps3-0.1.zip && \
	rm -r bstormps3-0.1/ && \
	echo "#!/bin/sh" > start.sh && \
	echo "cd /gonespy && java -jar bstormps3-0.1.jar" >> start.sh && \
	chmod u+x start.sh

# Expose gonespy ports
EXPOSE 80/tcp
EXPOSE 443/tcp
EXPOSE 29900/tcp
EXPOSE 29901/tcp
EXPOSE 27900/udp

# Start gonespy
CMD ["/bin/sh", "/gonespy/start.sh"]
