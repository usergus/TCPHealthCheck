#!/bin/bash

# Initialiser un objet JSON
jsonResult="{"

# Tester le port 22 sur servera
resultServerA=$(echo quit | telnet servera 22 2>&1 | grep "Connected to")
if [ -n "$resultServerA" ]; then
  jsonResult+="\"servera\":{\"port\":22,\"status\":\"success\"},"
else
  jsonResult+="\"servera\":{\"port\":22,\"status\":\"failure\"},"
fi

# Tester le port 123 sur serverb
resultServerB=$(echo quit | telnet serverb 123 2>&1 | grep "Connected to")
if [ -n "$resultServerB" ]; then
  jsonResult+="\"serverb\":{\"port\":123,\"status\":\"success\"}"
else
  jsonResult+="\"serverb\":{\"port\":123,\"status\":\"failure\"}"
fi

# Finaliser l'objet JSON
jsonResult+="}"

# Afficher le résultat JSON
echo $jsonResult | jq .

