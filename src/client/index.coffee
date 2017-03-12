#!/usr/bin/env coffee

# Développeur ....: K3rn€l_P4n1K
# Description ....: prime-database-client
# Date de création: samedi 4 mars 2017, 16:03:20 (UTC+0100)
# Plateformes ....: Ubuntu

# Fonctionnalité .: Client pour requêter la BDD de nombres premiers
# Intention ......: Fournir les autres applications en nombres premiers
# Remarque .......:

# ----------
# Constantes
# ----------

bundle="/package.json"
extra=/\/[a-zA-Z]+\/client$/
CONSTANT=
  # Version courante
  version: require(__dirname.replace extra, bundle).version

# --------------------
# Dépendances externes
# --------------------

VENDOR=
  program:require 'commander'

ext=__filename.match /\.[a-zA-Z]+$/
service=__dirname.replace /client.*$/, "service/PrimeDatabaseService#{ext}"
LIB={primeDB:require service}

# --------------
# Initialisation
# --------------

# Gestion des arguments console
VENDOR.program
  .version(CONSTANT.version)
  .option(
    '-n, --nth [number]'
    , 'Donne la valeur du nombre premier à l\'indice n'
    , 1).parse process.argv

if VENDOR.program.nth
  print=(row)->
    console.log row.value
  new LIB
    .primeDB()
    .getNth(parseInt(VENDOR.program.nth), print)