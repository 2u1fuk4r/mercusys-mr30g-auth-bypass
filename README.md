# Mercusys / TP-Link MR30G Authentication Bypass (PoC)

## Overview
This repository contains a proof-of-concept (PoC) demonstrating an authentication bypass vulnerability in the Mercusys / TP-Link MR30G 4G LTE router web management interface.

Due to improper access control, several internal backend endpoints can be accessed without authentication, allowing retrieval of device and network-related information.

**CVE Status:** CVE-PENDING

---

## Affected Device
- Vendor: Mercusys / TP-Link
- Model: MR30G (4G LTE Router)
- Interface: Web Management Interface

---

## Vulnerability Details
Certain backend endpoints do not properly enforce authentication checks. An attacker with network access to the device can interact with these endpoints directly and obtain internal information such as:

- WAN configuration and status
- Cloud-related configuration data
- Router feature and capability details

---

## Proof of Concept (PoC)

The following script demonstrates unauthenticated access to affected endpoints.

### Usage
```bash
bash mrg30-poc.sh
