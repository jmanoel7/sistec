# sistec 0.2.0

### Functions

- The `aria()` now has offline and online version (#75)
- Creation of `aria_desktop_build()`. This function create a folder with all necessary
files to build the ARIA's desktop version with innosetup. (#74)
- Cration of `read_linked_courses()` to read a file with the relation between courses in academic registration and Sistec cyclo. (#55)
- Update `read_sigaa()`to read datasets with "Campus" and "Cota". (#53)

### Documentation

- ARIA's manual panel for output description. (#81)
- ARIA's manual in pt-br. (#60)

### ARIA

- Included entry not found in outputs. (#82)
- Included in outputs CPF's and academic registration with repetitions. (#65)

### Bug fixes

- Fix a bug in sistec utf dates. (#79)
- Fix encoding issues in `read_sistec()`. (#68)

# sistec 0.1.0

### ARIA

- sistec_app was deprecated and point to `aria()`. (#45)
- Included which year to start the comparison. (#44)
- Included wrong registration data frames in the results. (#43)
- Included `test_mode` parameter in `aria()`. Now, it is possible to choose 
if you want to run the app in production or test mode. (#29)
- The web app in this package now has a name: ARIA.

### Refactoring

- Write performance improved in 5x (#34)
- Creation of `rfept_data_frame`. This is useful because we don't need to change the code
for every student registration. Now, we just need to create a `read_*()` function that 
converts to a `rfept_data_frame`. (#30)

### Functions 

- The `read_rfept()` is a wrapper around `read_qacademico()` and `read_sigaa()`. Now you just need to specify the folder path and `read_rfept()` identifies if it is a qacademico or sigaa file and then read it. (#38)
- Sigaa integration on package using `read_sigaa()`. (#33)
- Refactor of `sistec_compare()` to only work with `rfept_data_frame`. (#30)

### Bug fixes

- Fixed bugs when using dplyr(>=1.2.0). (#28)
