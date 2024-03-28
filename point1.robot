*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
การได้แต้มและการใช้แต้มจากการซื้อ T-shirt ที่ sck online store
    Open Browser    url=https://www.sckonlinestore.com    browser=chrome
    Page Should Contain    text=SCK

    Input Text    id=input-left    text=Outfits for men
    Click Button    id=button-search

    Page Should Contain    text=Showing results for 'Outfits for men'
    Click Element    id=item-selected

    Page Should Contain    text=Mens long sleeve T-shirt Cotton Base Layer Slim Muscle
    Element Should Contain    id=price    expected=350.00 THB
    Element Should Contain    id=point    expected=Earn: 3 Points

    Click Button    id=add-to-cart
    Element Should Contain    id=basket    expected=1

    Click Element    id=basket
    Element Should Contain    id=item    expected=Mens long sleeve T-shirt Cotton
    Element Should Contain    id=price    expected=350.00 THB
    Element Should Contain    id=point    expected=3 Points
    Element Should Contain    id=available-points    expected=500 Points
    Input Text    id=use-point-as-a-discount    text=200
    Element Should Contain    id=sub-total    expected=350.00 THB
    Element Should Contain    id=discount    expected=-200.00 THB
    Element Should Contain    id=total    expected=-150.00 THB

    Click Button    id=checkout

    Page Should Contain    text=Shipping information
    Element Text Should Be    id=firstname    expected=Arunee
    Element Text Should Be    id=lastname    expected=Poonsawat
    Element Text Should Be    id=address    expected=500/1 Ladpraw 92
    List Selection Should Be    id=province    expected=Bangkok
    List Selection Should Be    id=district    expected=Wang Thonglang
    List Selection Should Be    id=sub-district    expected=Phlapphla
    Element Text Should Be    id=zipcode    expected=10310
    Element Text Should Be    id=mobile-number    expected=0813267897

    Radio Button Should Be Set To    group_name=delivery-method    value=Kerry

    Radio Button Should Be Set To    group_name=payment    value=credit-card
    Element Text Should Be    id=name-on-card    expected=Arunee Poonsawat
    Element Text Should Be    id=card-number    expected=1234 5678 9101 1121
    Element Text Should Be    id=expiration-date    expected=06/27
    Input Text    id=security-code    text=234

    Element Should Contain    id=sub-total    expected=350.00 THB
    Element Should Contain    id=discount    expected=-200.00 THB
    Element Should Contain    id=total    expected=150.00 THB
    Click Button    id=checkout

    Page Should Contain    text=Thank You For Your Order

    Close All Browsers

*** Keywords ***