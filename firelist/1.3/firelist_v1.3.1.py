import requests
import argparse
from urllib.parse import quote
from colorama import init, Fore, Style

# Инициализация colorama
init(autoreset=True)

# Константы по умолчанию
DEFAULT_ARCH = "win64"
DEFAULT_LANG = "en-US"
DEFAULT_TYPE = "msi"
BASE_FTP_URL = "https://ftp.mozilla.org/pub/firefox/releases/"

# Цвета через colorama
COLOR_STABLE = Fore.GREEN + Style.BRIGHT
COLOR_ESR = Fore.BLUE + Style.BRIGHT
COLOR_ESR_NEXT = Fore.MAGENTA + Style.BRIGHT
COLOR_URL = Fore.CYAN + Style.BRIGHT
COLOR_META = Fore.WHITE + Style.BRIGHT
COLOR_ERROR = Fore.RED + Style.BRIGHT

def clean_esr_version(version):
    """Удаляет 'esr' из версии."""
    return version[:-3] if version and version.endswith('esr') else version

def get_firefox_versions(arch, lang, product_type):  # Обратите внимание на имя параметра product_type
    try:
        versions = requests.get("https://product-details.mozilla.org/1.0/firefox_versions.json").json()

        latest_stable = versions["LATEST_FIREFOX_VERSION"]
        latest_esr = versions["FIREFOX_ESR"]
        latest_esr_next = versions.get("FIREFOX_ESR_NEXT")

        def build_url(version, arch, lang, product_type):
            if not version: return None
            filename = f"Firefox Setup {version}.{'msi' if product_type == 'msi' else 'exe'}"
            return f"{BASE_FTP_URL}{version}/{arch}/{lang}/{quote(filename)}"

        # Вывод с цветами
        print(f"{COLOR_META}Arch: {arch}, Lang: {lang}, Installer type: {product_type}\n")
        
        print(f"{COLOR_STABLE}Current Stable: {latest_stable}")
        print(f"Download: {COLOR_URL}{build_url(latest_stable, arch, lang, product_type)}")
        print(f"Release Notes: {COLOR_URL}https://www.firefox.com/en-US/firefox/{latest_stable}/notes/\n")

        print(f"{COLOR_ESR}Current ESR: {latest_esr}")
        print(f"Download: {COLOR_URL}{build_url(latest_esr, arch, lang, product_type)}")
        print(f"Release Notes: {COLOR_URL}https://www.mozilla.org/en-US/firefox/{clean_esr_version(latest_esr)}/releasenotes/\n")

        if latest_esr_next:
            print(f"{COLOR_ESR_NEXT}Next ESR: {latest_esr_next}")
            print(f"Download: {COLOR_URL}{build_url(latest_esr_next, arch, lang, product_type)}")
            print(f"Release Notes: {COLOR_URL}https://www.mozilla.org/en-US/firefox/{clean_esr_version(latest_esr_next)}/releasenotes/")

    except Exception as e:
        print(f"{COLOR_ERROR}Error: {e}")

def main():
    parser = argparse.ArgumentParser(description="Firefox Download Links Generator")
    parser.add_argument("--arch", help="Architecture (win32/win64)", default=DEFAULT_ARCH)
    parser.add_argument("--lang", help="Language (en-US, ru, etc.)", default=DEFAULT_LANG)
    parser.add_argument("--type", choices=["msi", "exe"], help="Installer type", default=DEFAULT_TYPE, dest="product_type")  # Используем dest
    
    args = parser.parse_args()
    get_firefox_versions(arch=args.arch, lang=args.lang, product_type=args.product_type)  # Явная передача аргументов

if __name__ == "__main__":
    print()
    main()