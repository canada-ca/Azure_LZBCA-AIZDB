# Azure_LZBCA-AIZDB
Azure Landing Zone Base Cloud Architecture - Architecture infonuagique zone d'atterrissage de base

This initiative is a contribution to the GC Accelerators.

These tools and IaC (Infrastructure as Code) enable the Government of Canada's Cloud First direction and support for the GC Digital Standards.

The users of this initiative will be Government of Canada employees deploying cloud-based workloads.

# Background

The Azure Landing Zone Base Cloud Architecture **(LZBCA)** is an initiative that is led by Cloud Product Management & Services - Research & Development team. 

The Azure LZBCA is a fully functional Virtual Data Centre (VDC) with the necessary configuration to meet the 30-Day Guardrails (technical only) and many of the 90-Day guardrails through Infrastructure as Code (IaC). It aligns with Cloud Usage Profile 3, with a future design for Cloud Usage Profiles 5 & 6.  We will be starting our Security Assessment (SA) on the environment in June 2020. 
  
* For Network details See [Network Architecture](Network/README.md)
* For Routing details See [Routing and Flow Control Overview](Network/Routing_Overview.md)
* For Application Dataflow details see [Application Dataflow - HA and AzLB](Network/Application_Dataflow_-_HA_and_AzLB.md)

It has been designed to enable departments to leverage and quickly deploy an Azure Landing Zone that aligns with a departments naming standards and IP blocks.

Development of the Azure LZBAC will continue to add functionality for components such as: SCED, AD, RBAC and etc., this development will move forward in parallel with the SA process. For a complete list of current and future development "Available Today" and "Future Releases" below.

______________________


## How to Contribute

See [CONTRIBUTING.md](CONTRIBUTING.md)

## License

Unless otherwise noted, the source code of this project is covered under Crown Copyright, Government of Canada, and is distributed under the [MIT License](LICENSE).

The Canada wordmark and related graphics associated with this distribution are protected under trademark law and copyright law. No permission is granted to use them outside the parameters of the Government of Canada's corporate identity program. For more information, see [Federal identity requirements](https://www.canada.ca/en/treasury-board-secretariat/topics/government-communications/federal-identity-requirements.html).

______________________

# Code Generation Pipeline

The code pipeline begin with an VDC input configuration spread sheet, this is used to build a control file that is ingested by a PowerShell script to create all the necessary Terraform “*.tf” files required to deploy a VDC.

![Diagram](Resources/code-pipeline.png)

## VDC Configuration Spreadsheet defines the following values
Resource groups, virtual and sub networks, peering and user defined routing, Virtual machines + availability sets, Windows domain controller, Fortinet HA firewall, F5/Azure HA load balancer, Azure SDN app, Log analytics Workspace, NICs + temporary public Ips [config & licensing], network security groups, Azure security center [+ subscription activation]

# Future Development Roadmap

![Diagram](Resources/azure-roadmap.png)

# **Available Today**
1. Azure LZBCA r2b = fully functional VDC
   - Core Security Infrastructure
     - F5
       - HA pair (Active/Passive)
       - Outbound Internet NAT
       - Application Delivery (LTM)
         - SSL Offload
       - Remote Access (APM)
         - Access Portal
         - RDS Proxy 
     - FortiGate
       - VM-08 HA pair (Active/Passive)
       - Prod and Dev separation using vDOMs
       - Flow Control
       - URL Whitelist
       - IPS/IDS
       - Anti-Malware
       - SSL Inspection
   - ITSG-22 Zoning
     - Management Restricted Zone (MRZ)
     - Management Access Zone (MAZ)
     - Public Access Zone (PAZ) > Prod & Dev
     - Operation Zone (OZ) > Prod & Dev
     - Data Restricted Zone (RZ) > Prod & Dev
     - Application Restricted Zone (RZ) > Prod & Dev
     - FE Private Restricted Zone (RZ) > Prod & Dev
2. Managed Service available to help deploy an Azure Landing Zone with aligned naming standards and IP blocks.
3. Azure Naming and Tagging Standards
4. 30-Day Guardrail Implementation Guide
5. 30-Day Guardrails Applied (Technical GR only)
6. Reporting tool
7. Deploys a Local Active Directory (azure.local)


# **Future Releases**
1. 30 Day Guardrail Compliance Automation Tool (r2c)
2. Integrate F5 into pipeline (r2c)
3. Modularize Terraform Deployement
   - F5 (r2c)
   - FortiGate (r2c)
   - Core Infrastructure (r2c)
   - Bolt on Components
     - Subscription (r2d)
     - Resource Group (r2d)
     - vNets/sNets (r2d)
     - Key Vault (r2d)
4. IaaS/PaaS Guardrail Compliance Automation
   - 30-Day Guardrails (r2c)
   - 90-Day Guardrails (r2d)
   - 180-Day Guardrails (r2d)
5. Separate FortiGate HA pairs for Prod and Dev (r2c)
6. SCED Connectivity / Cloud Usage Profile 5 & 6 (r2d)
7. Active Directory Domain Services - Ground <-> Cloud (r2d)
8. ATO - Cloud PBMM Security Profile (Technical Controls Only)
9. F5 authentication to used local Active Directory
10. Hardening of all infrastructure
11. High-Level Governance Framework 

______________________

# Current Release Limitations

Azure LZBCA release 2b has a couple limitations when using the pipeline to generate new *.TF files to create a custom VDC, these limitations are:

1. The F5 code in this repository is fully functional, however it did not go through the pipeline and was manually configure via IaC. This will be rectified for our r2c release.  If you require to customize a deployment (integrate your naming standard and IP blocks) before our next release, we suggest to leverage our managed service to help with the process.

2. There are also a list of pre and post deployment steps that are required, these are available here See [LZ Deployment Steps](Terraform/README.md).  We plan to automate some of these steps in future

______________________

# Notes

Post deployment tasks:

**Must change all default passwords and userids for all accounts.**

______________________

# Azure_LZBCA-AIZDB
Azure Cloud Landing Zone Base Cloud Architecture - Architecture infonuagique zone d'atterrissage de base

Cette initiative est une contribution aux accélérateurs du GC.

Ces outils et IaC (Infrastructure as Code) permettent au gouvernement du Canada d'orienter et de soutenir les normes numériques du GC.

Les utilisateurs de cette initiative seront des employés du gouvernement du Canada qui déploieront des charges de travail en infonuagique.

# Contexte

L'AIZDB est une initiative dirigée par la direction des services et de la gestion des produits infonuagiques- Équipe de recherche et développement.

L’AIZDB est un centre de données virtuel (CDV) entièrement fonctionnel doté de toutes les composantes nécessaires pour rencontrer les garde-fous de 30 jours (aspects techniques) ainsi que plusieurs des garde-fous de 90 jours via une infrastructure déployable par Code (IaC). Il s'aligne sur le profil d'utilisation infonuagique 3 avec une conception future qui tiens compte des profils d'utilisation infonuagique 5 et 6. Nous commencerons notre évaluation de la sécurité (SA) sur l'environnement en juin 2020.

Il a été conçu pour permettre aux partenaires de déployer rapidement une zone d'atterrissage Azure qui s'aligne sur les normes de dénomination et les blocs d’addresses IP d'un partenaire.

Le développement d'AAIZDB continuera à ajouter des fonctionnalités pour des composantes tels que: SCED, AD, RBAC et etc.. Ce développement se fera en parallèle avec le processus d’évaluation de la sécurité. Pour une liste complète des fonctionnalités en développements actuels et futurs, voir les sections "Available Today – Disponible auhourd’hui" et "Future Releases – Prochaines versions" ci-dessous.

______________________


## Comment contribuer

Voir [CONTRIBUTING.md](CONTRIBUTING.md)

## Licence

Sauf indication contraire, le code source de ce projet est couvert par le droit d'auteur de la Couronne, gouvernement du Canada, et est distribué sous la [Licence MIT] (LICENCE).

Le mot-symbole Canada et les graphiques associés à cette distribution sont protégés par le droit des marques et le droit d'auteur. Aucune autorisation n'est accordée pour les utiliser en dehors des paramètres du programme d'identité corporative du gouvernement du Canada. Pour plus d'informations, voir [Exigences fédérales en matière d'identité] (https://www.canada.ca/fr/treasury-board-secretariat/topics/government-communications/federation-identity-requirements.html).

______________________

# Pipeline de génération de code

Le pipeline de code commence par une feuille de calcul de configuration d'entrée VDC, qui est utilisée pour créer un fichier de contrôle qui est ingéré par un script PowerShell pour créer tous les fichiers Terraform «* ??.tf» nécessaires pour déployer un VDC.

![Diagram](Resources/code-pipeline.png)

## VDC Configuration Spreadsheet définit les valeurs suivantes
Groupes de ressources, réseaux virtuels et sous-réseaux, homologation et routage défini par l'utilisateur, machines virtuelles + ensembles de disponibilité, contrôleur de domaine Windows, pare-feu Fortinet HA, équilibreur de charge F5 / Azure HA, application Azure SDN, espace de travail d'analyse des journaux, cartes réseau + Ips publiques temporaires [config et licences], groupes de sécurité réseau, Azure Security Center [+ activation de l'abonnement]

# Feuille de route pour le développement futur

![Diagram](Resources/azure-roadmap.png)

# **Disponible aujourd'hui**
1. Azure LZBCA r2b = VDC entièrement fonctionnel
   - Infrastructure de sécurité principale
     - F5
       - Paire HA (active / passive)
       - NAT Internet sortant
       - Livraison d'application (LTM)
         - Déchargement SSL
       - Accès à distance (APM)
         - Portail d'accès
         - Proxy RDS
     - FortiGate
       - Paire VM-08 HA (active / passive)
       - Séparation Prod et Dev à l'aide de vDOM
       - Contrôle de flux
       - Liste blanche d'URL
       - IPS / IDS
       - Anti-Malware
       - Inspection SSL
   - Zonage ITSG-22
     - Zone à gestion restreinte (MRZ)
     - Zone d'accès à la gestion (MAZ)
     - Zone d'accès public (PAZ)> Prod & Dev
     - Zone d'opération (OZ)> Prod & Dev
     - Zone restreinte de données (RZ)> Prod & Dev
     - Zone d'application restreinte (RZ)> Prod & Dev
     - FE Zone privée restreinte (RZ)> Prod & Dev
2. Service géré disponible pour aider à déployer une zone d'atterrissage Azure avec des normes de dénomination alignées et des blocs IP.
3. Normes de nommage et d'étiquetage Azure
4. Guide de mise en œuvre de garde-corps de 30 jours
5. Garde-corps de 30 jours appliqués (GR technique uniquement)
6. Outil de rapports
7. Déploie un répertoire AD local (azure.local)

# ** Versions futures **
1. Outil d'automatisation de la conformité des garde-corps de 30 jours (r2c)
2. Intégrer F5 dans le pipeline (r2c)
3. Modulariser le déploiement de Terraform
   - F5 (r2c)
   - FortiGate (r2c)
   - Infrastructure principale (r2c)
   - Composants boulonnés
     - Abonnement (r2d)
     - Groupe de ressources (r2d)
     - vNets / sNets (r2d)
     - Key Vault (r2d)
4. Automatisation de la conformité IaaS / PaaS Guardrail
   - Garde-corps de 30 jours (R2C)
   - Garde-corps 90 jours (R2D)
   - Garde-corps de 180 jours (R2D)
5. Séparer les paires FortiGate HA pour Prod et Dev (r2c)
6. Connectivité SCED / Profil d'utilisation infonuagique 5 et 6 (r2d)
7. Services de domaine Active Directory - Ground <-> Cloud (r2d)
8. ATO - Profil de sécurité Cloud PBMM (contrôles techniques uniquement)
9. Authentification F5 pour Active Directory local utilisé
10. Durcissement de toutes les infrastructures
11. Cadre de gouvernance de haut niveau

# Remarques

Tâches post-déploiement:
Doit changer tous les mots de passe et ID utilisateur par défaut pour tous les comptes.

______________________

# Limites actuelles des versions

Azure AIZDB version 2b a quelques limitations lors de l'utilisation du pipeline pour générer de nouveaux fichiers * .TF pour créer un VDC personnalisé, ces limitates sont les suivantes:

1. Le code F5 dans ce référentiel est entièrement fonctionnel, mais il n'est pas passé par le pipeline et a été configuré manuellement via IaC. Cela sera corrigé pour notre version r2c. Si vous souhaitez personnaliser un déploiement (intégrer votre norme de dénomination et vos blocs IP) avant notre prochaine version, nous vous suggérons de tirer parti de notre service géré pour vous aider dans le processus.

2. Il existe également une liste des étapes de pré et post déploiement qui sont requises, celles-ci sont disponibles ici "ajouter un lien aux étapes". Nous prévoyons automatiser certaines de ces étapes dans le future.





