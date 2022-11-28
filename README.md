# Ets-MademoiselleBio
Ets-MademoiselleBio est une application qui permet aux etablissements scolaires tout en créant une liansant avec les differentes entitées classes, eleves, enseignants ....

1- Install Docker et composer s'il n'est pas encore installer

2- Cloner le projet dans ton repo avec la commande  : git clone https://github.com/chanelV/Test-Mademoiselle-bio.git

3- Pointer dans le repectoire, si taper les commandes 
   * docker-compose up // Permet de declancher le serveur 
   *Control c // pour stopper les contenairs 
   *docker ps // pour savoir si les composer sont en route 
   * docker-compose -d // permet de declencher les environnements en taches de fonds
   * docker-compose down  // permet de stopper les contenairs apres avoir utiliser la commande docker-compose -d au lieu de Control c d


4- à chaque fois qu'on ajoute un controller, il faut taper ces deux commandes:
    - composer install
    - composer dump-autoload
 
Se positionner sur le dossier 

   cd .\public_html\  
   composer dump-autoload
5- GitHub
   git add
   git commit -m 'Version02'
   git push

