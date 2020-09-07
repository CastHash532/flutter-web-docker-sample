FROM cirrusci/flutter:beta AS build

RUN flutter config --enable-web

RUN flutter create sample
WORKDIR /home/cirrus/sample
RUN flutter build web

FROM nginx
COPY --from=build /home/cirrus/sample/build/web /usr/share/nginx/html
