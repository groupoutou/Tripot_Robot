# Utiliser l'image Alpine Linux comme base
FROM alpine:latest

RUN apk update && \
    apk add --no-cache openssh

# Générer les clés SSH (vous pouvez également copier vos propres clés)
RUN ssh-keygen -A

# Créer un utilisateur non-root (optionnel mais recommandé)
RUN adduser -D myuser

# Configurer le mot de passe pour l'utilisateur (vous pouvez également utiliser des clés SSH)
RUN echo 'IPSI:robot' | chpasswd

# Autoriser l'utilisateur à se connecter via SSH
RUN sed -i 's/^#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/UsePAM.*/UsePAM no/' /etc/ssh/sshd_config

# Exposer le port SSH
EXPOSE 22

# Mettre à jour les paquets et installer Python 3 ainsi que pip
RUN apk update && \
    apk add --no-cache python3 py3-pip

# Définir des variables d'environnement pour Python
ENV PYTHONUNBUFFERED=1

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers de l'application dans le conteneur (si nécessaire)
# COPY . /app

# Installer les dépendances Python (si vous avez un fichier requirements.txt)
# RUN pip install --no-cache-dir -r requirements.txt

# Démarrer le serveur SSH
CMD ["/usr/sbin/sshd", "-D"]




