# The name of this view in Looker is "Vw Sdk"
view: vw_sdk {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "SDK_SCHEMA"."VW_SDK" ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Amdmntind" in Explore.

  dimension: amdmntind {
    type: yesno
    sql: ${TABLE}."AMDMNTIND" ;;
  }

  dimension: bic {
    type: string
    sql: ${TABLE}."BIC" ;;
  }

  dimension: btchbookg {
    type: yesno
    sql: ${TABLE}."BTCHBOOKG" ;;
  }

  dimension: cdtracct_iban {
    type: string
    sql: ${TABLE}."CDTRACCT_IBAN" ;;
  }

  dimension: chrgbr {
    type: string
    sql: ${TABLE}."CHRGBR" ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension: credttm {
    type: string
    sql: ${TABLE}."CREDTTM" ;;
  }

  dimension: dbtr_nm {
    type: string
    sql: ${TABLE}."DBTR_NM" ;;
  }

  dimension: dbtracct_iban {
    type: string
    sql: ${TABLE}."DBTRACCT_IBAN" ;;
  }

  dimension: dbtragt_bic {
    type: string
    sql: ${TABLE}."DBTRAGT_BIC" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: dtofsgntr {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DTOFSGNTR" ;;
  }

  dimension: endtoendid {
    type: number
    value_format_name: id
    sql: ${TABLE}."ENDTOENDID" ;;
  }

  dimension: grphdr_ctrlsum {
    type: number
    sql: ${TABLE}."GRPHDR_CTRLSUM" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_grphdr_ctrlsum {
    type: sum
    sql: ${grphdr_ctrlsum} ;;
  drill_fields: [transaction_details*]}
  measure: average_grphdr_ctrlsum {
    type: average
    sql: ${grphdr_ctrlsum} ;;  }

  dimension: grphdr_nboftxs {
    type: string
    sql: ${TABLE}."GRPHDR_NBOFTXS" ;;
  }

  dimension: instdamt {
    type: number
    sql: ${TABLE}."INSTDAMT" ;;
  }

  dimension: instrid {
    type: number
    value_format_name: id
    sql: ${TABLE}."INSTRID" ;;
  }

  dimension: mndtid {
    type: number
    value_format_name: id
    sql: ${TABLE}."MNDTID" ;;
  }

  dimension: msgid {
    type: string
    sql: ${TABLE}."MSGID" ;;
  }

  dimension: nm {
    type: string
    sql: ${TABLE}."NM" ;;
  }

  dimension: pmtinf_nboftxs {
    type: number
    sql: ${TABLE}."PMTINF_NBOFTXS" ;;
  }

  dimension: pmtinfid {
    type: number
    value_format_name: id
    sql: ${TABLE}."PMTINFID" ;;
  }

  dimension: pmtmtd {
    type: string
    sql: ${TABLE}."PMTMTD" ;;
  }

  dimension: ustrd {
    type: string
    sql: ${TABLE}."USTRD" ;;
  }

  dimension: transaction_second{
    type: number
    sql: second(cast(${TABLE}.credttm as timestamp)) ;;
  }

  measure: transaction_count {
    type: sum
    sql: ${grphdr_nboftxs} ;;
  }
  measure: count {
    type: count
  }
  set: transaction_details {
    fields: [ustrd,grphdr_ctrlsum,nm,dbtr_nm]}
}
