*** Variables ***
${URL}    https://www.sckonlinestore.com
${BROWSER}    chrome

*** Keywords ***
เข้าเว็บ sck online store
    Open Browser    url=${URL}    browser=${BROWSER}
    Page Should Contain    text=SCK

ค้นหาสินค้าโดยใช้คำค้น Outfits for men
    Input Text    id=input-left    text=Outfits for men
    Click Button    id=button-search

เลือกดูสินค้าที่ค้นเจอ
    Page Should Contain    text=Showing results for 'Outfits for men'
    Click Element    id=item-selected

แสดงรายละเอียดสินค้า
    Page Should Contain    text=Mens long sleeve T-shirt Cotton Base Layer Slim Muscle
    Element Should Contain    id=price    expected=350.00 THB
    Element Should Contain    id=point    expected=Earn: 3 Points

นำสินค้าลงตะกร้า
    Click Button    id=add-to-cart
    Element Should Contain    id=basket    expected=1

ดูรายละเอียดสินค้าในตะกร้า
    Click Element    id=basket
    Element Should Contain    id=item    expected=Mens long sleeve T-shirt Cotton
    Element Should Contain    id=price    expected=350.00 THB
    Element Should Contain    id=point    expected=3 Points
    Element Should Contain    id=available-points    expected=500 Points
    Input Text    id=use-point-as-a-discount    text=200
    Element Should Contain    id=sub-total    expected=350.00 THB
    Element Should Contain    id=discount    expected=-200.00 THB
    Element Should Contain    id=total    expected=-150.00 THB

เข้าสู่หน้าชำระเงินค่าสินค้า
    Click Button    id=checkout

ตรวจสอบชื่อนามสกุลผู้รับ ที่อยู่จัดส่ง และเบอร์โทรศัพท์
    Page Should Contain    text=Shipping information
    Element Text Should Be    id=firstname    expected=Arunee
    Element Text Should Be    id=lastname    expected=Poonsawat
    Element Text Should Be    id=address    expected=500/1 Ladpraw 92
    List Selection Should Be    id=province    expected=Bangkok
    List Selection Should Be    id=district    expected=Wang Thonglang
    List Selection Should Be    id=sub-district    expected=Phlapphla
    Element Text Should Be    id=zipcode    expected=10310
    Element Text Should Be    id=mobile-number    expected=0813267897

ตรวจสอบวิธีการจัดส่ง
    Radio Button Should Be Set To    group_name=delivery-method    value=Kerry

ตรวจสอบวิธีการชำระค่าสินค้า
    Radio Button Should Be Set To    group_name=payment    value=credit-card
    Element Text Should Be    id=name-on-card    expected=Arunee Poonsawat
    Element Text Should Be    id=card-number    expected=1234 5678 9101 1121
    Element Text Should Be    id=expiration-date    expected=06/27
    Input Text    id=security-code    text=234

ดูรายละเอียดราคาสินค้าที่ต้องชำระพร้อมชำระค่าสินค้า
    Element Should Contain    id=sub-total    expected=350.00 THB
    Element Should Contain    id=discount    expected=-200.00 THB
    Element Should Contain    id=total    expected=150.00 THB
    Click Button    id=checkout

เข้าสู่หน้าชำระเงินสำเร็จ    
    Page Should Contain    text=Thank You For Your Order

ปิด browsers
    Close All Browsers

