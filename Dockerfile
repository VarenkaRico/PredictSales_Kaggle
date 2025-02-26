#Dockerfile

FROM python:3.11.2
WORKDIR /usr/src/app
RUN python -m pip install \
    joblib==1.2.0 \
    matplotlib==3.6.3 \
    numpy==1.24.2 \
    pandas==1.5.3 \
    scikit-learn==1.2.1 \
    scipy==1.10.0 \
    seaborn==0.12.2 \
    statsmodels \
    datetime
CMD ["python", "etl_preprocess.py"]
