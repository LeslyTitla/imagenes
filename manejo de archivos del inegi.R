# Manejo de archivos de bases de datos del INEGI

# UEA: Informatica
# prof. dr. Jesus Zavala Ruiz
# Universidad Autonoma Metropolitana

# 1. Preparación del ambiente en RStudio

# Primero se instala el paquete rio (R input/output) para importar, 
# exportar y convertir archivos: 
  
if (!require("rio")) install.packages("rio")

# Luego instale los distintos formatos de archivos con la función install_formats()
install_formats()

# Luego, instale el paquete stringr para manipular # cadenas 
# o datos alfanuméricos:
if (!require("stringr")) install.packages("stringr")


# Luego se cargan los paquetes para tenerlos disponibles para su ejecucion
library(rio)
library(stringr)

# 2. Importación y exportación del archivo

# Primero, hay que identificar el directorio donde se encuentra el o 
# los archivos fuente eligiendo y definiendo el directorio como 
# el directorio de trabajo, con el manegador de archivos de RStudio. 
# Esto equivale a correr o ejecutar la función setwd(). Luego, 
# se obtiene la ruta del directorio de trabajo con la función setwd().

# Luego, se construye la ruta al archivo fuente dummy_personas_cpv2010_dbf.zip 
# con la función str_c() del paquete stringr, la ruta del archivo de salida 
# con la función str_replace() cambiando la extensión del archivo DBF 
# comprimido "zip" a delimitado por comas "csv" y el archivo a convertir a xls:


directorioDeTrabajo <- getwd()
directorioDeTrabajo <- "."

# manejo de un archivo local
archivoDeEntrada <- "DUMMY_PERSONAS_5K.dbf"
archivoDeEntrada

# cambiar el tipo de archivo
archivoExportado <- str_replace(archivoDeEntrada,".dbf",".csv")
archivoExportado

archivoConvertido <- str_replace(archivoDeEntrada,".dbf",".xlsx")
archivoConvertido

rutaDeImportacion <- str_c(directorioDeTrabajo, archivoDeEntrada, sep = "/")
rutaDeImportacion

rutaDeExportacion <- str_c(directorioDeTrabajo, archivoExportado, sep = "/")
rutaDeExportacion

rutaDeConversion <- str_c(directorioDeTrabajo, archivoConvertido, sep = "/")
rutaDeConversion

# Luego, se realiza la importación del archivo con la función import() del 
# paquete rio:
archivoImportado <- import(rutaDeImportacion) 


# Posteriormente, se exporta el dataframe al archivo de salida utilizando 
# la función export() de rio:
  
# DUMMY_PERSONAS_5K.dbf a
export(archivoImportado,"DUMMY_PERSONAS_5K.csv")

# o
export(archivoImportado,rutaDeExportacion)

list.files(directorioDeTrabajo, pattern="DUMMY_PERSONAS_5K")

# 3. Conversión directa

# Es posible convertir el archivo de manera directa con la función convert() 
# del paquete rio:
convert("DUMMY_PERSONAS_5K.dbf","DUMMY_PERSONAS_5K.xlsx")  

# o
convert(rutaDeImportacion,rutaDeConversion)

list.files(directorioDeTrabajo, pattern="DUMMY_PERSONAS_5K")


# Descarga directa desde el Internet
# manejo de un archivo desde el sitio web del Inegi
# DBF
urlDeEntrada <- "https://www.inegi.org.mx/contenidos/programas/ccpv/2010/microdatos/ejemplobd/dummy_personas_cpv2010_dbf.zip"

# DTA
urlDeEntrada <- "https://www.inegi.org.mx/contenidos/programas/ccpv/2010/microdatos/ejemplobd/dummy_personas_cpv2010_dta.zip"

# SAV
urlDeEntrada <- "https://www.inegi.org.mx/contenidos/programas/ccpv/2010/microdatos/ejemplobd/dummy_personas_cpv2010_sav.zip"

# SAS
urlDeEntrada <- "https://www.inegi.org.mx/contenidos/programas/ccpv/2010/microdatos/ejemplobd/dummy_viviendas_cpv2010_sas.zip"

urlDeEntrada

# 
archivoImportado <- import(urlDeEntrada)

export(archivoImportado,"dummy_personas_cpv2010_dbf.xlsx")

list.files(directorioDeTrabajo, pattern="dummy_personas")
list.files(directorioDeTrabajo, pattern="DUMMY_PERSONAS")


