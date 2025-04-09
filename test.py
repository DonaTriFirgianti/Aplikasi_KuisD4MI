from appium import webdriver
from appium.options.android import UiAutomator2Options
from appium.webdriver.common.appiumby import AppiumBy
import time


options = UiAutomator2Options()
options.platform_name = 'Android'
options.device_name = 'VirtualDevice'
options.app_package = 'com.example.flutter_aplikasi_kuis'
options.app_activity = 'com.example.flutter_aplikasi_kuis.MainActivity'

driver = webdriver.Remote('http://127.0.0.1:4723', options=options)

driver.find_element(AppiumBy.XPATH, '//android.widget.Button[@content-desc="Mulai Kuis"]').click()
time.sleep(2)
driver.find_element(AppiumBy.XPATH, '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]').click()
time.sleep(2)
driver.find_element(AppiumBy.XPATH, '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]').send_keys('Dona Tri Firgianti')
time.sleep(2)
driver.find_element(AppiumBy.XPATH, '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[2]').click()
time.sleep(2)
driver.find_element(AppiumBy.XPATH, '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[2]').send_keys('23091397023')
time.sleep(2)
driver.find_element(AppiumBy.XPATH, '//android.widget.Button[@content-desc="Mulai Kuis"]').click()
time.sleep(1)
driver.find_element(AppiumBy.XPATH, '//android.widget.Button[@content-desc="Dart"]').click()
time.sleep(1)
driver.find_element(AppiumBy.XPATH, '//android.widget.Button[@content-desc="HyperText Transfer Protocol"]').click()
time.sleep(1)
driver.find_element(AppiumBy.XPATH, '//android.widget.Button[@content-desc="Row"]').click()
time.sleep(1)
driver.find_element(AppiumBy.XPATH, '//android.widget.Button[@content-desc="Fakultas Vokasi"]').click()
time.sleep(1)
driver.find_element(AppiumBy.XPATH, '//android.widget.Button[@content-desc="Flutter"]').click()
time.sleep(1)
driver.find_element(AppiumBy.XPATH, '//android.widget.Button[@content-desc="SELECT"]').click()
time.sleep(1)
driver.find_element(AppiumBy.XPATH, '//android.widget.Button[@content-desc="Figma"]').click()
time.sleep(1)
driver.find_element(AppiumBy.XPATH, '//android.widget.Button[@content-desc="PHP"]').click()
time.sleep(1)
driver.find_element(AppiumBy.XPATH, '//android.widget.Button[@content-desc="Mencari dan memperbaiki kesalahan dalam kode"]').click()
time.sleep(1)
driver.find_element(AppiumBy.XPATH, '//android.widget.Button[@content-desc="Mengulang eksekusi kode tertentu"]').click()
