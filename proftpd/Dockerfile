FROM archlinux

COPY proftpd.pkg.tar.zst /
COPY mdp /

RUN pacman -Sy && pacman -S openssh mariadb-libs postgresql-libs hiredis libsodium perl --noconfirm

RUN pacman -U proftpd.pkg.tar.zst --noconfirm

RUN useradd -m dev
RUN passwd dev < mdp

RUN ssh-keygen -A

COPY proftpd.conf /etc/proftpd.conf

RUN mkdir -p /etc/proftpd/authorized_keys
COPY id_rsa.pub /etc/proftpd/authorized_keys/dev

CMD ["proftpd","--nodaemon"]
