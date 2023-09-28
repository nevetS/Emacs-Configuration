import ctypes
import pyautogui
import time
ctypes.windll.kernel32.SetThreadExecutionState(0x00000004)

while True:
    pyautogui.press('volumedown')
    time.sleep(1)
    pyautogui.press('volumeup')
    time.sleep(5)
