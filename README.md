# pharmacy_parcer
parser for Georgian pharmacies Psp && Aversi

## Installation

Clone the project 

To install the required dependencies, run:
bundle install

## Usage example
ruby index.rb aspirin

## Answer example:

+--------------------------------------+----------------------+----------+
| Title                                | Amount with discount | Pharmacy |
+--------------------------------------+----------------------+----------+
| Aspirin 0.5g #10t                    | 0.4                  | Aversi   |
| Aspirin 0.5g #10t(Bel)               | 0.4                  | Aversi   |
| Aspirin 0.5g #10t darnica            | 0.75                 | Aversi   |
| АСПИРИН КАРДИО - Аспирин Кардио 0,1г | 5.05                 | PSP      |
| Аспирин С - Аспирин С 10             | 9.03                 | PSP      |
| Aspirin cardio 0.1g #28t             | 9.5                  | Aversi   |
| Аспирин 0,5 грамм 10 таблеток 0,33₾  | 10.0                 | PSP      |
| Аспирин - Аспирин 0,5г 10 таблеток   | 10.0                 | PSP      |
| АСПИРИН - Аспирин 0,5 грамм 10       | 10.0                 | PSP      |
| Aspirin cardio 0.3g #20t             | 12.35                | Aversi   |
| Аспирин кардио - Аспирин кардио 0,3г | 12.47                | PSP      |
| Aspirin C #10t effervesc.            | 12.58                | Aversi   |
+--------------------------------------+----------------------+----------+

