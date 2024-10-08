// JavaScript script to update NBH Cache
const fs = require('fs');
const path = '/tmp/nbh_stake_cache.txt';

// Function to read and update cache
function updateNBHCache() {
    fs.readFile(path, 'utf8', (err, data) => {
        if (err) {
            console.error("Error reading cache: ", err);
            return;
        }
        console.log("Current cache: ", data);

        // Update cache with new data
        let newCacheData = data + "\nUpdated Stake: 500 NBHToken";
        fs.writeFile(path, newCacheData, (err) => {
            if (err) {
                console.error("Error updating cache: ", err);
            } else {
                console.log("Cache updated successfully.");
            }
        });
    });
}

// Call the cache update function
updateNBHCache();
