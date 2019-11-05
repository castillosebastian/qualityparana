# define list of fields for data entry
input_list <- list(
  type=c("Numeric",
         "Text",
         "Text",
         "Text",
         "Text",
         "Text",
         "Text",
         "Text",
         "Text",
         "Text",
         "Text"),
  id=c("id_n",
       "id_fecha",
       "op_tipo",
       "activo_tipo",
       "activo_código",
       "activo_mercado",
       "at_desc",
       "at_conclusión",
       "at_señal_entrada_esperada",
       "agenda_fecha",
       "agenda_op_tipo"),
  label=c("id_n",
          "id_fecha",
          "op_tipo",
          "activo_tipo",
          "activo_código",
          "activo_mercado",
          "at_desc",
          "at_conclusión",
          "at_señal_entrada_esperada",
          "agenda_fecha",
          "agenda_op_tipo"))

## ejemplo
# id_n
# id_fecha:2019-07-12
# op_tipo: seguimiento
# activo_tipo: acción
# activo_código: SUPV
# activo_mercado: BYMA
# at_desc:Lateral, sin confirmar tendencia, ni fuerza. Medias Móviles no alineadas. Falta volumen y MACD en area de sobrecompra en donde en período anteriores cayó la cotización (feb-2019 y oct-2018).
# at_conclusión: no_operar
# at_señal_entrada_esperada: superar resistencia de $85.
# agenda_fecha: 2019-07-19
# agenda_op_tipo: seguimiento