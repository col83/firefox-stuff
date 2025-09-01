import requests
from bs4 import BeautifulSoup
import re

BASE_URL = "https://dist.torproject.org/torbrowser/"
BUILD_FILE = "sha256sums-signed-build.txt"

APK_PATTERN = ["android", "aarch64"]
APK_EXTENSION = ".apk"
EXE_PATTERN = ["windows", "x86_64"]
EXE_EXTENSION = ".exe"
LINUX_PATTERN = ["linux", "x86_64"]
LINUX_EXTENSION = ".tar.xz"

def get_latest_version_folder():
    """Get latest version from BASE_URL"""
    response = requests.get(BASE_URL)
    soup = BeautifulSoup(response.text, 'html.parser')
    
    folders = []
    for link in soup.find_all('a'):
        href = link.get('href')
        if href and re.match(r'^\d+\.\d+\.\d+/$', href):
            folders.append(href.rstrip('/'))
    
    if not folders:
        raise ValueError("No version folders found")
    
    latest = max(folders, key=lambda v: tuple(map(int, v.split('.'))))
    return latest

def get_download_links(version):
    """Get download links"""
    build_file_url = f"{BASE_URL}{version}/{BUILD_FILE}"
    response = requests.get(build_file_url)
    
    if response.status_code != 200:
        raise ValueError(f"Failed to retrieve {build_file_url}")
    
    links = {
        'android': None,
        'windows': None,
        'linux': None
    }
    
    for line in response.text.splitlines():
        parts = line.split()
        if len(parts) < 2:
            continue
        
        filename = parts[1].lower()
        
        if all(p in filename for p in APK_PATTERN) and filename.endswith(APK_EXTENSION):
            links['android'] = f"{BASE_URL}{version}/{parts[1]}"
        elif all(p in filename for p in EXE_PATTERN) and filename.endswith(EXE_EXTENSION):
            links['windows'] = f"{BASE_URL}{version}/{parts[1]}"
        elif all(p in filename for p in LINUX_PATTERN) and filename.endswith(LINUX_EXTENSION):
            links['linux'] = f"{BASE_URL}{version}/{parts[1]}"
    
    return links

def main():
    print()  # Space at the beginning
    
    try:
        print("Fetching latest Tor Browser version...")
        print()  # Space between fetching and version
        latest_version = get_latest_version_folder()
        print(f"Latest version: {latest_version}\n")
        
        print("Retrieving download links...")
        links = get_download_links(latest_version)
        
        print("\nDownload Links:")
        print()  # Space after Download Links header
        
        print(f"Android:   {links['android'] or 'Not found'}")
        print(f"Windows:   {links['windows'] or 'Not found'}")
        print(f"Linux:     {links['linux'] or 'Not found'}")
    
    except Exception as e:
        print(f"Error occurred: {e}")
    
    finally:
        input("\nPress Enter to exit...")

if __name__ == "__main__":
    main()