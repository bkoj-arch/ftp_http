FROM archlinux

RUN pacman -Sy
RUN pacman -S nginx --noconfirm
# ubuntu
# apt install -y nginx
RUN mkdir -p /var/www/html
RUN usermod -u 1000 http


COPY nginx.conf /etc/nginx/nginx.conf



CMD ["nginx","-g","daemon off;"]
