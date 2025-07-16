FROM node:19.5.0-alpine
 # Указываем нашу рабочую директорию
WORKDIR /app

#Копируем package.json и package-lock.json внутрь контейнера
COPY package*.json ./

#Устанавливаем зависимости
RUN npm i

#Копируем оставшееся приложение в контейнер
COPY . .

#Устанавливаем Prisma
RUN npm i -g prisma

#Генерируем prisma client
RUN prisma generate

#Копируем prisma schema
COPY prisma/schema.prisma ./prisma

#Открываем порт в нашем контейнере
EXPOSE 3000

#Запускаем наш сервер
CMD ["npm", "run", "start"]
