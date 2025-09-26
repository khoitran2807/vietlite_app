# vietlite

A new Flutter project.
# vietlite
flutter test --coverage && genhtml coverage/lcov.info -o coverage/html && open coverage/html/index.html

# deploy web
flutter build web --target=lib/main_dev.dart
scp -P 1994 -r build/web/* <host>:/tmp/webfiles/
ssh into server
sudo rsync -av --delete /tmp/webfiles/* /var/www/vietlite/

