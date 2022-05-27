FROM jekyll/jekyll:3 AS build
WORKDIR /srv/jekyll
COPY . .
RUN bundle install
RUN bundle exec jekyll build

FROM nginx:alpine AS serve
COPY --from=build /srv/jekyll/_site /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
