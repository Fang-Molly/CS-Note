
# Organize data

* Get "filtered_feature_bc_matrix" folder from 10X analysis results and put all samples's data in the same folder.

* Uncompressing tar.gz files

```bash
for file in *.tar.gz; do
	file_dir="${file%.tar.gz}"
	mkdir -p "$file_dir"
	tar -xvzf "$file" -C "$file_dir"
done
```








