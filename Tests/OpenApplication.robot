*** Settings ***
Resource   ../Resources/resources.robot



*** Test Cases ***
Search For Bilgisayar
     [Tags]    search
     Open Akakce Application
     Close Pop Up Message
     Type Bilgisayar In The Search Box And Click Enter
     Select First Product
     Go To Selected Product
     Scroll To Takip Et Button
     Click On The Takip Et Button
     Verify Login Page Displayed

Login Akakce Application
    Open Akakce Application
    Close Pop Up Message
     Click On User Icon
    Verify Login Page Displayed
     Click On Hesap Olustur Button
     Enter Register Details


#TEST CASES İN ALTINA TEST CASEMİZİN İSMİNİ YAZARIZ
#TEST CASEMİZİN ALTINA STEPLERİMZİ YAZMADAN ÖCE İKİ SPACE BIRAKIRIZ YADA DAHA FAZLA OLABİLİR
# LOG TO CONSOLE  JAVADA SOUT GİBİDİR
# RAPORU OTOMATİK OLUŞTURUR
# ÖZEL LARAK RAPOR OLUŞTURMA KOMUTUNA GEREK YOK SCREN SHOTTA OTOMATİK ALIR
# TERMİNALDEN ÇALIŞTIRMAZSAK SÜREKLİ GEREKSİZ RAPOR ALIR
# robot -d Reports --loglevel trace tests komutunun terminalden yazarız raporları burada toplarız
# robot --include Smoke -d Reports --loglevel trace tests  komutu ile istediğimiz test grubunu dahil ediyouz
# robot -d Reports --randomize ALL tests ile tüm teslerimiz random çalışır(hepsi biribirinden bağımsız çalışır sonuçlar birbirini etkilemez)










    # Swipe  500  1700  500  100    # ÖNCE SWİPE KULLANARAK ELEMENTE SCROLL KOORDİNATLARINI BULDUM
   # Swipe By Percent    50  80  50  10  # DAHA SONRA YUKARDAKİ KOORDİNATLARI EMULATÖRÜN EKAN BOYUTLARI ÜZERİNDEN YÜZDEYE ÇEVİRDİM
    # Wait Until Page Contains Element      ${takip_et_button}
   #  Click Element                         ${takip_et_button}
    #Sleep    5


















