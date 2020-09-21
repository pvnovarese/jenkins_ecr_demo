FROM alpine:latest

# bad EXPOSE
#EXPOSE 22
# good EXPOSE
EXPOSE 9999

# bad RUN
#RUN apk add curl
# good RUN
RUN apk add wget

# BAD user
## (nothing, default to root)
# GOOD user
USER 65534:65534

# good CMD, bad CMD same either way
CMD /bin/sh
