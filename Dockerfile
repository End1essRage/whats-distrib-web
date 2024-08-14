# Используем официальный образ для Node.js
FROM node:latest

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файл package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем все остальные файлы
COPY . .

# Собираем приложение
RUN npm run build

# Открываем порт, на котором будет запускаться ваше приложение
EXPOSE 3000

# Запускаем приложение
CMD ["npm", "start"]