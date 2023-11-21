FROM archlinux

COPY proftpd.pkg.tar.zst /
COPY mdp /

RUN pacman -Sy && pacman -S mariadb-libs postgresql-libs hiredis libsodium perl --noconfirm

RUN pacman -U proftpd.pkg.tar.zst --noconfirm

RUN useradd -m dev
RUN passwd dev < mdp


CMD ["proftpd","--nodaemon"]
