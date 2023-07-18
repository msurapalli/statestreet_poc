# The name of this view in Looker is "Sdk Table"
view: sdk_table {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "SDK_SCHEMA"."SDK_TABLE" ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Key" in Explore.

  dimension: key {
    type: string
    sql: ${TABLE}."KEY" ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}."VALUE" ;;
  }
  measure: count {
    type: count
  }
}
