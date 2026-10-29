# /////////////////////////////////////////////////////////////////////////////
# Resumen ---------------------------------------------------------------------
# Proyecto:  Trial DD+
# Script:    Data_cleansing.R
# Propósito: Importación, limpieza y consolidación de las bases de datos
# Responsable: David Niño
# /////////////////////////////////////////////////////////////////////////////

# /////////////////////////////////////////////////////////////////////////////
# Entorno y librerías  --------------------------------------------------------
# - Limpiar el entorno de trabajo
# - Cargar y listar las librerías necesarias
# /////////////////////////////////////////////////////////////////////////////

rm(list = ls())

# Librerías utilizadas:
library(tidyverse)
library(Hmisc)

# /////////////////////////////////////////////////////////////////////////////
# Carga y depuración basica de datos ------------------------------------------
# - Cargar archivos de datos .CSV y .xlsx
# - 
# - 
# - 
# /////////////////////////////////////////////////////////////////////////////

## Importar datos -------------------------------------------------------------
data <- read.csv('DATA/CentroNIHREnSaludGlo_DATA_2026-07-04_0002.csv')

## Filtrar por tipo de participante y participante aleatorizado ----------------
data <- data |> filter(tipo_participante == 1)
data <- data |>  filter(!is.na(randomization_group))

## Seleccionar las variables de interes para el analisis ----------------------
data <- data |> select(
  # Cover Page
  -tipo_registro,
  -tipo_participante,
  -edad_calculada,
  -criterio_exclusion,
  -tratamiento_ambulatorio,
  
  # Sociodemográfico (líderes/aplicadores)
  -estado_civil_lidaplic,
  -estudios_lidaplic,
  -ocupacion_lidaplic_otros,
  -ocupacion_lidaplic___1,
  -ocupacion_lidaplic___2,
  -ocupacion_lidaplic___3,
  -ocupacion_lidaplic___4,
  -ocupacion_lidaplic___5,
  -ocupacion_lidaplic___6,
  -ocupacion_lidaplic___7,
  -ocupacion_lidaplic___8,
  -ocupacion_lidaplic___9,
  -ocupacion_lidaplic___10,
  -ocupacion_lidaplic___11,
  -ocupacion_lidaplic___12,
  -ocupacion_lidaplic___13,
  -residente_lidaplic,
  -ocupacion_lidaplic_otro,
  -experiencia_lidaplic_m,
  -experiencia_lidaplic_a,
  -grupo_social_lidaplic___1,
  -grupo_social_lidaplic___2,
  -grupo_social_lidaplic___3,
  -grupo_social_lidaplic___4,
  -grupo_social_lidaplic___5,
  -grupo_social_lidaplic___6,
  -grupo_social_lidaplic___7,
  -grupo_social_lidaplic___8,
  -grupo_social_lidaplic___9,
  -grupo_social_lidaplic_otro,
  -pueblo_originario_otro,
  -sociodemogrfico_lderesaplicadores_complete
)
