# Hitobito SJAS

This hitobito wagon defines the organization hierarchy with groups and roles.

[![Build Status](https://travis-ci.org/hitobito/hitobito_sjas.svg?branch=master)](https://travis-ci.org/hitobito/hitobito_sjas)

## Organization Hierarchy

* SJAS
  * SJAS
    * Administrator: [:admin, :layer_and_below_full, :impersonation]
  * Geschäftsstelle
    * Adressverwalter*in: [:group_full, :contact_data, :layer_and_below_full]
    * Projektleitung: [:layer_and_below_full, :contact_data, :finance]
    * Sachbearbeitung: [:layer_and_below_full, :finance]
    * Geschäftsführung: [:layer_and_below_full, :finance]
  * Leitungspool
    * Lagerleiter*innen: []
    * Kursleiter*innen: []
    * Mitleiter*innen: []
    * Köch*in: []
    * Zivildienstleistender: []
  * Teilnehmerpool
    * Teilnehmende: []
  * Stiftungsrat
    * Präsident*in: [:layer_read, :group_full]
    * Vize-Präsident*in: [:layer_read, :group_full]
    * Kassier*in: [:layer_read]
    * Sekretär*in: [:layer_read, :group_full]
    * Beisitzer*in: [:layer_read]
* Stiftung
  * Stiftung
    * Kontakt: []
* Partner
  * Partner
    * Partner: []
* Kantonalkomitee
  * Kantonalkomitee
    * Adressverwalter*in: [:group_full, :contact_data]
    * Kontakt: []
* Fundraising
  * Fundraising
    * Adressverwalter*in: [:group_full, :contact_data]
    * Kontakt: []

(Output of rake app:hitobito:roles)
