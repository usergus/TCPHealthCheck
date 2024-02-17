# Test de Flux Serveur

## Contexte

En entreprise il peut arriver que des flux de communication soient interrompus ou perdus, entraînant des perturbations dans les opérations quotidiennes et la gestion de l'infrastructure.
Pour pallier ce problème, voici une solution permettant de tester régulièrement ces flux et de générer des rapports de statut sous forme de JSON, exportable vers un prometheus et grafana ou tout autre système de monitoring.

## Objectif

Le but de ce projet est de fournir un outil simple, automatique et nécessitant uniquement des paquets natifs aux distributions RHEL, pour tester la connectivité entre les serveurs applicatifs et les serveurs de management d'infrastructure.
En exécutant régulièrement ces tests, nous pouvons rapidement identifier et résoudre les problèmes de communication, assurant ainsi une gestion d'infras plus fiable et efficace.

## Fonctionnement

Le script développé réalise des tests de connectivité (via telnet, par exemple) entre les serveurs applicatifs et les serveurs de management. Les résultats de ces tests sont ensuite formatés en JSON, fournissant un état clair de la connectivité entre les serveurs.

## Mise en œuvre avec Ansible

Pour faciliter l'exécution de ces tests à travers l'ensemble de mon parc de serveurs, j'utilise Ansible. 
Cela permet de lancer le script de test sur plusieurs machines simultanément et de récupérer les résultats centralisément sur notre serveur Ansible.

## Comment utiliser

### Prérequis

- Ansible installé sur le serveur de gestion.
- Accès SSH configuré vers tous les serveurs cibles.

### Installation

1. Clonez le dépôt sur votre serveur de gestion :

````bash
git clone <url_du_repo>
````
