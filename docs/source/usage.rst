
Working with dates
---------------

To decompose the date given in a predefined set of columns you can use the ``functions_dates.fun_process_dates()`` function:

.. py:function:: functions_dates.fun_process_dates(tbl, column, format)

    Transforms dates into %Y-M-D% format and it returns additional columns(month, year, year_month, year_month_start, year_month_end, day_year)
    
    :param tbl table in which the date column to be transformed is  

    :param column name of the date column in tbl

    :param format is the actual format in which the date is given. For Kaggle Sales Prediction is expected '%d.%m.%Y'

    Columns added in tbl

    month: Month corresponding to date

    year: Year corresponding to date

    year_month_start: First day of the month (Y-M-01)

    year_month_end: Last day of the month
    
    day_year: Number of day (1 - 365)

    :return tbl with column formated and additional columns added

