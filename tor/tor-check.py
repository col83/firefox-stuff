import requests
from bs4 import BeautifulSoup
import re

# Константы
BASE_URL = "https://dist.torproject.org/torbrowser/"
BUILD_FILE = "sha256sums-signed-build.txt"

# Паттерны для разных ОС
APK_PATTERN = ["android", "aarch64"]
APK_EXTENSION = ".apk"

EXE_PATTERN = ["windows", "x86_64"]
EXE_EXTENSION = ".exe"

LINUX_PATTERN = ["linux", "x86_64"]
LINUX_EXTENSION = ".tar.xz"

def get_latest_version_folder():
    """Получаем последнюю версию из BASE_URL"""
    response = requests.get(BASE_URL)
    soup = BeautifulSoup(response.text, 'html.parser')
    
    # Ищем все папки с версиями (формат X.Y.Z/)
    folders = []
    for link in soup.find_all('a'):
        href = link.get('href')
        if href and re.match(r'^\d+\.\d+\.\d+/$', href):
            folders.append(href.rstrip('/'))
    
    if not folders:
        raise ValueError("Не найдено папок с версиями")
    
    # Сортируем по номеру версии
    latest = max(folders, key=lambda v: tuple(map(int, v.split('.'))))
    return latest

def get_download_links(version):
    """Получаем ссылки для скачивания"""
    build_file_url = f"{BASE_URL}{version}/{BUILD_FILE}"
    response = requests.get(build_file_url)
    
    if response.status_code != 200:
        raise ValueError(f"Не удалось получить файл {build_file_url}")
    
    links = {
        'android': None,
        'windows': None,
        'linux': None
    }
    
    for line in response.text.splitlines():
        if len(line.split()) < 2:
            continue
        
        filename = line.split()[1].lower()
        
        # Проверяем Android
        if (all(p in filename for p in APK_PATTERN) and filename.endswith(APK_EXTENSION)):
            links['android'] = f"{BASE_URL}{version}/{line.split()[1]}"
        
        # Проверяем Windows
        elif (all(p in filename for p in EXE_PATTERN) and filename.endswith(EXE_EXTENSION)):
            links['windows'] = f"{BASE_URL}{version}/{line.split()[1]}"
        
        # Проверяем Linux
        elif (all(p in filename for p in LINUX_PATTERN) and filename.endswith(LINUX_EXTENSION)):
            links['linux'] = f"{BASE_URL}{version}/{line.split()[1]}"
    
    return links

def main():
    try:
        print("Получаем последнюю версию Tor Browser...")
        latest_version = get_latest_version_folder()
        print(f"Последняя версия: {latest_version}")
        
        print("Ищем ссылки для скачивания...")
        links = get_download_links(latest_version)
        
        print("\nСсылки для скачивания:")
        if links['android']:
            print(f"Android:\n{links['android']}")
        else:
            print("Android: ссылка не найдена")
        
        if links['windows']:
            print(f"\nWindows:\n{links['windows']}")
        else:
            print("\nWindows: ссылка не найдена")
        
        if links['linux']:
            print(f"\nLinux:\n{links['linux']}")
        else:
            print("\nLinux: ссылка не найдена")
    
    except Exception as e:
        print(f"Произошла ошибка: {e}")

if __name__ == "__main__":
    main()