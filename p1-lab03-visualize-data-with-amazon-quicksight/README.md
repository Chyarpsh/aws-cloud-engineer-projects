# 🧪 Lab 03 — Visualize Data with Amazon QuickSight

## 👩‍💻 Author  
**Arpita Chowdhury**

---

## 🎯 Objective  
The goal of this lab was to use **Amazon QuickSight** to visualize Netflix dataset insights stored in Amazon S3.  
I learned how to upload datasets, use a `manifest.json` file, apply filters, generate visualizations, create dashboards, and update datasets when new data becomes available. :contentReference[oaicite:1]{index=1}

---

## 🧩 Concepts & Services Used  

| Service / Concept | Purpose |
|-------------------|---------|
| **Amazon S3** | Store dataset & manifest file |
| **Amazon QuickSight** | Create visuals, dashboards, and analyze data |
| **manifest.json** | Defines dataset structure & S3 file path |
| **Charts & Filters** | Build insights: donut charts, category filters |
| **Dashboard Publishing & PDF Export** | Generate final report |

---

## 📂 Dataset Used  
- `netflix_titles.csv` — original dataset  
- `netflix_titles_updated.csv` — updated dataset with missing country values fixed  
- `manifest.json` — updated to match S3 file path & dataset name  

---

## 🚀 Project Steps

### 1️⃣ Upload Dataset & Manifest File to S3  
I uploaded the dataset and `manifest.json` into an S3 bucket.  
The manifest file required editing to include the correct S3 object URL, which tells QuickSight **where and how to read the dataset**.  
Without this file, QuickSight would not successfully load the dataset. :contentReference[oaicite:2]{index=2}

---

### 2️⃣ Create a QuickSight Account  
- Activated using the **30-day free trial**  
- Unchecked the **$500 Pixel-Perfect Report add-on**  
- Account creation took ~3 minutes  
- Included S3 permissions for dataset access :contentReference[oaicite:3]{index=3}

---

### 3️⃣ Connect S3 Dataset to QuickSight  
I selected **S3** as the data source and uploaded the dataset using the manifest file.  
The manifest guided QuickSight to correctly identify:  
- Data structure  
- File format  
- Field/column definitions  
This ensured that the visualizations were accurate. :contentReference[oaicite:4]{index=4}

---

### 4️⃣ Create Visualizations  

#### 📊 **Visualization 1 — Content Release Over the Years**  
- Chart type: **Donut chart**  
- Shows how much Netflix content was released each year  
- Largest content release year: **2018 with 1.15K titles**  
- Dataset size analyzed: **8.81K entries**  

I created this by selecting **release_year** from the dataset and switching the visual type from bar → donut.

---

#### 📊 **Visualization 2 — Genre Filter Breakdown**  
I applied filters to narrow down categories like:  
- TV Comedies  
- Action  
- Thriller  

Using the `listed_in` field, I filtered specific genres to visualize subsets of Netflix content. :contentReference[oaicite:5]{index=5}

---

### 5️⃣ Create a Dashboard  
I created a clean dashboard layout with properly formatted titles for readability and clarity.  
Then exported it as a **PDF** using:  
**Publish → Generate PDF → Export**  
This helped consolidate visuals into a final report. :contentReference[oaicite:6]{index=6}

---

### 6️⃣ Updating to a New Dataset  
Later I downloaded a newer dataset version (`netflix_titles_updated.csv`) that contained complete country information.  
Steps taken:  

1. Uploaded the new dataset to S3  
2. Updated the `manifest.json` with the new filename  
3. Refreshed dataset in QuickSight using:  
   **Dataset → Edit → Query mode → Refresh now → Save & Publish**  

This ensured QuickSight pulled the updated data correctly. :contentReference[oaicite:7]{index=7}

---

## 🐞 Challenge Encountered  

### ❌ Problem  
QuickSight initially did **not display the updated dataset**.

### 🕵️ Root Cause  
The old dataset was still cached, and the manifest file still pointed to outdated file paths.

### ✔️ Solution  
Refreshing the dataset manually and updating the manifest file to reflect the new S3 object resolved the issue.  
Everything displayed correctly after the refresh. :contentReference[oaicite:8]{index=8}

---

## ⏱️ Time Taken  
**~2 hours 30 minutes** including learning, creating visuals, debugging, and PDF exporting. :contentReference[oaicite:9]{index=9}

---

## 🧠 Key Learnings  
- Importance of the `.json` manifest when working with S3 data sources  
- How QuickSight auto-generates visuals based on selected fields  
- How filters completely change analysis results  
- Dataset updates require careful refresh & manifest edits  
- Visual dashboards improve storytelling and data communication  

---

## 🔮 Future Improvements  
| Improvement | Tool / Service |
|------------|----------------|
| Build interactive dashboards | QuickSight controls |
| Add cloud-based automation | Lambda + S3 Events |
| Use Athena for query-based analysis | Amazon Athena |
| Use QuickSight ML Insights | QuickSight ML features |

---



