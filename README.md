# Bug_Bounty

# recon.sh

## Overview

**`recon.sh`** is a comprehensive Bash script created by **r00tSid** for automating the reconnaissance process in bug bounty hunting and cybersecurity assessments. The script leverages a variety of tools to discover subdomains, assess live hosts, and perform vulnerability scanning, making it an essential tool for security professionals.

## Features

- **Subdomain Enumeration**:
  - Uses `Subfinder`, `Assetfinder`, and `Amass` to identify subdomains associated with target domains.
- **Brute Force & DNS Resolution**:
  - Integrates `subbrute.py` and `Massdns` to brute force and resolve subdomains.
- **Live Host Detection**:
  - Employs `HTTPx` to check for active subdomains.
- **Screenshot Capturing**:
  - Utilizes `Aquatone` to take screenshots of live subdomains for easier visualization.
- **Port Scanning**:
  - Executes `Naabu` to perform port scanning on discovered subdomains.

## Prerequisites

Ensure you have the following tools installed:

- [Subfinder](https://github.com/projectdiscovery/subfinder)
- [Assetfinder](https://github.com/tomnomnom/assetfinder)
- [Amass](https://github.com/OWASP/Amass)
- [Massdns](https://github.com/blechschmidt/massdns)
- [HTTPx](https://github.com/projectdiscovery/httpx)
- [Aquatone](https://github.com/michenriksen/aquatone)
- [Naabu](https://github.com/projectdiscovery/naabu)
- [anew](https://github.com/tomnomnom/anew) by TomNomNom
- [subbrute.py](https://github.com/TheRook/subbrute) script

## Installation

1. **Clone the repository and navigate to the directory**:

    ```bash
    git clone https://github.com/yourusername/recon.sh.git
    cd recon.sh
    chmod +x recon.sh
    ```

2. **Install `anew`**:

    ```bash
    git clone https://github.com/tomnomnom/anew.git
    cd anew
    go build
    ```

    Move the `anew` binary to your `PATH` or use it directly from the `anew` directory.

## Usage

Run the script with a list of domains provided in `domains.txt`:

```bash
./recon.sh
```

### Script Breakdown

1. **Subfinder**:
    - Runs `Subfinder` twice: first on the initial domain list and then on the discovered subdomains for deeper enumeration.

2. **Assetfinder**:
    - Uses `Assetfinder` to find subdomains and adds them to the subdomain list.

3. **Amass**:
    - Runs `Amass` in active mode using a custom configuration to discover additional subdomains.

4. **Subbrute.py & Massdns**:
    - Brute forces subdomains using `subbrute.py` and resolves them with `Massdns`.

5. **Sed Processing**:
    - Uses `sed` to clean up the `Massdns` output, extracting valid subdomains.

6. **HTTPx**:
    - Probes for live subdomains by testing HTTP/HTTPS connections.

7. **Aquatone**:
    - Takes screenshots of live subdomains to help visualize the attack surface.

8. **Naabu**:
    - Scans live subdomains for open ports, excluding commonly used web ports.

## Contributions

Feel free to contribute by submitting issues or making pull requests to enhance the script.
