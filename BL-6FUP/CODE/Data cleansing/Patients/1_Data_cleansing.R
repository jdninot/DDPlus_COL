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
data <- data |> filter(redcap_event_name %in% 
                         c("lnea_base_arm_1", 
                           "seguimiento_6_mese_arm_1"))
data <- data |> filter(tipo_participante == 1)
data <- data |> filter(!is.na(randomization_group))

## Seleccionar las variables de interes para el analisis ----------------------
data <- data |> select(
  # Cover Page
  -tipo_registro,
  -tipo_participante,
  -comunicacion_espanol,
  -residencia,
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
  -sociodemogrfico_lderesaplicadores_complete,
  
  # AIM/IAM/FIM Aplicadores
  -aim_1_lidaplic,
  -aim_2_lidaplic,
  -aim_3_lidaplic,
  -aim_4_lidaplic,
  -iam_1_lidaplic,
  -iam_2_lidaplic,
  -iam_3_lidaplic,
  -iam_4_lidaplic,
  -fim_1_lidaplic,
  -fim_2_lidaplic, 
  -fim_3_lidaplic,
  -fim_4_lidaplic,
  -aimiamfim_3fff_complete,
  
  # Evento adverso
  -investigador_principal_ea,
  -dx_ea,
  -investigador_ea,
  -fecha1_ea,
  -descripcion_ea,
  -causalidad_ea,
  -eas_ea,
  -investigador_ea_2,
  -fecha1_ea_2,
  -tipo_reporte_ea,
  -fecha_ingreso_sujeto_ea,
  -estado_sujeto_ea,
  -edad_ea,
  -sexo_ea,
  -ant_patologico_ea,
  -ant_medicamento_ea,
  -nombre_ea,
  -cie10_ea,
  -fecha_conocmiento_ea,
  -fecha_ini_ea,
  -fecha_fin_ea,
  -sistema_afectado_ea,
  -criterio_seriedad,
  -clasificaci_n_ctcae,
  -suspension_intervencion_ea,
  -retiro_sujeto_ea,
  -medicamento_eas_ea,
  -desenlace_ea,
  -descripcion_manual_ea,
  -evento_interes_ea,
  -eas_relacion1_ea,
  -eas_realacion2_ea,
  -ruptura_ciego_ea,
  -descripcion_eas_ea,
  -paraclinico_eas_ea,
  -producto_ea,
  -dosis_ea,
  -lasagna_naranjo_ea,
  -dosis_ea_2,
  -firma_ip_ea,
  -evento_adverso_no_serio_complete
)
