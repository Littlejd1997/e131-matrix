FROM ruby:2.7-slim
RUN apt-get update && \
    apt-get install -qy nodejs git curl build-essential && \
    apt-get autoremove -qy
RUN curl -o- -L https://yarnpkg.com/install.sh | bash
ENV PATH="/root/.yarn/bin:${PATH}"
COPY package.json .
RUN yarn install --check-files
COPY Gemfile Gemfile.lock ./
RUN bundle install -j8
COPY . .
ENV DISABLE_SPRING=true
ENV RAILS_ENV=development

CMD ["rails", "server", "-b", "0.0.0.0"]
