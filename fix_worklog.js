const fs = require('fs');
const path = require('path');

const baseDir = path.join('content', '1-Worklog');
for (let week = 1; week <= 12; week++) {
    const dirName = fs.readdirSync(baseDir).find(d => d.startsWith(`1.${week}-Week${week}`));
    if (!dirName) continue;
    
    const enFile = path.join(baseDir, dirName, '_index.md');
    if (fs.existsSync(enFile)) {
        let content = fs.readFileSync(enFile, 'utf8');
        // Update weight
        content = content.replace(/weight:\s*\d+/, `weight: ${week}`);
        
        // Update table headers and days
        content = content.replace(/\|\s*Day\s*\|/, '| Day of Week |');
        content = content.replace(/\|\s*2\s*\|/g, '| Monday    |');
        content = content.replace(/\|\s*3\s*\|/g, '| Tuesday   |');
        content = content.replace(/\|\s*4\s*\|/g, '| Wednesday |');
        content = content.replace(/\|\s*5\s*\|/g, '| Thursday  |');
        content = content.replace(/\|\s*6\s*\|/g, '| Friday    |');
        
        fs.writeFileSync(enFile, content);
        console.log(`Updated ${enFile}`);
    }
}
