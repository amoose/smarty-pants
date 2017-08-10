// Description:
//   Ask if a piece of software is approved by GSA
//
// Depdeendencies:
//   "csvtojson": "1.1.7"
//
// Commands:
//   hubot is <software> approved
//
// Examples:
//   hubot is slack approved

const csv = require('csvtojson');
let _robot = null;

const colors = {
  'Proposed': '#f9c642',
  'Approved': '#2e8540',
  'Sunsetting': '#e7f4e4',
  'Denied': '#e31c3d'
};

const getColor = (status) => {
  const shortStatus = status.match(/^\S+/)[0];
  if (colors[shortStatus]) {
    return colors[shortStatus];
  }
  return '#aeb0b5';
};

const getAttachment = item => ({
  title: `${item.name} - ${item.status}`,
  fallback: `${item.name} - ${item.status}`,
  fields: [{
    title: '',
    value: `this is a ${item.platform} product`,
    short: false
  }],
  color: getColor(item.status),
});

const handler = (msg) => {
  const lookingFor = msg.match[1].toLowerCase();
  _robot.http('https://raw.githubusercontent.com/GSA/data/gh-pages/enterprise-architecture/it-standards.csv')
    .header('User-Agent', '18F-bot')
    .get()((err, res, body) => {
      const matches = [];
      csv().fromString(body)
        .on('csv', (item) => {
          if(item[0].toLowerCase().includes(lookingFor)) {
            matches.push({ name: item[0], status: item[3], platform: item[4] })
          }
        }).on('done', () => {
          let message = ''
          if (matches.length == 0) {
            message = `I didn't find anything in the GSA IT Standards for ${msg.match[1]}`;
          } else if (matches.length <= 5) {
            message = { attachments: matches.map(getAttachment) };
            message.attachments[0].pretext = `Here's what I found in the GSA IT Standards`;
          } else {
            const finds = matches.map((item) => `*${item.name}* (${item.status})`)
            message = `I found several potential matches for ${msg.match[1]}: ${finds.join(' | ')}`;
          }
          msg.send(message);
        });
      });
};

module.exports = (robot) => {
  _robot = robot
  robot.respond(/is (.+) approved/i, handler);
  robot.hear(/(\S+) is approved\?/i, handler)
};

    // # robot.http('https://api.github.com/repos/18f/procurement-glossary/contents/abbreviations.yml')
    // #   .header('User-Agent', '18F-bot')
    // #   .get() (err, res, body) ->
    // #     b = new Buffer(JSON.parse(body).content, 'base64');
    // #     g = yaml.safeLoad(b.toString(), { json: true }).abbreviations
    // #
    // #     searchTerm = msg.match[2].trim()
    // #     terms = Object.keys(g)
    // #     term = findCaseInsensitively(terms, searchTerm)
    // #
    // #     if term
    // #       msg.reply "The term #{ g[term].longform } (#{ term }) means #{g[term].description}"
    // #     else
    // #       msg.reply "I don't know that term. If you'd like to add it, the project is at https://github.com/18F/procurement-glossary."
