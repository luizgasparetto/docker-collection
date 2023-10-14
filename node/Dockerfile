
FROM node:18-alpine as base

# DEV

FROM base As dev

WORKDIR /usr/src/app

COPY --chown=node:node package*.json ./
COPY --chown=node:node . .

RUN npx prisma generate

USER node

# BUILD

FROM base As build

WORKDIR /usr/src/app

COPY --chown=node:node --from=dev /usr/src/app/node_modules ./node_modules
COPY --chown=node:node . .

RUN --mount=type=cache,target=/usr/src/app/.npm \
  npm set cache /usr/src/app/.npm && \
  npm install --omit=dev

RUN npm cache clean --force

USER node

# PRODUCTION

FROM base As production

ARG port
ENV PORT ${port}

COPY --chown=node:node --from=build /usr/src/app/node_modules ./node_modules
COPY --chown=node:node --from=build /usr/src/app/dist ./dist

EXPOSE $PORT

CMD [ "node", "dist/main.js" ]
