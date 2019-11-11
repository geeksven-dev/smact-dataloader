# Getting Started

### Building
```
./gradlew build
```

### Running Loader from Jar
```
cd build/libs
java -Dapp.loader.input.dir=/Users/s.reinhardt/tmp/smact/AIS-Files -jar dataloader-0.0.1-SNAPSHOT.jar
```

### Running Loader from Source
Running with default settings for listening to mysql on localhost:3306
```
APP_LOADER_INPUT_DIR=<input_dir> ./gradlew clean bootRun
```

To change the database settings use this:
```
APP_LOADER_INPUT_DIR=<input_dir> SPRING_DATASOURCE_URL=<datasource_url> SPRING_DATASOURCE_USERNAME=<username> SPRING_DATASOURCE_PASSWORD=<password> ./gradlew clean bootRun
```

FYI: all properties defined by Spring (also those not explicitly defined in /resources/application.properties) can
be overridden by the following ENV rules: properties like app.property.sample need to be uppercased and underscored instead 
of dotted when used from command line as environment variable. For example **app.property.sample** is going to be **APP_PROPERTY_SAMPLE**

### Guides

#### Mapping files for XLS
There is a default mapping for all XLS files which is the following:
```
companyname -> Unternehmen
zipcode -> PLZ
street -> Strasse
city -> Ort
mainsector -> NACE-Branche
corporatename -> Rechtsform
established -> Gründung
staffquantity -> Mitarbeiter
backupnumber -> Telefon
website -> Website
annualsalesyear -> Umsatzjahr
lastannualsales -> Umsatz
subsidiaries -> Niederlassungen
email -> E-Mail
contact -> Führung 1
```

But there will surely be issues with some files running a loader import. The import will always tell you which mappings does not match the found
columns in your excel sheet like this in your browser:
```
[
{
    "filename": "Unternehmen - Brandenburg - ab 3 MA.xls",
    "companiesExcelCount": 13424,
    "companiesImportedCount": 13424,
    "message": "import successful"
  },
  {
    "filename": "Unternehmen - Sachsen - ab 3 MA.xls",
    "companiesExcelCount": 0,
    "companiesImportedCount": 0,
    "message": "Missing column mappings: [companyname, mainsector, staffquantity, website, annualsalesyear, subsidiaries, email, contact]"
  }
]
```
If you have missing column mappings you can easily create a so called .mapping file located next to your xls file in this case for example
you would need to create a file named **Unternehmen - Sachsen - ab 3 MA.mapping**

The content of this file should look this way and map the internal identifiers to the expeted columns
```
companyname:Unternehmen
mainsector:Branche 1
established:Gründung
staffquantity:  Mitarbeiter
website:<ignore>
annualsalesyear:Geschäftsjahr
subsidiaries:<ignore>
email:<ignore>
contact:Nachname
```
All identifiers marked as _\<ignore>_ will not be part of the whole import process (just in case the is no column providing this special piece of information)

#### HTTP API
To trigger loader imports just use the following web API while running SMACT Loader on your machine (PORT 7700)
##### Recreate entire companies
```
http://localhost:7700/api/v1/loader/run?truncateCompanies=true
```

##### Import just a specific file (companies will not be dropped cause of truncateCompanies defaults to false)
```
http://localhost:7700/api/v1/loader/run?specificFile=Unternehmen%20-%20PLZ%208-9%20-%20ab%2010%20MA.xls
```

##### Import just a specific file AND explicitly drop all companies
```
http://localhost:7700/api/v1/loader/run?truncateCompanies=true&specificFile=Unternehmen%20-%20PLZ%208-9%20-%20ab%2010%20MA.xls
```

### Building Software

#### Version increase
Never forget to increase the version number in **build.gradle.kts** file

#### Gradle build
```
./gradlew clean build
```

#### Docker build/tag
```
docker build --tag dataloader:<version> .
```

#### Docker save image (to upload to portainer or registry)
```
docker save dataloader:<version> > dataloader.tar
```

