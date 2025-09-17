import uuid
import re

def get_mac_address():
    """Возвращает MAC-адрес в стандартном формате HH:MM:SS:AA:BB:CC."""
    mac_num = uuid.getnode()
    mac_hex = re.findall('..', '%012x' % mac_num)
    return ':'.join(mac_hex)

mac = get_mac_address()
print(f"MAC-адрес: {mac}")

# Для перезаписи или создания нового файла
# with open('мой_файл.txt', 'w', encoding='utf-8') as f:
#     # Здесь будет ваш код для записи
#     f.write(mac)

# # Для добавления данных в конец файла
# with open('мой_файл.txt', 'a', encoding='utf-8') as f:
#     # Здесь будет ваш код для записи
#     pass
