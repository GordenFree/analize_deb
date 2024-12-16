#!/bin/bash

# Получаем путь к файлу .deb в качестве аргумента командной строки
DEB_FILE="$1"

# Извлекаем информацию о пакете и его зависимостях из файла .deb
dpkg-deb -f "$DEB_FILE" > /tmp/info_dep.txt

# Читаем информацию из /tmp/info_dep.txt и выводим её на экран
cat /tmp/info_dep.txt | grep 'Package:' | awk '{print $2}'
cat /tmp/info_dep.txt | grep 'Depends:' | sed 's/Depends: //' | tr ',' '\n'

# Очищаем временный файл
rm /tmp/info_dep.txt