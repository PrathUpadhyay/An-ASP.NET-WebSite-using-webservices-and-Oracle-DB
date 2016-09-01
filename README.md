# An-ASP.NET-WebSite-using-webservices-and-Oracle-DB
Online Health Portal build on .NET platform using oracle database

This project comprises an E-pharmacy portal.. CheckUp.

For Website Database management, DALC4NET Module was used
http://www.codeproject.com/Articles/158042/DALC-NET-A-Generic-Data-Access-Layer-for-NET

## in /Database
These are the needed SQL commands that can be run directly on console.
- Tables.txt gives detailed description of all the tables with primary key and foreign

- All files with keyword "insert" describe insert queries to the respective tabels (sort of creating dummy database)

- sequencres_all.txt ----- are automatic seuqnces that work in oracle (alternative of autoincrement)


## in /CheckUp
This folder contains all webforms files.

Readme.txt files contains all the list of external packages needed
CheckUp.sln is the solution file for VStudio.

### **in Checkup/Packages** 

these are the 3rd party external libraries needed for running the project
- HTML Agility Pack for Web Crawling

- Pacifico for Font

- AjaxControl Toolkit (For Highly Interactive Ajax Control Tools like Accordion etc etc ) https://github.com/DevExpress/AjaxControlToolkit

### **Checkup/Package** , **CheckUp/HtmlAgilityPack.1.4.6** **CheckUp/pacifico** 

all described above

# in CheckUp/CheckUp

- All .asmx files are Webservices files (Webservice can be hosted on a private network or hotspot and their IP Address can be updated here

- All standalone webpages are comprised of three pages (depending upon css js files in different folders)

  -  aspx.cs file: Backend Code
  -  aspx file: Design Page
  -  aspx.designer.cs: Not needed much
  -  There are many Master pages....that provide same overhead format inherited by many pages...denoted by Master.cs and their particular aspx files too. These master pages can be inherited by any page providing the Master Page Format.

- Folders like About, AccountPage, Family_Account, FilterPage provide different css, jpeg, js assets to the partiuclar webpages.

- Mainly all image files are in img folder, and CSS folder is also self explanatory
