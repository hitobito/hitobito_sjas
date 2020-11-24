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
    * Präsident*in: [:group_full]
    * Vize-Präsident*in: [:group_full]
    * Kassier*in: [:group_read]
    * Sekretär*in: [:group_full]
    * Beisitzer*in: [:group_read]
  * Externe
    * Adressverwalter*in: [:group_full, :contact_data]
    * Kontakt: []
  * Stiftung
    * Kontakt: []
* Kantonalkomitee
  * Kantonalkomitee
    * Adressverwalter*in: [:group_full, :contact_data]
    * Kontakt: []

(Output of rake app:hitobito:roles)
