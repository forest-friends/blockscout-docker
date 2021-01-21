FROM elixir:alpine
# Please rewrite for production version
ENV SECRET_KEY_BASE=VTIB3uHDNbvrY0+60ZWgUoUBKDn9ppLR8MI4CpRz4/qLyEFs54ktJfaNT6Z221No
ENV MIX_ENV=prod
ENV PORT=4000

RUN apk add --no-cache git rust cargo make g++ nodejs npm
RUN git clone https://github.com/poanetwork/blockscout
WORKDIR /blockscout
RUN mix local.hex --force && mix do deps.get, local.rebar --force, deps.compile, compile
RUN cd apps/block_scout_web/assets; npm install && node_modules/webpack/bin/webpack.js --mode production; cd - && cd apps/explorer && npm install; cd -
RUN mix phx.digest
RUN cd apps/block_scout_web; mix phx.gen.cert blockscout blockscout.local; cd -
COPY hosts /etc/hosts

CMD [ "mix", "phx.server", "--no-compile"]