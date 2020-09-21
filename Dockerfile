FROM alpine:latest

# bad EXPOSE, RUN, USER
#EXPOSE 22
#RUN apk add curl

# good EXPOSE, RUN, USER
EXPOSE 9999
RUN apk add wget
USER 65534:65534

# good CMD, bad CMD same either way
CMD /bin/sh
