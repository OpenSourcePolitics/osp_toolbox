# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

user = User.create!(
  email: "hello@example.org",
  password: "password",
  password_confirmation: "password"
)

document = Document.create!(
  user: user,
  title: Faker::Book.title
)

proposals_file = InputFile.new(typename: "Proposals", document: document)
proposals_file.file.attach(io: File.open(Rails.root.join("db", "seeds_data", "proposals.csv")), filename: "proposals.csv")
proposals_file.save!

comments_file = InputFile.create(typename: "Comments", document: document)
comments_file.file.attach(io: File.open(Rails.root.join("db", "seeds_data", "comments.csv")), filename: "comments.csv")
comments_file.save!

preprocessing = Pprocessing.new(
  title: Faker::Book.title,
  client: Faker::Twitter.name,
  url: Faker::Internet.domain_name,
  sent_to_preprocessing_at: Time.now,
  preprocessed_data: {
    "0": {
      id: 77,
      category: "consommer",
      title: "L'autoconsommation solaire",
      body: "Bonjour, inciter les grd surfaces à prendre exemple du magasin de Sisteron (04) qui  a investi dans des ombrières solaires, installées sur le parking du supermarché. Ce qui a permis de produire en moyenne 40% des besoins énergétiques. \nInciter toutes les entreprises à s équiper de panneaux solaires, afin d utiliser toute la surface disponible et tendre vers tjrs plus d autonomie énergétique, au lieu d en installer dans des champs qui pourraient servir pour l agriculture.\nBon courage"
    },
    "1": {
      id: 3930,
      category: "consommer",
      title: "Instaurer un indicateur \"CO2 Score\"",
      body: "Introduire un indicateur sur le bilan carbone des produits à l'achat, mais aussi des services , sur le modèle du nutriscore. Ces indicateurs devraient permettre au citoyen de choisir \"rapidement \" vers quel produit ou service s'orienter."
    },
    "2": {
      id: 50,
      category: "consommer",
      title: "Réglementer les tarifs des assurances auto",
      body: "Priorité à la réduction directe de consommation de pétrole : \nPour contrecarrer la tendance à l'augmentation de la puissance des voitures en circulation, les primes d'assurances doivent être modulées en fonction de la consommation de carburant et des émissions de CO2 du véhicule. \nCeci doit être réalisé uniformément par tous les assureurs, pour éviter les risques de fuite des grosses cylindrées vers la concurrence lorsqu'un assureur seul adopterait ce comportement vertueux. \nUne réglementation nationale doit donc fixer une modulation obligatoire des primes d'assurances selon ce critère, semblable au bonus-malus à l'achat, mais qui se répercutera chaque année et non pas juste initialement à l'achat du véhicule. Chaque assureur restera libre de fixer le montant de référence de ses primes, mais devra respecter la modulation nationale selon l'impact climatique du véhicule. \nCette modulation doit être dissuasive pour les forts émetteurs, et doit favoriser les petites cylindrées économes par un bonus. \nCeci devrait influencer positivement et rapidement les choix des clients du marché auto dès l'acte d'achat, et également le marché de l'occasion."
    },
    "3": {
      id: 22,
      category: "consommer",
      title: "Comptabilité verte et Surveillance accrue",
      body: "Bjr,\nJe pense à :\nSuppression de la publicité des lieux et médias publics.\nCampagne d’information publique intensive sur le problème liés aux chaînes logistiques, aux circuit longs…\nGestion des déchets =>obliger les communes et CC à imposer un autre mode de traitement.\nInterdiction du plastique dans les emballages.\nMise en place de la consigne obligatoire pour les bouteilles.\nS’assurer que les agriculteurs français sont rémunérés correctement.\nVente en vrac alimentaire obligatoire.\nSupprimer la déclaration des revenus générés par la vente de produit d’occasion.\nRevoir le PCG, déduction de tva, etc... valoriser le plan d’amortissement des entreprises qui achètent des produits en circuit court.\nAudit annuel des E sur leur engagement Dev.Dur \nCommande publique : L’audit dev. durable doit être produit lors de la réponse au AO.\nTVA différenciée : produit de 1ere nécessité/produit alimentaire à circuit court/produit technologique/produit de luxe.\nDroit de rétractation des achats réalisés sur des sites étrangers ramené à 5j. \nDéclaration et taxes sur les achats de neuf sur Internet. \nAugm. du tx d'intérêt des prêt à la conso.\nObligation d'étiquetage des produits => ajout d’une dimension Impact carbone, Contrôler les mentions trompeuses \"Fait maison\" - \"Cuit sur place\" etc \nClarification des labels et communication large public.\nEncourager l’utilisation de monnaie locale."
    },
    "4": {
      id: 79,
      category: "consommer",
      title: "Fenêtres solaires ",
      body: "Création d'une norme sur la construction immobilière, pour que les fenêtres soient des panneaux solaires transparents. Ainsi cela réduire les émissions de polluants, augmentera l'auto-suffisance des habitations, améliorera la consommation énergétique, ..."
    },
    "5": {
      id: 39,
      category: "consommer",
      title: "Réduire la publicité",
      body: "Notre société de consommation doit changer de paradigme : de \"consommer plus\" il faut passer à \"consommer mieux, voire consommer moins\".\n\nLe pouvoir d'achat des français doit s'orienter autrement et on peut agir en amont sur les fabricants (français mais aussi les importations) et en aval sur les taxes, l'information aux consommateurs...\n\nLa première chose serait de réduire l'affichage des publicités dans les rues, les magazines, la télé... \n\nPas simple, car elles financent l'audiovisuel et un certain journalisme (dt on peut se passer)."
    },
    "6": {
      id: 154,
      category: "consommer",
      title: "Obsolescence programmée, surconsommation ",
      body: "Obliger les industriels à garantir leurs produits 7 ans ou plus et que leurs réparations soit prévu lors de la conception afin de limiter l'obsolescence programmée. \n\nLimiter le nombre de collection annuelle pour les magasins de prêt à porter et d'ameublement."
    },
    "7": {
      id: 8,
      category: "consommer",
      title: "La monnaie Carbone",
      body: "La monnaie Carbone serait une nouvelle forme de devise indépendante de l’euro. Cette nouvelle devise ne se substituerait pas à l’euro mais donnerait une valeur en carbone à chaque produit et service vendu en France.\t\nEx : 1 kg de tomates coûterait 1,5€ plus une somme X en Carbone.\n\nLe montant carbone attribué à chaque produit ou service serait calculé en fonction de son coût environnemental. Plus un bien ou service générerait une émission de gaz à effet de serre (confection, transport, consommation...) plus son prix carbone serait élevé. \t\n\nChaque personne se verrait recevoir de manière égale, un nombre limité de Carbone chaque année afin d’atteindre des objectifs ambitieux en matière d’écologie. Si un citoyen venait à dépenser tous ses Carbones au cours de l’année, il pourrait être alors possible les premières années d’acheter des carbones via le paiement d’un montant (assez élevé) en €. Ce système d’achat de Carbone ne serait que temporaire afin de ne pas brusquer les gens. Passé ce délai, les citoyens serraient dans l’obligation de respecter le quota Carbone annuel.\t\n\nEnfin, le montant Carbone versé chaque 1er Janvier aux citoyens serait réduit au fur et à mesure des années.\nUne autre manière de recevoir des carbones serait d’acquérir un bien, d’utiliser un service, de participer à une activité, ou bien de financer une action ayant une consommation négative de gaz à effet de serre.\n\n(Si besoin j'ai un doc plus complet que je peux envoyer par mail.)"
    },
    "8": {
      id: 109,
      category: "consommer",
      title: "Garantie d'un prix maximum sur les denrées alimentaires de base",
      body: "La garantie par l'état d'un prix maximum sur les denrées alimentaires de base (eau, blé, oeufs, lait, pain, graines, fruits), afin que celui-ci soit indépendant des conditions climatiques (et donc de la spéculation).\nCelà amènera à :  \n- éviter à nos agriculteurs de sur-produire pour baisser les prix (et donc plus moissonner (CO2), augmenter la taille des fermes laitières (méthane), augmenter la taille des plantations fruitières (CO2)...)\n- consommer davantage d'eau du robinet, et donc baisser d'autant la production de CO2 par le transport de l'eau en bouteille\n- baissera d'autant les émissions de CO2 liées aux flux de la supply chain au global (pas de sur-production pour faire baisser les prix)\n- et enfin celà baissera la quantité de gaz dû à la fermentation des stocks (liste des effets non exhaustive)."
    },
    "9": {
      id: 206,
      category: "consommer",
      title: "Cleanwalks scolaires",
      body: "En plus de nettoyer directement les rues et espaces verts, cela sensibiliserait chacun, inciterait à moins jeter ses papiers / mégots par terre et revaloriserait les métiers de la propreté dans l'imaginaire collectif.\nAinsi, il serait intéressant de demander aux écoles, collèges, lycées et universités de faire un jour ou une après-midi réservée à une cleanwalk obligatoire une fois par mois, trimestre ou semestre (en fonction du niveau scolaire des élèves : En CM2, on a plus de temps pour en faire qu'au lycée).\n\n(Je sais que ce n'est pas dans la consommation mais je ne pouvais pas en mettre un deuxième dans \"transversal\")"
    },
    "10": {
      id: 95,
      category: "consommer",
      title: "Inversion charge recyclable et traitement déchet ",
      body: "Au lieu de faire porter sur collectivité la charge du recyclage et traitement déchet,integrer dans le coût de chaque produit et services le coût ou à défaut taxe lié au traitement fin de vie. Objectif créer un signal prix vertueuxau niveau consommation. Dans la même idée adjoindre un signal prix sur étiquettes énergétiques"
    },
    "11": {
      id: 43,
      category: "consommer",
      title: "Indiquer l'empreinte carbone sur chaque produit",
      body: "Indiquer l'empreinte carbone/environnementale sur chaque produit grâce à un code couleur par exemple, en prenant en compte toutes les émissions engendrées par le produit/ l'entreprise le produisant. \nCela permettrait de guider les choix des consommateurs et d'encourager certaines entreprises à diminuer leurs émissions."
    },
    "12": {
      id: 63,
      category: "consommer",
      title: "Sortir du CETA et du MERCOSUR, taxer le Soja importé",
      body: "Le CETA et le MERCOSUR sont deux accords de libre-échanges commercial, avec le Canada et le Brésil respectivement. \n\nCes deux accords encouragent le commerce international, beaucoup plus polluant que la production locale. Les agriculteurs craignent de voir des produits importés sur les marchés Français, ce qui rendrait notre assiette très émettrice de CO2. \n\nLa Convention devrait proposer que la France sorte, unilatéralement si besoin, de ces deux traités (d'ailleurs le Mercosur n'est pas signé, il est encore en négociation). \n\nDe plus, la Convention devrait proposer de taxer le soja importé hors d'Europe. Le but est de décourager l’importation de soja pour nourrir les troupeaux, et d'inciter au développement de l’élevage paysan, nourrissant les troupeaux à partir d’herbes et de foin locaux et élevant les bêtes en plein air.\n\nLes Français pourront alors manger sans craindre de participer indirectement à la déforestation de l'Amazonie."
    },
    "13": {
      id: 85,
      category: "consommer",
      title: "Réparer au lieu de jeter avec l interoperabilite des pièces détachées ",
      body: "Bonjour \nL idée est d imposer aux industriel une convergence des normes des pièces utilisées en imposant au fur et à mesure la définition de produits de réparation utilisable sur différents modèles et également sur différents producteurs. Ainsi les pièces détachées seraient plus faciles à obtenir et cela rendrait illégal les tentatives des industriels de rendre certaines pièces rapidement inutilisables sans possibilités de les changer rapidement (comme les batteries de certains téléphones ou encore éviter d avoir 50 types de chargeurs par exemple)."
    },
    "14": {
      id: 737,
      category: "consommer",
      title: "Simplification des signalétiques de recyclage plastique",
      body: "1- Modifier le sigle de la contribution éco-emballage pour qu'il ne prête plus à penser que l'emballage en question est recyclable.\n2- Créer des catégories très simples de logos sur les tous les emballages alignés avec les logos ou couleurs des poubelles de recyclage.\n3- Pénaliser les sociétés utilisant des emballages non recyclables dans le prix."
    },
    "15": {
      id: 688,
      category: "consommer",
      title: "Réduire ou modifier les emballages",
      body: "Certains magasins proposent déjà des sachets en papier pour le pain ou les fruits et légumes mais ceux-ci ont une partie plastique afin de voir à travers. Les sachets ne sont donc pas recyclables.\nPropositions : \nQue les grandes surfaces ne proposent que des sachets en papier recyclé et recyclables.\nDe même, les industriels doivent impérativement réduire leurs emballages ou proposer des emballages 100% recyclables."
    },
    "16": {
      id: 126,
      category: "consommer",
      title: "Favoriser l'implantation des supermarchés coopératifs",
      body: "Aujourd'hui l'implantation d'un supermarché coopératif est compliqué car il est perçu comme une menace aux supermarchés classiques (difficulté d'obtenir un local par exemple dans une opération immobilière municipale) et pas suffisamment fiable pour trouver facilement des partenaires financiers nécessaires.  Alors que les résultats sont là pour beaucoup de ces magasins, qui doivent néanmoins surmonter une résistance au changement importante de la part des décideurs concernés. Pourtant ils sont souvent plébiscités par les consommateurs..."
    },
    "17": {
      id: 157,
      category: "consommer",
      title: "Interdiction publicité automobile",
      body: "Le transport routier est un gros émetteur de CO2 (et il n'y a pas de petites économies).\nLa loi Evin nous montre qu'il est de la responsabilité de l’État de réglementer la publicité lorsqu'elle touche à la santé publique. Puisque l'enjeu du réchauffement climatique va au delà de la santé publique, nous devrions interdire la publicité des véhicules personnels."
    },
    "18": {
      id: 98,
      category: "consommer",
      title: "Remplacement des batteries et interdiction de la vente-liée de batteries",
      body: "Une quantité importante de déchets (en particulier numériques) est générée par la complexité (et certaines fois l'impossibilité) de l'opération consistant à remplacer les batteries dans des biens de grande consommation. Au lieu de s'améliorer, la situation a même eu tendance à se dégrader. Il y 10 ans il paraissait normal de pouvoir changer soi-même la batterie de son ordinateur portable : aujourd'hui cela devient de plus en plus difficile.\n\nTout produit de grande consommation devrait autoriser un changement simple de batterie par le consommateur lui-même, dans un format standardisé (pour éviter que des marques crééent leur format propriétaire dans l'unique but d'empêcher le consommateur de procéder au changement de batterie). \n\nPour éviter les pratiques actuelles, cela pourrait légalement  passer par la reconnaissance de la vente de toute batterie avec un bien de grande consommation comme de la vente liée. Interdire cette vente liée aurait deux conséquences permettant d'accomplir l'objectif visé :\n1) Permettre au consommateur de choisir une batterie d'un autre constructeur lors de l'achat de son produit (si toutefois les formats de batterie sont standardisés)\n2) Permettre le remplacement des batteries par le consommateur lui-même\n\nD'un point de vue écologique et énergétique la situation actuelle est absolument désastreuse, et le législateur devrait s'emparer de la question."
    },
    "19": {
      id: 137,
      category: "consommer",
      title: "Interdire portes ouvertes magasins avec chauffage ou clim à fond",
      body: "Les magasins laissent leur enormes portes ouvertes m^me quand il fait 0 ou 35 degrés dehors et que le chauffage ou la clim sont à fond.\nJ'ai demandé à plusieurs reprises dans plusieurs magasins à Paris. En vain.\nIl faudrait les obliger par décret car le gâchis est évident.\nPar avance merci"
    },
    "20": {
      id: 173,
      category: "consommer",
      title: "Usage raisonné de la Publicité",
      body: "Pour aider les citoyens à changer leurs comportements il est nécessaire et indispensable d'agir sur la publicité.\n\nTous les produits qui participent aux émissions de CO2 comme les véhicules thermiques, les voyages aériens, les smartphones, les produits issus de l'agriculture intensive, etc devraient être interdits de publicité.\nSeuls les produits qui participent de la réduction de notre impact CO2 devraient être autoriser à la publicité.\n\nLes temps de publicité devraient intégrer, à hauteur d'au moins 40%, des conseils pour réduire son impact carbone.\n\nLes écrans publicitaires qui envahissent l'espace public (métros, gares, centre ville, etc.) devraient être interdits.\n\nLes enseignes lumineuses et les devantures devraient être éteintes dès la fermeture des magasins."
    },
    "21": {
      id: 836,
      category: "consommer",
      title: "Réglementation pub + éducation",
      body: "Interdire les pubs pour les biens et services fortement générateurs de CO2 (SUV, voyages en avion...)\n\nNettoyer nos espaces publics, nos services publics (radios, TV...) de l'invasion publicitaire\n\nTaxer la publicité pour financer des opérations d'information, d'éducation liées à la déconsommation (TV, web, écoles...)"
    },
    "22": {
      id: 117,
      category: "consommer",
      title: "Et si on utilisait la publicité ?",
      body: "Bonjour, \nje propose une nouvelle approche de la publicité.\nQuand on y réfléchi, elle fait appel à des talents : les slogans sont tellement bien faits que 10-20 ans plus tard on peut encore les redire (et en chanson :)!).\nDans ce cas-là, elle pourrait être une formidable force de communication en faveur de la transition écologique dans un esprit de justice sociale !\nL'idée serait donc plutôt de mettre en place de nouvelles règles du jeu !\nJ'ai donc pensé au système suivant : tous ceux qui voudraient avoir recours à de la publicité pourraient mettre de l'argent dans un \"pot commun\" (organisme percepteur), qui rémunèrerait les agences de publicité. Puis, il y aurait une conception des publicités qui permettrait d'assurer la promotion des produits ayant des bénéfices (avérés) pour la\nsanté / l'environnement (ou un impact non négatif). Et pour les entreprises ayant des progrès à réaliser, on pourrait mettre en avant leurs actions (puis le suivi des actions). Des vérifications étant faites par des experts indépendants (dans les domaines concernés, par exemple des chimistes vérifierait la non nocivité des produits ménagers).\nQu'en pensez-vous ?\nCordialement,\nSandrine"
    },
    "23": {
      id: 134,
      category: "consommer",
      title: "Interdire gel douche en flacons plastique",
      body: "Bonjour,\nVoici ma suggestion:\nInterdire la fabrication et la vente de tous les gels douche en bouteille plastique. On peut très bien se laver avec du savon solide.\nPar avance merci de prendre en compte mes suggestions.\nBien à vous"
    },
    "24": {
      id: 135,
      category: "consommer",
      title: "Offrir un kit Zéro déchet aux jeunes",
      body: "Lorsque les jeunes reçoivent leur carte vitale à 16 ans , je propose qu'on leur offre un kit zéro déchet  : des serviettes hygiéniques lavables en coton Bio fabriquées en France pour les filles , un rasoir inox pour les garçons , + 1 brosse à dent en bois ou blé + 1 gourde inox fabriquée en Europe+ 1 guide zéro déchet = un bon départ dans la vie , une sensibilisation CONCRETE et UNIVERSELLE ( car concerne hommes et femmes , tous milieux sociaux ) + circuits de production Courts. Prendre de bonnes habitudes tôt pour éviter le plastique et favoriser la production locale . Avec effet rétro-actif pour couvrir les jeunes qui ont jusqu'à 25 ans aujourd'hui."
    },
    "25": {
      id: 214,
      category: "consommer",
      title: "Revoir les modalités de publicité pour les transports polluants",
      body: "Pour diminuer les émissions de CO2 générés par les transports il faut limiter la consommations de \"transports\" et donc limiter /taxer la publicité pour les voitures, pour les compagnies aériennes, les compagnies de croisières.\nSi on considère qu'il faut une consommation plus raisonnable et donc plus orienté sur le nécessaire et non plus le superflu, quelle besoin de publicité vantant les mérites de machines à polluer présentées dans des paysages sauvages...\nLes couts économisés par les fabricants pourraient être positivement réorientés vers des activités de R&D pour les nouveaux véhicules de mobilité non polluants."
    },
    "26": {
      id: 738,
      category: "consommer",
      title: "Création d'une taxe kilométrique pour les denrées alimentaires",
      body: "Les denrées alimentaires produites localement doivent être favorisées versus les denrées produites à l'autre bout du monde (bananes, avocats, etc.).\nIl est donc indispensable de créer une taxe augmentant le prix des denrées produites à l'autre bout du monde, dont les recettes bénéficieraient aux produits locaux."
    },
    "27": {
      id: 288,
      category: "consommer",
      title: "La déviance du pollueur payeur",
      body: "Il faudrait introduire dans la constitution le droit de la nature et de l'environnement ce qui permettrait légalement de dénoncer les traités européens.\nLorsqu'on nous dit que la moyenne de consommation de CO2 est de 10 tonnes par personne et qu'il faut que chacun réduise à 2 tonnes et doit donc contribuer à cette hauteur il s'agit bien d'une moyenne. Ce qui n'est pas dit : Le bilan carbone est très mauvais chez les classes supérieures et moindres chez les classes populaires, que le plus mauvais poste est celui du transport routier et qu'il prend donc en compte les millions de camions circulant quotidiennement sur nos autoroutes, que les plus gros pollueurs disposent non seulement de niches fiscales mais de subventions etc....."
    },
    "28": {
      id: 146,
      category: "consommer",
      title: "Interdire la publicité papier et les écrans publicitaires",
      body: "A l'heure d'internet où toutes les informations que l'on cherche sont directement accessibles en ligne, arrêtons de couper des arbres pour en faire de la publicité papier qui finira parterre ou à la poubelle. Arrêtons également les panneaux publicitaires qui restent allumés toute la nuit et consomment beaucoup d'énergie."
    },
    "29": {
      id: 213,
      category: "consommer",
      title: "Interdire la publicité pour les voitures (ou au minimum la règlementer)",
      body: "Je pense qu'il faudrait idéalement interdire la publicité pour les voitures.\nCela éviterait notamment la désastreuse \"mode\" actuelle, suscitée par un incroyable matraquage publicitaire, pour des véhicules lourds, hauts, et donc plus consommateurs.\nEt si on ne veut ou ne peut pas l'interdire (certains jugeront cela liberticides - quoique on l'a bien fait pour le tabac;...), on pourrait au minimum réglementer la publicité pour les voitures.\nPar exemple, on pourrait l'autoriser uniquement pour des véhicules de moins d'une tonne. \nAutre possibilité: on pourrait imposer au publicitaire de faire défiler un message en fin de publicité disant par exemple \"Un véhicule plus lourd et plus haut consomme significativement plus de carburant qu'un véhicule léger et bas\"... Un peu comme ce qui est fait sur certaines pubs alimentaires (il faudrait que cela soit plus visible cependant que le petit bandeau en bas d'écran que personne ne lit)...\n\nP.S.: Cette contribution aurait plutôt eu sa place dans le thème \"Se Déplacer\", mais j'ai beaucoup d'idées et il est très frustrant de ne pouvoir faire qu'une seule contribution par thème et par inter-session, donc j'ai mise celle-ci ici."
    },
    "30": {
      id: 3398,
      category: "consommer",
      title: "Ne pas développer un réseau 5G",
      body: "La mise en place d'un réseau 5G, va amener une hausse de la consommation électrique et un renouvellement des équipements existants. Il va générer un afflux supplémentaire des consommateurs sur des sites énergivores (streaming) et rendre obsolète les réseaux filaires existants (on va être amené à plus se connecter via la 5 G que via les box) pourtant plus \"économique\" d'un point de vu énergétique.\nCe coût énergétique est-il justifiable au regard des effets positifs produits? j'en doute."
    },
    "31": {
      id: 160,
      category: "consommer",
      title: "Fin du futile / sobriété / réemploi",
      body: "Avec la complicité de tous, nous sommes dans une société coupée du réel. On a envie de posséder. L'argent nous le permet quand il est là. C'est une course sans fin délétère.\n\nPremier point, il faut couper ce cercle de mauvaise consommation. Stop aux publicités partout pour des produits futiles produit dans l'unique but de faire de l'argent rapide. Il faut arriver à proposer/décrire des modèles de vie sobre, viable pour le grand public. Il faut privilégier le long terme, et si c'est possible d'arriver à s'entendre sur ce qui n'est pas futile.\n\nQu'a-t-on besoin de posséder pour vivre? La sobriété dans nos modes de vies ralentira la consommation futile. \n\nDeuxième point, nos actions individuelles volontaires ou subies, doivent s'articuler autour de principes éthiques et soutenable. Par exemple, la consommation zéro déchet, circuit court et éthique est primordiale. Il faut l'encourage plus fortement. Le réemploi, le recyclage, la \"seconde main\", est la base. Il faut favoriser la consigne de pots, bouteilles. Il faut encourager les actions de réparation participative pour prolonger la durée de vie des biens essentiels. \n\nMais tout cela ne tiendra que si nous avons des modèles de vie en sociétés sobres."
    },
    "32": {
      id: 178,
      category: "consommer",
      title: "Instaurer un bonus malus sur les aliments",
      body: "Instaurer un système de bonus malus sur les aliments en fonction de leur empreinte carbone aurait en plus l’intérêt d'inciter les consommateurs à mieux manger (par exemple plus de légumineuses et moins de viandes)."
    },
    "33": {
      id: 161,
      category: "consommer",
      title: "Affichage empreinte carbone obligatoire pour tout",
      body: "Pour aider les consommateurs à réduire leur propre empreinte carbone, il faut rendre obligatoire l'affichage de l'empreinte carbone 'réelle' d'un produit mais aussi d'un service (billet de train, d'avion, abonnement) et pas uniquement le coût CO2 de sa production et de son utilisation (comme pour le voyage).  (cf autre proposition sur étiquette énergie)\n\nLà, pour aller plus vite, il ne faudra pas attendre que toutes les entreprises aient tout mesurer (cf autre proposition sur analyse de cycle de vie ) mais les inciter à publier leur donnée empreinte carbone et environnementale dès qu'elles les ont."
    },
    "34": {
      id: 159,
      category: "consommer",
      title: "Producteur = Recycleur",
      body: "Le principe est de définir : \nce qui est fabriqué par un organisme doit obligatoirement être recyclé par ce même organisme.\n\nExemple : La télévision\nLe consommateur achète une télévision. En fin de vie de ce produit, il doit la retournée au vendeur qui à sont tour le retourne au fabricant, qui désassemble la télévision puis renvoie les composants à ces fournisseurs, qui à leurs tours doivent désassemble les composants et ainsi de suite jusqu'à retrouver uniquement la matière première (terre rare, métal, aluminium, plastique)... \n\nCes matières premiers peuvent ensuite être réutilisées directement ou bénéficié d'un recyclage parfaitement approprié car l'organisme qui les a produits (les plastiques, les métaux) connaît leurs compositions exact.\n\nAinsi nous réduisons de manière drastique les émissions de carbone causées par l'incinération des produits/mauvais recyclage et par l'extraction des matières premières (pétrole, terre rare, aluminium, ...)"
    },
    "35": {
      id: 195,
      category: "consommer",
      title: "Espace public sans publicité",
      body: "Devant les causes évidentes du changement climatique apparait notre modèle de consommation actuel , et entre choses, il est urgent de réfléchir à la place de la publicité qui pousse au \"acheté-jeté\".\nLa convention pourrait notamment réfléchir à l'interdiction pur et simple de la publicité dans l'espace publique ou tout du moins, à sa stricte limitation dans des zones dédiés , un peu sur le modèle des publications administratives qui sont cantonnés dans des cadres dédiés sur les bâtiments publics .\nRéfléchir aussi à réglementé la distributions de tract publicitaire dans les boites aux lettres ( interdire le papier glacé , imprimé en noir et blanc sur papier recyclé etc ..)\nCe sujet peut paraitre anecdotique mais il est surtout porteur d'un imaginaire qui doit changer ( le toujours plus véhiculé par la publicité ) ."
    },
    "36": {
      id: 360,
      category: "consommer",
      title: "Conseils indépendants individualisés pour réduire son emprunte carbone",
      body: "L'Etat pourrait développer et subventionner à 100% des conseils indépendants locaux, connaissant les aides publiques disponibles, technologies disponibles, et capables d'aider chaque citoyen qui le souhaite à réduire son emprunte carbone et environnementale. Les conseillers viendraient faire un diagnostic à domicile sur le logement, l'alimentation, les déplacements en partant de la situation de chacun pour donner une visibilité très concrète sur ce qu'on peut changer pour réduire son emprunte environnementale, nous orienter vers les aides publiques disponibles et les alternatives disponibles sur le marché. \nOn pourrait même imaginer prolonger sur des contrats individuels de réduction de son emprunte carbone : réduction d'impôts de X% si on réduit de Y% son emprunte carbone (avec contrôle indépendant à l'appui)."
    },
    "37": {
      id: 310,
      category: "consommer",
      title: "Documentaires sur toutes les chaînes le mardi soir",
      body: "Nous observons que les gens les plus informés sur le changement climatique sont plus inquiets que les autres quant à ses effets, et soutiennent davantage de politiques climatiques. Ainsi, on devrait lancer une campagne d’information massive et durable, afin que tout le monde acquière une compréhension satisfaisante des problèmes sociétaux et des solutions possibles (en incluant au passage d’autres enjeux que le changement climatique). Ne serait-il pas souhaitable d’imposer aux principales chaînes de télévision et de radio la diffusion de documentaires régulièrement, disons tous les mardis de 21h à 22h ? Une telle décision pourrait en tous cas être soumise à referendum."
    },
    "38": {
      id: 186,
      category: "consommer",
      title: "Garantie, Réparation",
      body: "Allonger la durée minimale (donc gratuite) de garantie des biens de consommations (en particulier l'électroménager)."
    },
    "39": {
      id: 204,
      category: "consommer",
      title: "Droits de douane pour favoriser la consommation nationale",
      body: "Aujourd'hui nous faisons venir des marchandises du monde entier au lieu de les fabriquer en France, avec un coût environnemental monstrueux en transport.\nIl est urgent de favoriser la production nationale en instaurant des droits de douane aux frontières de la France. Les Anglais y arrivent bien avec le brexit donc c'est possible !"
    },
    "40": {
      id: 207,
      category: "consommer",
      title: "Creer un \"crédit carbone\". ",
      body: "Il va falloir dire la vérité : réduire notre impact sur le climat suppose de réduire notre consommation. \nJe propose une mesure qui aurait deux vertus : limiter l'impact carbone de nos achats et redistribuer les richesses : la carte carbone.\nPhase pédagogique : commencer par un étiquetage informant les consommateurs du \"coût carbone\" de leurs achats.\nPhase expérimentation : proposer des \"cartes carbone\"aux consommateurs volontaires (pour les produits de consommation courante ou pour tous les produits mais en intégrant une notion d'amortissement sur plusieurs années pour les achats d'électroménager, les travaux, etc.).\nPhase généralisation :\nA terme, intégrer systématiquement un crédit carbone aux cartes bancaires. Les plus aisés auront consommé leur crédit carbone plus vite que leur salaire. Ils auront la possibilité d'acheter le crédit carbone non consommé aux consommateurs les plus sobres ou les plus pauvres... \nDernier avantage : le crédit carbone à \"se partager\" serait voté comme le budget. Pas de dépassement possible, pas de \"compensation\"."
    },
    "41": {
      id: 220,
      category: "consommer",
      title: "Fin du gaspillage d’électricité ",
      body: "Création d'un vaste programme d'économie d'électricité sur tout le pays avec :\n- interdiction des éclairages de magasins et zones artisanales et industrielles la nuit\n- réduction drastique des éclairages sur les bâtiments publics et privés (supermarchés, par exemple) et information au public des économies engendrées\n- fin de panneaux publicitaires électroniques qui fleurissent partout, même dans des petits villages ruraux où il est possible de voir passer en boucle les manifestations du village à 3 h du matin...\n- grande réflexion auprès des communautés des communes, et grandes agglomérations pour rationaliser le nombre de lampadaires existants, dans beaucoup de zones il serait possible d'en enlever 1 sur 2!"
    },
    "42": {
      id: 209,
      category: "consommer",
      title: "Quota carbonne ; et une chaine youtube sur l'environnement",
      body: "Bonjour à tous ;-)\n\nLa contribution ici présente renvoie à d'autres concepts déjà évoqués \"monnaie carbone\" [Hennig] ; \"crédit carbone\" [Arianechris]\n\nIl s'agit \"simplement\" (plus facile à dire qu'a faire^^) de quantifier l'émission carbone associée à chaque consommation et mettre ça en regard d'un droit maximum mensuel.\n\nJ'en profite pour donner un lien vers une chaîne youtube que j’apprécie beaucoup sur le sujet : Le Réveilleur qui a fait une vidéo qui explique plutôt bien les avantages de cette mesure.\n\n[Le réveilleur ; Le quota carbone]\n\nCela peut s'apparenter au simple bon sens dont on fait preuve avec les ascenseurs: il y a une limite maximum d'usage exprimée en kilos, par exemple 300 kilos maximum. si on met trop de poids dans l'ascenseur, il casse et donc, on se donne une limite (un quota) à ne pas dépasser.\n\nDe plus, puisque le climat n'est pas le seul problème a traiter, la généralisation dans le futur à un \"quota impact\" associé à toutes consommations pourrait être nécessaire (par exemple les eaux polluées par les rejets miniers ou encore l'eutrophisation ne sont pas forcément des problèmes de carbone, et pourtant ça crains quand même un max)."
    },
    "43": {
      id: 238,
      category: "consommer",
      title: "Réduire le pouvoir des LOBBIES de la grande consommation...",
      body: "Aujourd'hui, les décisions courageuses qui doivent être prises sont souvent bloquées, amoindries, empêchées par l'omniprésence des Lobbies auprès : \n- 1) De la Commission et du Parlement européens, \n- 2) Du Gouvernement et parlement français, \n- 3) Des médias et de toutes les autres formes de pouvoir (locaux, au sein des entreprises, etc.) \n_____ \n\nPour réussir à transformer le secteur de la consommation (production, usage du plastique, surconsommation, obsolescence programmée, etc.) pour réduire les émissions de gaz à effet de serre, il faut absolument changer le fonctionnement de nos institution et de notre démocratie : \n________\n- Généraliser les Conventions citoyennes tirées au sort pour les grandes décisions de société (environnementales, sociales, économiques, démocratiques) mais en leur ouvrant dans la constitution le pouvoir de déclencher elles-mêmes directement des RÉFÉRENDUMS. \n\n________\n- Appliquer les principes de la démocratie ouverte www.democratieouverte.org au fonctionnement des institutions de demain : Plus de transparence + Plus de place donnée aux citoyens + de Pouvoir d'agir, d'intelligence collective et de gouvernance partagée... \nSur ce sujet, demandez à auditionner le collectif Démocratie Ouverte (ou dans votre comité de gouvernance : Mathilde Imer, Loïc Blondiaux, Jean-Michel Fourniau).\n\n________\nOn compte sur vous !"
    },
    "44": {
      id: 223,
      category: "consommer",
      title: "Lister les économies indolores pour une vision positive",
      body: "Il pourrait être utile et pédagogique de lister et quantifier toutes les économies que nous pourrions faire sans que cela ne remette en cause la satisfaction de nos besoins fondamentaux. On pourrait ensuite planifier leur mise en application progressive en proposant aux secteurs touchés des alternatives de reconversion, pour que la transition se fasse en douceur. Cela pourrait même devenir une philosophie de vie de la véritable économie à promouvoir, celle dans laquelle la réussite serait synonyme d’impact positif sur l’environnement et récompensé comme tel.\nCes économies prises isolément sont peut-être marginales, mais mise bout à bout pourrait représenter un effort indolore et encourageant pour d’autres efforts à venir plus difficile à accepter.\nListe de quelques exemples : pollution lumineuse des villes la nuit, écrans plasma publicitaires, climatisation excessive de centres commerciaux, congélateurs sans couvercle des supermarchés, utilisation de machines inutiles (souffleuses de feuilles, camions de nettoyage des caniveau, canons à neige…), feux d’artifices du 14 juillet et du nouvel an très polluants, pratique de sports forts émetteurs de CO2 (sport automobile…).\nEn cherchant bien, il y a surement quantité de pratiques à supprimer qui n’auraient pas d’incidence notables sur nos vies quotidiennes et pourrait être envisagées de manière positive et non anxiogène."
    },
    "45": {
      id: 417,
      category: "consommer",
      title: "Sortir de la société de consommation",
      body: "Bonjour,\n\nNous sommes complètement dépendant à la consommation. Tout simplement car la société nous pousse à consommer (pub, l'économie n'est pas en forme à cause de la consommation...)\n\nPourtant, cette sur-consommation va nous mener à notre perte! (Cf. The mimits of growth - Club of Rome)\n\nPour luter contre cela, ce serait bien de supprimer la pub (une industrie parmi les plus consommatrice d'énergie). Exiger que tous les produits vendues ait une longue durée de vie et puisse être réparer.\n\nEnfin, en finir avec les emballages! (principalement les plastiques)\n\nJe vous remercie"
    },
    "46": {
      id: 272,
      category: "consommer",
      title: "Imposer un quota individuel de streaming",
      body: "Aujourd'hui le numérique a une empreinte carbone, sociale et environnementale déjà désastreuse. Le secteur est comparable à l'aviation civile en termes de GES, et particulièrement destructeurs pour extraire les matières qui lui sont nécessaires (sans parler des conditions de travail que cela induit).\nParmi les usages, le plus gourmand (en termes de bande passante et de composants) est celui de la vidéo.  \n\nOr beaucoup utilisent Youtube pour écouter de la musique gratuitement (mais ne peuvent écouter s'ils éteignent l'écran pour ne pas voir la vidéo, Youtube ne le permet pas). \n\nImposons un quota en Mo/jour/consommateur à appliquer aux services de streaming (à calculer selon ce que la communauté scientifique internationale considère en phase avec la biocapacité terrestre). \nCela favorisera un retour à des supports ou formats plus durables, permettant une plus juste rémunération des artistes, la possibilité de jouir de l’œuvre à vie par l'acheteur, et donc une meilleure valorisation des œuvres en général. \n\nNul n'a besoin d'accéder, à tout instant, à des millions d’œuvres (musicales, cinématographiques...) à tout instant. Ça ne valorise ni l’œuvre, ni l'artiste, ni l'environnement."
    },
    "47": {
      id: 250,
      category: "consommer",
      title: "Communiquer sur les filières courtes",
      body: "De plus en plus de citoyens déménagent et à chaque fois il est difficile au début de son installation de trouver les coopératives locales ou les ventes de produits locaux existantes ou tout autres possibilités de consommer mieux et local exitantes. Les mairies devraient mettre en place un livret d'accueils pour les citoyens ! Faire de la publicité sur les agriculteurs et leurs produits pour éviter les déplacements."
    },
    "48": {
      id: 254,
      category: "consommer",
      title: "Taxer fortement les produits emballés dans du plastique",
      body: "Il existe souvent des alternatives au plastique comme, par exemple :\n- le papier qui peut parfaitement emballer le papier toilette (certaines marques le font)\n- le carton enduit de cire végétale pour les yaourts\n- le verre (qu'il faudrait consigner)\n- et bien d'autres options \nJe propose donc de taxer les produits des marques qui ne font pas l'effort de changer et vous verrez, comme par magie, leurs pratiques se modifier !"
    },
    "49": {
      id: 1865,
      category: "consommer",
      title: "Climatisation magasin",
      body: "Interdire les magasins, principalement les grandes enseignes à chauffer (l'hiver) et climatiser (l'été) non seulement à outrance mais surtout en laissant les portes grandes ouvertes pour faciliter l'accès aux consommateurs"
    },
    "50": {
      id: 369,
      category: "consommer",
      title: "Consommation locale",
      body: "Il faut favoriser la consommation de produit locaux dans tous les domaines. Il est aberrant de manger un kiwi de Nouvelle-Zélande en regardant un télé coréenne dans des vêtements fait au Bangladesh. \nPour cela, les produits importées doivent être taxés au bénéfices des produits locaux et des produits de première nécessité. La taxation des vols peut aussi être utile pour réduire l'acheminement de marchandise vers la France. Cela doit être accompagné par le développement des filières peu développée en France.\nIl faut interdire la création de nouveaux entrepôts de poduits venant du monde entier.\nIl faut réduire notre consommation, donc interdire la publicité. Surtout interdire les panneaux publicitaires numériques qui consomment autant d'énergie qu'un foyer par an.\nIl faut interdire les grands projets climaticides, comme celui d'Europacity, qui détruisent les commerçants locaux et favorisent l'importation de produits. \nIl faut réglementer les emballages plastiques et interdire le suremballage. Les supermarchés pourraient être taxé sur la quantité d'emballage vendu.\nIl faut créer un éco label pour chaque produit gérer par une instance libre et indépendante dont le financement sera à la charge des entreprises au prorata des notes obtenues par leurs produits.\nIl faut obliger les producteurs de produits électroniques à développer des produits réparables (certains appareils ne peuvent même pas être ouvert).\nIl faut sévèrement punir le fait de détruire des produits neufs."
    },
    "51": {
      id: 266,
      category: "consommer",
      title: "Inciter l'achat aliments en vrac",
      body: "Passer à l'achat des aliments en vrac demande un véritable effort (emporter ses contenants, s'organiser, gérer ses réserves...) Or actuellement , il n'y a pas ou très peu d'écart de prix avec les aliments similaires emballés. pourtant beaucoup de grandes ou moyennes surfaces proposent cette possibilité. mais cela reste essentiellement un acte militant. \nUne véritable incitation financière pourrait démultiplier les volontaires. Il semblerait normal d'ajuster la TVA à ce type de produits plus vertueux. l'économie peut sembler peu significative mais cela pourrait également encourager les professionnels de la restauration à entrer dans ce cercle."
    },
    "52": {
      id: 274,
      category: "consommer",
      title: "Extention des cas d'application de la loi \"no pub\"",
      body: "A partir de la loi qui interdit la publicité pour les cigarettes, étendre son domaine d'application.  \nUne commission citoyenne tirée au sort chaque année aurait pour mission d'étendre la liste des produits et services interdits de pub, sur des critères de GES / Justice Sociale. \nLes citoyens proposeraient des produits / services à exclure de la publicité, soit parce qu'ils stimulent la consommation de GES (voiture individuelle) soir parce qu'ils stimulent les inégalités sociales (produits de luxe), soit les deux ensemble (avion). La commission, étudierait les propositions avec les méthodes de son choix et en toute transparence (éviter l'influence des lobbys à travers l'expertise). Les décisions de la commission seraient applicables avec un délai d'un an pour que la commission suivante travaille sur des bases rafraichies. \nCe mécanisme de long terme assainirait progressivement l'envahissement de nos vies par la pub."
    },
    "53": {
      id: 248,
      category: "consommer",
      title: "Les villages vacances zéro déchet",
      body: "Créer un village vacances zéro déchet dans chaque département (Au moins).\n Le village vacances zéro déchet c'est un village autonome, autosuffisant, produisant zéro déchet et  ne  produisant pas de gaz à effet de serre.  Toute la nourriture est produite à l'intérieur du village par les employés et les vacanciers. L'eau peut être pompé dans un puits, par exemple, puis filtrée, ou bien l'on peux récupérer l'eau de pluie.  Aucun déchets n'est produit  puisque il n'y a pas de plastique. Les paniers sont par exemple en osier, les bols et assiettes en terre cuite, et les déchets organiques sont mis au compost.  L'idée ici est d'avoir plusieurs villages qui ne se ressemblent pas et qui deviennent une multitude de terrains d'expériences permettant de trouver des modèles de villages autonomes en énergie, en eau et en nourriture.  Pour certains il peut ne pas y avoir d'électricité, pour d'autres il peut y avoir de l'électricité produite par une éolienne par exemple. Les logements sont de type : Tiny House, yourte, chalet,  roulotte, ou tout autre habitat écologique.\n Plusieurs activités au cours de la semaine de vacances sont proposés pour les vacanciers comme il s'occuper du potager, s'occuper des animaux, apprendre la Permaculture, l'agroforesterie, la vannerie, la cueillette, la traite, l'équitation, etc..."
    },
    "54": {
      id: 268,
      category: "consommer",
      title: "Taxe kilométrique/droit de douane",
      body: "Il faut garantir garantir la non concurrence avec des produit venant de loin via une TAXE KILOMETRIQUE qui prendrait en compte le cout écologique du transport. Cesser de signer à tout va des traités transatlantique : Japon, Canada, etc.\nOn ne pourra pas parler de transition écologique sans questionner le fonctionnement du système actuel néolibéraliste, il faut réapprendre à consommer local, moins mais de meilleure qualité."
    },
    "55": {
      id: 418,
      category: "consommer",
      title: "Emballages plastiques ",
      body: "Taxer les produits qui ne sont pas de première nécessité alimentaire et qui sont emballés dans du plastique, type sodas, barres chocolatées, bonbons car:\n- en consommer trop est mauvais pour la santé \n- ces produits de consommation \"récréative\" sont ceux que l'on retrouve le plus dans l'environnement."
    },
    "56": {
      id: 1866,
      category: "consommer",
      title: "Eclairage urbain",
      body: "Interdire aux magasins et principalement les grandes enseignes d'éclairer leurs vitrines à partir d'une certaine heure"
    },
    "57": {
      id: 2223,
      category: "consommer",
      title: "Atelier de réparation participatif et solidaire \"Repair Café\"",
      body: "Créer des ateliers de réparation d'objets sur des petits territoires pour sensibiliser la population à la réparation et ainsi redonner une seconde vie aux objets. Lutter contre l'obsolescence programmée matérielle et logicielle. \nAccéder à une bibliothèque pour faciliter la réparation. S'inspirer de la Suède qui a opté pour un allègement fiscal des personnes qui réparent leurs propres objets. Éduquer les plus jeunes à s'approprier les objets.\nFavoriser la multiplication des Repair Cafés sur tout le territoire comme en Hollande ou Belgique."
    },
    "58": {
      id: 316,
      category: "consommer",
      title: "Huile de palme et huile de coco",
      body: "Interdire totale de l'utilisation de l'huile de palme en France, que ce soit pour les produits alimentaires ou pour les carburants. De même pour l'huile de noix de coco qui vient de plus en plus remplacer l'huile de palme dans les produits alimentaires."
    },
    "59": {
      id: 421,
      category: "consommer",
      title: "Limiter les emballages (surtout plastiques)",
      body: "Trouver le moyen de mettre des contraintes pour inciter producteurs et consommateurs à ne pas acheter des produits emballés, par exemple affichage séparé du prix de l'emballage,  taxe au poids de l'emballage ou ratio produit/emballage."
    },
    "60": {
      id: 361,
      category: "consommer",
      title: "Favoriser la proximité",
      body: "Création d'une taxe applicable à tout produit physique. Cette taxe serait relative au poids de la marchandise et au nombre de kilomètres parcourus. \n\nCette taxe présenterait plusieurs avantages : \n - Équilibrer la balance commerciale sans discrimination en se référant à des notions simples (le kilomètre parcouru et le poids) pour rapprocher les consommateurs et les producteurs\n - Réindustrialiser et développer à nouveau les tissus économiques régionaux en rapatriant les bassins d'emplois au plus proche des bassins de vie\n - Diminuer le trafic de marchandises au niveau mondial et donc la pollution qui en découle\n - Arrêter la course aux économies d'échelles qui concentre les problèmes (on le voit avec les centrales d'achats, mais aussi avec les problèmes environnementaux que posent les sites industriels de grande échelle, sans parler des effets pervers sur les inégalités de revenu, la concentration de la misère, les capacités de nuisance des lobbys à la tête de ces empires industriels, ...)\n - Arrêter avec l'hypocrisie d'une production de biens importée dont les pratiques sociales et environnementales ne sont pas en adéquation avec nos valeurs et le besoin d'une transition écologique.\n - Remettre de la proximité entre le producteur et son client, ramener de l'humain dans cette relation et ne plus voir cette relation que sous l'aune de simples indicateurs financiers."
    },
    "61": {
      id: 1033,
      category: "consommer",
      title: "Créer un lobbing de consommateurs vertueux pour la planète",
      body: "Utiliser les réseaux sociaux pour informer en masse !!\n- Prise de conscience que les consommateurs ont un énorme pouvoir. \n- S'en servir à des fins vertueuses.\n- Promouvoir tous les produits qui réduisent déchets, plastiques, kilomètres de transports, mauvaises conditions sociales de leur employés, etc.\n- Stigmatiser tous les produits  moins utiles, de mauvaises qualité, d'obsolesence programmée,  etc. \n(Même s'ils sont fabriqués en France !)\nPour remoraliser notre mode de consommation. Car oui, notre modèle de surconsommation à des conséquences désastreuses sur l'environnement."
    },
    "62": {
      id: 999,
      category: "consommer",
      title: "Créer une poubelle \"organique\"",
      body: "Cette poubelle servirait pour tous les déchets alimentaires: épluchures, assiettes non-finies, produits périmés... Son ramassage s'effectuerait au même rythme que les poubelles normales actuelles. Les poubelles normales, ayant moins de déchets pourrissants vites, seraient alors ramassées moins souvent, pour limiter le coût de cette mesure.\n\nLes déchets alimentaires ainsi récoltés seraient compostés (voire lombri-compostés) et revendus par les communes aux agriculteurs alentours en tant que compost. Une autre piste serait de les méthaniser pour en faire du Gaz.\n\nCela aurait de multiples avantages :\n- ça améliore la fertilisation des sols autour de la commune avec de la matière organique plutôt qu'avec des engrais chimiques\n- c'est renouvelable puisque ça utilise un \"cycle\" organique naturel plutôt qu'une \"chaîne de production rectiligne\" non-renouvelable (on ne peut pas indéfiniment extraire du phosphate de mines finies à l'autre bout du monde pour le déposer dans nos champs)\n- ça valorise mieux ces déchets en évitant de les brûler bêtement, ce qui émet du CO2\n- ça favorise les circuits locaux courts faibles en émissions carbone\n- tout en étant neutre économiquement pour la mairie\n\nBien sûr, cela pourrait d'abord être testé expérimentalement sur quelques villes volontaires à différentes échelles (10.000 hab. - 1.000.000 hab.), avant d'être généralisé à l'ensemble de la France..."
    },
    "63": {
      id: 340,
      category: "consommer",
      title: "Interdire la destruction d'invendus",
      body: "La production doit s'adapter à la consommation: au niveau des vêtements par exemple il y a trop de production et trop souvent de nouvelles collections. Résultat: de nombreux invendus sont encore détruits, créés pour être détruits sans aucune utilité, double pollution (création et destruction).\nProduire moins et surtout recycler mais pas détruire."
    },
    "64": {
      id: 1240,
      category: "consommer",
      title: "Label \"made in social\"",
      body: "Un label qui permette d'acheter 100% économie positive : il doit cumuler \n- Bio, \n- Environnementalement responsable, (carbone et cycle de vie)\n- Sociétalement responsable, (production, inclusion par l'insertion et sur le handicap)\n- Made in France,\n- Responsabilité employeur (encadrement des salaires, réinvestissement en emploi, gouvernance partagée).\navec 1 seul label, et une NOTE sur 5 qui indique le niveau. \nIl existe en France des agréments pour chaque point (sur la partie sociétalement responsable : entreprise agréée ESUS, B-Corp, etc)\nPour aller plus loin consulter le Mouvement des entrepreneurs sociaux."
    },
    "65": {
      id: 392,
      category: "consommer",
      title: "Multiplier les espaces de don d'objets ",
      body: "Beaucoup souhaitent donner des objets dont ils veulent se débarrasser sans savoir comment les faire circuler. Les associations ont leurs limites (sélectivité des objets, distance) \net les sites de don aussi (temps pour trouver un repreneur). Une solution serait de multiplier les espaces de don dans les quartiers (de type give boxes). Les déchetteries pourraient constituer des points d'apport des objets volumineux à condition d'être ouvertes à la récupération par tous, ce qui n'est pas le cas aujourd'hui. Les municipalités devraient également organiser des gratiferias (fêtes de la gratuité) au moins deux à trois fois par an.\nMoins d'objets finiraient enfouis ou incinérés si on laissait des gens les récupérer par ces différents canaux."
    },
    "66": {
      id: 650,
      category: "consommer",
      title: "Réinstaurer un protectionisme commercial salutaire",
      body: "Renégocier tous les traités commerciaux internationaux à l'aune des émissions de GES générées par les importations de biens qu'on pourrait produire localement."
    },
    "67": {
      id: 327,
      category: "consommer",
      title: "Mieux informer le consommateur, consommer plus sobrement, consommer les produits les plus vertueux en matière d'environnement",
      body: "- Consommer sobrement des produits simples à changer/réparer par pièce détachée (interdire l'obsolescence programmée)\n\n- Mettre sur tous les produits une étiquette colorée indiquant la quantité de CO2 émis pour le produire et son impact environnemental (+ créer une application mobile de type Yuka)\n\n- Interdire les produits qui ont nécessité de brûler la foret (exemple: soja du Brésil, ...)\n\n- Interdire la vente des grosses voitures, la vente des croisières sur les gros paquebots hyper-polluants, les billets d'avions à 40 euros (taxer lourdement le kérosène), les jets privés, le taxi-drone...\n\n- informer les citoyens que les batteries électriques et les voitures électriques sont très néfastes à produire (beaucoup de CO2 émis!): ce n'est pas la solution pour la mobilité! \nLes voitures à hydrogène vert sont bien plus vertueuses (aucun rejet de CO2) (mais cela nécessite de bâtir l'économie hydrogène verte en 5-10 ans. Voir https://mcphy.com/fr/ ).\n\n- Manger beaucoup moins de viande (car les protéines d'origine animale sont beaucoup plus émettrices de CO2).\n- Manger plus de légumes, lentilles..."
    },
    "68": {
      id: 368,
      category: "consommer",
      title: "2 IDEES  Economie d'Electricité Gestion de l'eau",
      body: "Idée toute simple: obliger les fabricants de petit electromenager à equiper brosses à dent, rasoirs etc de cable secteur . Il faut 24 heures de charge electrique pour se laver 3 fois les dents . Brancher extemporanement quand on a l'usage devrait être une evidence\nGestion de l'eau: nous alternons inondations et secheresse. Pourquoi ne pas creer des milliers de retenues et reservoirs d'eau. Cela limiterait les crues mais surtout permettrait irrigation, arrosage et lutte contre les incendies en période de secheresse"
    },
    "69": {
      id: 345,
      category: "consommer",
      title: "Interdire la pub pour les boissons en bouteille",
      body: "Vu qu'en france l'eau du robinet est en général potable (pour plus de 95% de la population), interdire la publicité pour les boissons dans des contenants plastique qui , même recyclables et recyclés, se retrouveront dans la nature et qu'il faudra donc remplacer par du pétrole.\nEt sur les étiquettes des boissons, faire comme pour les paquets de tabac: \"En buvant ce truc vous ingérez plus de plastique qu'avec de l'eau en bouteille, la fabrication et le transport de cette bouteille a émis plus de CO2 que l'eau du robinet, une bouteille plastique n'est jamais recyclable à 100%, l'homme et la femme n'ont besoin que d'eau (et de lait) pour survivre, toute autre boisson est néfaste pour la santé et l'environement,...\""
    },
    "70": {
      id: 453,
      category: "consommer",
      title: "Interdiction des TV 4K et 8K et limitation objet connecté",
      body: "Depuis quelques mois/années les fabricants de téléviseurs vendent des télévisions 4K (ainsi que des cameras, appareils photos...) et bientôt ce sera le 8K... alors que nous avons tous déjà une télévision, la plupart du temps HD.\nTrès honnêtement, je ne pense pas que téléspectateurs moyens voient la différence entre de la 4K et de la HD, ou en tout cas la HD est déjà de très bonne qualité. Il n'y a donc pas d'intérêts à la remplacer par de la 4K/8K.\nLa fabrication de ces nouvelles TV consomment énormément de ressources abiotiques (minerai/métaux rares) et leur utilisation consomme énormément d'électricité et le tout émet beaucoup de GES.\nDe plus, les fichiers vidéo 4K sont très lourds. Cela implique d'avoir énormément de stockage (production/utilisation disques durs) et consomme énormément d'énergie pour le streaming (transfert des données) et l'affichage.\nLa télévision n'est pas un objet essentiel pour notre vie, nous devons/pouvons donc limiter son impact, notamment en interdisant le 4K ou à minima le 8K. En faisant cela, c'est la production de millions de TV qui peut être évité.\n\nAttention également aux objets connectés qui nécessitent beaucoup de matières premières (métaux) pour être fabriqués et la plupart du temps jamais recyclés."
    },
    "71": {
      id: 375,
      category: "consommer",
      title: "Taxe progressive sur les trajets en avion au départ ou à destination de la France",
      body: "Instaurer une taxe progressive qui inciterait les personnes voyageant en avion à l'utiliser le moins possible :\nOn peut imaginer que le premier aller-retour en avion effectué par une personne physique ou morale (pour une entreprise par exemple) chaque année soit exempté de taxe puis qu'une taxe progressive et extrêmement dissuasive soit mise en place pour des voyages en avion répétitif. Avec par exemple :\n - 2ème voyage aller retour dans l'année : 10 % de taxe\n - 3ème voyage aller retour dans l'année : 50 % de taxe\n - 4ème voyage aller retour dans l'année : 100 % de taxe etc..\nCela affecterait pas les personnes avec peu de moyen (donc forte dimension de justice sociale) et servirait de levier de pression pour reconsidérer les voyages polluants en avion à répétition qu'ils soient effectués par des particuliers ou des entreprises.\nLa taxe ainsi récoltée pourrait par exemple être redistribuée pour tous les citoyens qui n'ont pas pris l'avion dans l'année pour les en remercier de façon directe et valoriser leur comportement exemplaire."
    },
    "72": {
      id: 430,
      category: "consommer",
      title: "Surtaxer (ou interdire) les produits superficiels",
      body: "Consommer mieux, consommer moins... et surtout consommer utilement !\n\nIl convient de lutter contre la consommation de biens superficiels. Ne sont évidemment pas concernés ici les denrées alimentaires du quotidien, ni l'habillement courant, ni les services, etc. Mais les biens dommageables à l'environnement et/ou énergivores, dont on se passe très bien. Il s'agit notamment de :\n- objects connectés \"tendance\" : des montres connectées (nécessitant des métaux rares, et une recharge quotidienne), jusqu'à la fourchette et au maillot de bain connectés !\n- électroménager de sur-équipement : robots aspirateurs, balai à récurer électrique...\n- fausses inventions, souvent proches de l'arnaque : localisateur de bagages blutooth (= qui permet de savoir où est votre valise quand vous partez en voyage... mais ne fonctionnant que si on est à moins de 15m d'elle !) ; faux \"climatiseurs\" (ventilateur avec un glaçon)\n- tous les produits de luxe qui ont un fort impact sur l'environnement (voiture de luxe, vêtements haute couture, etc)\n\nPour cette lute, 2 moyens :\n- les interdire, et traquer les contrevenants (notamment pour les vendeurs d'objets \"arnaques\" / ne tenant pas leur promesses)\n- les surtaxer : pour les décourager via le signal-prix, tout en rapportant un peu d'argent aux caisses de l'état (il en faut / finançant des projets de la transition)"
    },
    "73": {
      id: 608,
      category: "consommer",
      title: "Sortir du modèle de l'hypermarché et des Zones commerciales en périphérie des villes",
      body: "Les zones commerciales n'ont du succès que parce qu'elles sont facilement accessibles en voiture. Or, elles posent de nombreux problèmes :\n\n— Comme elles sont éloignéss des centre-villes, chacun vient avec sa voiture.\n\n— Destruction de vastes espaces naturels et agricoles en périphérie, alors que ces espaces pourraient être des puits de carbone.\n\n— Enlaidissement du paysage à l'entrée des villes et appauvrissement des coeurs de ville du fait de la concurrence.\n\nQuelques mesures pourraient être prises pour limiter, voire faire disparaître, ce modèle de consommation qui n'existe que parce que la voiture individuelle est le modèle dominant :\n\n— Obliger les hypermarchés à financer des navettes régulières, voire les obliger à proposer des réductions pour inciter à venir en navette.\n\n— Informer les consommateurs sur le fait que les hypermarchés ne sont pas si bon marché, lorsqu'on ajoute le prix du carburant dépensé pour s'y rendre\n\n— Faire prendre conscience qu'acheter local sur les marchés auprès d'un agriculteur de la région coûtera toujours moins cher et sera de meilleure qualité que les produits frais des hypermarchés (bio y compris)\n\n— A terme, interdire la construction de toute nouvelle zone commerciale en périphérie. Favoriser, à la place, le développement de commerces plus variés en centre-ville et/ou créer de nouveaux \"centre-villes\" dans les quartiers autour des villes"
    },
    "74": {
      id: 3399,
      category: "consommer",
      title: "Impact de la mise en vente d'un nouveau produit de consommation durable  sur le marché",
      body: "Pour la mise en place d'un nouveau produit de consommation durable (téléphones, TV, ordinateurs, électroménager, machines outils, voitures, avions....), les fabricants doivent garantir une diminution de la consommation de Co2 de 5 ou 10%(échelle à construire) du nouveau produit par rapport à son prédécesseur sur l'ensemble de sa durée de vie (conception, fabrication, transport, usage)."
    },
    "75": {
      id: 456,
      category: "consommer",
      title: "Interdire l'emballage du bio dans du plastique ",
      body: "L'agriculture biologique est censée contribuer à une consommation plus propice à la préservation de l'environnement. Pourtant, ses produits sont sur-emballés dans les supermarchés, ce qui peut décourager à acheter du bio."
    },
    "76": {
      id: 803,
      category: "consommer",
      title: "Révolutionner la publicité !",
      body: "Diminuer fortement nos émissions de GES implique de revoir nos modes de consommation. A cet égard, la publicité est un levier d'action extrêmement puissant, notamment au travers des imaginaires qu'elle transmet, des désirs qu'elle suscite et des normes sociales qu'elle est capable d'instaurer et de conforter.\nLes acteurs de la lutte contre le changement climatique, en premier lieu desquels l'Ademe, ont bien pris conscience de cet enjeu, mais leurs moyens restent limités et le rapport de force avec les principaux acteurs économiques demeure très défavorable.\nPourtant, une révision réglementaire simple des activités publicitaires serait facile à mettre en oeuvre, dans un délai très rapide et à un coût direct nul pour les finances publiques.\nParmi les mesures possibles d'engager :\n- l'interdiction de la publicité, à défaut d'en interdire la vente, pour les biens et services les plus dommageables pour le climat (ex., les trajets en avions, la viande issue d'élevages intensifs), ou qui ne sont pas réparables et/ou recyclables ;\n- l'obligation d'information de l'empreinte CO2, avec une visibilité de l'information a minima égale à celle du prix ;\n- l'obligation d'inclure un message promouvant la sobriété et l'achat d'occasion ;\n- etc.\nNon seulement ces mesures se passent de toute stigmatisation, mais elles s’inscrivent dans un esprit de justice sociale en évitant de susciter des frustrations pour les plus démunis et en valorisant les démarches de simplicité et de sobriété."
    },
    "77": {
      id: 437,
      category: "consommer",
      title: "Imposer les mêmes règle a l'import",
      body: "Il me semble évidant que quel que sois les règles créés il faut les imposées aussi aux produits importés pour éviter d'exporter le problème dans d'autre pays. \nIl me semble que c'est ce qui c'est passé avec les mesures prisent jusqu’à maintenant.\nIl faut donc pouvoirs évaluer l’emprunte carbone des produits importés et pouvoirs vérifier leur fabrication.\nIl est tout aussi important de ne pas autoriser a l'exportation des produits dont on n’autorise pas la vente sur notre territoire ou de leur appliquer les mêmes taxes."
    },
    "78": {
      id: 564,
      category: "consommer",
      title: "Proposer obligatoirement une alternative au neuf",
      body: "Il faudrait réduire considérablement nos achats de produits neufs ( en dehors de l’alimentation et cosmétique) : pourquoi ne pas obliger les magasins à proposer des produits d’occasion en bon état et/ou reconditionné. Exemple : pour les vêtements : un rayon neuf, et un rayon d’occasion de leur marque. Pour l’electromenager : idem avec des produits révisés. Ces produits seront moins cher puisque nous n’utiliserons pas de matières premières pour les produire à nouveau, et nous limiterons ainsi le gaspillage"
    },
    "79": {
      id: 441,
      category: "consommer",
      title: "Pousser à consommer utile et dé-carboné",
      body: "Réduire la consommation de produit peu utile et à fort impact carbone.\n\nL'eau: Interdire les publicités pour de l'eau en bouteille. Informé les gens qu'il est mieux de boire de l'eau du robinet.\n\nLes emballages : réduire à la source en obligeant les supermarchés à transitionner en proposant du vrac et de la consigne de verre jusqu'à élimination des emballages (aussi avec leurs fournisseurs). \n\nProduits non locaux, transformés : taxer l'entreprise sur chaque produits en fonction de leurs bilan carbone (emballage, transport, transformation etc)\n\nNumérique :  Ne faut -il pas revoir la décision de passage à la 5g qui risque d'augmenter encore plus les visualisation de vidéos sur internet? Repasser à la 3g?\n\nProduit à fort impact : au minimum supprimer la pub pour la cohérence du discours sur certains produits (ex: voiture essence, agence voyage, avion, électronique)\n\nGénéral : Réduire le nombre (et la durée ?) des coupures publicitaires à la télévision"
    },
    "80": {
      id: 882,
      category: "consommer",
      title: "Indexer la TVA sur l'empreinte carbone",
      body: "Le principe est de déplacer la taxe carbone de l'amont, sur les énergies fossiles, vers l'aval, sur les produits et services. Les contrôles de l'empreinte carbone sont faits sur le modèle existant du contrôle de la chaîne de production alimentaire, et la note est payée sous forme de valeur ajoutée au produit ou service final. Elle permet de transformer la notion de \"pollueur payeur\" en \"pollueur alourdi\". Elle vise à favoriser les pratiques sobres, de dissuader la consommation énergivore, de favoriser les circuits cours par rapport aux circuits longs, et de permettre l'émergence d'entreprises à la portée plus locale.\n\nCeci est une formulation écrite et étoffée de l'intervention de Guillaume de Bordeaux, lors du jour 1, session #2 de la convention citoyenne pour le climat.\n\nPlus de détails sont disponibles sur demande : avantages, inconvénients, réglages, évolutions, contrôles, exemples, ... Je ne peux pas tout écrire ici, étant limité à 1500 caractères.\n\nLe principal avantage est de créer des incitations fortes à la diminution des GES :\nA court terme, cela force les entreprises à optimiser leur empreinte carbone par le biais de leurs fournisseurs ou de leurs opérations, pour diminuer leurs tarifs finaux.\nA moyen terme, cela entraîne l'éradication par les lois du marché des pratiques les plus carbonées, qui auront été supplantées économiquement. \nA long terme, cela pilote l'innovation vers des diminutions de l'empreinte carbone."
    },
    "81": {
      id: 529,
      category: "consommer",
      title: "Plus de pubs absurdes !",
      body: "Arrêtons de placer la consommation comme le but ultime à atteindre.\nLes politiques ou experts nous disent que c'est le consommateur qui fera la différence. Mais restons honnêtes, les moyens utilisés par les grandes entreprises pour vendre leurs produits non durables sont efficaces et c'est ici que le politique peut agir. \nComment peut-on voir ou entendre encore des publicités pour des produits polluants, jetables, inutiles... et donc destructeurs des écosystèmes et responsables du dérèglement climatique. Il serait bien d'interdire la publicité mais comme on sait très bien que ce n'est pas possible au nom du sacro-saint libéralisme. Interdisons au moins les pubs pour les produits les plus destructeurs, et il y en a… les voitures les plus polluantes, les croisières, les aliments transformés, les produits agricoles non issus de l'agriculture biologique, les outils de bricolage montés par des enfants à l'autre bout de la planète... ça évitera la tentation d'acheter n'importe quoi, ça fera du bien à tout le monde de ne pas être inondés par ces \"informations\", et ça permet d'économiser des sommes d'argent considérables sui seront utilisées de façon bien plus intelligente. Pas d’inquiétude, pour tous ces produits promus à longueur de journée, il existe des solutions plus locales, plus écologiques et acceptables socialement. Et si on pense que ces produits sont trop chers pour le commun des mortels, c'est au politique de les rendre abordables (par l’argent non investi dans la pub?)"
    },
    "82": {
      id: 651,
      category: "consommer",
      title: "À propos de l'intervention de Monsieur Jancovici",
      body: "Cette remarque pourrait tout aussi bien être dans la rubrique \"produire\" ou \"transversal\".\n\nLors de la quatrième journée de travail, Jean-Marc Jancovici s’est présenté comme membre non payé du Haut Conseil pour le Climat. Il n’a pas précisé ses autres activités.\nIl a oublié de préciser qu’il est aussi président du Shift Project, un organisme financé par EDF, Vinci, Bouygues, Enedis, Saint Gobain… Il est aussi associé fondateur de Carbone 4, une entreprise qui conseille pour décarboner notamment le groupe PSA, total, safran, le groupe Lagardère, BNP-Paribas, Vinci, Bouygues Immobilier...\nMonsieur Jancovici propose des pistes très intéressantes pour penser la société de demain. Je pense que dans l’ensemble il est bon de s’inspirer de ses idées. Cependant attention au risque de conflit d’intérêt lors de ses interventions, en particulier concernant le nucléaire.\nNon, le nucléaire n’est pas la seule solution pour baisser les émissions de CO2. C’est une solution, mais ce n’est pas la seule et encore moins la meilleure. À ce propos, une émission sur France Culture dont le titre est : \"L'EPR : le nucléaire c'est cher et ça ne fonctionne pas\".\nMieux vaut s’inspirer d’un scénario type Negawatt : en priorité réduire les besoins en énergie, en deuxième améliorer l’efficacité des appareils, et enfin utiliser des sources d’énergie renouvelables."
    },
    "83": {
      id: 805,
      category: "consommer",
      title: "Autoproduction et Reduction/Boycott : Les deux pilliers pour une transformation de notre Consomation ",
      body: "-Produire soi-meme, ou avec ses voisins, ses amis, et Boycotter\n-Reduire drastiquement nos consommations d'energies, de biens et de capitaux\n\nLe changement viendra des citoyen eux-meme, par un mouvement non violent, pacifique, et alors les systemes evolurons et s'adapterons. Si nous reduisons a notre echelle personnelle, familiale, locale, notre maniere de consommer, en produisant notre nouriture lorsque nous le pouvons, nos vetments, energie etc... et en Boycottant les produits non locaux, non bio, reduisant nos deplacements etc..."
    },
    "84": {
      id: 401,
      category: "consommer",
      title: "Monnaie multidimensionnelle",
      body: "Aujourd'hui, notre monnaie est à une dimension, c'est à dire que l'équilibre et la différenciation du \"pouvoir d'achat\" entre citoyen se fait en combinant toutes les formes de consommation sur une seule dimension.\n\nDésirer mettre en valeur l'impact carbone au milieu de tout le reste, tout autant que le droit de se nourrir ou l’accès à l’énergie est difficile sur une dimension. Grace au numérique et à internet , il est désormais possible d'envisager une monnaie a plusieurs dimensions.\nIl devient alors évident de la nature des deux premières dimensions :\n- le travail (correspondant a l'euro)\n- l'emprunte carbone (correspondant au droit égale de chacun à consommer les ressources de la planète de chacun)\n3 autres dimensions semblent pertinentes :\n- le droit en eau \n- le droit en énergie \n- le droit en nourriture\nOutre la dimension travail, dont le \"salaire\" passe par le travail, les autres dimensions cités sont liées à concept de salaire universel (montant versé de manière identique à chacun quotidiennement).\nLes valeurs de chaque dimension peuvent être échangées contre d'autres dimensions, en particulier la personne qui \"pollue\" plus devra payer en monnaie travail le droit à consommer des ressources naturelles d'autres personnes qui de leur côté devront utiliser cet argent pour des services non polluant. En retrouvant le prix de chaque dimension au moment de l'achat, le client aura conscience de l'impact \"environnemental\" de son achat."
    },
    "85": {
      id: 406,
      category: "consommer",
      title: "Limiter la consommation de vêtements neufs",
      body: "Encadrer la mise sur le marché de vêtements neufs pour limiter à 1kg par personne et par an"
    },
    "86": {
      id: 446,
      category: "consommer",
      title: "Inciter à la déconsommation",
      body: "Arrêter de chercher la croissance à tout prix et à \"relancer la consommation des ménages\". Il faut à tout prix diminuer notre consommation dans la plupart des domaines.\nOn peut en particulier lutter contre la publicité commerciale en l'interdisant dans les espaces publics, sur les chaînes publiques, ou même l'interdire complètement. Ces publicités sont de toute façon payées par les consommateurs sur le prix des produits, et ne profitent qu'à une minorité de marques. Diminuer les publicités permettraient de baisser les prix et cela pourrait compenser de nouveaux impôts pour financer l'audiovisuel etc. Dans ce registre, on peut aussi imposer une plus grande sobriété sur les emballages, pour diminuer le coût du marketing.\nIl faudrait aussi lutter contre l'obsolescence programmée, par exemple en imposant des durées de garanties beaucoup plus longues.\nIl faut aussi en finir avec les politiques incitatives à l'achat systématique (prime à la conversion sur des véhicules, etc.)\nTaxer plus fortement certains produits non-nécessaires, en fonction de leur impact environnementale"
    },
    "87": {
      id: 981,
      category: "consommer",
      title: "Interdire progressivement la publicité dans les espaces publics",
      body: "La publicité dans les espaces publics est énergivore (écrans allumés en continu + impact de leur construction, affiches et leurs changement régulier...), pousse les individus à la consommation (qui a elle-même un gros impact) en cherchant souvent à les manipuler vers un état de manque et de désir inassouvi. Difficile de justifier de dépenser nos ressources carbone pour arriver à ce résultat.\n\nQuelle différence possible dans le bien être de la population si les écrans qui agrippent notre attention était retirés, et les affiches remplacées par des promotions ou imageries culturelles ou naturelles...\n\nCe changement se ressentirait dans une modification de comportement de la population (moins consommatrice, plus satisfaite de ce qui est déjà là, meilleure santé mentale - ce qui a également un impact carboné), et une économie des ressources nécessaire à l'industrie de la publicité dans les espaces publiques."
    },
    "88": {
      id: 472,
      category: "consommer",
      title: "Consommer différemment",
      body: "Imposer une autre PAC qui financerait une agriculture bio et centrerait la politique agricole sur la diversité des cultures pour un approvisionnement local plutôt que pour les exportations (en métropole et en DOM TOM).\n\nTaxer d'avantage les importations.\n\nPlus aucune ratification de traités de libres échanges typer CETA etc.\n\nLa suppression des tribunaux arbitraux, un Etat ne peut pas être mis au même rang qu'une entreprise.\n\nImposer les repas végétariens dans les cantines scolaires.\n\nFavoriser l'accès au bio et local pour les populations plus précaires, avec notamment une politique de financement public qui ne soit pas négligeable (en vue par ex de subvention d'associations et afin de favoriser un bio peu cher).\n\nInterdiction des pesticides et aide à la mise en place d'alternatives.\n\nInterdiction des élevages intensifs (type la ferme des milles vaches etc) et interdiction des élevages en cage.\n\nRèglementation plus stricte des abattoirs, en ce compris dans les conditions de travail des salariés de ces structures."
    },
    "89": {
      id: 285,
      category: "consommer",
      title: "Imposer une résolution maximum pour le streaming",
      body: "La vidéo sur internet consomme beaucoup d'énergie. Plus la résolution est élevée et plus la consommation est élevée. La résolution HD (1080p) est le standard actuel et est suffisant pour quasi tous les usages. L'arrivée de nouvelles résolutions (4k, 8k et plus) est aberrante énergétiquement et n'a pas d’intérêt majeur pour les internautes. La résolution 720p est même suffisante pour beaucoup des usages actuels. La vidéo ne devrait pas être utilisée pour des usages musicaux car elle consomme beaucoup plus qu'un simple flux audio.\n\nJe propose donc une limitation à 1080p pour la vidéo en streaming sur internet et l'interdiction des vidéos purement musicales."
    },
    "90": {
      id: 461,
      category: "consommer",
      title: "Se battre contre la publicité : délaisser le superflu pour revenir au nécessaire",
      body: "Rarement pointée du doigt, la publicité est pourtant le moteur de la surconsommation de nos sociétés. La réduction de nos émissions commence par la réduction notre consommation (cf loi Evin de 1991 pour faire reculer du tabagisme en interdisant sa publicité).\n\n1a) Interdire la publicité pour des produits fortement émetteurs de GES, à défaut forcer une mention légale \"ce produit a un effet néfaste sur le climat\". La première cible d'une telle mesure est l'automobile, mais les exemples pourraient être nombreux (compagnies aériennes, sports d'hiver, viande, etc...).\n\n1b) Interdire les affichages publicitaires lumineux ou animés, qui sont en plus énergivores (métro, périphérique parisien,...). Pour les enseignes des commerces, n'autoriser l'éclairage qu'aux horaires d'ouverture.\n\n1c) Interdire la distribution de prospectus autrement qu'en main propre (courriers non adressés, flyers sur les pare-brises, etc...)\n\n1d) Revenir à des médias publics sans publicité. Tout média bénéficiant de la redevance devraient être exempt de publicité. Nouveaux financements à imaginer, comme une redevance majorée et allouée par le contribuable.\n\n1e) Imposer la publication des recettes publicitaires dans les comptes des entreprises et lister les principaux annonceurs. Cette transparence pourrait freiner ou permette ensuite de cibler de futures restrictions.\n\nEnfin, il faut trouver des moyens pour freiner le marketing sur les médias numériques qui est en forte croissance..."
    },
    "91": {
      id: 462,
      category: "consommer",
      title: "Se rendre compte de sa pollution numérique entreprise",
      body: "Mettre en place dans les entreprises un tableau de bord publié un fois par mois montrant la pollution numérique produite : par les emails, les pj etc... + suivre les actions de réduction et mettre en place des règles d'usage de suppression automatique de tous les mails non archivés tous les 3 mois."
    },
    "92": {
      id: 476,
      category: "consommer",
      title: " la santé devrait être un thème en tant que tel.",
      body: "Ayant déjà utilisé un commentaire dans la rubrique \"transversal\"  je mets celui-ci qui est aussi \"transversal\" ici!  Se nourrir, consommer, etc. suppose d'être en bonne santé, santé  qui se détériore du fait de la dégradation de l'environnement. Ne faudrait-il pas en faire un thème en tant que tel plutôt que de l'aborder \"fondu\" dans les autres approches ?"
    },
    "93": {
      id: 498,
      category: "consommer",
      title: "Emballages : Verre et Consigne à généraliser",
      body: "Le plastique est difficilement recyclable et le plastique recyclé ne sera jamais compatible alimentaire. Il est aujourd'hui envoyé en Asie pour être recyclé !\nSeuls les emballages en verre sont réutilisables et les plus sains.\nPour que la réutilisation soit efficace économiquement et écologiquement, il faut qu'elle soit généralisée.\n\nJe propose  :\n-de créer des contenants en verre alimentaire normalisés NF (bouteilles 1l, 75cl, 25cl, bocaux 1l lait/soupe, boites 1l, 50cl...).\nLe but est de limiter le nombre de références pour une réutilisation maximale et simple.\n-tous ces contenants normalisés seront réutilisables et consignés. Les étiquettes devront aussi être encadrées (par exemple en papier, avec une colle facilement nettoyable).\n-tous les autres contenants (non conformes aux normes, en plastique, ...) seront taxés du même montant que la consigne de même volume (pourquoi pas l'augmenter après quelques années). Cette taxe servira à financer la filière de recyclage et aidera à la conversion des utilisateurs de ces contenants (producteurs de contenu :  vins, bières, lait, soupes, ...).\nCette normalisation des contenants facilitera aussi leur usage pour la vente en vrac.\n\nSeule cette généralisation permettra la création de filières régionales, locales, de réutilisation (collecte, lavage et redistribution) des contenants, évitant le transports trop longs et couteux en énergie, en GES."
    },
    "94": {
      id: 517,
      category: "consommer",
      title: "Réduction des dépenses de publicité",
      body: "Interdire la distribution de prospectus publicitaires dans les boites aux lettres, y compris le publipostage. Interdire les écrans lumineux publicitaires. Interdire toute forme de publicité pour des produits énergétivores en énergie non renouvelable (en particulier les automobiles, mais également les produits alimentaires non indispensables tels que les sucreries). \nBénéfices écologiques et sociaux attendus de ces mesures : réduire la consommation de papier (900.000 tonnes mises dans nos boites aux lettres) et d’électricité, faire baisser la consommation de produits énergétivores, faire baisser les prix des produits en réduisant les frais publicitaires (trois milliards d’euros = coût des imprimés sans adresse)."
    },
    "95": {
      id: 3923,
      category: "consommer",
      title: "Favoriser les circuits courts",
      body: "Favoriser les circuits courts avec une TVA proportionnelle à la distance entre le lieu de production et le lieu de vente des produits vendus."
    },
    "96": {
      id: 839,
      category: "consommer",
      title: "Garantie obligatoire de 10 ans sur une majorite de produits",
      body: "Une garantie obligatoire de 10 ans sur tous les produits domestiques (machines a laver, telephones, voitures, ...).\nSource d'information: rapport \"allonger la durée de vie de nos biens : la garantie a 10 ANS MAINTENANT !\""
    },
    "97": {
      id: 480,
      category: "consommer",
      title: "Arrêter de nous prendre pour des cons-ommateurs",
      body: "Montrer, remontrer, sans relâche, les coulisses des industries de TOUS nos objets du quotidien => responsabiliser nos achats. \nCette spirale vertueuse fonctionne sans faille :\n\npédagogie => connaissances => empathie pour les citoyens du monde et pour la Nature => détachement vis à vis des éléments matériels => rapidement, un bonheur différend que via la consommation s'installe => impossibilité de revenir en arrière et de surconsommer :)"
    },
    "98": {
      id: 486,
      category: "consommer",
      title: "Gaspillage d'électricité",
      body: "Réflexion de mon petit fils de 12 ans \nBonjour ,\n\n  Avec plusieurs membres de ma famille, nous avons remarqué que beaucoup de grandes surfaces commerciales laissaient la majorité de  leurs armoires frigorifiques de produits alimentaires  sans porte  . En conséquence ,  la température ambiante du magasin baisse fortement ( de 10 à 15 °) car, en plus  les bâtiments qui abritent ces commerces, ne sont  pas isolés .\n  Comme si nous laissions notre frigo ou notre congélateur ouvert toutes la journée !!!\n  Je pense que si ces \"responsables commerciaux\" équipaient leurs armoires frigorifiques de porte , CELA SERAIT TOUT BENEF POUR LE CLIMAT...\n\n  Cordialement \n  Bonne journée \n  Hugo"
    },
    "99": {
      id: 505,
      category: "consommer",
      title: "Une taxe carbone tres redistributive",
      body: "Plus la taxe carbone sera élevée et plus elle pourra être redistributive Cela permettra en effet d’avoir plus de ressources pour accompagner les personnes les plus vulnérables qui vont subir le plus les conséquences du changement climatique et dans les actions à entreprendre rapidement.\nPar exemple, avec une taxe importante (200 €/T) sur les émissions de CO2 des véhicules on pourrait avoir des ressources à redistribuer en trois 1/3 \n1-\tRembourser à tout le monde la taxe à hauteur de la cible à atteindre à horizon 10ans.\nExemple si notre cible est à horizon 10 ans est de 5T de CO2 par personne (nous sommes aujourd’hui à 10, on rembourse à chaque Français 5 X 200 €/T= 1000 €. Pour ceux qui sont déjà à la cible ils sont totalement remboursés des taxes qu’ils ont payées.\nL’argent qui reste serait partagée entre \n2-\tFinancer des actions qui feront réduire nos émissions de gaz à effet de serre soit au niveau national  pour nos infrastructures, soit au niveau des services publics ou des particuliers les plus vulnérables  (ex : pompe à chaleur pour remplacer les chaudières à fuel, prime à la conversion des voitures anciennes,  création d’infrastructures comme des pistes cyclables  …)\n3-\tFournir une aide aux pays qui sont le plus touchés par l’évolution du Climat alors qu’ils n’ont pas été les émetteurs de gaz à effet de serre."
    },
    "100": {
      id: 611,
      category: "consommer",
      title: "Consommer local et rester ouvert",
      body: "La Suisse propose interdit l'importation de certains fruits lorsque c'est la pleine saison chez eux.\nAinsi, plutôt que de dresser des murs, d'instaurer des droits de douanes immanquablement retoqués par l'UE, on peut définir des zones de chalandises de certains produits frais et naturels (les noix de Grenoble, les pêches de la Drôme, les olives d'Espagne, les artichauts de Bretagne, etc.), de fixer annuellement par décret la période d'exclusivité, de façon à ce que chaque producteur puisse s'y retrouver sur son propre marché, écouler sa production sans dumping, tout en recueillant l'aval des producteurs des région voisines, et ainsi nous développer non pas contre les autres producteurs, mais avec les autres.\nPour les produits frais à production annuelle (lait, beurre, etc.), en l'absence d'efficacité de la loi EGALIM sur le prix du lait, la loi devrait imposer une régulation des prix avec un prix mini, l'obligation des grandes surfaces d'écouler prioritairement la production régionale avant d'importer du lait à prix cassé.\nEnfin, la déforestation étant grandement liée à la culture du soja, interdire dans l’alimentation animale indispensable aux grands fermes de production laitière notamment (mais pas que) ou les biocarburants l’usage des produits bruts ou dérivés du soja me semble indispensable."
    },
    "101": {
      id: 549,
      category: "consommer",
      title: "Stop à la publicité",
      body: "Interdire toute la publicité commerciale."
    },
    "102": {
      id: 466,
      category: "consommer",
      title: "Une taxe carbone acceptable et efficace pour contribuer à la transition écologique ",
      body: "Le principe : une taxe qui ouvre des droits personnels aux aides à la transition écologique .\nChaque « pollueur-contributeur » , par le moyen d'une carte du type des cartes de fidélité dans les magasins, accumule des points à chaque fois qu'il paie cette taxe. Ces points ouvrent des droits aux aides correspondant à la valeur de la somme des  taxes payées .  Ces aides doivent concerner de petits  achats  (carte de transport en commun, billet de train... ) comme  des investissements  plus conséquents (isolation, pompe à chaleur, panneaux solaires , véhicule propre, systèmes industriels plus économes...). Ces aides bénéficient donc à tous. Mais ces points, ou droits aux aides , doivent être utilisés dans un délai qui sera fixé, sinon ils seront perdus. Les sommes qui n'auront pas été utilisées alimenteront une caisse devant servir à la transition écologique des collectivités locales.\n\nL'intérêt \nUne taxe à laquelle les citoyens peuvent consentir : \nAvec ce nouveau système, chacun sait qu'il peut profiter d'une aide, et que sa contribution n'aide  pas un ménage plus aisé (les aides actuelles profitent surtout aux ménages qui peuvent effectuer des travaux ou changer de véhicule) \n\nUn système efficace :\nIl incite tout le monde à participer à la transition écologique, les gros \"contributeurs-pollueurs\" qui ont donc accumulé beaucoup de points,  les personnes plus économes qui peuvent utiliser leurs points pour des actions plus modestes, et les collectivités locales."
    },
    "103": {
      id: 612,
      category: "consommer",
      title: "Réformer le programme des cours de technologie du secondaire",
      body: "Tout le monde se souvient des cours de technologie au collège, généralement en 5ème et en 4ème. Fabriquer des portes clés lumineux à l'esthétique très spéciale, des horloges qui me fonctionnent pas.. tout cela n'est pas très utile et contribue à gaspiller à la fois des ressources des collèges et du temps d'apprentissage\n\nEt si on faisait de ces cours des moments propices de formation aux enjeux de la transition vers une économie circulaire, qui prolonge la durée de vie des objets et introduit des modes de consommation plus responsable ? Il ne s'agit pas de revenir aux cours de réparation de nos grands-parents mais de donner des outils et des méthodes pour pouvoir etre acteur de la transition\n\nPar exemple des cours d'upcycling : détourner la vocation d'un déchet pour en faire un objet nouveaux ; un projet de composteur ou de méthaniseur collectif ; un atelier pitch de projets environnementaux. Ainsi on sensibilise les adolescents en espérant leur donner envie de s'engager dans la suite de leurs études."
    },
    "104": {
      id: 686,
      category: "consommer",
      title: "Permis carbone pour tous",
      body: "Chaque citoyen et entreprise, soit muni d'un quota de carbone à dépenser par an. Un point d'égalité pour tout le monde sans exception.\n\nImpossibilité de revendre et acheter de points carbone.\n\nBien sûre il faut que chaque produits aient leur empreinte carbone d'affiché, qu'il soit produit en France ou à l'étrangé.\nÇa comprend les bien,  les services le numérique et le service publique.\n\nDe facto un ça privilégiera les circuits cours et évitera la sur consommation. Pénalisera donc ce qui vient de loin ou est sur manufacturé et permettra de développer toujours plus le marché de l'occasion et l'économie circulaire.\n\nAdmettons on fait une planification sur plusieurs années (7 - 12 ans).\nOù chaque année on a le droit à un peut moins, ça permettrais une adaptation progressive pour arriver à un objectif de 2T / 2.5Tco2 / habitant, importation de co2 inclus à l'horizon 2030."
    },
    "105": {
      id: 583,
      category: "consommer",
      title: "Changer notre façon d’acheter, sans emballage avec tarif préférentiel ",
      body: "Je propose d’encourager les achats chez nos commerçants sans emballage grâce à un tarif généralisé « sans emballage » par exemple on va chez son pâtissier avec une boîte et le commerçant nous met les pâtisseries directement dans notre boîte. \nAinsi le client repart sans emballage et un prix diminué d’un montant X correspondant à l’absence d’emballage. Et cela peut être valable pour tous les commerces et pourquoi pas les GMS.\nAcheter sans emballage, c’est autant de déchets en moins dans les poubelles."
    },
    "106": {
      id: 553,
      category: "consommer",
      title: "Recyclage du verre moins énergivore",
      body: "Si aujourd'hui il est relativement facile de déposer du verre dans des containers, il me parait totalement absurde de fondre du verre (avec des fours très énergivores) pour refaire du verre (toujours avec des fours très énergivores).\nPourquoi ne pas revenir à la \"simple\" consigne ? Je suis passé en Belgique où apparemment il est facile de déposer ses bouteilles dans une sorte d'automate qui reconnait automatiquement les bouteilles (à quelques exceptons près) et qui surtout donne de l'argent quand on donne des bouteilles.\nC'est à mes yeux un moyen très incitatif pour ramener les bouteilles vides !\nIl y a bien sûr un investissement important à faire en automates, mais quelle économie en énergie ! (En moyenne le verre fond à 1000° voire plus).\nAvec la consigne, un simple lavage des bouteilles suffit ! \nNon seulement la consigne économise en énergie mais de plus incite chacun à ramener les bouteilles grâce à l'argent rendu. \nCela permet à chacun de réaliser que la fabrique d'une bouteille n'est pas \"gratuit\" que ce soit écologiquement ou ou financièrement."
    },
    "107": {
      id: 543,
      category: "consommer",
      title: "Définition d'un logement minimal décent",
      body: "Primo : pour chacun ou chaque famille en fonction de sa composition (nombre d'enfants), définir un type de logement décent non taxé (nombre et type de pièces, surface, équipement minimal...).\nSecundo : taxer plus ou moins lourdement les excédents (surface, pièces, jardin, piscine, SPA, équipement superflu)."
    },
    "108": {
      id: 1114,
      category: "consommer",
      title: "Fin de l'obsolescence programmée",
      body: "Tous les produits manufacturés soient garanties pendant une durée de 5 années minimum (pièces et main d'oeuvre, et sur site dans le cas des produits lourds et/ou volumineux)\nToutes les pièces (consommable compris) qui composent un produit manufacturé doivent être disponibles sous moins de 10 jours et cela pendant les 10 années qui suivent la fin de mise sur le marché du dit produit. \nLa somme du prix unitaires des pièces détachés ne doit pas dépasser le prix de vente du produit. La pièce la plus chère n’excédant pas 20% du prix de vente. Les 5 pièces les plus chères n'excédant pas 50% du prix de vente. \nLe \"MTBF\" (=Mean Time Between Fail) (traduction: temps moyen entre 2 pannes) doit être indiqué sur le produit vendu. (Par défaut, on prendra la durée de vie de l'élément qui a la durée de vie la plus courte).\nLes produits manufacturés doivent être démontable par n'importe quel \"quidam\" (=réparateur/bricoleur). Ce qui proscrit tous systèmes propriétaires (Outillage, vis, ...) ainsi que tous systèmes mécaniques(ex.: collage, ...) empêchant le démontage."
    },
    "109": {
      id: 554,
      category: "consommer",
      title: "Quote-part; Limites du système planetaire",
      body: "Le système planétaire a des limites, et donc la consommation devrait en avoir également.\n\nIl a été question d'un affichage du taux d’émission pour chaque bien ou service, que le consommateur puisse choisir en connaissance de cause.\n\nCette idée est bonne, va dans le bon sens et je pense qu'elle est insuffisante.\n\nEn effet les achats vont jours après jours, semaine après semaine, et à la fin du mois je ne sait pas combien ma consommation pèse au total. Hors c'est bien de ce poids total dont il est question.\n\nJe pèse combien sur l'effet de serre ?\nAi-je dépassé la limite ?\n\nDe plus, un simple affichage ne matérialise pas cette limite et n'est pas contraignante envers celui qui se refuserai à jouer le jeux, et c'est donc en l'état injuste envers ceux qui s'en donnent la peine.\n\nÇa ne répond pas au critère de justice.\n\nLorsque j'ai vidé mon compte bancaire, je ne peut plus acheter d'avantage.\nJe ne devrais pas non plus pouvoir une fois ma quote-part carbone épuisée.\n\nÇa ne devrait pas être possible.\n\nJe ne devrais pas pouvoir continuer ma consommation au delà de ma quote-part.\nOu dit autrement, je ne devrais pas pouvoir continuer à emmètre au delà de ma limite d'émission.\n\nLa quote-part est équitable si distribuée à chacun de manière égale.\nElle répond dans ce cas au critère de justice.\n\nAvec des étapes, des mises a l'essai, on devrais tendre vers ça."
    },
    "110": {
      id: 621,
      category: "consommer",
      title: "Gaspillage de l'electricité ",
      body: "Les agents d'EDF et leur famille ne paient pas l’électricité et se permettent  peut être pas tous mais beaucoup, de ne pas fermer leurs radiateurs lorsqu'ils aèrent leurs logement en hiver, et laissent ainsi l'énergie se consommer pour rien et certaines de ces personnes se permettent même de s'en vanter! Alors que bien des français ont du mal à se chauffer correctement faute de moyens suffisants, cela est révoltant! Donc pour mettre fin à ces gaspillages, tous doivent PAYER ce qu'ils dépensent!"
    },
    "111": {
      id: 524,
      category: "consommer",
      title: "Sortir du nucléaire, trop insécuritaire",
      body: "Comme nous l'ont courageusement montré les activistes de Greenpeace en 2017, le nucléaire a des failles de sécurité et on n'est pas à l'abri de catastrophe nucléaire. Personnellement, j'habite à 60km des 6 réacteurs nucléaires de Gravelines, je ne suis donc pas hors de danger, comme la majorité de la population française. Pire, les déchets nucléaires se retrouvent entassés un peu partout sur le territoire là encore sans aucune sécurité.\nPar ailleurs, les centrales nucléaires coûtent énormément d'argent à entretenir (notons que le parc nucléaire est très ancien pour certains réacteurs) et que le nouveau EPR à Flamanville n'a toujours pas fait ses preuves, étant clairement un échec avec son budget initial multiplié par 4 et son délai de mise en route retardé de 10 ans (pour l'instant !).\nPourquoi persister?!\nL'électricité renouvelable est bien plus sûr!"
    },
    "112": {
      id: 516,
      category: "consommer",
      title: "Réduction des déchets ",
      body: "Taxer les industriels pratiquant le sur-emballage, en fonction du type et du poids des matériaux d’emballage.\n\nDevelopper les filières de récupération de certains emballages (bouteilles en verre par ex.), via des consignes.\n\nGénéraliser la facturation au poids, des poubelles.\n\nInterdire, à terme, les emballages plastiques."
    },
    "113": {
      id: 1005,
      category: "consommer",
      title: "Proclématique du tabac, de l'alcool et autres substances addictives",
      body: "-Appliquer une taxe pour compenser le coût pour la société de produits néfastes, lorsqu'ils sont consommés plus que de raison. (Donner un sens à la taxation)\n-Augmenter les moyens pour sensibiliser dans les écoles aux dangers de l'alcool, du tabac et autres (sur différentes classes d'âge et avec des témoignages scientifiques). Il ne faut pas diaboliser la consommation mais la raisonner en faisant comprendre les impacts sociétaux et géopolitiques."
    },
    "114": {
      id: 521,
      category: "consommer",
      title: " Faire tomber le lobbyisme, 0 achat 0 vente",
      body: "Notre pouvoir est toujours là mal-grès les apparences , nous pouvons changer la donne en ciblant nos achats faire tomber le lobbyisme, 0 achat 0 vente....\nFaire pression pour que le lobbyiste ne puisse plus intervenir dans les tribunes lors de votes de lois( par exemple dans le cadre de Monsanto et les OGMS).\nsi nous ne pouvons changer le pouvoir en place, nous pouvons agir localement et changer notre consommation."
    },
    "115": {
      id: 1117,
      category: "consommer",
      title: "Incitation financière pour l'achat de produits locaux",
      body: "Encourager l'achat de produits Made In France.\n\nAppliquer une TVA incitative pour le consommateur qui choisit des produits Made In France."
    },
    "116": {
      id: 597,
      category: "consommer",
      title: "Impact carbone du numérique",
      body: "Combien coûte en tant que dépense énergétique chaque courriel que l'on envoie?Que l'on reçoit?Celui que l'on laisse dans notre boite mail, dans notre corbeille?Combien coûte une vidéo postée?Une photo?Que dépense un jeu en ligne?\nBref, il faudrait le faire calculer aux élèves, aux chefs d'entreprise, à tous ,en fait et l'on pourrait espérer changer nos mauvaises habitudes...ou bien interdire les mails professionnel à partir d'une certaine heure ou le weekend\n(cela se fait déjà le vendredi dans certaines entreprises)\nA quand des calculateurs d'impact carbone facile d'accès et d'utilisation dans toutes les écoles , collèges, lycées? dans toute entreprise respectueuse de notre avenir?"
    },
    "117": {
      id: 592,
      category: "consommer",
      title: "Une adaptation culturelle à une biosphère limitée. *",
      body: "Biodiversité, pollutions, climat constituent un peu un même sujet.\nLe sujet est un avenir proche possiblement assez épouvantable. Le pire pronostic actuel à +7° en 2100 sur le climat revient à parler de disparition du vivant sur la Terre avant 2100.\nDans ces conditions, faire peser toute la responsabilité et tous les efforts sur les citoyens, alors que dans le même temps ceux-ci sont mal informés et souvent désinformés concernant chacun de ces sujets est illusoire.\nIl faut noter que la publicité est en contradiction avec les efforts demandés aux citoyens puisqu'il s'agit d'achats de voyage, de SUV, etc.,  souvent cautionné par la promesse physico-chimiquement  fausse d'une économie circulaire ou de compensations.\nEn conséquence de tout cela, je suggère:\n1°) Information du public sur toutes les chaines et média. L'information peut s'appuyer sur des démonstrations simplifiées et des illustrations. Il faut faire comprendre. Achat d'espace publicitaire\n2°) Forte taxation sur la publicité commerciale basée sur l'impact sur la biosphère du produit ou service en réclame. Ceci finance la campagne menée en 1. Système de bonus-malus. Taxation packaging.\nCes mesures n'ont aucune incidence budgétaire directe pour l'Etat et seront extrêmement incitatives pour les entreprises à changer avec vivacité. Ces mesures respectent le choix des français en matière de liberté d'entreprise. Ces mesures éduquent également le citoyen, l'acteur politique, l'entrepreneur ou le syndicaliste."
    },
    "118": {
      id: 788,
      category: "consommer",
      title: "Parler démographie?",
      body: "Parler démographie ?\n    1) S’il est absurde de vouloir hiérarchiser l’importance des causes de quelque phénomène humain que ce soit, il est nécessaire de distinguer les causes des effets et d’éviter de confondre coïncidence et causalité.\n    2) Il semble que depuis que l’homme ne se contente plus, comme les autres êtres vivants, de chasser et cueillir ce qui est nécessaire à sa vie, il a la possibilité de prélever plus que ce qui est nécessaire à sa vie et à sa reproduction en tant qu’espèce. En particulier à proliférer au-delà de la continuation de l’espèce.\n    3) Si depuis des temps immémoriaux l’homme s’est répandu sur toutes les terres émergées, c’est seulement en quatre ou cinq siècles qu’il a occupé des continents entiers, Amériques, Océanie, autrefois peu ou très peu peuplés.\n    4) Au vingtième siècle des régions affichent une croissance démographique telle qu’elles vivent d’une émigration de masse, l’Amérique du sud, vers le nord, l’Afrique vers l’Europe,  l’Asie vers l’Océanie… Ces émigrants cherchent des conditions de vie meilleures ailleurs ! Observons l’écart entre les ressources, alimentaires, énergétiques, culturelles, médicales, et les besoins des populations de la moitié des pays du monde.\n    5) S’intéresser à l’avenir des hommes c’est s’intéresser à l’évolution de la population humaine. Les migrations de masse sont un signe qu’il y a un problème démographique : occupons nous de démographie.\nFrançois Bougnet, fbougnet@free.fr"
    },
    "119": {
      id: 940,
      category: "consommer",
      title: "Gestion des dechets",
      body: "Pour la gestion des déchets, je propose 3 axes.\n\nLe premier relatif au compost: créer des ramassages de déchet compostables toutes les semaines: sur ce point, la ville de Bristol en Angleterre est un exemple qui fonctionne (les déchets ménagers étant par conséquent ramassés toutes les 2 semaines)\n\nLe deuxième est incitatif: faire payer les impôts locaux en fonction du poids des poubelles.  Ainsi, une famille qui limite ses déchets et recycle de manière appropriée paiera moins. \n\nEnfin, les déchets électroniques et électroménagers seront également repris par la ville, pour les utiliser pour les réparer et leur donner une deuxième vie."
    },
    "120": {
      id: 696,
      category: "consommer",
      title: "Transformer les consommateurs en consommacteurs",
      body: "Objectifs : \n- Favoriser la consommation de produits ayant une empreinte carbone faible\n- Promouvoir les produits locaux sources de revenus et d'emplois locaux\n- Crééer un cercle vertueux invitant les entreprises à réduire leur empreinte carbone\n- Mettre fin à l'obsolescence programmée\n\nComment?\n- Afficher clairement l'empreinte carbone de tous les produits à destination du consommateur. Le consommateur aura un critère de plus à disposition afin de choisir le produit à acheter/consommer parmi plusieurs produits analogues.\n- Afficher la durée de vie moyenne de tous les produits à destination du consommateur sans exception s'il y a lieu. Le consommateur aura un critère de plus à disposition afin de choisir le produit à acheter/consommer parmi plusieurs produits analogues.\n- Obliger les industriels à crééer des produits réparables avec des pièces détachées disponibles pour la réparation sur un laps de temps minimum à définir (5 ans par exemple)\n\nPour aller plus loin :\n- Crééer un label visible et clair (un peu sur le modèle du nutriscore et dans l'esprit de ce qui est fait pour l'achat des maisons avec les dpe) permettant de situer le produit consommé dans une gamme d'empreinte carbone pour un type de produit.\n- Les pièces d'usure doivent pouvoir être remplacées sans avoir à racheter un équipement complet quelquesoit l'équipement en question."
    },
    "121": {
      id: 697,
      category: "consommer",
      title: "Trois niveaux d'action",
      body: "1. Individuel :\n- Il faut inciter les gens à consommer moins. Campagne publicitaire en ce sens.\n- Il faut réparer / réutiliser / recycler.\n- Il faut désirer moins et surtout moins de biens dont le process nécessite des émissions importantes de CO2 --> Pour cela il faut interdire la publicité sur les produits fortement émetteurs de CO2\n\n\n2. Industriel\n- Dans le processus de fabrication des produits il faut que ceux-ci puissent être au maximum réparables.\n- L'obsolescence programmée doit être punie par la loi.\n- Interdiction de vendre des produits dont le bilan carbone dépasserait un certain seuil à déterminer.\n\n3. Au niveau de l'état / de l'Europe\n- Il faut mettre en place des règles et des normes restrictives par rapport au bilan carbone des biens vendus.\n- Il faut réfléchir à une tva progressive en fonction du bilan carbone des produits\nFaibles émissions --> Faible taxe\nFortes émissions --> Forte taxe\nCela permettrait de mettre un vrai prix sur les produits importés ne serait-ce qu'avec le frêt maritime.\nC'est une taxe carbone qui doit venir supplanter une partie ou totalité de la TVA et non s'additionner."
    },
    "122": {
      id: 497,
      category: "consommer",
      title: "Simplifier et faciliter les bons gestes, obliger les fournisseurs, exemplarité de l’État",
      body: "Informez vous sur l’analyse de cycle de vie et l’effet rebond.\n\nFACILITER\n-crée un label écoconso (exigeant) et un label local\n-financer les repair café\n-modifier la TVA : ex 1 % si label local ET écoconso ; 5 % si un des deux labels ; 30 % sinon, sans dérogation (favorise artisans et paysans) (+1 % par tranche de l'étiquette CO2 ) (une part de la taxe est allouée à la caisse de transition éco)\n-augmenter la taxe éco (multimédia)\nOBLIGATION\n-quota carbone individualisé (emprunt possible)\n-toutes les cantines bio et locales en 2025 (montrer et faire vivre la conso vertueuse) : entreprise, école, hopital, ephad\n-services : limiter l’administratif, interdire le démarchage téléphonique,...\n-internet/télécom : neutralité CO2 des fournisseurs en 2050 donc 50 % en 2035.\n-garantie des produits 10 ans min\n-interdiction de détruire un objet réparable (déchetterie, entreprise)\n-radio et TV : obligation -40 % en 2030\n-vacances/loisirs : label 40 % puis obligation en 2030\n-former des réparateurs\n-garantir 20 ans l'accès aux pièces de réparation\n-abonnements d’énergie en % de la facture\nEXEMPLARITÉ  DE L'ETAT\n-Tous les marchés publics critères :  local, éco, % de recyclé\n-collectivités : création de méthaniseurs, collecte des organiques en ville, taxer les poubelles au kg (même prix pour une poubelle moyenne, mais incite à diminuer), fournir des poules.\n- recyclage : obligation de recyclerie en déchetterie (avec employé fonctionnaire formé)"
    },
    "123": {
      id: 749,
      category: "consommer",
      title: "Interdire la publicité",
      body: "1er vecteur de surconsommation. Source de nuisance quotidienne"
    },
    "124": {
      id: 1003,
      category: "consommer",
      title: "Réduire ou supprimer la TVA sur les réparations locales",
      body: "L'industrialisation a trop bien réussi à optimiser le coût de production en masse des biens de consommation. Pour le consommateur, il est trop souvent plus cher (et moins pratique) de réparer son lave-linge, son fer à repasser ou son vélo que d'en racheter un neuf. Malheureusement cela se fait au détriment des ressources finies de notre seule et unique planète.\n\nLa réparation, elle, peine à s'industrialiser car elle est \"personnalisée\": chaque pièce doit être diagnostiquée au cas par cas, puis réparée manuellement.\n\nPour rendre compétitif la réparation par rapport à la production en chaîne, il faudrait réduire voir supprimer la TVA sur ces services.\n\nCela a un avantage économique majeur pour la France : cela équivaut à \"relocaliser\" des emplois. On basculerait des emplois de *production* (en Chine par exemple) vers des emplois de *réparation* locaux en France, qui eux, ne sont pas délocalisables et génèrent moins de CO2. Il est en effet trop cher de renvoyer son fer à repasser en Chine pour réparation...\n\nUn dernier avantage est que cela réduit notre dépendance aux matières premières que nous n'avons ou n'exportons pas comme les métaux ou le plastique (pétrole)."
    },
    "125": {
      id: 663,
      category: "consommer",
      title: "Interdire les forfaits mobile + téléphone",
      body: "Ces forfaits génèrent un remplacement très rapide des appareils, bien avant qu'ils soient obsolètes, en trompant l'utilisateur sur le coût de l'appareil. L'utilisateur ne se rend en effet pas compte du prix qu'il paie réellement pour l'appareil. Obliger les fournisseurs à séparer le prix de l'abonnement du prix du mobile conduirait à un remplacement moins rapide des appareils : les consommateurs verraient qu'ils peuvent faire de grosses économies en diminuant la fréquence de remplacement."
    },
    "126": {
      id: 751,
      category: "consommer",
      title: "Halte àla publicité",
      body: "Interdire catégoriquement la distribution de publicités papier (catalogues,prospectus) dans les boites aux lettres.\n\nInterdire l'implantation des grands encarts publicitaires 4x3  qui défigurent les villes et villages  \net démonter ceux qui sont déjà en place .\n\nlimiter fortement la durée des spots publicitaires télévisés"
    },
    "127": {
      id: 2292,
      category: "consommer",
      title: "Intégration du coût sociétal dans le prix des biens et services",
      body: "Nous le savons tous, le pouvoir d'achat est UN ENJEU majeur pour TOUS les citoyens et TOUS les politiques. \n\nPENSEZ-VOUS VRAIMENT QU'UN T-SHIRT COUTE MOINS DE 10 EUROS ?\n\nActuellement, le système économique ne permet pas l'intégration des externalités d'un produit ou d'un service. Ainsi, des biens ou services polluants sont beaucoup moins chers que ceux qui respectent des valeurs sociétales. \n\nArthur Pigou, économiste anglais a été le premier a proposer une taxe destinée à internaliser le coût sociétal des externalités négatives des activités économiques. C'était en 1920...\n\nActuellement, c'est les États, donc nous citoyens qui finançons les impacts du changement climatique (sur la santé, la biodiversité, pollution des cours d'eau...). Le FMI évalue à 60 milliards par an ces coûts pour le Canada (5 000 milliards dans le monde).\n\nL'intégration du coût sociétal, permettra de faire une différenciation par le prix et ainsi, les produits/ services écologiques seront rendus plus accessibles. Les produits/ services polluants seront désormais à leurs RÉELS PRIX."
    },
    "128": {
      id: 664,
      category: "consommer",
      title: "Gourdes à la place des bouteilles en plastiques",
      body: "Ma proposition vise à limiter l'usage des bouteilles individuelles en plastiques (50 cl).\nPour cela, il faut obliger tous les établissements de vente à emporter de nourriture à proposer des formules dans lesquelles l'eau minérale en bouteille plastique et les sodas  sont remplacés par de l'eau du robinet ou des sodas versés dans la gourde du client. \nChaque français aurait donc avec lui sa gourde de 50 cl et la ferait remplir à chaque fois."
    },
    "129": {
      id: 2184,
      category: "consommer",
      title: "Organisme de transition vers le plastique biodégradable biosourcé",
      body: "Pourquoi les cotons-tiges plastiques avaient-ils besoin de 3 ans pour être interdits ? ... alors qu'originellement ils étaient déjà fait en tiges carton donc aucune innovation à chercher.\n\nOn consomme des milliers de bouteilles, de flacons, de tubes, de sachets, de pots, de barquettes... en plastique.\nPourquoi le virage met-il autant de temps alors qu'on a des innovations en pagaille pour le substituer ? Par exemple, les seringues, combien de milliers on en utilise dans les hôpitaux ? \n\nIl existe des tas d'alternatives : \n- plastique de chanvre (promu par Henri Ford déjà en 1941) et pas que le plastique d'ailleurs, gros absorbeur de CO2 https://youtu.be/Db0dUaHhSN8\n- d'algues comme Algopack https://youtu.be/JMoenIWIPFU\n- de figuier de barbarie  https://youtu.be/5UV7VduAiN4\n- de cannes à sucre https://youtu.be/xy7YDrlHs9I\n- de champignon https://youtu.be/GbhMsJ4uqSE\netc\n\nIl faudrait un organisme en charge de la transition du plastique vers des alternatives, aide au développement,  campagnes d'infos auprès des industriels et pénalité applicable si il existe une alternative, planning de transition suivant les contraintes de l'industriel. \n\nCe n'est plus un choix, les particules de plastique sont partout. Le recyclage est limité et n'est donc pas une solution. Ne garder éventuellement le plastique que pour des choses qui n'ont pas d'alternatives - raisons sanitaires ou chimiques.\n\nIl ne faut pas responsabiliser les consommateurs, il faut un virage industriel."
    },
    "130": {
      id: 667,
      category: "consommer",
      title: "Taxe carbone et \"ISFvert\"/redistribution du produit de cet ISF aux personnes vulnérables très impactées par la taxe",
      body: "La lutte climatique doit allier une juste répartition de l'effort (à proportion des possibilités de chacun) et  la mise en oeuvre de mesures efficaces. Or l'instauration d'une taxe carbone fait consensus parmi les économistes.\nJE PROPOSE L'INSTAURATION D'UN \"ISF vert\" couplé à une redistribution de son produit aux personnes vulnérables les plus impactées par la taxe.\nToutes les études montrent que l'empreinte carbone croît rapidement avec le niveau de vie des individus (et leur mode de vie). Il est donc logique que les catégories favorisées contribuent davantage à l'effort climatique. L'ISF vert doit donc être fortement progressif.\nPour être acceptée par nos concitoyens modestes, une taxe carbone doit être, au départ, neutre pour leur budget. Ceci implique de dégager plusieurs milliards d'Euros donc l'ISF vert doit avoir une assiette large, allant des classes moyennes aux plus riches.\nSur le plan psychologique, la compensation carbone pourrait prendre la forme d'un chèque énergie annuel ou trimestriel."
    },
    "131": {
      id: 595,
      category: "consommer",
      title: "Affichage empreinte climat + intégration explication dans appli comme Yuka",
      body: "Afficher une note de 0 à 9 dans une pastille identifiable sur tous les produits accessibles aux consommateurs. La note sera attribuée par un organisme compétant par rapport à un niveau de référence (redéfinissable suivant une périodicité à définir) pour s’adapter aux objectifs climatiques. Initialement sans contrainte financière, cette pastille sera éducative. Associée à une campagne de sensibilisation sur le climat, elle permettra de stimuler les consciences. L’intégration d’explications sur la note (scanne code barre) dans une application comme Yuka (pour ne pas complexifié le système) contribuera à dynamiser l’information pour les plus motivés.  Les premières années permettrons aux acteurs des différents marchés de s’impliquer dans une boucle de contre réaction positive, par la suite amplifiée par une adaptation financière de l’indice. Plus l’indice est élevé, plus une taxe élevée sera appliquée. Inversement, pour un indice faible, cette taxe deviendra un abondement financé par les indices forts.\nLe producteur aura la possibilité de justifier d’un indice plus faible de son produit au sein de l’organisme d’état et fera progresser positivement son empreinte carbone.\nReste à vérifier l’impact social (les produits les plus carbonés étant pour le moment généralement les moins chers …) et à définir les critères qui serviront à définir la note suivant la gamme de produits (alimentation, vêtements, voitures, transports ...)."
    },
    "132": {
      id: 702,
      category: "consommer",
      title: "Pour un controle citoyen de la consommation",
      body: "Réduire la surconsommation est une bonne piste pour réduire les gaz à effet de serre. Dans notre système, seules les entreprises décident de ce qui est mis en vente sur le marché. Voici une proposition simple et efficace : le controle citoyen de la consommation. Une commission de citoyens, tirés au sort, se voit proposés les projets des produits que les entreprises souhaitent vendre. Elle décide si ce produit est effectivement mis en vente ou pas, en basant sa réflexion sur l'intérêt général, et notamment climatique. Un exemple concret : cette commission se voit proposés les projets des constructeurs automobiles : elle décide que les SUVs ou certains modèles polluants ne sont pas commercialisés. Point. Pour personne. Pas de taxe (qui permet aux riches de se payer les trucs qui polluent). Pas de jaloux. Pas de pollution. Peut-être la commission n'autoriserait-elle pas la commercialisation de rivières de diamants, des pommes sous plastiques, de produits alimentaires contenant des colorants, de chaudières à fuel, de smartphones, de caviar, de chaussures fabriquées par des enfants au Bengladesh, de yachts, de jouets en plastique moches qui cassent au bout de 2 heures, de télé de plus de 17 pouces, de montres à 7000 Euros ou de diffuseurs d'aromes connectés, .... on ne sait pas, car c'est la commission qui déciderait de notre \"sobriété\"... car sans sobriété, ca ne passe pas. Et la sobriété, ca doit être pour tout le monde, sinon, ca n'est pas juste."
    },
    "133": {
      id: 755,
      category: "consommer",
      title: "Favoriser les industries locales ",
      body: "Le transport et l’énergie étant les premiers contributeurs de gaz à effet de serre, il est indispensable de réduire à la fois les distances de trajet et les ressources allouées pour nos biens de consommation. Pour cela, il faut consommer le plus possible local et made un France. Malheureusement notre industrie a été décimée, et notre système fiscal avantage seulement les multinationales qui délocalisent leur production. Je propose que l’on incite à l’achat made in France, avec des crédits d’impôts par exemple. Concrètement, moins de TVA pour les produits d’origine ( et j’insiste sur les ingrédients d’origine, pas seulement la production) France par exemple."
    },
    "134": {
      id: 792,
      category: "consommer",
      title: "Du lobbying (inconscient?) au sein de la convention",
      body: "Cette remarque pourrait tout aussi bien être dans la rubrique \"produire\" ou \"transversal\".\n\nLors de la quatrième journée de travail, un intervenant s’est présenté comme membre non payé du Haut Conseil pour le Climat. Il n’a pas précisé ses autres activités. Il a oublié de préciser qu’il est aussi président du Shift Project, un organisme financé par EDF, Vinci, Bouygues, Enedis, Saint Gobain… Il est aussi associé fondateur de Carbone 4, une entreprise qui conseille pour décarboner notamment le groupe PSA, total, safran, le groupe Lagardère, BNP-Paribas, Vinci, Bouygues Immobilier…\n\nIl propose des pistes très intéressantes pour penser la société de demain. Je pense que dans l’ensemble il est bon de s’inspirer de ses idées. Cependant attention au risque de conflit d’intérêt lors de ses interventions, en particulier concernant les lobbies de l’électricité et du nucléaire. Non, le nucléaire n’est pas la seule solution pour baisser les émissions de CO2. C’est une solution, mais ce n’est pas la seule et encore moins la meilleure. À ce propos, une émission sur France Culture dont le titre est : \"L'EPR : le nucléaire c'est cher et ça ne fonctionne pas\". Développer la filière électrique n’est pas une solution acceptable : il est préférable de consommer moins d’énergie. Mieux vaut s’inspirer d’un scénario type Negawatt : en priorité réduire les besoins en énergie, en deuxième améliorer l’efficacité des appareils, et enfin utiliser des sources d’énergie renouvelables."
    },
    "135": {
      id: 642,
      category: "consommer",
      title: "Initier le virage politique pour un mode de consommation compatible avec l’objectif de réduction : consommer moins ",
      body: "La ccc doit exorter l’exécutif à sortir du discours qui nous berce d’illusions sur la croissance verte.\nLa ccc doit envoyer le message suivant à nos hommes politiques qui nous représentent :\nLes citoyens soucieux de l’avenir et éclairés sur les différents paramètres que sont le climat, l’énergie et l’économie ont pris conscience que l’objectif de réduction de GES ne pourra être tenu sans une baisse de la consommation.\nPour ce faire, mettre en place des mesures incitatives qui permettent aux citoyens de consommer moins et mieux.\n- mettre en place une comptabilité carbone pour tout produit et service vendue en France\n- taxer massivement les produits à forte emprunte carbone"
    },
    "136": {
      id: 673,
      category: "consommer",
      title: "Avoir les idées claires, c'est connaitre les ordres de grandeur....ou sont les GES",
      body: "Bonjour, Il est important dans le travail d'avoir les idées claires sur les ordres de grandeurs. Ou se trouvent les émissions de GES. Et donc ou devons-nous porter nos efforts pour  réduire les émissions de GES, le plus rapidement ? \nConnaître les ordres de grandeur, c'est éviter de discuter sur le truc qui n'a pas ou très peu d'impact (très peu d'émission....). \nNous avons très peu de temps pour maintenir une situation climatique du moins pire. Donc nous devons choisir les endroits de grande émission de GES et réfléchir comment réduire ses émissions.\nMalheureusement il y aura des perdants et comment prendre en compte les perdants !?\nJe pense que c'est la collectivité qui doit prendre en compte les perdants."
    },
    "137": {
      id: 709,
      category: "consommer",
      title: "Imposer l'extinction des devantures de magasins la nuit.",
      body: "Imposer l'extinction des devantures de magasins et de tout bâtiment inoccupé la nuit.\nUne mesure tout à fait simpliste qui devrait déjà être prise.\nCela s'inscrit dans le cadre de la limitation de consommation d'énergie au lieu de chercher des moyens d'en produire plus."
    },
    "138": {
      id: 637,
      category: "consommer",
      title: "Les grandes enseignes en vrac",
      body: "Fair en sorte de réduire la production de déchet.\nLes grandes enseignes alimentaires ne devrait elle pas avoir l'obligation de proposé la plus part des produits en vrac ? Chaque habitant arriverait dans les enseignes avec leur boîte et se serviron en vrac de la quantité voulu.\nPour des produits alimentaires (à long durée de vie bien sûr, mais aussi ceux qui on un peu moins de longévité en fessant pourquoi pas des bacs avec les différente dates de péremption) mais aussi des produits beauté (crème, shampoing, gel douche...)\nCela sera pour sûr un investissement pour les grandes enseignes et ils devront repensées à pas mal de choses pour faire un système vraiment efficace, mais à la fin, les consomateurs et l'enseigne sera gagnant car aucun d'entre eu ne payera le prix du contentent."
    },
    "139": {
      id: 793,
      category: "consommer",
      title: "Une Carte Carbone plutôt qu’une taxe carbone.",
      body: "Son fonctionnement est simple: chaque habitant reçoit un quota annuel de droits d’émissions de GES. Pour chaque achat encadré par le quota, la Carte Carbone sera scannée et décrémentée des droits d’émissions correspondant aux émissions du produit acheté. Quand le quota arrive à zéro, vous ne pouvez plus acheter les produits concernés par le quota.\n\nDans une bourse au carbone, les plus pauvres pourront choisir de vendre leurs \"points carbone\" inutilisés à ceux qui veulent consommer plus. On voit ainsi que contrairement à la taxe carbone - qui permettra toujours au plus riches de consommer à leur guise et qui nécessiterait des compensations très incertaines à l’égard des pauvres - la Carte Carbone met en place un cercle vertueux, qui limite les plus riches, au profit des plus pauvres !\n\nLa Carte Carbone pourra d'abord s'appliquer à la consommation d'essence et d’énergie et, dans un second temps, à la plupart des objets de consommation.\n\nLes émission doivent diminuer régulièrement jusqu’en 2050, les quotas individuels annuels, strictement égaux d’une personne à l’autre, diminueront en même proportion. Ainsi, contrairement à la taxe carbone dont l’effet réel est très incertain, la carte carbone permet à coup sûr de respecter l’objectif de diminution de nos émissions.\n\nCette proposition est défendue par Yves Cochet, ancien ministre de l'environnement. Je vous encourage vivement à l'inviter pour qu'il soit auditionné."
    },
    "140": {
      id: 891,
      category: "consommer",
      title: "Les eaux en bouteille",
      body: "Le luxe d'une époque, l'eau potable au robinet , est devenu source de suspicion, entretenue par les producteurs d'eau en bouteille.\nje suis infirmière. Il y a encore quelques années, dans les services hospitaliers, l'eau était distribuée dans des brocs en inox; Aujourd'hui, la règle est l'eau en petite bouteille plastique de 33cl. Au sortir de l'hôpital, le patient croit important pour sa santé, guidé par les choix de l'hôpital, de continuer à acheter de l'eau en bouteille ( c'est la technique commerciale des vendeurs de drogue... ). Le recyclage est illusoire du fait d'une consommation exponentielle de ces eaux en bouteille, et il crée sa part de dépense en énergie fossile. Si l'eau distribuée par le réseau local est de qualité, il faut INTERDIRE aux hôpitaux, maisons de retraite, école, collectivités en général, de fournir des eaux en bouteille; il existe des méthodes de filtration efficace au cas ou le gout ne serait pas satisfaisant."
    },
    "141": {
      id: 892,
      category: "consommer",
      title: "Interdire toute nouvelle implantation de grande surface, et Taxer les produits selon la distance parcourue",
      body: "La France a un taux de grandes surfaces par habitant déjà disproportionné, et la grande distribution non seulement a tué la convivialité des centre-villes, mais participe d'une logistique mondialisée aux conséquences environnementales (pollution), sociales (production à bas-prix, délocalisation de l'emploi) et culturelles (gavage publicitaire) désastreuses, que ne saurait justifier la couse aux profits de quelques uns, Plus aucune nouvelle implantation ne doit être autorisée, et un vaste programme de réflexion sur les reconversions possibles des implantations existantes surnuméraires doit être lancé, En outre, une taxation écologique des produits en fonction de la distance qu'ils ont parcourue, simple mesure de justice par rapport aux coûts indirects supportés par la collectivité, permettrait sans plus attendre de renverser leur pseudo-compétitivité."
    },
    "142": {
      id: 681,
      category: "consommer",
      title: "Grandes surfaces",
      body: "Bonjour, dans notre village, un permis de construire a été donné pour créer une grande surface Carrefour sur le plateau de la gare, en dehors du village. Celui qui a construit ce carrefour a aussi créé 2 surfaces où se sont installés un tabac/presse et la pharmacie. (ces 2 derniers étaient avant sur la route principale du village). De ce fait, il ne reste plus, dans le centre du village, qu'une boulangerie et une petite surface Spar (cette dernière existe depuis très longtemps) et un petit local de vente des petits producteurs de la vallée. Pour la pharmacie, par exemple, quand il manque un médicament, qu'on habite au bout du village et que l'on commence à avancer en âge, c'est un gros problème. Il faudrait donc interdire les surfaces avec les \"grands noms\"."
    },
    "143": {
      id: 926,
      category: "consommer",
      title: "Développer le micro-crédit",
      body: "Faciliter l'accès au micro-crédit (à taux zéro) pour permettre aux personnes qui ont des idées de se lancer sans s'endetter."
    },
    "144": {
      id: 761,
      category: "consommer",
      title: "Malus / Bonus consommation des vêtements",
      body: "Malus (+100%) sur l'importation (hors CEE) de vêtements / Bonus (-50%) sur les produits de recyclage tissus (sur France), et la fabrication de vêtements fabriqués 100% sur France."
    },
    "145": {
      id: 762,
      category: "consommer",
      title: "Abandonner le transport routier par poids lourds",
      body: "Au profit du frêt SNCF et du transport par péniches"
    },
    "146": {
      id: 763,
      category: "consommer",
      title: "Diminuer la TVA sur les produits durables",
      body: "Aujourd'hui la plupart des appareils électroménagers (refrigerateur, machine à laver etc.) ne sont plus garantis que 3 ans et ont tendance à tomber en panne juste après pour encourager la consommation. Ils sont souvent même irréparables (tout est fait pour ça) ou réparables à un cout si prohibitif qu'ils finissent en déchetterie. Il faudrait baisser de façon très significative la TVA sur les produits garantis 10 voire 20 ans pièces et main d'oeuvre. Et encourager les fabricants à proposer du durable. Et ça pourrait aussi s'appliquer à d'autres secteurs (comme les meubles, l'habillement). On pourrait même envisager une augmentation de la TVA sur les produits inutiles, importés et voués à rapidement finir à la poubelle (les jouets pour faire les bulles en sont une très belle illustration)."
    },
    "147": {
      id: 723,
      category: "consommer",
      title: "Fermer les portes des magasins chauffés ou climatisés",
      body: "Ca parait une évidence, mais pourtant, en pleine canicule les magasins ont la climatisation et la porte ouverte. Idem en hiver. \nDes portes automatiques peuvent être installées."
    },
    "148": {
      id: 989,
      category: "consommer",
      title: "Former les citoyens pour promouvoir la sobriété énergétique",
      body: "Si le développement d'énergies renouvelables et décarbonées est une nécessité absolue pour relever le défi climatique, on oublie souvent l'enjeu de la sobriété énergétique. S'il est impératif de produire \"mieux\", il est également indispensable de consommer \"moins\", et par conséquent de faire la chasse aux consommations évitables et/ou inutiles.\n\nFormons donc le plus grand nombre aux enjeux de la sobriété énergétique. Des gestes simples à la maison, comme au bureau, peuvent permettre de réduire nos consommations d'énergie. Proposons donc des ateliers en Mairie, gratuits, et accessibles à tous, pour promouvoir les bons gestes et réduire nos consommations d'énergies et, de facto, les factures qui y sont associées ! \n\n\nPS : j'ai personnellement réduit ma consommation de 17% en l'espace d'une année, en respectant quelques règles simples. \nEt selon la plateforme Equilibre d'EDF, mon foyer a une consommation inférieure de 60% à celle des foyers similaires."
    },
    "149": {
      id: 714,
      category: "consommer",
      title: "Interdire la publicité",
      body: "La publicité est un rouage essentiel de notre société de consommation : 1 euro de publicité engendre environ de 7 euros de PIB. Elle pousse à la consommation, y compris de biens ou de services inutiles qui seront jetés rapidement ou inutilisés.\nPar ailleurs, seules quelques grandes entreprises peuvent se payer des espaces publicitaires dignes de ce nom. La publicité n'aide donc pas le consommateur à faire un choix éclairé. \nEn outre, les grandes entreprises qui peuvent financer des publicités n'oeuvrent pas pour le développement durable. En 2013, les 5 plus grands annonceurs étaient Procter & Gamble, Unilever, l'Oréal, Toyota et General Motors.\nFace à ces constats, je propose d’interdire la publicité dans l'ensemble des médias et de l'espace public. Elle sera remplacée par des oeuvres d'art ou des supports d'information.\nLa publicité finance des médias et des initiatives privées et publiques. Ce financement sera transitoirement assuré par une contribution des entreprises et de l'Etat. Parallèlement, des groupes de travail élaboreront de nouveaux modèles économiques. L'écosystème des start-up, créatives dans le domaine des modèles économiques, sera mis à contribution.\nAfin que le consommateur puisse faire un choix éclairé, les comparateurs d'offres et les médias spécialisés qui testent ces offres (magasines informatiques, etc.) seront appelés à se développer avec le concours technique et financier des services de l’Etat et le concours financier des entreprises."
    },
    "150": {
      id: 715,
      category: "consommer",
      title: "Noter le coût environnemental des produits",
      body: "Sur le même modèle que la note de consommation énergétique à laquelle nous nous sommes habitués pour nos appareils électroménagers, rendre obligatoire pour n'importe quel produit de consommation une note \"cycle de vie\" qui évalue leur impact réel sur les écosystèmes. Cet outil permettrait de responsabiliser les producteurs en les obligeant à la transparence sur l'ensemble de leur cycle de production, et aiderait les consommateurs à choisir de manière éclairée des produits à l'impact environnemental réduit. \n\nElle peut être établie en prenant en compte l'ensemble des impacts environnementaux d'un produit, depuis l'extraction des matières premières nécessaires à sa fabrication jusqu'à sa fin de vie. Ces étapes du cycle de vie intègrent : \n- l'extraction des matières premières\n- leur transport jusqu'au lieu de production\n-l'énergie et les ressources utilisées pour la fabrication\n- le transport jusqu'au lieu de distribution\n- l'énergie et les ressources nécessaires pour l'usage (ex  : pour une bouteille de shampooing, on intègre la consommation d'eau moyenne pour un lavage de cheveux / pour un smartphone la quantité d'électricité consommée pour XXX recharges) \n- la fin de vie du produit : recyclage ? compostage ? ni l'un ni l'autre ?"
    },
    "151": {
      id: 893,
      category: "consommer",
      title: "Favoriser la réparation à l'achat de nouveau matériel",
      body: "Il faut toujours préférer la réparation d'un bien à l'achat d'un bien neuf.\nC'est moins polluant. De plus, bien souvent, les produits sont fabriqués dans d'autres pays alors que la réparation est effectuée en France. C'est donc bon pour le climat et pour l'emploi en France.\nPour favoriser cela :\n- ajouter une garantie obligatoire sur certains produits (électroniques par exemple) d'une durée suffisante (3 ans, 5 ans) ce qui incitera les entreprises à faire des produits plus durables et les consommateurs ç faire réparer plutôt qu'acheter neuf\n- diminuer la TVA sur les réparations. C'est déjà possible pour certaines réparations sans accord de l'Europe car déjà prévu par les textes européens : réparation sur les bicyclettes, les chaussures et les articles en cuir et les vêtements et linge de maison. Demander à l'Europe une évolution pour pouvoir baisser la TVA sur les autres types de réparation\n- favoriser toutes les initiatives citoyennes type Repair Café"
    },
    "152": {
      id: 929,
      category: "consommer",
      title: "Interdire ou réguler le crédit à la consommation",
      body: "Supprimer ou encadrer strictement les crédits à la consommation afin de lutter contre le surendettement et la précarisation."
    },
    "153": {
      id: 770,
      category: "consommer",
      title: "Publicité & consomation d'énergie",
      body: "Les panneaux de publicité éclairés et les écrans dans les lieux public représentent une consommation d'énergie non négligeable et injustifiable.\n\nIl n'est pas que question de gaspillage énergétique mais aussi de pollution lumineuse qui met en danger la santé des humains (rythme circadiens) et des animaux sauvages nocturnes (insectes, mammifères, oiseaux migrateurs, etc.).\n\nIl est très simple d’éteindre définitivement ces supports, un simple interrupteur, et en quelques semaines l’économie serait réelle et immédiate.\n\nJe propose donc l'interdiction pure et simple de toute consommation d'énergie pour les supports publicitaires."
    },
    "154": {
      id: 726,
      category: "consommer",
      title: "Éteindre la lumière des établissements et commerces, durant les heures de fermetures",
      body: "Durant les heures de fermeture beaucoup de magasins, bureaux d'entreprises, etc. laissent des écrans, des éclairages allumées. Beaucoup d'énergie utilisé pour rien.\nL'idée est de rendre obligatoire les coupures d'énergie, tout appareils qui touche pas directement au bon fonctionnement de l'entreprise durant ces heures de fermetures."
    },
    "155": {
      id: 729,
      category: "consommer",
      title: "Etiquette carbone produits de consommation",
      body: "Bonjour et bon courage à tous,\nPourquoi ne pas créer une étiquette climat/contenu en carbone sur l'ensemble des produits de consommation (évalué sur le cycle de vie du produit), de manière à informer le consommateur ? Cette étiquette pourrait prendre la forme des étiquettes nutriscore, avec des codes couleurs, ou des étiquettes énergie que l'on retrouve par exemple sur l'électroménager.\nMerci"
    },
    "156": {
      id: 730,
      category: "consommer",
      title: "Interdiction des emballages multiples",
      body: "En parallèle du développement du vrac, certains produits vendus en supermarchés sont emballés doublement voire triplement. Cette multiplication des emballages est inutile. Je suggère donc de limiter le nombre d'emballage à 1 seul à la vente.\nCela n'empêche pas d'avoir des portions individuelles avec par ailleurs."
    },
    "157": {
      id: 1176,
      category: "consommer",
      title: "Étiquetage des produits sur leur fin de vie",
      body: "Rendre obligatoire sur chaque emballage imprimé, l'impression des pictogrammes sur la fin de vie du produit.\n\nPeut-il être composté ?\nPeut-il être recyclé ?\nDoit-il être jeté ?\n\nC'est une mesure qui peut-être rapidement mise en place.\n\nhttp://www.saintgermainbouclesdeseine.fr/actualites/fiche/rappel-sur-letiquetage-qui-nous-facilite-le-tri/?cHash=0b5568553ebab5e44ceccd9769c0ec88\nhttps://www.consignesdetri.fr/baba/?anchor=chapter3#chapter3"
    },
    "158": {
      id: 831,
      category: "consommer",
      title: "Tva écologique et sociale ",
      body: "Réévaluation de la tva en faveur des produits de première nécessité et non nocif pour l'environnement.  taxer les produits polluants et ceux de luxe.\nFavoriser les circuits courts à travers une tva réduite."
    },
    "159": {
      id: 779,
      category: "consommer",
      title: "Mise en place d'une Carte Carbone",
      body: "Dans un contexte où la planète peut absorber une quantité finie de CO2, il convient pour limiter le réchauffement climatique de fixer un plafond des émissions au niveau mondial. On peut commencer par l'appliquer en France afin de donner l'exemple à suivre.\nLa Carte Carbone est une mesure radicale mais pourrait être ce qu'il y a de plus efficace, en fixant un quota d'émissions par individu, réparti équitablement entre tous les êtres humains. Les émissions seraient comptabilisées sur certains achats pour commencer, comme l'achat de produits à empreinte carbone élevée (high tech, voiture), ou de l'essence par exemple.\nOn pourrait commencer par un plafond relativement élevé, puis le réduire progressivement pour atteindre les objectifs des Accords de Paris.\n\nLa Carte Carbone comporte donc de nombreux avantages:\n\nProgressivité du plafond pour accompagner la réduction progressive des émissions\n\nPousserait vers des pratiques éco-responsables dans le domaine de la consommation, que ce soit de la part des citoyens que de la part des entreprises.\n\nA l'inverse de la taxe carbone qui est indolore pour les plus riches, qui sont également les plus pollueurs, les plus pauvres se verraient créditer d'un excédent de crédits leur permettant la revente aux plus riches sur une sorte de \"marché du carbone\".\n\nPour plus d'infos:\nVoir groupes Facebook autour de la convention car ici on ne peut pas développer plus de 1500 caractères.."
    },
    "160": {
      id: 851,
      category: "consommer",
      title: "Se libérer d'une concurrence internationale déloyale (CETA...) afin d'éviter de niveler par le bas les pratiques de production",
      body: "Chaque consommateur doit pouvoir apprécier par ailleurs, le mieux possible, la production de GES associée à la production puis la mise en vente des différents produits mis en vente. Le caractère local de la production ne suffisant pas à garantir qu'elle est climato-compatible, il est important de fournir d'autres informations au consommateur.\nL'augmentation du prix de l'énergie d'origine fossile, même s'il sera considéré comme relevant d'une écologie punitive, reste une voix d'amélioration des effets de la consommation incontournable. Ou alors, il faudrait allouer des droits individuels maximaux de pollution dont je vois mal les modalités de mise en oeuvre.\nSi l'on augmente le prix des énergies fossiles, il faut aussi accentuer la solidarité et réduire la disparités des revenus au sein de la population afin de ne pas mettre en difficulté aigüe les personnes ayant de faibles revenus."
    },
    "161": {
      id: 830,
      category: "consommer",
      title: "Plusieurs idées ",
      body: "Bonjour, bravo pour cette possibilité de contribution et bravo aux 150 citoyens qui vivent une expérience incroyable et très certainement durable 😉 ... \n\nQuelques idées ▶️\n1/ rendre obligatoire l’affichage du coût CO2 \nd.un produit (ensemble du cycle ) à coté du prix \n2/interdire le black Friday \n3/ suivre sa consommation CO2 avec sa carte bancaire \n4/encourager le Co voiturage en diminuant l.assurance ( créer une assurance partagée entre tous les voyageurs )\n 5/installer un système de réutilisation de l’eau de son logement  et un système de récupération d.eau de pluie \n6/ l’interdiction du plastique à usage unique doit aussi s.appliquer aux bouteilles de shampoing / produits ménagers ... etc \n7/ rendre obligatoire l’installation d.un composteur dans les copropriétés \n8/ interdire les panneaux publicitaires numériques \n9/ diminuer l’eclairage public des villes et reverser le gain budgétaire au plus démunis \n10/les biens alimentaires de la région oû l.on vit doivent être préférés \n11/ démystifier le nucléaire qui n’émet pas de CO2 ´ investir dans la gestion de la sécurité (pas trop d.eoliennes svp ) \n... \n\nMerci 😊"
    },
    "162": {
      id: 1310,
      category: "consommer",
      title: "Rendre les boites aux lettres \"STOP PUB\" par défaut",
      body: "Nombre de boites aux lettres n'ont pas de \"stop pub\", parce qu'il s'agit de résidences secondaires, d'un logement inoccupé, parce que les particuliers ont oubliés d'en coller un, parce qu'ils n'en ont pas trouvé ou parce qu'ils viennent d'emménager .... \n\nIdée de loi : \n\n- « par défaut » toutes les boites aux lettres seraient interdites à la publicité\n- Un autocollant « oui pub » serait envoyé à tout les français. Ils choisiraient ensuite de le coller (ou non) sur leurs boites. \n- Une plateforme internet avec les catalogues en ligne, répartis par code postal (pour permettre le ciblage géographique, et permettre aux TPE-PME locales de faire de la publicité) serait créée afin que les personnes qui souhaitent toujours voir les pub, mais pas en version papier puissent le faire. \n\nCela permettrait de réduire le nombre de publicités papier distribuées, lutter contre la déforestation, et indirectement de lutter contre la surconsommation.\n\nCela ne nuirait pas pour autant aux \"libertés\" puisqu'il serait toujours possible de continuer d'en recevoir, ou de les consulter sur internet."
    },
    "163": {
      id: 808,
      category: "consommer",
      title: "Organiser la collecte des déchets le long des fleuves",
      body: "Le phytoplancton et les coquillages sont des acteurs majeurs de la captation de C02. L'un le capte par photosynthèse, l'autre l'emprisonne sous forme de carbonate de calcium dans sa coquille.\nIl faut donc préserver les océans pollués par nos fleuves qui charrient énormément de nos déchets.\nL'incivilité existera toujours. Il n'y aura jamais un gendarme derrière chaque pollueur. Il y aura toujours des inondations imprévues. Il faut donc partir du principe que dans une ville de dizaines ou centaines de milliers d'habitants : il y aura toujours des milliers d'entre eux à jeter ou à perdre quelque chose dans le fleuve.\nIl faut donc mettre en place une collecte systématique et régulière des déchets dans un fleuve à la sortie de chaque agglomération le polluant, pour tous les fleuves.\nUn océan moins pollué jouera mieux son rôle régulateur des perturbations atmosphériques."
    },
    "164": {
      id: 898,
      category: "consommer",
      title: "Sensibiliser à la sobriété énergétique",
      body: "Puisque consommer moins d'énergie en général contribue à faire baisser les émissions de GES, pourquoi le ministère de la transition énergétique ne ferait-il pas des spots ou des affichages de sensibilisation allant dans ce sens ? Si chaque foyer faisait attention à bien régler son chauffage, sa clim, son frigo, ou si chaque foyer coupait les box internet pendant la nuit par exemple, la consommation d'énergie baisserait drastiquement. Il est totalement anormale que la consommation d'énergie continue de croitre alors que la technologie nous permet de consommer moins. Il existe des multitudes de gestes à adopter mais aucune communication n'est faite pour expliquer comment faire."
    },
    "165": {
      id: 943,
      category: "consommer",
      title: "Effondrement, climat et biodiversité",
      body: "Nous sommes confrontés à 2 grands defis. \"Le bouleversement climatique, l'extinction massive des espèces et la perte de biodiversité\" ET \"l'effondrement de la société thermo industrielle\". \nL'effondrement de la société thermo-industrielle dû à la rarefaction des ressources fossile et minière serait en fait notre chance pour ralentir rapidement nos emissions de CO2 et limiter les degats sur le climat et la nature. Mais cet effondrement entrainera des conflits, de la misère, de grands bouleverselents sociaux. Cet effondrement est en cours, il est inevitable, les pays industriels seront les plus violemment touchés puique nous sommes extremement dependants et incapables de vivre de peu. Il faut donc l'accompagner, pour le vivre au mieux et permettre de ralentir le changement climatique. Dans le même temps il faut restaurer en masse les ecosystemes. Il est encore temps mais le temps presse. La France doit s'engager à fond, prendre le probleme à \"bras le corps\", planifier  et devenir un modele et developper une expertise dont elle pourra faire beneficier d'autres états. Soyez audacieux !"
    },
    "166": {
      id: 933,
      category: "consommer",
      title: "Défiscaliser à 100% les investissements pour le climat",
      body: "Pour faciliter/accélérer/augmenter les investissements pour le climat, il faut les défiscaliser à 100%"
    },
    "167": {
      id: 946,
      category: "consommer",
      title: "Sensibiliser toute la famille sur notre budget carbone ",
      body: "Tous les élèves doivent calculer le bilan carbone de ses parents en primaire et le comparer aux objectifs 2030"
    },
    "168": {
      id: 990,
      category: "consommer",
      title: "Interdire la pub pour les objets/services climaticides",
      body: "En septembre nous avons eu droit aux campagnes de pub des compagnies d'aviation (\"prolongez l'été, rendez vos collègues jaloux, partez à l'autre bout du monde\"). Comment encourager des comportements bas carbone si la publicité créé ce genre de désirs ?\n\nJe propose d'interdire, secteur par secteur, la publicité pour les activités les plus émettrices de carbone. Dans le transport : l'avion et la voiture. Dans l'alimentation : la viande rouge, l'huile de palme et le soja issus de la déforestation. Dans le bâtiment : la construction de résidences individuelles. Dans l'électronique : les appareils les plus gourmands en co2. Etc.\n\nIl faudrait mesurer le manque à gagner pour les médias ou régies de transport. Et pourquoi pas que l'État compense par des campagnes de sensibilisation sur le climat (ou tout autre sujet dintérêt public)."
    },
    "169": {
      id: 1120,
      category: "consommer",
      title: "Lutter contre l'obsolescence programmée logicielle par la dissociation des types de mises à jour",
      body: "Je pense que nous avons tous eu l'expérience d'une demande de notre ordinateur, smartphone, ... de mise à jour. N'ayant pas réellement le choix nous l'acceptons souvent à contre cœur car nous savons pertinemment l'effet de ralentissement que ça peut provoquer sur notre matériel. Nous avons une chance sur deux. Combien d'entre nous ont été dans l'obligation de changer de matériel pourtant fonctionnel, voir comme neuf cependant ramant comme si il avait 10 ans d'utilisation ?\n\nAujourd'hui la fabrication de ces appareils nécessitent des ressources abiotiques rares et de plus en plus rare. En terme de gain écologique, nous avons intérêt à garder nos équipements le plus longtemps possible.\n\nLa proposition est de rendre obligatoire la différenciation des mises à jour logiciels correctives indispensables, des mises à jour évolutives, qui apportent de nouvelles fonctionnalités souvent non utilisées et non désirées. De plus, les mises à jour évolutives devraient être optionnelles permettant à l'utilisateur de choisir tout simplement si il souhaite installer ces fonctionnalités ou non."
    },
    "170": {
      id: 900,
      category: "consommer",
      title: "Quel type de gouvernance ? ",
      body: "Bonjour et félicitations pour cette expérience assez inédite ! \nJ'ai pris beaucoup de plaisir et d'intérêt à suivre les sessions de la Convention mais une question qui me semble primordiale n'a jamais été envisagée : quel mode de gouvernance, quel type de système politique pourrait favoriser l'objectif de transition (ou d'adaptation plutôt) énergétique ? Le système représentatif de notre République semble avoir faillit dans cette tâche, cette Convention en est elle même une démonstration. C'est évidemment une question pas facile... Mais le même système partiellement démocratique actuel qui est grandement responsable des problèmes climatiques peut il aussi formuler une solution sans être réformé ? La question de l'impact de la gouvernance dans l'emergence, l'application et le contrôle des solutions me semble important. \nMerci!"
    },
    "171": {
      id: 903,
      category: "consommer",
      title: "Interdire l'emballage et inutile au maximum",
      body: "- Obliger les industriels à changer leur mode d'emballage ( interdire le suremballage  , minimiser au maximum l'emballage , des bouteilles en verre au lieu du plastique avec consigne ....) et pas dans 5 ou 10 ans ...mais immédiatement quand c'est possible ( exemple le carton pour regrouper les yaourts ...)\n- Obligation de remettre dans les grandes surfaces du personnel pour servir le bio en vrac en légumes et en fruits pour éviter le raison en barquette plastique ou le concombre sous film par ex\n-Interdire la vente de légumes , de fruits \"découpés\" dans des barquettes en plastique\n-Interdire les \"packs\" d'eau ou de boisson avec un film\n-Généraliser les boites ou containers à la sortie des magasins pour y laisser ce que le consommateur ne veut pas voir encombrer ses poubelles pour sensibiliser l'enseigne qui fera remonter l'info et appuiera auprés de ses fournisseurs\n- Interdire la vente de sacs plastiques au caisse ou le faire payer bien plus cher \n- Voilà quelques exemples sachant que le consommateur est toujours libre de ses choix mais il faut aussi aider les gens de bonne volonté"
    },
    "172": {
      id: 901,
      category: "consommer",
      title: "Produits controversés",
      body: "Interdiction d'importation de l'huile de palme et de soja responsables de déforestation et de disparitions d\"espèces animales uniques.\nInterdiction d'introduire ces produits dans les produits transformés."
    },
    "173": {
      id: 905,
      category: "consommer",
      title: "Quotas et surtaxe",
      body: "Mettre en place des quotas de consomation (gaz, electricite,eau, petrole, dechets) selon taille famille et revenus et surtaxe au delà"
    },
    "174": {
      id: 1705,
      category: "consommer",
      title: "Arrêter la destruction des produits de contrefaçon et les redistribuer aux organismes humanitaires",
      body: "Chaque année, les Douanes détruisent des quantités de produits contrefaits qui, en dehors du préjudice qu'ils causent aux marques concernées, pourraient être redistribués par les organismes humanitaires aux plus démunis.\nIl faudrait vérifier la qualité minimum desdits produits, les rendre incompatibles à la revente (coloration, créer un \"défaut d'aspect\" discret non nuisible à l'utilisation...), demander aux organismes bénéficiaires de justifier de l'utilisation des produits."
    },
    "175": {
      id: 949,
      category: "consommer",
      title: "TVA juste (ou Taxe juste) pour remplacer la TVA",
      body: "TVA ou Taxe Juste pour favoriser la Transition Ecologique, \n\nTaxe Sociale et Juste : \nPour booster les filières de produits/services d’avenir bons pour l’environnement et la santé,\nDésavantager les Filières polluantes pour accélérer / pousser leur modernisation et environnementalisation, via la TVA ou une taxe de remplacement ou un système complémentaire. (bonus/malus), aider à créer des emplois durables, et faire évoluer des activités existantes naturellement vers des emplois plus durables. \n\n1e étape : un barème sur les catégories de produits et services\n2e étape : un calculateur exact basé sur des données scientifiques (sur le même modèle que le calcul du prix de l'électricité)\n\nPlusieurs milliers de personnes ont déjà signé la pétition : \nhttps://www.change.org/p/emmanuel-macron-pour-la-mise-en-place-d-une-taxe-juste-au-niveau-français-et-européen-ecologique-sociale"
    },
    "176": {
      id: 950,
      category: "consommer",
      title: "Cours de réparation dès l’école primaire ",
      body: "Nous aimerions tous savoir réparer les multiples objets du quotidien. Pour diminuer notre consommation, il faudrait que l’on apprenne les bases de la réparation dès l’école primaire, sous forme ludique puis de plus en plus technique au fur et à mesure des années d’étude.\nNous pourrions aussi enseigner les bases de la réparation et de l’isolation d’une maison. Afin que chacun devienne un acteur de la rénovation."
    },
    "177": {
      id: 1012,
      category: "consommer",
      title: "Associer un QR code a chaque produit",
      body: "Ce QR code donnera l'adresse du site et la référence du produit, où l'on pourra consulter : \n- le lieu et la date de fabrication, \n- les ingrédients et composants et leur traçabilité, \n- la date de péremption, \n- la composition, \n- les allergènes, \n- les précautions d'emploi, \n- un éventuel manuel d'utilisation, \n- les consignes de recyclage, \n- le coût carbone, \n- le score santé."
    },
    "178": {
      id: 870,
      category: "consommer",
      title: "Développer la consigne verre puis la rendre obligatoire",
      body: "L'idée serait d'aboutir à un système de consigne verre pour tous les produits vendus en bouteille ou en pack. Cela permettrait de limiter les déchets plastiques tout en développant une industrie de collecte et remise en condition des bouteilles qui aurait l'avantage d'être difficilement délocalisable (il pourrait être utile de faire en sorte que les bouteilles ne retournent pas en chine pour se faire reconditionner, voire limiter les distances de transport).\n\nPour faciliter la mise en place:\n - le système pourrait commencer graduellement, par région et/ou par catégories de bouteille.\n - un certains nombre de modèles standards (10-40 ?) devraient être définis pour améliorer la portabilité et éviter que chaque marque ait son modèle (petites bouteilles de boisson, grandes bouteilles de boisson, vin, limonade, etc., puis produits d'entretient avec des bouteilles suffisamment différentes pour éviter les confusions)\n - Les fournisseurs qui seraient en retard auraient à payer le prix de la consigne sur toutes leur ventes en bouteilles plastiques.\n- Des collecteurs automatisés ou non devraient être disponibles avec un bon maillage.\n\nLa mesure nécessite d'y réfléchir de manière approfondie, mais j'espère avoir initié une idée,\nMerci de votre travail,\nCordialement,"
    },
    "179": {
      id: 1989,
      category: "consommer",
      title: "Du contrôle et des effets de bord",
      body: "Eviter que les règles qui s'appliquent ou s'appliqueront ici, en local ne soient contournées par achat en ligne, sous-traitance, importation ou délocalisation.\nque les règles soient contrôlées encore et toujours de manière réelle, concrète et avec vigueur.\nque le taux d'impôt des sociétés de grande distribution et équipement grand public (françaises et étrangères) soit rendu public, affiché au moins 1 fois par an avec effet d'annonce pour ceux qui ne paient que trop peu d'impôt par effet d'optimisation fiscale au détriment de la planète ou de la vie en société...et de leurs plus petits camarades de jeu\nQue l'Europe ne soit pas un prétexte pour ne rien ou peu faire mais un tremplin pour agir mieux et plus vite : quitte à englober le marché commun EU et renforcer les contrôles en interne (en Europe mais en France de manière unilatérale).\nRendez public l'efficacité du contrôle et donc le taux de respect des règles et dites lorsque vous ne savez pas encore mesurer. Le budget pour le contrôle pourrait bien se révéler un bon investissement vert et social ?"
    },
    "180": {
      id: 1017,
      category: "consommer",
      title: "Stop à la publicité permanente et aux centres commerciaux",
      body: "La publicité incite les citoyens à consommer et pour ceux qui sont conscient des dégâts environnementales engendrées, elle crée de la dissonance cognitive : je sais que ce n'est pas bien de surconsommer mais partout où je regarde on me demande d'acheter des objets.\n\nIl faut interdire la publicité pour les produits qui engendre la plus grande pollution : voitures, voyages en avion, viande, produits à base d'huile de palme\n\nRéglementer la place de la publicité dans l'espace public pour réduire la quantité de sollicitation auxquelles nous sommes soumis (15.000 par jour environ)\n\nInterdire certains modes de publicité comme les panneaux publicitaires lumineux\n\nRéglementer le nombre de centre commerciaux car leur taille et leur puissance commerciale induisent la surconsommation et tuent les petits commerce\n\nTaxer la vente en ligne qui induit des transports individualisés"
    },
    "181": {
      id: 1213,
      category: "consommer",
      title: "La taxe carbone est la plus juste des taxes",
      body: "La taxe carbone est la plus juste des taxes à 4 conditions :\n1° Qu’elle s’applique sur tous les usages et pas uniquement sur le carburant des véhicules.\n2° Qu’il y ait un mécanisme de compensation aux frontières, ou encore mieux, que l’OMC soit revue pour n’accepter les échanges commerciaux qu’avec des pays qui applique le même niveau de taxe.\n3° Supprimer l’évasion fiscale pour ne pas pouvoir consommer ailleurs (non taxé) l’argent produit chez nous.\n4° Que les gains viennent principalement en déductions d’autres taxes (SMIC, TVA,…) pour au minimum la rendre globalement neutre pour les bas revenus.\nLa raison pour laquelle cette taxe est juste est simple. Plus quelqu’un (aussi les entreprises) consomme, plus il est taxé. De plus le produit consommé est polluant, plus la taxe est élevée.\nDonc les riches payent beaucoup plus de taxe que les pauvres. Mais ce n’est pas tant d’être riche qui compte que la manière dont on vit. En effet l’agriculteur qui vit avec moins qu’un smic malgré qu’il est « riche » n’a pas de raison d’être taxé davantage."
    },
    "182": {
      id: 820,
      category: "consommer",
      title: "Réutilisation des objets avant déchetterie ",
      body: "Il faut avoir accès libre à la déchetterie pour y récupérer un objet qui nous intéresse afin de lui donner une seconde vie. Trop souvent en déchetterie des objets sont encore utilisables. Les objets sont parfois re-valorisé par le syndicat mais ceci signifie qu'ils sont recyclés avec un coût environnemental. \nJ'aimerai avoir l'autorisation de récupérer du bois, ou autre matériaux de construction par exemple. Afin de ne pas consommer du neuf et économiser de l'argent. Actuellement interdit dans les déchetteries. \nOu bien chaque déchetterie pourrait avoir obligation de travailler en lien direct avec une ressourcerie/recyclerie."
    },
    "183": {
      id: 2030,
      category: "consommer",
      title: "Retour de la consigne sur les bouteilles en plastique, en verre, les bocaux et tout autre emballage pouvant être consigné",
      body: "La consigne est un moyen simple et efficace d'éviter le gaspillage. C'est du bon sens. C'est une mesure non contraignante, ni pour le consommateur, ni pour le producteur. Elle pourrait par ailleurs déboucher à la création d'emploi."
    },
    "184": {
      id: 879,
      category: "consommer",
      title: "Rationnement... pour sortir de la taxe",
      body: "Je vous invite à cette lecture...\n\nhttps://www.lemonde.fr/idees/article/2019/08/28/le-climat-une-drole-de-guerre_5503560_3232.html\n\nLe rationnement peut d'ailleurs s'appliquer à beaucoup d'autres champs que le transport, à partir du moment où les produits ont une étiquette carbone. La consommation du numérique peut aussi être touchée grâce à des applications telles que développées par l'organisme de JM Jancovici récemment, qui mesure l'impact carbone de la consommation numérique des particuliers en fonction de la bande passante : https://www.linfodurable.fr/technomedias/une-extension-web-pour-mesurer-notre-empreinte-sur-internet-14502\n\nMerci pour votre travail et votre implication !"
    },
    "185": {
      id: 963,
      category: "consommer",
      title: "Économie d’énergie ",
      body: "Scanner toutes les maisons Françaises afin de détecter les maisons energivores et imposer aux propriétaires d’effectuer les travaux d’isolation nécessaire via des prêts à taux zéro remboursable sur une longue période"
    },
    "186": {
      id: 822,
      category: "consommer",
      title: "Natalité, sécurité sociale, rationnement, calcul de l’empreinte carbone, boycott",
      body: "Inverser la politique actuelle de natalité : allocations familiales pour le premier enfant mais pas pour les suivants (à appliquer sur les nouvelles naissances) et d’un montant forfaitaire égal pour tou.te.s .\n\nProtection sociale en parallèle pour assurer à chacun que les efforts individuels soient faits sans risques : \n- Revenu d’existence d’un montant suffisant pour assurer les besoins essentiels, associé à un droit constitutionnel d’ accès aux ressources publiques pour tou.te.s. Cela implique de remettre et développer les services publiques sur tout le territoire de manière à réduire les déplacements.\n- Associé à une sécurité sociale devenue universellement intégrale du type couverture maladie universelle complémentaire – pas de tiers payant, tout est financé par l’extension des cotisations patronales à la mesure du nécessaire, l’idée étant de limiter le profit des actionnaires au bénéfice universel de la société toute entière.\n\nIntroduire progressivement un rationnement, avec la carte carbone qui est équitable au contraire de la taxe carbone.\n\nRemettre immédiatement en ligne le système de calcul du bilan carbone fourni par l’Ademe, pour permettre à chaque citoyen.ne d’évaluer ses émissions en détail.\n\nSupprimer les lois pénalisant l’appel au boycott : les citoyens doivent avoir un levier pour mettre la pression sur les entreprises les plus émettrices, afin de les inciter à décarboner leurs activités."
    },
    "187": {
      id: 3114,
      category: "consommer",
      title: "Encourager les comportements sobres vis à vis de l'eau",
      body: "Doter chaque habitant d'un \"quota eau\", défini sur la base d'une consommation suffisante et décente. \nLe prix de l'eau correspondant à ce quota serait faible, mais les dépassements de consommation seraient \"taxés\" pour inciter à la sobriété. \nEncourager également le développement des toilettes sèches."
    },
    "188": {
      id: 916,
      category: "consommer",
      title: "Réduire progressivement la publicité puis l'interdire",
      body: "La publicité, quelque soit le support, encourage à la consommation, elle est inutile dans une société de préservation des ressources, elle impacte directement le prix des biens et services.\n\nEn réduisant puis interdisant la publicité, les prix baisseront (cf la question posée par un membre de convention citoyenne en séance à propos du prix d'une automobile en sortie d usine)\n\nLes consommateurs ont suffisamment de moyens à leur disposition pour trouver un bien ou un service sans utilisation de la publicité\n\nCette proposition va à l'encontre des règles de concurrence au sein de l'union européenne, et probablement l'organisation mondiale du commerce, il faudra donc prendre les dispositions pour pouvoir l'appliquer"
    },
    "189": {
      id: 1121,
      category: "consommer",
      title: "Sobriété numérique - usage de la vidéo en ligne",
      body: "Non-déploiement du réseau 5G et limitation réglementaire du débit pour la vidéo en ligne (max 720p50), avec formation obligatoire au lycée sur la manière de compresser un fichier vidéo (ex : logiciel gratuit Handbrake)."
    },
    "190": {
      id: 1162,
      category: "consommer",
      title: "Consultation citoyenne pour toute dépense d'investissement sup à 500 000 euros",
      body: "La population doit être associée à toute dépense conséquente pour son avenir à l'échelon local, ainsi tout investissement d eplus de 500 000 euros doit être analysé au regard de ses impacts climatiques et soumis à l'approbation des habitants par référendum ou consultation. Ceci évitera des dépenses dont les besoins ne son pas identifiés ou justifiés et climaticides."
    },
    "191": {
      id: 1583,
      category: "consommer",
      title: "Bannir la publicité de polluants",
      body: "En soi, la publicité elle-même pollue à cause des litres d'encres utilisés, du renouvellement des affiches, ou pire, de la consommation énergétique des écrans publicitaires. \nEn plus de cela, des publicités concernant le nouveau SUV 4 roues motrices consommant outrageusement au km et libérant des quantités de GES, ou encore les publicités de café en capsule (augmentant le nombre de déchets, métalliques, qui plus est en tant que ressource non-renouvelables) encouragent les consommateurs à consommer de manière sale pour l'environnement. \nDes filtres écologiques devraient être normés pour autoriser une publicité ou non."
    },
    "192": {
      id: 964,
      category: "consommer",
      title: "Oui aux échanges mondialisés, mais au vrai coût des transports !",
      body: "Il faut des mesures simultanées toutes étroitement interactives et indispensables dans les domaines de transition écologique + ré-aménagement du territoire + justice sociale et fiscale + formation et emploi. La transition climatique sera socialement équitable, ou ne se fera pas.\nIl est quasi-impossible de trouver, dans une grande surface ou dans un magasin de détail, un bien d’équipement qui ne provienne pas de l’autre bout du monde ! Est-on décidément désormais incapables, en Europe, de fabriquer une simple ampoule électrique ?\nIl est donc indispensable de réussir à instaurer rapidement une taxe carbone (nationale, puis internationale) sur les  transports à longue distance, non seulement terrestres, mais aussi aériens et maritimes. Le jour où les compagnies internationales de transport paieront le véritable coût de leur activité (y compris pollutions et dégradations en tous genres, actuellement externalisées à la charge de la société civile et… de la planète !), la mondialisation triomphante calmera ses excès, et pas mal d’emplois se re-localiseront.\nCe point mériterait certainement d’être proposé et mis à l’ordre du jour de la prochaine COP 25 de Madrid, sinon de la suivante."
    },
    "193": {
      id: 1018,
      category: "consommer",
      title: "Mettre en place une notation/un prix durable",
      body: "Aujourd’hui, le coût d’un produit est quasi-exclusivement défini et perçu à partir de son coût économique. C’est ce qui fait que des tomates d’agriculture conventionnelle semblent bien moins chères que celles d’une agriculture bio et paysanne.\nPourtant, le coût économique en apparence moins cher à court terme cache plein d’autres coûts invisibles ou non comptabilisés à moyen et long terme, en particulier les coûts de type écologique et social. \nSi on pouvait tenir compte de l’empreinte carbone des tomates conventionnelles (liées à leur transport, leur production industrielle...), des incidences environnementales liées à leur production (appauvrissement des sols...), de l’appauvrissement du tissu territorial lié à leur production délocalisée et des conditions de travail associées (souvent précaires), on se rendrait compte qu’elles nous coûtent (à nous personnellement et en tant que société) bien plus cher que des tomates produites en agriculture paysanne et bio (ou mieux, Nature & Progrès).\nLa proposition est donc de mettre en place un système de notation obligatoire (e.g. A, B, C, D... comme sur l’électroménager), ou des mentions obligatoires (empreinte carbone liée au transport du produit, origine transparente des composants...), ou une taxe durable (qui s’ajouterait à la TVA et inciterait à moins consommer de produits polluants) qui permettraient de rendre compte du coût à la fois écologique et social (plus  difficile à mesurer) des produits achetés."
    },
    "194": {
      id: 2297,
      category: "consommer",
      title: "Interdiction de la publicité dans l'espace public",
      body: "Interdire toute forme de publicité commerciale dans l'espace public : panneaux d'affichages (voir comment interdire aussi dans les terrains privés), médias (radio France, France televison...), sites internet publics.... Démanteler ou si nécessaire réutiliser les espaces existants pour de l'information ou des oeuvres d'art. \nCette mesure pourra contribuer à réduire notre emprise à la consommation, donc réduire la pollution qui en découle."
    },
    "195": {
      id: 969,
      category: "consommer",
      title: "Imposer le retour à la consigne du verre ",
      body: "Le recyclage du verre est une bonne chose mais émet énormément de CO2 : il faut chauffer le verre à 1500 degrés pour le fondre et le remodeler.\n\nUn retour à un système de consigne des bouteilles en verre est plus avantageux pour l’environnement mais également économiquement :\n- les collectivités locales répercutent le coût du recyclage sur la taxe de ordures ménagers\n- la collecte des bouteilles en verre dans des machines permettrait de rétribuer au consommateur une pécule financier  \n- le retour à la consigne permettrait de développer une nouvelle activité économique avec un fort ancrage territorial\n\nCette vidéo de la Fondation Nicolas Hulot permet de mieux comprendre les enjeux et les avantages qui en seraient tirés : https://youtu.be/l7xl2bZyIJg"
    },
    "196": {
      id: 1178,
      category: "consommer",
      title: "Suppression du service au volant",
      body: "Au sujet du service au volant en restauration rapide, je fais le constat suivant:\n\n- effets sur la pollution atmosphérique, le rejet de CO2, le réchauffement climatique\n- sédentarité, passivité du consommateur\nNon loin de chez moi, il y a un service au volant qui fonctionne 24 H sur 24, 3 jours par semaine!\nJ'ai déjà fait 2 courriers au ministère de l'Ecologie, sans résultat et j'espère que la convention va reprendre cette proposition.\n- Ou l'on convainc les opérateurs de l'arrêter\n- Ou bien, on les oblige par la Loi."
    },
    "197": {
      id: 972,
      category: "consommer",
      title: "Faire des sites web plus simples",
      body: "Chaque seconde passée sur un site coûte de l'énergie. On n'a pas besoin de toutes ces pubs, animations, fioritures et ergonomie mal pensée qui ralentissent la navigation. Plus les applis seront simples, plus on pourra les utiliser longtemps sans être forcé de changer son ordi ou son smartphone."
    },
    "198": {
      id: 1123,
      category: "consommer",
      title: "Limiter le renouvellement des équipements domestiques",
      body: "Tous les équipements domestiques : Meubles, électroménager, électronique, etc. devraient :\n- Avoir une durée de vie minimale garantie\n- Avoir une durée de \"réparabilité\" garantie, et être réparables localement\n- Etre repris à la fin de leur vie par le constructeur pour recyclage des matériaux\n- Avoir un taux de recyclabilité minimal"
    },
    "199": {
      id: 1142,
      category: "consommer",
      title: "Inciter, taxer... rationner",
      body: "Toutes nos habitudes de consommation doivent changer. Il faut en finir avec la surconsommation. D'après l'INSEE les 20% des +riches émettent 2,7 fois + de CO2 que les 20% les + pauvres.Les pouvoirs publics doivent donner des signaux forts , cohérents et équitables pour accompagner les changements de mode de vie. Utiliser le principe pollueur/payeur et une réglementation judicieuse. D'abord taxer le transport aérien. Taxes sur le C mais investissement massif dans les alternatives au transport routier (ferroviaire, bus gratuits,pistes cyclables). Ce qui est bon marché et vient du bout du monde se paye en émission de GES donc favoriser les circuits courts: taxe carbone sur les produits alimentaires venant hors UE et DOM TOM. Pour un minimum de cohérence interdiction de la publicité dans les espaces publics. Etc, etc..."
    },
    "200": {
      id: 980,
      category: "consommer",
      title: "Réduire l'empreinte carbone de la livraison",
      body: "Les entreprises de ventes en ligne ont pour seul objectif de livrer le plus vite possible les clients, sans prise en compte de l'empreinte carbone de la solution de livraison choisie et sans en informer le consommateur.\n\nLes empreintes carbone deviennent de plus en plus importantes lorsque le délai de livraison augmente, notamment parce que toute mutualisation est impossible. Il suffit que le consommateur soit plus flexible sur son délai de livraison (quelques jours plutôt que 1j) et que les entreprises de livraison travaillent avec les mêmes prestataires pour mutualiser et faire en sorte que les camions soient plus remplis et livrent des clients proches, faisant diminuer leur empreinte carbone.\n\nPar ailleurs, cette logistique du dernier km peut être la plus propre possible en utilisant, dès que possible, des livraisons à vélo, petits véhicules non polluants, etc.\n\nPour réduire cette empreinte carbone, on peut imaginer des effets incitatifs en obligeant les entreprises à calculer et à afficher les empreintes carbones de chaque solution de livraison choisie, avec des taxes supplémentaires les solutions à forte empreinte carbone ou  tout simplement en interdisant les solutions trop polluantes. Dans tous les cas, il est fondamental de mesurer ces empreintes carbones."
    },
    "201": {
      id: 1021,
      category: "consommer",
      title: "Interdire les emballages non biodégradables",
      body: "Pour favoriser le côté pratique et donc les ventes et le profit, de plus en plus de denrées alimentaires bénéficient de packagings très élaborés à base de matières plastiques. Il devient ainsi quasi-impossible de trouver des biscuits non emballés dans des petits sachets individuels en plastique.\nCes emballages et bouteilles sont une source de pollution majeure et contribuent à l’effondrement de la biodiversité. Les systèmes de recyclage en place ne traitent qu’une faible partie de ces emballages et bouteilles plastiques, le reste est brûlé avec dégagement de CO2 à la clé.\nL’idée ici serait d’interdire purement et simplement l’usage de ce type d’emballages exterminateur du vivant. Des solutions simples existent : le verre consigné, les emballages carton biodégradables …\nL’innovation des industriels doit être réorientée par la réglementation vers des emballages à faible impact écologique."
    },
    "202": {
      id: 994,
      category: "consommer",
      title: "Interdire les avions cargos inutiles",
      body: "Bonjour, je travaille dans l'industrie de la mode / textile (la 2eme pire au monde). Une des sources les plus inutiles de contribution carbone est l'utilisation des avions cargos pour envoyer les vetements de leur lieu de production (eg asie, moyen orient) en 3 jours au lieu de prendre le bateau (en 2 mois). La plupart des entreprises utilisent les avions cargos pour gagner du \"lead time\" et reduire leur stock. Mais si on banissait ces pratiques pour l'ensemble de l'industrie, la planete y gagnerait (et meme les marges des entreprises car l'avion est plus cher). L'argument \"les produits seront moins tendance\" n'est qu'un mythe dangereux qui n'a plus lieu d'etre. Au dela de ce cas non-negligeable mais facile à mettre en oeuvre, il y a une vraie necessité de revoir les strategies de transports industrie par industrie. a) Peut etre accepte t on le transport aérien pour certains biens urgent de premiere nécessité. Mais pour des cerises en hiver? b) evidement la question du lieu de production est à remettre sur la table. Moins de vetements crées mais \"Made in Europe\" c) pour le ecommerce, forcer à n'utiliser que des transports economes en carbone (train, etc) meme si cela implique d'augmenter les temps de livraison. Si tous les ecommerces appliquent cette regle, le consommateur s'habituera"
    },
    "203": {
      id: 998,
      category: "consommer",
      title: "Mettre QR code sur les produits pour savoir où le réutiliser, recycler, donner...",
      body: "En mettant un QR code sur les produits, on peut créer un lien Internet vers une page qui donne les informations environnementales  et sur le produit (recyclage de l'emballage, ainsi qu'à la localisation des points de collecte et consigne à proximité, date de péremption...) sachant qu’il n'y a souvent pas assez de place sur l'emballage pour les mettre.\n\nPour les produits électroménagers, on pourrait aussi proposer des lieux pour réparer, louer, donner ses produits afin d'éviter qu'ils partent en déchetterie.\n\nCes données devraient aussi être accessibles en Open Data aux applications comme Yuka, Hoali ... (via API gratuite et ouverte )"
    },
    "204": {
      id: 1050,
      category: "consommer",
      title: "Décider une politique de rationnement pour gagner la guerre du climat",
      body: "Il y a un lien direct entre le PIB, le niveau de consommation et les émissions de GES globales de chaque pays (locales + délocalisées).\nLa politique de rationnement mise en place aux États-Unis pendant la seconde guerre mondiale a permis ainsi de diviser par deux la consommation d’essence en quelques mois.\nL’idée ici est de mettre en place une politique de rationnement pour gagner la guerre du climat. Chaque citoyen recevrait une part égale de fourniture. Même si ils ont les  moyens de s’en procurer plus, chacun devra se plier au rationnement. Rationnements prioritaires : voyages en avion, essence, viande, vêtements, construction de logements neufs, matériels numériques, utilisation de la vidéo en streaming … Le rationnement s’appliquera aussi aux entreprises avec des quotas de déplacement en avion par exemple."
    },
    "205": {
      id: 1125,
      category: "consommer",
      title: "Interdire les produits à usage unique",
      body: "Les produits à usage unique devraient être interdits, quelque soit leur matériau, ou leur mode de fabrication.\n\nCes produits consomment des matériaux et de l'énergie inutilement. Ils sont, par essence, contraires à la notion de durabilité.\n\nNous n'avons pas besoin de mouchoirs, serviettes, assiettes, verts, couverts, bavoirs, etc. jetables."
    },
    "206": {
      id: 1127,
      category: "consommer",
      title: "TVA indexée sur les émissions de CO2",
      body: "Il faut que la TVA soit proportionnelle aux émissions de CO2 du produit (en tenant compte du cycle de vie complet du produit).\nAinsi, pour un même produit, celui qui vient de loin aura une TVA plus élevée car il faudra y intégrer les émissions de CO2 liées au transport.\nEt pour deux produits différents, celui qui sera écoconçu aura moins de TVA car il émettra moins de CO2."
    },
    "207": {
      id: 1089,
      category: "consommer",
      title: "Remise en questions des événements d'hyper consommation",
      body: "Que ce soit les soldes, le black fridays, pâque ou même noël etc. \nIl y a une remise en question à faire au niveau des ces événements qui pousse à la sur consommation et donc de facto à la génération de GES et au réchauffement climatique.\n\nC'est juste un piste à explorer.\n\nDoit ont les supprimer ? Ou juste mieux les encadrer ?"
    },
    "208": {
      id: 1252,
      category: "consommer",
      title: "Loto écolo et engagé",
      body: "À l'image du Loto du patrimoine qui finance la rénovation du patrimoine historique, un Loto qui mette en jeux des véhicules électriques, la rénovation énergétique de son logement, la compensation carbone d'une année de vie, un contrat d'électricité verte, des panneaux solaires, un abonnement de train, une mission humanitaire..."
    },
    "209": {
      id: 1253,
      category: "consommer",
      title: "Taxer l'énergie grise",
      body: "Établir un bilan carbone ACV des produits importés et taxer les émissions carbone liées aux produits de façon à relocaliser la production et favoriser les circuits courts"
    },
    "210": {
      id: 1131,
      category: "consommer",
      title: "Pour une consommation raisonnée ",
      body: "Réduction des emballages plastiques et bannissement du suremballage.\nRemise au goût du jour des bouteilles consignées.\nFavoriser la distribution en vrac des denrées alimentaires.\nVerbaliser l'obsolescence programmée.\nDévelopper la réparation plutôt que le renouvellement systématique.\nPromouvoir l’auto-réparation et l'impression 3D qui peut être une alternative au stock de pièces détachées.\nPrendre en compte les heures de bénévolat social dans le calcul des trimestres de retraite.\nInterdire la création de nouvelles zones commerciales. Avec le développement du commerce en ligne, le besoin de zone commerciale devrait être réduit et celles existantes recalibrées à la baisse.\nLes zones commerciales sont devenues les temples de la consommation. Il est urgent que les politiques donnent aux jeunes surtout mais aux moins jeunes aussi d'autres perspectives dans leurs vies que toujours plus de besoin, de consommation et donc de frustration.\nInterdire le démarchage téléphonique le site bloctél n'étant pas très efficace.\nFavoriser l'usage des logiciels libres."
    },
    "211": {
      id: 1132,
      category: "consommer",
      title: "Service au volant restauration",
      body: "J'ai déjà fait cette requête 2 fois au Ministre de la Transition Ecologique sans réponse sur le fond.\n\nIl faut supprimer le service au volant en restauration rapide car:\n\n- afflux de véhicules qui\" font la queue\" et qui génèrent de la pollution et de l'émission de CO2 \n- lutte contre le sédentarisme (santé)\nSoit on convainc le secteur de la restauration rapide, soit on le contraint par la loi."
    },
    "212": {
      id: 2209,
      category: "consommer",
      title: "Supprimer la publicité ",
      body: "La consommation est clairement incitée par la publicité. Pourquoi les ventes de SUV augmentent? \nEn supprimant la publicité quelque soit son format, les citoyens seront moins tentés d'acheter tel ou tel produit. Cela forcera les marques à investir dans leurs produits plutôt que dans le marketing et peut être qu'un des effets de bords positifs serait d'avoir des produits de meilleur qualité.\nConcernant les évènements culturels (concerts, festival, expo, ...), la publicité pourrait être autorisé."
    },
    "213": {
      id: 3120,
      category: "consommer",
      title: "Garde$-fou et compensation$ N°4",
      body: "Je pense qu 'il faudrait:\n-Mettre en place des garde$ fou pour les gourmands d'énergie\n-Entreprendre toutes les actions nécessaires pour recréditer l'energie prélevée à la biomasse (pétrole, charbon..) de Madame la planète. \n\nConsumons mieux et créons beaucoup"
    },
    "214": {
      id: 1080,
      category: "consommer",
      title: "Imposer un partage d'espace entre publicité et information d'intérêt général",
      body: "Réduire notre empreinte carbone, c'est réduire notre consommation. Or, la publicité oriente nos achats en jouant le plus souvent sur nos émotions. Mais nos émotions sont mauvaises conseillères quand elles sont manipulées pour que notre raison s'efface.\nSommes-nous plus libres en roulant dans un SUV plutôt que dans un modèle léger et sobre? La femme de nos rêves va-t-elle nous tomber dans les bras grace à un parfum? Voyager à l'autre bout du monde est-il indispensable pour passer de bonnes vacances?\n\nLutter contre les allégories publicitaires, c'est reprendre le contrôle de notre consommation. Mais on ne doit pas instaurer une censure.\n\nOn peut équilibrer l'espace pub : 50% pour les créatifs, 50% pour la planète.\nLa moitié de chaque affiche, page magazine, encart, bannière, spot télé ou vidéo, annonce radio, etc. devra être consacrée soit à présenter l'emprunte carbone du produit concerné par l'autre moitié, soit à diffuser l'un des messages d'intérêt général qui auront été définis par une instance indépendante, sur les thèmes cruciaux que sont durabilité, réparabilité, sobriété énergétique, économie circulaire...\n\nChaque euro dépensé en publicité (payé par nous au final) aura un message équilibré.\nLe message d'intérêt général ne fera que renforcer le message pub des industries vertueuses. Pour les autres, il mettra en évidence les contradictions et fera réfléchir les consos influençables que nous sommes."
    },
    "215": {
      id: 1082,
      category: "consommer",
      title: "Gestion des emballages",
      body: "- encourager la vente en vrac ou au détail\n- supprimer progressivement tous les emballages plastiques ou d'origine pétrolière\n- rendre payants tout emballage pour encourager chacun à venir avec ses contenants\n- sanctionner le non respect du recyclage"
    },
    "216": {
      id: 13,
      category: "consommer",
      title: "Création d'un label zéro déforestation importé",
      body: "Le consommateur doit pouvoir faire des choix éclairés, pour cela le mieux est d'indiquer sur les produits pour les particuliers mais aussi les acheteurs publics comme les villes, les ministères si les produits participent à la déforestation en Amazonie ou ailleurs, on peut penser aux élevages nourris aux soja brésilien aux bonbons comprenant de l'huile de palme, aux fruits ou légumes voir même à l'or dont l'exploitation en Guyane française pose question..."
    },
    "217": {
      id: 1315,
      category: "consommer",
      title: "Stop à certains échanges internationaux et Supprimer les emballages",
      body: "Supprimer le CETA et MERCOSUR et refuser le TAFTA pour ne pas être à la merci des grandes multinationales.\n   Imposer  aux produits étrangers importés les mêmes normes sociales et environnementales que celles imposés à la fabrication des produits français. \n   Instaurer une taxe proportionnelle aux frais de transport pour les produits hors Europe.\n   Diffuser les actions des lobby\n   Supprimer le plus possible les emballages et ne pas pousser à la consommation donc vendre le produit à l'unité le même  prix qu'en gros."
    },
    "218": {
      id: 1102,
      category: "consommer",
      title: "Taxe de recyclage au coût réel",
      body: "Certains vont dire « encore une taxe » et ils ont raison. Pour rendre les écotaxes admissible, il faut absolument qu’il soit écrit dans la loi que toute rentrée de cette taxe doit servir à réduire d’autres taxes (TVA, impôts et taxes sur les bas revenus,…).\nIl serait normal que chaque produit vendu soit taxé à hauteur de son coût réel de recyclage. Ceci s’ajoute à la taxe carbone car l’énergie nécessaire à la production est tout simplement perdue.\nIl n’est évidemment pas si facile de fixer le prix de recyclage réel. La première contrainte est d’imposer à tout constructeur (donc y compris les sous-traitants pour les composants) de fournir un listing complet des pièces avec leurs compositions et la ou les méthodes possible de recyclage pour récupérer des matières premières pures à réutiliser.\nIl reste alors à mettre en place des règles relativement complexe pour estimer le coût de recyclage le plus précisément possible en fonction de la main d’œuvre nécessaire, du coût énergétique, de la pollution qui risque d’en découler. Il faut évidemment taxer davantage les produits mal recyclable (avec dégradation de qualité de la matière première) ou carrément non recyclable.\nSi l’on prend le cas des voitures dont le poids doit être amené à se réduire, le risque majeur est de voir de plus en plus de composants fabriqués en matières composites très spécialisées rendant le recyclage de plus en plus difficile."
    },
    "219": {
      id: 2082,
      category: "consommer",
      title: "Remise en place de la consigne",
      body: "Les bouteilles en verre ainsi que les bocaux en verre partent en majorité à la poubelle après vidage de leur contenu.\nLes réutiliser couterait moins cher sur le plan écologique puisqu'il faut les recycler ou pire, les enfouir ( couvercles en métal non recyclés): -de carbone pour leur production, - de pollution.\nCe sont des objets rapidement utilisables après lavage, moins chers que des neufs et qui peuvent être redistribués par un système ou une entreprise, aux entreprises en ayant besoin dans leur production.\nDe plus ce cycle de récupération et de revalorisation est source de création d'emplois."
    },
    "220": {
      id: 1589,
      category: "consommer",
      title: "Développer l'idée du Noël Récup/Occas'",
      body: "Développer dans l'opinion publique le principe de Noël \"récup/occasion\". \nLe principe : Au lieu d'acheter des cadeaux neufs chaque année, acheter d'occasion des jouets qui ont déjà servi mais qui sont souvent en très bon état (et rarement cassés), afin d'éviter 1) qu'ils traînent au fond d'un placard (autant qu'ils servent!), 2) de la surconsommation chaque année, et de permettre 3) de faire des économies et 4) de recycler/réutiliser pour ne pas jeter."
    },
    "221": {
      id: 1191,
      category: "consommer",
      title: "Fin du gâchis des grandes surfaces",
      body: "Il faut contraindre les grandes surfaces à donner leur sirplus aux associations afin d'enrayer la faim de manière générale.\n\nNe pas attendre la délation par un concitoyen comme c'est déjà le cas."
    },
    "222": {
      id: 1141,
      category: "consommer",
      title: "Réutilisation des emballages alimentaires",
      body: "Bonjour, je me bat depuis déjà quelques mois pour mettre en place la première usine de traitement des emballages alimentaires pour leur réutilisation sous leur forme primaire. \nJe me confronte à plusieurs défis, en l occurence la lois m'en empêche. \nIl est nécessaire pour réduire nos émissions à effets de serre et pour respecter nos engagements de COP21 de réduire la fabrication neuve de ces déchets. \nJe souhaiterais donc présenter ce projet qui existe déjà dans d autre pays de l'Union Européenne ainsi que l évolution de l industrie du plastique et du recyclage français pour une meilleure gestion de ces déchets."
    },
    "223": {
      id: 1148,
      category: "consommer",
      title: "Création d'un label quantité de gaz à effet de serre emis",
      body: "Création d'un label \"quantité de gaz à effet de serre emis\" obligatoire sur tous les produits de consommation.\n\nc'est un outil puissant qui fera évoluer les entreprises de façon relativement rapide sur leur façon de produire. À l'instar du nutriscore sur les produits alimentaires et du développement d'applications  qui notent leurs impacts sur la santé.\n\nAvec un label \"quantité de gaz à effet de serre emis\" , chaque consommateur peut contribuer directement par ses achats à pousser les entreprises à être plus vertueuses."
    },
    "224": {
      id: 1151,
      category: "consommer",
      title: "Consommation energetique et data centers",
      body: "Les data centers représentent un lieu majeur de consommation énergétique.\nils sont source de production de CO2 et du réchauffement climatique.\nils sont un lieu de surveillance des individus\nils utilisent des métaux rares\ncette consommation se fera toujours au détriment de la consommation individuelle en cas de manque.\n\nPropositions:\ntransparence du stockage des données: qui ? ou ? quels documents ?\nréduction du stockage"
    },
    "225": {
      id: 1782,
      category: "consommer",
      title: "Suppression des sports mécaniques",
      body: "Ce serait sans doute une mesure anecdotique en regard des enjeux. Mais comment justifier cette débauche de consommation de matières premières et d’énergie à seuls fins de loisir/spectacle?\nCe serait en tout cas un signal fort pour marquer les esprits et montrer l'urgence de l'action.\nÇa pourrait se faire en réglementant le sponsoring et la publicité par exemple."
    },
    "226": {
      id: 1783,
      category: "consommer",
      title: "Publicités panneaux videos",
      body: "Arrêter les panneaux de pub vidéos dans le métro les gares ou ailleurs"
    },
    "227": {
      id: 1260,
      category: "consommer",
      title: "Interdire le lancement automatique de vidéos en ligne",
      body: "Les services numériques ont aujourd'hui un impact énorme sur le climat et l'environnement, et la facture énergétique du secteur est en forte croissance chaque année.\nParmi eux, les services de vidéo en \"streaming\" représentent près de 60% du traffic et sont les plus consommateurs à tous les points de vue (serveurs, datacenters, infrastructure réseaux, terminaux des utilisateurs).\nCes services aujourd'hui ont tous un mécanisme dit \"autoplay\" qui consiste à lire une ou des vidéos de manière automatique et sans demander à l'utilisateur, et ce à des fins commerciales (retenir l'utilisateur le plus longtemps sur la plateforme). Cet \"autoplay\" se manifeste aussi par la lecture automatique de nouvelles vidéos lorsque celle en cours se termine.\nGlobalement, l'autoplay engendre une consommation accrue de vidéos en streaming, alourdissant la facture environnementale.\nIl faut donc interdire la lecture automatique \"par défaut\" et sans demande à l'utilisateur. Ces fonctionnalités d'autoplay pourraient tout de même être activées par l'utilisateur si il le souhaite."
    },
    "228": {
      id: 1154,
      category: "consommer",
      title: "Taxer les industries qui font des emballages plastiques",
      body: "On sait aujourd'hui que le plastique a une alternative : l'algue entre autre. L' État doit taxer non pas le consommateur mais l'industrie qui fabrique les packaging en plastique. Il faut cesser cela. Même avec les alertes sur l'environnement, les industries continuent toujours plus leur packaging en plastique (paquets de gâteaux individuels ...). Il faut les sanctionner et vite."
    },
    "229": {
      id: 1156,
      category: "consommer",
      title: "Carte quota carbone",
      body: "Freins actuels à la diminution des émissions de GES:\n- manque de connaissances de l'impact carbone de chaque activité ou produit consommé\n- réguler son impact carbone individuel revient à remplacer certaines actions émettrices par d'autres, émettrices aussi mais un peu moins !! (on ne compense pas)\n- tout le monde ne s'implique pas forcément dans la démarche\nEnfin, les interdictions de certaines activités polluantes pourraient être très mal vécues par certains. \n\nDONC : en lien avec les limites planétaires annuelles, définir un \"quota d'émission autorisée par individu par an\" et créer une Carte Quota Carbone dans laquelle chacun dispose de son budget carbone annuel. Lors de chaque achat ou prestation, le citoyen fait débiter son montant carbone de la carte et on lui communique le solde qui lui reste jusqu'à la fin de l'année. \n\nLe quota me semble être la solution la plus efficace et la plus JUSTE socialement. En plus d'informer au quotidien sur l'impact de chaque activité, il limite et responsabilise. A gérer de la même façon qu'on gère son budget.\n\nA mettre en place nationalement, le soumettre ensuite à l'UE,  idéalement diffusion internationale aux pays les plus émetteurs.\n\nSi le coût GES de chaque produit ou prestation prend réellement en compte toutes les émissions (matières premières, fabrication et transport inclus) les produits les plus émetteurs seront moins consommés donc injonction indirecte aux entreprises à diminuer leur bilan carbone elles aussi."
    },
    "230": {
      id: 1205,
      category: "consommer",
      title: "Développer les petits commerces en ville et village",
      body: "Les gens font leurs courses en prenant leur voiture pour aller dans un hypermarché à la périphérie urbaine.\n\nIl faut au contraire, développer le retour des petits commerces en ville et village où l'on peut se rendre à pied ou en vélo.\nL'usage de la voiture doit devenir l'exception et non plus la norme.\n\nLa construction de nouveaux grands centres commerciaux doit être interdit. Interdire les agrandissement. Ceux existant taxé.\n\nInciter les grandes enseignes à faire plusieurs petits magasins de proximité plutôt qu'un grand supermarché, pas que à Paris.\n=> une taxe exponentielle sur la superficie du magasin"
    },
    "231": {
      id: 1206,
      category: "consommer",
      title: "Eviter que ma brique de lait parcourt 800 km entre la vache et moi; ",
      body: "La marque \"bleu blanc coeur\" qui se glorifie de nous permettre de consommer local semble n'avoir qu'une usine de conditionnement (44), ce qui fait que le lait produit dans la région (Nouvelle Aquitaine) fait 400km pour aller à l'usine et 400km pour revenir chez moi; alors qu'une usine de produits laitiers (à Claix 16) a fermé très recemment, avec destructions d'emploi, sauf pour les chauffeurs routiers. J'ai verifié: idem pour le Jura (600km) et l'Ile de France.\nJe pense que ce n'est qu'un exemple et on doit pouvoir en trouver des centaines."
    },
    "232": {
      id: 1202,
      category: "consommer",
      title: "Imposer une taxe carbone mais avec compensation financière préventive pour les moins aisés.",
      body: "Imposer une taxe carbone sur chaque produit émetteur mais avec compensation financière préventive pour les moins aisés.\nPour éviter le fiasco de la taxe carbone 2018, il faut protéger les plus précaires en leurs attribuant en début d'année une allocation pour acheter des produits pour l'instant indispensable mais très émetteur .\nEn effet tous les experts semblent s'accorder sur le fait que la taxe carbone est le levier le plus efficace pour faire diminuer la consommation et donc la production de produits à émission de gaz à effet de serre.\nEnsuite,  s'assurer que la taxe va uniquement servir à la lutte contre le changement climatique et pas à autre chose."
    },
    "233": {
      id: 1265,
      category: "consommer",
      title: "A problème global, solution Globale: Le Concept Dit Zident",
      body: "Bonjour,\n\nA tout hasard donc,\nvoici pour synthétiser, \nle Concept Dit Zident...\n\nhttp://www.philippe-laffont.net/LeConceptDitZidentA6.pdf\n\nhttp://www.philippe-laffont.net/2019LeGrandDebat.pdf\n\nConnaissez-vous, ne serait-ce qu'un équivalent théorique?\n\n;-)\n\nPhilippe LAFFONT"
    },
    "234": {
      id: 1550,
      category: "consommer",
      title: "Obsolescence contrôlée",
      body: "Bonjour, \nJe pense qu'il faudrait produire de manière plus pérenne. En effet, je suis âgé de 37 ans. Je constate sur un grand nombre d'objet que ceux ci ne tiennent plus aussi longtemps qu'avant. \nUne batterie de voiture il y a 30 ans devait être changé tous les 10 ans, aujourd'hui une batterie tient en moyenne 3 ans. Il en est de même pour un grand nombre d'objet. (Télé - voitures - outils....) \nMerci."
    },
    "235": {
      id: 1274,
      category: "consommer",
      title: "Filière Vêtements ",
      body: "Il faut obliger les magasins de vêtements à proposer des articles de seconde main. Les points de vente ne doivent pas proposer plus de 20% d’articles neufs. Une filière de la seconde main peut se développer, il est possible de composer de nouveaux vêtements avec  des pièces de tissus prélevées, récupérer la laine et autre matière pour en recomposer d’autres. Les kms parcourus sur l’ensemble du cycle seront donc réduits sur  l’ensemble du cycle, il n’y aura plus de teinture de tissus néfaste, moins d’eau consommée  pour créer un vêtement , moins de pesticides pour faire pousser du coton  ... \nPour une filière du vêtements juste pour les hommes 👫 et sûre pour la planète 🌍 ."
    },
    "236": {
      id: 2727,
      category: "consommer",
      title: "Augmenter la durée de la garantie constructeur",
      body: "Le matériel que nous achetons est de plus en plus éphémère (obsolescence programmée, réparation impossible, effet de mode, ...)\nOr, le coût énergétique de fabrication d'un appareil est très souvent bien supérieur au coût énergétique de son utilisation.\nPour lutter contre ce gaspillage, il serait intéressant de rendre obligatoire une garantie constructeur supérieure à 5 ans."
    },
    "237": {
      id: 2726,
      category: "consommer",
      title: "Privilégier les moyens de chauffage à bas rejets de CO2",
      body: "Le chauffage représente près du tiers de nos rejets de CO2.\nIl convient de stopper la filière fuel et charbon très polluante.\nL'actuelle réglementation thermique (RT 2012) pour les logements neufs privilégie indûment le gaz par rapport à l'électricité. La conséquence est d'augmenter ainsi nos rejets de CO2 (rappelons que l'usage de l'électricité est largement décarbonee en France grâce à l'hydraulique et au nucléaire ...).\nCette RT 2012 doit être remplacée par la RE 2020, en cours d'élaboration. \nC'est l'opportunité de privilégier les pompes à chaleur réversibles, de proposer l'autoconsommation avec PV en consacrant une partie des sommes de la CSPE aux investissements plutôt que de les consacrer exclusivement aux EnR intermittentes (121 milliards engagés !)"
    },
    "238": {
      id: 1353,
      category: "consommer",
      title: "Garantir le minimum d'impact écologique des produits et services",
      body: "Autoriser uniquement la commercialisation des produits ou services dont on a la certitude de savoir comment ils seront effectivement et efficacement recyclés et interdire la mise sur le marché de tout autre produit ou service (y compris leurs emballages) qui ont un impact négatif sur l'environnement (pollution, émissions de gaz à effets de serre...).\nInterdire également aux industriels l'utilisation des suremballages qui n'ont bien souvent vocation qu'à promouvoir le produit et aucune utilité concrète.\nS'assurer de la mise en oeuvre d'un recyclage vertueux : on paye déjà une éco-taxe sur les produits, mais comment est-elle réellement utilisée ???\nA l'heure où nous devons faire un choix puisque les centrales nucléaires sont en \"fin de vie\" et qu'il faudra investir tout aussi massivement pour les \"rajeunir\" que si l'on optait pour le développement des énergies renouvelables, opter pour le système le plus écologique et en finir avec le nucléaire..."
    },
    "239": {
      id: 1203,
      category: "consommer",
      title: "Taxer les importations en fonction de leur empreinte carbone",
      body: "La Chine prévoit 226GW de nouvelles centrales au charbon, soit 3,5 fois le parc nucléaire français. Or la production d’électricité à partir de charbon compte déjà pour 1/3 des émissions anthropiques mondiales de CO2.\n\nEn Europe, en France, avons délocalisé une bonne partie de notre empreinte carbone (et de nos emplois) durant les 40 dernières années, principalement vers l’Asie.\n\nLe seul vrai moyen de pression sur un pays comme la Chine pour l’inciter à réduire ses émissions de CO2 serait que l’UE taxe significativement ses importations en fonction de leur empreinte carbone.\n\nBeaucoup de biens de consommation deviendront plus chers, mais en contrepartie nous « risquons » aussi de fortement relocaliser la production manufacturée (et de créer des emplois), qui fait du mix électrique français (~50 gCO2/kWh) ou même européen (~300 g) sera nettement moins émissive en CO2 que celle des produits importés de Chine (~650 g). En parallèle on pourrait réduire la TVA sur les produits alimentaires et de première nécessité.\n\nIl serait naïf de croire que mettre en place cette taxe se fera sans mesures de rétorsion de la part des pays exportateurs. Mais si c’est fait au niveau de l’UE, première puissance économique mondiale, le moyen de pression sera très élevé.\n\nDans un premier temps, notamment face à l’opposition prévisible de l’Allemagne, cette mesure pourrait déjà être prise au niveau français, pour tous les produits fabriqués hors UE. L’UE finira bien par suivre."
    },
    "240": {
      id: 1781,
      category: "consommer",
      title: "Réglementation de la publicité",
      body: "Il faudrait interdire les publicités pour des produits émetteurs de gaz à effet de serre et destructeurs de l'environnement. Je pense en premier à la viande, aux véhicules à moteur, aux voyages en avion, etc... Il suffirait de déterminer leur empreinte écologique. Au contraire favoriser les publicités pour les produits vertueux : alimentation bio, locale, vélo, etc..."
    },
    "241": {
      id: 2325,
      category: "consommer",
      title: "Renoncer à refroidir la planète pour éviter de la réchauffer",
      body: "La climatisation augmente notre consommation énergétique et donc le réchauffement.\nCe n'est pas (encore) un des premiers poste de consommation.\nMais c'est très symbolique.\nLa climatisation est le symbole de la fuite en avant qui permet  de penser qu'il existe un refuge , au moins pour quelques-uns.\nContre-carrer cette fuite en avant induirait un changement de mentalité et augmenterait l'exigence de solutions.\nLimiter les GES c'est nécessairement consommer moins de matériel et donc renoncer à certaines consommations et libertés.\nAlors renoncer au symbole me parait un bon début.\nInterdire la climatisation, c'est (assez) facile à faire et très difficile à faire comprendre. \nMais trouvez-moi un autre renoncement plus facile et avec autant d'impact (psychologique ou physique) . Faire des enfants ? Bon courage.\nHauts les cœurs."
    },
    "242": {
      id: 1221,
      category: "consommer",
      title: "Consigne sur le verre",
      body: "Il faut commencer par créer une consigne sur les bouteilles en verre pour créer une filière française de ré-emploi."
    },
    "243": {
      id: 1326,
      category: "consommer",
      title: "Prendre en compte les importations !",
      body: "On sait que le facteur majeur de la réduction des émissions de GES de la France ces dernières décennies est la désindustrialisation de notre pays : nous ne produisons plus de CO2 en fabriquant des produits manufacturés, mais nous les achetons aux Chinois qui les produisent pour nous, en assumant eux-mêmes cette production de CO2, en plus avec des technologies moins efficaces, et ce au prix de transports beaucoup plus longs, eux-mêmes émetteurs de GES.\nLe problème existe aussi en agriculture : du fait de l'importance de notre consommation de viande, nous importons de la nourriture pour nos animaux d'élevage, dont la culture hors d'Europe monopolise des terres cultivables, produit des GES et implique des transports sur de longues distances.\nDes mesures qui n'intégreraient pas ces problèmes seraient hypocrites : nous devons produire moins de GES tant par notre consommation que par nos importations !"
    },
    "244": {
      id: 1280,
      category: "consommer",
      title: "Responsabiliser les hypermarchés ",
      body: "Il faut obliger la mesure des articles emballés en plastique passés en caisse (scan d’un code permettant d’identifier du plastique recyclable, déjà recyclé ou non) et pénaliser les magasins qui dépassent un quota de vente à fixer. Les actes éco-responsables doivent être partagés entre le consommateur qui doit préférer des articles en vrac  et les points de vente qui doivent travailler avec leurs fournisseurs pour transitionner."
    },
    "245": {
      id: 1234,
      category: "consommer",
      title: "Consommation et déchets",
      body: "Le constat est sans appel, la consommation génère des quantités énormes de déchets qui sont brûlés, enfouis ou que l'on retrouve dans la nature, exemple emblématique le plastique. \n\nTout d'abord il faut agir sur la conception des produits consommés (objet+son emballage) pour que ceux-ci soient recyclables facilement (définir des normes et les rendre obligatoires pour la commercialisation). Actuellement les produits sont conçus pour être attractifs et vendus plus facilement sans aucune contrainte sur leurs capacités à être recyclés. Un objet partiellement recyclable doit être défavorisé par rapport à un objet entièrement recyclable."
    },
    "246": {
      id: 1235,
      category: "consommer",
      title: "Ordures ménagères et encombants",
      body: "On ne parle jamais de nos déchets enfouis. Allez dans une déchetterie  et regardez les bennes de \"tout-venant\" qui vont à l'enfouissement, c'est indécent. Il faut que la quantité d'ordure et de déchets non recyclables aient un coût pour inciter à l'achat d'objets plus vertueux et recyclables. Rien n'est fait (au niveau de la conception) pour inciter à conserver ses objets et les réparer.\nLa taxe ordures ménagères n'incite pas à réduire ses déchets quotidiens. Je paye autant que mon voisin dont les poubelles débordent alors que je composte et que je n'achète quasiment pas de produit emballé. Je sors mes poubelles une semaine sur 2 et elles sont quasiment vides. Les poubelles doivent être individualisées et on doit payer en fonction de son poids/volume d'ordure: Exemple je signe un contrat pour un ramassage 2 fois par mois pour un conteneur nominatif de 0,3m3. Si je dépose plus je paye un supplément."
    },
    "247": {
      id: 1329,
      category: "consommer",
      title: "Interdire la publicité et Coopératiser les médias",
      body: "Vivre c'est consommer: c'est que nous apprend tous les jours la publicité.\n\nNous voyons tous les jours plus de 7500 placements de produits et appels à consommer.\n\nConsommer c'est Polluer.\n\nQuelle est l'utilité publique de la publicité ? Absolument  aucune !\n\nLe financement des médias me direz-vous? Changeons-le !\n\nLa propriété des médias : 80% des médias français sont possédés par 9 milliardaires \"philanthropes\" dont le seul objectif est de nous désinformer, de canaliser le peuple et de le faire consommer.\n\nRedonnons la propriété des médias aux journalistes qui les composent. Journalistes qui devront faire fonctionner leur média sur la base de la taxe audiovisuelle et sur les dons et abonnements de leur audience. (cf. les nouvelles formes de média sur Youtube: Thinkerview, Le média, QG, ....)\n\nAinsi les journalistes retrouveront leur indépendance et leur capacité critique envers notre gouvernement et l'oligarchie.\n\nPour ce qui est des publicitaires : organisons une reconversion professionnelle vers des sujets comme l'éducation populaire de la société sur les chaînes publiques aux problèmes écologiques et sociaux: produire de belles émissions pédagogiques, de beaux slogans.\n\nQuestion: pourquoi aucun de vos travaux n'est rediffusé sur les chaines publiques? \nSi le changement climatique est notre priorité, cela devrait occuper 50% du temps de programme de france 2 ou france 3? \nLa série \"Plus Belle la vie\" est-elle si importante?"
    },
    "248": {
      id: 1284,
      category: "consommer",
      title: "Une taxe kilométrique sur les produits de consommation à la place de la TVA",
      body: "Les transports de marchandises et la consommation massive de produits fabriqués parfois à l'autre bout du monde contribuent pour beaucoup aux gazs à effet de serre. Dans le même temps, les producteurs locaux se heurtent à la concurrence internationale face à laquelle il leur est souvent impossible de faire face. \n\nFace à ces problématiques, le remplacement de la TVA par une taxe kilométrique évolutive, appliquée aux produits suivant la distance entre lieu de fabrication et de consommation présenterait plusieurs intérêts :\n\n- cette taxe permettrait d'inciter les consommateurs à se tourner vers la consommation de produits locaux, ce qui réduirait d'autant les gazs à effet de serre liés au transport.\n\n- en étant introduite en lieu et place de la TVA, cette taxe permettrait aux producteurs français de vendre leurs produits à des prix plus concurrentiels et de faire face, de manière plus efficace, à la concurrence internationale.\n\n- cette taxe encouragerait les industriels, désireux d'écouler leurs produits sur le marché français à investir ou réinvestir dans un outil de production situé lui même en France afin d'échapper à cette taxe, ce qui aurait des effets très bénéfiques sur l'emploi.\n\n- la consommation de produits exotiques ou d'aliments hors saison serait taxée de façon plus raisonnée."
    },
    "249": {
      id: 1759,
      category: "consommer",
      title: "Limiter la consomation récréative d'énergies carbonnéss",
      body: "But : Chaque gouttes de pétrole brûlées étant la goutte de trop, Il nous faut déconnecter les\nsentiments de plaisirs et d’amusement de la consommation et combustion d’énergies carbonés.\nL’impact environnemental de ces propositions est sans doute faible, mais dans l’urgence où nous\nsomme la psychologie de groupe est également un terrain de bataille.\n\nInterdiction ou taxation lourde :\n-De tout les engins de loisirs à moteurs thermiques : quads, moto-cross, jet sky, voiture de golf etc...\nqui n’ont pas une utilité social (véhicule de sauvetage, de transport collectif, d’accès à des endroits\nescarpés...)\n-De toutes les activités sportives faisant usage d’engins à moteurs thermiques.\n-Des voitures de collections et des motos grosse cylindré (harley davidson...)\n-De tout les bateaux à moteur thermique de plaisance et des Yacht (qui n’ont pas un but de pêche, de\nsauvetage ou de transport de marchandise et de personnes)\n-De tout les avions privés qui n’ont pas un rôle de transport collectif.\n-Des campings cars ou caravanes selon la situation fiscale et foncière des propriétaires (pour ne pas\npénaliser ceux qui vivent dans leur camions ou qui en ont besoin dans leur mobilité professionnel)"
    },
    "250": {
      id: 1449,
      category: "consommer",
      title: "Loisirs : Interdire tous les sports mécaniques, freiner les domaines skiables",
      body: "Sports mécaniques :  par définition de l'ordre de l'accessoire, le carburant consommé par les sports mécaniques (karting, jet ski, moto cross, quad, ...) est une émission de GES inutile. Et plus que l'effet direct, ces activités, en particulier les plus médiatisées (24h du Mans, Grand prix F1, ...), participent au culte de l'automobile, objet emblématique du XXème,  marqueur de réussite sociale voire de virilité, qui nous pousse à acquérir des véhicules bien plus puissants que nécessaire.\n\nSports d'hiver : en soi, c'est une activité très dispendieuse en énergie qui génère un trafic automobile important vers les massifs montagneux. De plus, les domaines empiètent sur des zones parmi les dernières du territoire à rester sauvages, et sont donc des puits de carbone. Enfin, c'est une activité réservée aux français les plus aisés. Il faut dans un premier temps interdire toute création ou extension de domaine skiable, puis de créer une taxation progressive des remontées mécaniques afin renchérir et diminuer cette pratique.\n\nFoot : un acte symbolique fort serait de boycotter la coupe du monde de football 2022 au Qatar, qui est une aberration écologique (stades climatisés, pour nombre d'entre eux construits uniquement pour l'événement)."
    },
    "251": {
      id: 1294,
      category: "consommer",
      title: "Obilgation d'information sur le bilan carbone de tout produit ou service",
      body: "Un système simple permettant au consommateur de:\n- prendre conscience des émissions qu'il génère avec chaque acte de consommation\n- arbitrer en différents produits en faveur du moins émetteur\n\nEt aux industriels de:\n- tenir une comptabilité carbone poussée\n- réduire leur empreinte carbone pour continuer de vendre\n\nInsistons sur l'absolue nécessité d'avoir un système immédiatement intelligible: par exemple 3 couleurs Rouge-Orange-Vert ou une tranche de quantité de gaz à effet de serre émise par unité pertinente (poids, volume, nombre de pièces) avec un cahier des charges central pour que chaque type de produits soit évalué de manière comparable.\n\nOn verrait ainsi par exemple des lasagnes surgelées très rouges alors les tomates en vrac seraient très vertes."
    },
    "252": {
      id: 1784,
      category: "consommer",
      title: "Les ostréiculteurs sont très très inquiets pour leurs productions",
      body: "Les ostréiculteurs sont très très inquiets pour leurs productions  parce qu’ils reçoivent beaucoup trop d’eau douce l’hiver et surtout une eau très polluée par les matières fécales des stations d’épurations… en période de crue les stations débordent dans les rivières … avec tous les polluants !\nBeaucoup trop d’eau douce l’hiver et pas assez l’été … ils se demandent si on ne pourrait pas réguler un peu mieux en amont du bassin versant…  réflexion pleine de bon sens d’un homme de terrain mais qui va à l’encontre  des actions des fonctionnaires de la DDT et de la DREAL … qui au contraire détruisent toutes les retenues pour que les sédiments rejoignent la mer !\nJe ne comprenais pas pourquoi les sédiments devaient absolument rejoindre la mer et on vient de me fournir une explication tout à fait cohérente : La directive européenne impose juste de retrouver un état sanitaire satisfaisant des rivières, la destruction des retenues et l’écoulement des sédiments est une adaptation purement française de la directive … mais pourquoi évacuer les sédiments qui se déposent en amont des retenues alors qu’autrefois on s’en servait pour fertiliser les champs ? la réponse n’est pas très reluisante : les sédiments sont fortement pollués par les rejets des stations et les ruissellements des villes !"
    },
    "253": {
      id: 1447,
      category: "consommer",
      title: "Interdire les dalles vidéo publicitaires (écrans publicitaires dans le métro et autres lieux publics)",
      body: "Les affiches de publicité sont de plus en plus remplacées par des écrans géants dans les transports en commun ou les lieux publics.\nCes écrans consomment énormément d'énergie sans aucune valeur ajoutée sociétale. Par ailleurs l'électronique embarquée consomme des métaux et des terres rares qui sont plus utiles pour d'autres applications. Enfin il s'agit de matériel importé sans valeur ajoutée pour l'économie française.\nCes écrans devraient être interdits pour être remplacés par des affiches."
    },
    "254": {
      id: 2042,
      category: "consommer",
      title: "Réduction des éclairages publics",
      body: "Bonjour, \nPourquoi autant de gaspillage à cette période de l'année, tant de lumières, décos, éclairages superflus. Les décos de Noël sont allumées depuis fin novembre et le resteront jusqu'à fin janvier. On nous demande de faire des économies d'énergie en utilisant des ampoules basses consommation mais il y a bien du gaspillage dans nos villes et villages en ce moment, ne faudrait-il pas limiter cela ? \nMerci, bien à vous,\nRaphaël Riolon"
    },
    "255": {
      id: 1365,
      category: "consommer",
      title: "Pour une tarification incitative aux économie",
      body: "Revoir le mode de tarification de l'eau du gaz et de l'électricité. La part des coûts fixes (abonnement, raccordement etc..) est trop importante vis à vis des coûts variables directement liés à votre consommation. Ce mode de facturation n'incite pas à réduire sa consommation.\nIl serait plus judicieux pour inciter l'usager à consommer moins de baisser les frais fixes et augmenter les frais variables. Pour ma part je suis passé de 90 m3 à 27 m3 d'eau (du fait de l'utilisation de toilettes sèches et de récupération d'eau pluviale pour le jardin ) la réduction est notable mais la diminution de la facture est peu significative."
    },
    "256": {
      id: 1484,
      category: "consommer",
      title: "Créer les conditions de la revalorisation des produits",
      body: "Les structures du remplois s'appuient sur des modes de financements bancaux, perfusés aux subventions, des rémunérations au lance pierre, du bénévolat pour pallier aux surproductions, éviter l'incinération ... ou vivent péniblement d'un travail artisanal de réparation en dépit de compétences digne des métiers d'avenir.\n\nDilemme entre gros employeurs industriels multinationaux et tissus économique dense, solide et agile. Quelques pistes : \n- Recenser les couts réels du traitement des déchets (payé deux fois par les contribuables)\n- Définir les coûts de traitement et la valeur des services rendus à la collectivité + à l'environnement par ces acteurs (au même titre que les services rendus par certains agriculteurs représentent des économies indirectes pour le contribuable) \n- en renforcant les contraintes fabriquant (ecoconception, responsabilité élargie du producteur) de nouvelles opportunitées se créent \n- faciliter la transmission de ces savoirs faire pour soutenir le remploi la réparation ( aussi auprès des citoyens)\n- faciliter la création de groupement d'utilisateurs, de locations (informatique, consoles, électroménager, véhicules ...)"
    },
    "257": {
      id: 2041,
      category: "consommer",
      title: "Réductions des médicaments/emballages",
      body: "Bonjour, \nIl serait judicieux de faire comme en GB ou dans d'autres pays et donner le nombre exact de médicaments prescrits par le médecin. Pourquoi conserver des boites avec des médicaments inutilisés puis jetés. Le lobby des labos devrait comprendre que cela est mieux pour l'environnement. Moins d'emballage, moins de déchets. \nMerci, bien à vous. \nRaphaël Riolon"
    },
    "258": {
      id: 1544,
      category: "consommer",
      title: "Stopper la mise en place de tout accord de libre échange",
      body: "STOPPER la mise en place de tout accord de libre échange et DÉNONCER ceux déjà existants dans la mesure où ils s’affranchissent des distances et des taxes. \n\nL’économie ne se préoccupe pas de l’homme ni de sa planète. La théorie de la libre concurrence économiquement saine et vertueuse a ses limites : Elle n’intègre que les valeurs prises en compte par les lois économiques mais omet les autres valeurs humaines (déplacements, mobilité, qualité de vie, …) et terrestre (stocks, renouvellements des ressources, pollutions, faune et flore, climat, …) et ne pondère pas suffisamment la valeur des transports. A ces égards par exemple quels intérêts pour la planète et pour l’humanité : vendre aux USA une voiture française quand dans le même temps se vend une américaine en France."
    },
    "259": {
      id: 2043,
      category: "consommer",
      title: "Bonus/Malus contre le surremballage",
      body: "Afin de limiter la production d'emballages pas ou peu recyclables (notamment plastique), il faudrait introduire un malus de taxes pour les marques ne faisant aucun effort pour réduire l'impact écologique de leur produit. Ce malus pourrait servir à financer un bonus accompagnant les marques plus vertueuses qui utilisent moins d'emballages et surtout moins de plastiques (verre et carton).\nUne mesure vient d'être votée pour interdire le plastique à usage unique d'ici 2040, mais il faut être beaucoup plus radical.\nS'il vous plaît, faites ressortir des mesures contraignantes et rapides !\nMerci de la prise en compte de ma contribution et bon courage."
    },
    "260": {
      id: 1476,
      category: "consommer",
      title: "Placement bancaire transition écologique et solidaire",
      body: "Le financement de la transition écologique et solidaire pourrait se faire par des placements bancaires orientés vers cette cause primordiale exclusivement."
    },
    "261": {
      id: 1523,
      category: "consommer",
      title: "Les pratiques sportives",
      body: "Une éco-contribution lors de l'adhésion annuelle à la fédération sportive de son choix, éco-contribution modique mais qui serait en lien et proportionnelle à la pollution et aux GES générés par telle ou telle pratique sportive ?\n\nAuditionner les président-es des fédérations nationales pour évoquer avec eux l'impact environnemental du sport qu'ils représentent aux différents niveaux de pratique et ce que chaque fédé peut faire -outre la collecte d'une éco-contribution liée à l'adhésion annuelle- auprès de ses adhérents pour réduire le cas échéant cet impact ?\n\n\nLes fédérations sportives, constituées sous la forme associative, ont pour objet l’organisation d’une ou plusieurs disciplines sportives, dont elles gèrent la pratique, de l’activité de loisir au sport de haut niveau.\nPlusieurs types de fédérations peuvent être distingués (...).\nSource : sports.gouv.fr\n\n\nEn 2012 un guide \"bilan carbone\" avait été mis à disposition des fédérations de sport. Il semblerait hélas qu'il n'y ait eu aucun suivi par la suite (à vérifier).\n\nHTTP://www.developpement-durable.sports.gouv.fr/zoom-sur/article/le-bilan-carbone\n\n\nNB : également membre du collectif Un Climat de Changement mais nos circuits de validation sont plus lents tandis que si \"les 150\" retiennent cette proposition, il n'y a pas une minute à perdre pour trouver le créneau permettant d'auditionner les président-es des fédérations sportives."
    },
    "262": {
      id: 1877,
      category: "consommer",
      title: "Pub, obsolescence, occasion, réparation, Low-Tech",
      body: "Interdire les produits inutiles chinois en plastique, si une alternative française écologique existe.\nInterdire à la vente les téléviseurs de plus de 40 pouces\nDiviser par trois le flux vidéo consommé par personne\nLimiter l’achat de vêtements neufs à 1 kg par personne et par an, pour privilégier le second main.\nCréer des campagnes de communication pour le recyclage, le don de vêtements (à la croix rouge, Emmaüs, autres asso.).\nCréer les asso/club de couture, de réparation et de low-tech dans chaque commune et chaque école (ou mais un cours dédié pour les garçons et les filles).\nRationnement de certains produits de consommation importé tels que le café, le thé…\nPub (vidéo, audio, affiche…) interdite pour tout (sauf pê les produits vraiment écolo)\nExtinction de l’éclairage public après 22h (sauf événement festif).\nInterdire les écrans de pub lumineux partout en France.\nCombattre l’obsolescence programmée, fabriquer des produits durables made in France (de la matière première à la vente) (Ampoule qui a + de 100 ans : https://www.youtube.com/watch?v=jETnpL-nCJw)"
    },
    "263": {
      id: 1345,
      category: "consommer",
      title: "TVA réduite sur les produits",
      body: "LA TVA réduite est déjà appliquée sur certains produits et service. Appliquer systématiquement une TVA réduite sur les produits de première nécessité et/ou non transformés et/ou sans pesticides (fruits et légumes, farine, sucre, oeufs...) pour les rendre plus accessibles et donc favoriser un accès à une alimentation de qualité au plus grand nombre (actuellement, les produits les moins chers sont aussi les moins qualitatifs...).\nPour favoriser l'accès à ces produits de qualité en minimisant le transport, et donc l'empreinte carbone, appliquer une TVA encore moindre, voire nulle, si ces produits sont locaux et/ou en vente directe c'est-à-dire non expédiés (pas de transport puisque produits et consommés localement). Créer sur les sites internet des mairies un espace \"produits et producteurs locaux\" qui recense les informations utiles à cette consommation locale (banque de données qui contiendrait les informations utiles : présentation de chaque producteur, coordonnées, produits proposés, modalités de commercialisation...)."
    },
    "264": {
      id: 1462,
      category: "consommer",
      title: "Instaurer un \"score environnemental\" des produits",
      body: "Bonjour,\nJe suggère d'instaurer un système qui permettrait de connaître l'impact écologique de ce que l'on achète (tout produit), à la manière du nutri-score. Cela permettrait de prendre en compte tout le cycle de vie du produit.\nCela prendrait en compte le mode de production, les matériaux utilisés, la provenance (des matériaux et le/les lieux de fabrication), et également l'impact écologique de l'emballage (matière, provenance, recyclabilité...). Cet impact pourrait être exprimé en quantité de CO2 émis.\n\nLes produits avec le score environnemental le moins bon pourrait être taxés, ce qui avantagerait les autres.\n\nMerci."
    },
    "265": {
      id: 2284,
      category: "consommer",
      title: "Encourager les produits à faible impact CO2",
      body: "ABAISSER LA TVA SUR LES PRODUITS FAIBLES ÉMETTEURS DE CO2 :\n- véhicules électriques \n- électricité \n- recherche sur le stockage électrique"
    },
    "266": {
      id: 2228,
      category: "consommer",
      title: "Carte de Crédit Carbone",
      body: "Généraliser une alerte sur votre carte bancaire sur la quantité de carbone que vous générer en achetant un bien.\nCela se produit en généralisant la mesure (sur toute la chaîne de valeur) du carbone et communiquer cette mesure sur les étiquettes des prix (de la simple tomate à la voiture).\n\nDans un premier temps informatif...\nPlus d'info: Doconomy"
    },
    "267": {
      id: 1483,
      category: "consommer",
      title: "Viser la neutralité carbone du Web",
      body: "Internet le numérique représenteront prochainement 10% des EGES sans compter l'impact sur les ressources et les ecosystèmes ! Quelques pistes :\n\nsuppression automatique des archives mail, publicitaire apres X annees \nsupression automatique des sites inutilisés depuis X annees \nrèglementer les volumes, prestataires de mailing (volumes d’envoi, stockages, tarifs ... \nfilière france/europe remanufacturing d'ordinateur\nobligation d'eco-conception\ncompensation carbone obligatoire (responsabilité des fabriquants)"
    }
  }
)
preprocessing.file.attach(io: File.open(Rails.root.join("db", "seeds_data", "subset_raw_data.csv")), filename: "subset_raw_data.csv")
preprocessing.save!
