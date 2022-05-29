FROM jekyll/jekyll:3 AS build
WORKDIR /srv/jekyll
COPY . .
RUN bundle install
RUN bundle exec jekyll build

FROM nginx:alpine AS serve
COPY --from=build /srv/jekyll/_site /usr/share/nginx/html
COPY --from=build /srv/jekyll/config/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /srv/jekyll/config/site.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
