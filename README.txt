# README

## Overview
This document provides detailed information about the contents of the provided files and folders, which are part of the ALR-Video dataset. Below is a breakdown of each component:

---

## 1. **Video**

### Description:
This folder contains the compressed versions of all videos that were subjectively tested as part of the ALR-Video dataset.

### Compression Details:
- **Compression Tool**: Encoder `libx265` from `ffmpeg`.
- **File Format**: `.265`.

---

## 2. **bat**

### Description:
This folder includes two batch script files, `zip.bat` and `unzip.bat`, for compression and decompression, respectively.

### Key Features:
- **Compression Script**: `zip.bat` is used to implement the compression process.
- **Decompression Script**: `unzip.bat` is designed for decompressing `.265` files.
  
### Special Considerations:
- **Batch Decompression**: Due to the large size of the video data, the decompression process is implemented in batches. For example, `unzip.bat` can decompress all `.265` files within subfolders of the `265_AI` folder.
- **Customization**: Users can modify the script code to suit their specific file storage paths and requirements.

---

## 3. **dataset**

### Description:
This folder contains the JNQP observation results for each participant's video.

### Data Processing:
- **Sample Cleaning**: The experimental data has been processed to remove unreliable samples.
- **Normality Testing**: The remaining data has been verified to meet the requirements of normality testing.

---


Thank you for using the ALR-Video dataset!