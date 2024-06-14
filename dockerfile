# Utiliser une image Docker contenant Symfony CLI
FROM symfonycorp/cli:4.24.1

# Exposer le port 8000 pour accéder à l'application Symfony (si nécessaire)
EXPOSE 8000

# Définir le répertoire de travail (s'il est différent)
WORKDIR /app

# Copier les fichiers de l'application dans le répertoire de travail
COPY . .

# Démarrer le serveur Symfony (ou toute autre commande nécessaire)
CMD ["symfony", "serve", "--port=8000", "--no-tls"]
