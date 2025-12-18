### Demo

The 5chan-previewer allows users to share links on sites like Twitter, Telegram, etc. and generate a preview. E.g. the URL `https://5chan.app/#/biz/thread/QmbJuRPxPhncxkiGLEcCaFvawoGuoZdrwp26aPNzkSUYHa` becomes `https://s.5chan.app/biz/thread/QmbJuRPxPhncxkiGLEcCaFvawoGuoZdrwp26aPNzkSUYHa` which will generate a preview and redirect the user to 5chan.app.

### URL Format

The previewer accepts URLs in the format:
- `https://s.5chan.app/{board}/thread/{cid}`

Where:
- `{board}` can be either:
  - A directory (e.g., `biz`, `pol`) - short codes that resolve to subplebbit addresses via the 5chan multisub list
  - A subplebbit address (e.g., `business-and-finance.eth`) - full ENS addresses
  
- `{cid}` is the full CID of the comment/thread

### Directory Resolution

5chan-previewer automatically fetches and caches the [5chan multisub list](https://raw.githubusercontent.com/plebbit/lists/master/5chan-multisub.json) to resolve directories to their corresponding subplebbit addresses. This mapping is refreshed every hour.

**Behavior:**
- If a directory is used (e.g., `biz`), it's resolved to the subplebbit address (e.g., `business-and-finance.eth`) for fetching the comment, but the redirect URL still uses the directory format: `https://5chan.app/#/biz/thread/{cid}`
- If a subplebbit address is used and it maps to a directory in the multisub, the redirect URL uses the directory format
- If a subplebbit address is used and it doesn't map to a directory, the redirect URL uses the subplebbit address format: `https://5chan.app/#/{address}/thread/{cid}`

### How to use

```
npm install
npm start
```

### How to use with docker

```
npm install
scripts/start-docker.sh
```

### config.js

A javascript file like:

```javascript
module.exports = {
  port: 3924,
  plebbitOptions: {
    ipfsGatewayUrls: ['https://ipfs.io'],
  },
  // The redirect domain (only 5chan.app is supported)
  redirects: [
    '5chan.app'
  ],
  // URL to fetch the 5chan multisub list for directory resolution
  multisubUrl: 'https://raw.githubusercontent.com/plebbit/lists/master/5chan-multisub.json'
}
```
