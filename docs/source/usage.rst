
Usage
========================

Loading cyrillic encoded files
-------------------

.. py:function:: fun_open_cyrilic_files(path, file)

    Opens CSV files encoded in either UTF-8 or Windows-1251, commonly used for Cyrillic alphabets.

    This function attempts to open a CSV file using UTF-8 encoding. If a `UnicodeDecodeError` occurs (indicating a different encoding), 
    it retries with Windows-1251 encoding, which is suitable for Cyrillic characters.

    :param path: 
        The path from the working directory to the directory containing the CSV file.
    :type path: str

    :param file: 
        The name of the CSV file, including the ``.csv`` extension.
    :type file: str

    :returns: 
        The CSV file loaded into a pandas DataFrame.
    :rtype: pandas.DataFrame

    :raises UnicodeDecodeError: 
        Raised if the file cannot be decoded using either UTF-8 or Windows-1251 encoding.

    **Example usage:**

    .. code-block:: python

        import pandas as pd

        # Example path and file name
        path = 'data/'
        file = 'cyrillic_data.csv'

        # Open the file
        df = fun_open_cyrilic_files(path, file)
        print(df.head())



Processing dates
-------------------

To decompose the date given in a predefined set of columns you can use the ``functions_dates.fun_process_dates()`` function:

.. py:function:: fun_process_dates(tbl, column, format)

    Transforms date columns in a given DataFrame and returns additional date-related columns.

    This function converts the specified date column into a datetime format and adds the following columns to the DataFrame:
    - **month**: Extracted month from the date.
    - **year**: Extracted year from the date.
    - **year_month_start**: The first day of the corresponding month.
    - **year_month_end**: The last day of the corresponding month.
    - **day_year**: The day number within the year.

    :param tbl: 
        The pandas DataFrame containing the date column to be transformed.
    :type tbl: pandas.DataFrame

    :param column: 
        The name of the date column within the DataFrame.
    :type column: str

    :param format: 
        The format in which the date is provided. For example, in Kaggle Sales Prediction datasets, the expected format is ``'%d.%m.%Y'``.
    :type format: str

    :returns: 
        The original DataFrame with the specified date column converted to datetime format and the additional date-related columns added.
    :rtype: pandas.DataFrame

    :raises Exception: 
        Raises an exception if the date conversion fails, typically due to an incorrect date format. An error message is printed specifying the issue.

    **Example usage:**

    .. code-block:: python

        import pandas as pd

        data = {'date_column': ['01.01.2022', '15.03.2022']}
        df = pd.DataFrame(data)

        df_processed = fun_process_dates(df, 'date_column', '%d.%m.%Y')
        print(df_processed)


Cleaning catalogs
--------------------

.. py:function:: fun_clean_categories(cat)

    Cleans a DataFrame by removing extra white spaces from all string columns.

    :param cat: 
        The pandas DataFrame to be cleaned.
    :type cat: pandas.DataFrame

    :returns: 
        The DataFrame with leading and trailing spaces removed from string values.
    :rtype: pandas.DataFrame

    **Example usage:**

    .. code-block:: python

        import pandas as pd

        data = {'category': [' Electronics ', ' Home & Garden  ', 'Toys']}
        df = pd.DataFrame(data)

        df_cleaned = fun_clean_categories(df)
        print(df_cleaned)


.. py:function:: fun_split_category(cat)

    Splits the `item_category_name` column into two separate columns: `group` and `category`.

    If no split is found in `item_category_name`, the `category` column is filled with the value from `group`. 
    The original `item_category_name` column is dropped.

    :param cat: 
        The pandas DataFrame containing the `item_category_name` column.
    :type cat: pandas.DataFrame

    :returns: 
        The modified DataFrame with `group` and `category` columns, and without `item_category_name`.
    :rtype: pandas.DataFrame

    :raises Exception: 
        Raises an exception if splitting the `item_category_name` column fails.

    **Example usage:**

    .. code-block:: python

        import pandas as pd

        data = {'item_category_name': ['Electronics - Phones', 'Home - Kitchen', 'Toys']}
        df = pd.DataFrame(data)

        df_split = fun_split_category(df)
        print(df_split)


.. py:function:: fun_extract_shop_name_info(str_shop_name, info_type)

    Extracts either the city or the shop type from a given shop name.

    The function searches for known cities or shop types in the given shop name string. 
    If a match is found, the corresponding value is returned.

    :param str_shop_name: 
        The shop name string from which to extract information.
    :type str_shop_name: str

    :param info_type: 
        The type of information to extract. Must be either `'City'` or `'ShopType'`.
    :type info_type: str

    :returns: 
        The extracted city or shop type if found, otherwise `None`.
    :rtype: str or None

    :raises Exception: 
        Raises an error if `info_type` is not `'City'` or `'ShopType'`.

    **Example usage:**

    .. code-block:: python

        shop_name = "Москва ТЦ Электроника"
        city = fun_extract_shop_name_info(shop_name, "City")
        shop_type = fun_extract_shop_name_info(shop_name, "ShopType")

        print(f"City: {city}, Shop Type: {shop_type}")

