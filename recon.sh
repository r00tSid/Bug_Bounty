#!/bin/bash

# Created by r00tSid 

# Tool 1: subfinder

echo "Running subfinder..."

subfinder -dL domains.txt -silent | anew subdomains.txt

subfinder -dL subdomains.txt -silent | anew subdomains.txt

# Tool 2: assetfinder

echo "Running assetfinder..."
cat domains.txt | assetfinder -subs-only | anew subdomains.txt

cat subsubdomains.txt | assetfinder -subs-only | anew subdomains.txt

# Tool 3: amass

echo "Running amass..."

amass enum -df domains.txt -active -config ../config.yaml | anew amass.txt

# Tool 4: subbrute.py and massdns

echo "Running subbrute.py and massdns..."

python subbrute.py /usr/share/amass/wordlists/jhaddix_all.txt --domains domains.txt | massdns -r ../Tools/massdns/lists/resolvers.txt -t A -o S -w massdns.txt

# Tool 5: sed

echo "Processing massdns output..."

cat massdns.txt | sed 's/A.*// ; s/CN.*// ; s/\..$//' | anew bruteforced_subs.txt

# Tool 6: httpx

echo "Running httpx..."

cat subdomains.txt | httpx -silent -t 25 | anew live_subdomains.txt

# Tool 7: aquatone

echo "Running aquatone..."

cat live_subdomains.txt | aquatone -out aquatone -chrome-path ../Tools/chrome-linux/chrome --threads 3

# Tool 8: naabu

echo "Running naabu..."

cat subdomains.txt | naabu -p - -exclude-ports 443,80,8080,8000 | anew naabu.txt

echo "All tools executed."
