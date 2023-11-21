FROM archlinux

RUN pacman -Sy
RUN pacman -S nginx --noconfirm
# ubuntu
# apt install -y nginx

CMD ["nginx","-g","daemon off;"]
