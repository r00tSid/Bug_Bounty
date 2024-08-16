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
    git clone https://github.com/Sidhant0703/Bug_Bounty.git
    cd Bug_Bounty
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
  


Here's a `README.md` for the `automation.sh` script that explains its purpose, usage, and the setup needed. 

---

# automation.sh

## Overview

**`automation.sh`** is a Bash script created by **r00tSid** for automating various reconnaissance and vulnerability testing tasks. It integrates several tools to streamline the process of discovering subdomains, identifying live hosts, and performing vulnerability scans. This script helps in conducting comprehensive security assessments with minimal manual intervention.

## Features

- **Subdomain Enumeration**:
  - Uses `Subfinder`, `Assetfinder`, and `Amass` to gather subdomains associated with a given domain.
- **Live Host Detection**:
  - Employs `HTTPx` to identify which of the discovered subdomains are active.
- **Vulnerability Testing**:
  - Uses `Xray` to perform web application security testing on live subdomains.
  - Uses `Nuclei` to scan for various vulnerabilities based on predefined templates.

## Prerequisites

Ensure you have the following tools installed:

- [Subfinder](https://github.com/projectdiscovery/subfinder)
- [Assetfinder](https://github.com/tomnomnom/assetfinder)
- [Amass](https://github.com/OWASP/Amass)
- [HTTPx](https://github.com/projectdiscovery/httpx)
- [anew](https://github.com/tomnomnom/anew)
- [Xray](https://github.com/chaitin/xray) (ensure you have the `xray_linux_amd64` binary)
- [Nuclei](https://github.com/projectdiscovery/nuclei)

## Installation

1. **Clone the repository and navigate to the directory**:

    ```bash
    git clone https://github.com/Sidhant0703/Bug_Bounty.git
    cd Bug_Bounty
    chmod +x automation.sh
    ```

2. **Install prerequisites**:

    Follow the respective installation instructions for each tool listed in the prerequisites.

## Usage

Run the script by providing a domain as an argument:

```bash
./automation.sh example.com
```

### Script Breakdown

1. **Directory Setup**:
    - Creates a directory structure under `/root/` named after the domain.

2. **Subdomain Enumeration**:
    - Uses `Subfinder`, `Assetfinder`, and `Amass` to discover subdomains and saves them to `subs.txt`.

3. **Live Host Detection**:
    - Checks which subdomains are live using `HTTPx` and saves them to `alive.txt`.

4. **Xray Testing**:
    - Performs vulnerability testing on live subdomains using `Xray`. Results are saved with timestamps.

5. **Nuclei Testing**:
    - Scans live subdomains for various vulnerabilities using `Nuclei`. Results are saved to `nuclei.txt`.

## Example Output

- `subs.txt`: List of discovered subdomains.
- `alive.txt`: List of live subdomains.
- HTML files generated by `Xray` for each live subdomain.
- `nuclei.txt`: List of vulnerabilities detected by `Nuclei`.

## Contributions

Feel free to contribute by submitting issues or making pull requests to enhance the script.
