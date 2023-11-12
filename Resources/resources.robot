*** Settings ***
Library   AppiumLibrary  # AppiumLibrary burada impot etmek zorundayız,robot frameworkle gelen libraryleri import etmemize gerek yok

## SETTTİNG KISMI İMPORT YAPILAN KISIM


*** Variables ***
${pop_up_message}  id=com.akakce.akakce:id/framePopupLyt
${search_input_field}  id=searchText
${search_input_field2}  xpath=(//*[@resource-id='com.akakce.akakce:id/searchTextView'])[2]
${first_product}   xpath=(//*[@resource-id='com.akakce.akakce:id/cellContainer'])[1]
${ürüne_git_button}  id=com.akakce.akakce:id/detailBtnTextView
${takip_et_button}  xpath=//*[@text='Takip Et']
${login_button}     xpath=//*[@text='Giriş Yap']
${hesap_olustur}     xpath=//*[@text='Hesap Oluştur']
${User_Ad}           xpath=//*[@text='Ad']  # id=name_edt
${User_Soyad}        xpath=//*[@text='Soyad']  # id=surname_edt
${email_input}       xpath=(//*[@resource-id='com.akakce.akakce:id/email_edt'])[2]
${email_input2}      id=email_ag_edt
${password_input}    xpath=(//*[@resource-id='com.akakce.akakce:id/password_edt'])[2]
${password_input2}   id=password_ag_edt
${User_Icon}         id=rightIcon





*** Keywords ***
Open Akakce Application
     Open Application

   ...  remote_url=http://localhost:4723
   ...  platformName=Android
   ...  platformVersion=11.0
   ...  deviceName=emulator
   ...  appPackage=com.akakce.akakce
   ...  appActivity=com.akakce.akakce.ui.splash.SplashActivity
   ...  automationName=Uiautomator2


Close Pop Up Message
    Wait Until Page Contains Element       ${pop_up_message}  timeout=15     # pop up mesajına tıklamadan önce bekleme
    Click Element                          ${pop_up_message}

Type Bilgisayar In The Search Box And Click Enter
    Wait Until Page Contains Element      ${search_input_field}
    Click Element                         ${search_input_field}
    Wait Until Page Contains Element      ${search_input_field2}
    Input Text                            ${search_input_field2}  Bilgisayar
    Press Keycode    66  # 66 enter ın kod numarası

Select First Product
   Wait Until Page Contains Element    ${first_product}
    Click Element                      ${first_product}

Go To Selected Product
     Swipe    530   480  530  100     # ürüne git buttonu ekranın alt kısmında olduğu için coordinat belirledik ve hafif kaydırdık görünür hale getirdik
     Wait Until Page Contains Element           ${ürüne_git_button}
     Click Element                       ${ürüne_git_button}

Scroll To Takip Et Button

    ${isTakipEtButtonVisible}   Run Keyword And Return Status    Element Should Be Visible      ${takip_et_button}
     WHILE      "${isTakipEtButtonVisible}"== "False"   # eğer takip et butonu visible değilse,
    Swipe By Percent    50  80  50  10  #swipe yap ve
    ${isTakipEtButtonVisible}  Run Keyword And Return Status   Element Should Be Visible     ${takip_et_button}  #tekrar element visible mı değil mi
    END  # sonrasında bitir ve eğer hala yanlış dödürüyorsa tekrar döngüye girer ta ki visible olana kadar
    Click Element    ${takip_et_button}  #element sayfada görünür olunca click yap
    Sleep    3

Click On The Takip Et Button
    Click Element                         ${takip_et_button}
     Sleep    5

Verify Login Page Displayed
   Wait Until Page Contains Element    ${login_button}

Click On User Icon
   Wait Until Page Contains Element    ${User_Icon}
   Click Element                       ${User_Icon}


Click On Hesap Olustur Button
   Wait Until Page Contains Element     ${hesap_olustur}
   Click Element                        ${hesap_olustur}

Enter Register Details
  Wait Until Page Contains Element    ${User_Ad}
  Input Text    ${User_Ad}       John  #user ad yerine register_name_input_field yazabiliriz
  Input Text    ${User_Soyad}    wick
  Input Text    ${email_input}   j_wick123@example.com
  Input Text    ${email_input2}  j_wick123@example.com
  Input Text    ${password_input}  Johnwick123!.
  Input Text    ${password_input2}  Johnwick123!.
  Sleep    3

