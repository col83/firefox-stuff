import requests
import argparse
from urllib.parse import quote
import re

# Константы по умолчанию
DEFAULT_ARCH = "win64"
DEFAULT_LANG = "en-US"
DEFAULT_TYPE = "msi"
BASE_FTP_URL = "https://ftp.mozilla.org/pub/firefox/releases/"

def clean_esr_version(version):
    """Удаляет 'esr' из версии, если он есть (для корректного URL)."""
    if version and version.endswith('esr'):
        return version[:-3]  # Убираем последние 3 символа ('esr')
    return version

def get_firefox_versions(arch, lang, product_type):
    try:
        # Получаем данные основных версий
        versions_response = requests.get("https://product-details.mozilla.org/1.0/firefox_versions.json")
        versions_response.raise_for_status()
        versions = versions_response.json()

        # Извлекаем версии
        latest_stable = versions["LATEST_FIREFOX_VERSION"]
        latest_esr = versions["FIREFOX_ESR"]
        latest_esr_next = versions.get("FIREFOX_ESR_NEXT", None)

        # Функция для формирования корректной ссылки
        def build_download_url(version, arch, lang, product_type):
            if not version:
                return None
            base_path = f"{version}/{arch}/{lang}/"
            if product_type == "msi":
                filename = f"Firefox Setup {version}.msi"
            else:
                filename = f"Firefox Setup {version}.exe"
            
            encoded_filename = quote(filename)
            return f"{BASE_FTP_URL}{base_path}{encoded_filename}"

        # Формируем ссылки
        stable_url = build_download_url(latest_stable, arch, lang, product_type)
        esr_url = build_download_url(latest_esr, arch, lang, product_type)
        esr_next_url = build_download_url(latest_esr_next, arch, lang, product_type) if latest_esr_next else None

        # Выводим результат
        print(f"Arch: {arch}, Lang: {lang}, Installer type: {product_type}\n")
        
        print(f"Current Stable: {latest_stable}\n")
        print(f"Download: {stable_url}")
        print(f"Release Notes: https://www.firefox.com/en-US/firefox/{latest_stable}/notes/\n")

        print(f"Current ESR: {latest_esr}\n")
        print(f"Download: {esr_url}")
        print(f"Release Notes: https://www.mozilla.org/en-US/firefox/{clean_esr_version(latest_esr)}/releasenotes/\n")

        if latest_esr_next:
            print(f"Next ESR: {latest_esr_next}\n")
            print(f"Download: {esr_next_url}")
            print(f"Release Notes: https://www.mozilla.org/en-US/firefox/{clean_esr_version(latest_esr_next)}/releasenotes/")

    except Exception as e:
        print(f"Error: {e}")

def main():
    parser = argparse.ArgumentParser(description="Firefox Download Links Generator")
    parser.add_argument("--arch", help="Arch (win32/win64)", default=DEFAULT_ARCH)
    parser.add_argument("--lang", help="Language (en-US, ru и т.д.)", default=DEFAULT_LANG)
    parser.add_argument("--type", choices=["msi", "exe"], help="Installer type", default=DEFAULT_TYPE)

    args = parser.parse_args()
    get_firefox_versions(args.arch, args.lang, args.type)

if __name__ == "__main__":
    print()
    main()