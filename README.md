# Project Title: Predict Future Sales (Kaggle Competition)

## 📚 **Project Overview**
This project focuses on analyzing a dataset of sales of one of the largest Russian software firms 1C. The information is provided in a daily basis from January 2013 up to October 2015. The project handles data processing, cleaning, and enrichment tasks by applying Python-based data analysis techniques. As well as ARIMA timeseries analysis and prediction of sales for the next 12 months.

---
## 📊 Goals
Data preprocessing: Cleaning, transforming, and merging multiple datasets.
Exploratory Data Analysis (EDA): Understanding trends and seasonality in sales data.
Time Series Forecasting: Predicting sales for the next 12 months using ARIMA.
Machine Learning Models: Classification models to forecast product demand.

## 🚀 **Project Structure**
```
├── data/ #Raw and cleand files used and produced by the analysis and prediction process
│   └── sales_train     # Main file with sales information
│   └── items           # Catalog of items (item_name, item_id, item_category_id)
│   └── item_categories # Catalog of categories (item_category_name, item_category_id)
│   └── sales_train_complete # Clean and merge result from ETL process
│   └── shops           # Catalog of shops (shop_name, shop_id)
├── doc/                # Sphynx files
├── log/                # logs files
|   └── log.txt          # default txt file used to register activity 
├── src/                # Jupyter notebooks for analysis
|   └── __init__         
|   └── etl_preprocess  # Preprocess script for files to be used
|   └── functions_clean_catalogs # Auxiliar functions used to clean catalogs
|   └── functions_dates # Auxiliar functios used to process dates information
│   └── functions_load_data # Auxiliar functions used to load data
|   └── main            # Working file 
├── tests/              # Information file used to test the model
├── Dockerfile          # Docker file used to run the project
└── README.md           # Project documentation
```

---

## 🧩 **Key Features**
- Data loading and preprocessing using pandas.
- City extraction from complex shop names using `extract_city_info`.
- Retry mechanism for robust data processing.
- Error handling and logging for smooth workflows.
- ARIMA analysis for general tendency analysis and prediction
- Classification model to determine next months sales

---
## 🔹 Running with Docker

docker build -t predict_sales .
docker run --rm -v ${PWD}:/usr/src/app -w /usr/src/app predict_sales \
    python src/etl_preprocess.py --input_directory /usr/src/app/data/ \
    --output_file /usr/src/app/data/sales_train_complete.csv \
    --log_file /usr/src/app/log/log.txt
