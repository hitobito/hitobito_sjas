# hitobito_skv
A hitobito wagon defining the organization hierarchy and additional features for SKV
Basis Setup 

# Rollen, Berechtigungen
Dachverband
  - Geschäftsleitung (Alle Mitglieder der Geschäftsleitung haben dieselben Rechte)
      - Mitglied: [:group_and_below_full]
      - Kassier: 
  - Ressortmitarbeitende:
      - Mitglied: []
  - TK (Technische Komission) (1 Leiter Pro Sportart)
      - Mitglied: [:group_and_below_full]
  - Ehrenmitglieder (aktuell kein Login, in Zukunft gerne)
      - Mitglied: []
  - Externe Kontakte / Sponsoren
      - Kontakt: []
  - Sektion
      - Mutationsführer [:group_and_below_full]
      - Mitglied: []
      - NichtMitglied: []
      - ReadOnly: [:group_read]
      - Kassier: [:group_and_below_full]
         -> Sportart als Bezeichnung auf der Rolle abgebildet als Gruppe
      - NichtMitglied []
      - Eherenmitglied []
      - Sportart Gruppe:
          - Ombutsmann/Frau: [:group_full]
          - Mitglied: []
      - Externe Kontakte / Sponsoren
          - Kontakt: []
