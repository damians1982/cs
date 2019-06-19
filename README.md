# README

Internal application that have following objectives:

Will handle basic administration of tenement house in Poland mostly keeping up information
about invoices (sell and pay) and lease agreements, media settlements, deliver invoice to clients by sending emails, sending sms and email when client not pay on time. Application will be simplified (no login) because it will run privately in intranet. It will be not standalone invoicing application
(laws in Poland changes too often, so using this application will have a risk of consuming more
time to apply changes to make application handle possible tax law changes in the future).
Instead it will be using API of third party company application (fakturownia) to generate invoices.

There are following two most important inspirations for creating this applications:
First is handle diffucult polish law state when 1 tenement house belongs to many private shareholders
(współwłaśność). This make following problems with invoicing: lets say we have two shareholders.
One have 60 % of shares and is VAT TAX Payer and another have 40 % shares and isnt VAT TAX Payer.
For one monthly lease agreement for 1000 zł netto we need to prepare 2 invoices. Amount of money
on each invoice mus according to shares and contains also VAT if shareholder is VAT TAX Payer.

SAMPLE: lease agreement for 1000 zł netto (commercial client - retail shop)

| Shareholder(60% shares) no1(VAT Payer)  |  Shareholder(40%) no2(NO VAT PAYER)  |
|     Invoice 1 - 600 zł + 138 zł VAT     |   Invoice 2 - 400 zł (without vat)   |

Second inspiration for creating this application is to learn ruby on rails.
