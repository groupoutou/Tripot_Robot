# Tripot_Robot

## Pour travailler sur le projet :

1. Allez dans un répertoire, par exemple `D:`
2. Clonez le dépôt :
    ```sh
    git clone <URL_DU_DEPOT>
    ```

## Pour enregistrer le travail :

1. Ajoutez les modifications :
    ```sh
    git add .
    ```
2. Validez les modifications avec un commentaire :
    ```sh
    git commit -m "votre commentaire"
    ```
3. Envoyez les modifications :
    ```sh
    git push
    ```

## Pour lancer le projet :

1. Accédez au répertoire du projet :
    ```sh
    cd Tripot_Robot
    ```

2. Créez un conteneur Docker :
    ```sh
    docker build -t "nomduconteneur" .
    ```

3. Lancez le conteneur :
    ```sh
    docker run -d -p 2222:22 "nomduconteneur"
    ```

4. Vérifiez que le conteneur tourne et obtenez son ID :
    ```sh
    docker ps
    ```

5. Pour arrêter le conteneur :
    ```sh
    docker stop <container-id>
    ```




