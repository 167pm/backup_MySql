#!/bin/bash

# Настройки базы данных
DB_USER="ваш_пользователь"
DB_PASS="ваш_пароль"
DB_NAME="имя_базы_данных"

# Путь для сохранения резервной копии
BACKUP_DIR="/путь/к/папке/с/резервными/копиями"

# Генерируем имя файла для резервной копии
BACKUP_FILENAME="${DB_NAME}_$(date +'%Y%m%d%H%M%S').sql"

# Создаем резервную копию базы данных
mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > "$BACKUP_DIR/$BACKUP_FILENAME"

# Проверяем статус команды mysqldump
if [ $? -eq 0 ]; then
    echo "Резервная копия успешно создана: $BACKUP_DIR/$BACKUP_FILENAME"
else
    echo "Ошибка при создании резервной копии"
fi
