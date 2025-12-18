module.exports = {
  port: 3924,
  plebbitOptions: {
    ipfsGatewayUrls: [      
      'https://ipfsgateway.xyz',
      'https://gateway.plebpubsub.xyz',
      'https://gateway.forumindex.com',
    ],
  },
  redirects: [
    '5chan.app'
  ],
  multisubUrl: 'https://raw.githubusercontent.com/plebbit/lists/master/5chan-multisub.json'
}
