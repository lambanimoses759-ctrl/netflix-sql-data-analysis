# Netflix Catalog Data Analysis (SQL)

## Project Overview
This repository contains a comprehensive SQL data analysis project conducted on a Netflix titles dataset (`netflix_titles(Moses_Lambani).xlsx`). Using **MySQL Workbench**, the analysis uncovers long-term patterns in platform content, structural shifts in movie runtimes over the decades, and individual genre distributions.

## Core Database Schema
```sql
CREATE TABLE `netflix_titles(moses lambani)` (
    show_id VARCHAR(50) PRIMARY KEY,
    type VARCHAR(50),
    title VARCHAR(255),
    director VARCHAR(255),
    cast_members TEXT,
    country VARCHAR(255),
    clean_date_added DATE,
    release_year INT,
    rating VARCHAR(50),
    duration_value INT,
    duration_unit VARCHAR(50),
    listed_in TEXT,
    description TEXT
);
