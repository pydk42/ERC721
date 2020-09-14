const YouTubeThumbnailToken = artifacts.require('./YouTubeThumbnailToken.sol')
const fs = require('fs')

module.exports = function (deployer) {
  var name = "YouTube Thumnail Token";
  var symbol = "YTT";
  //youtubeThumbnailToken.sol 생성자에서 name과 symbol을 받기 때문에 여기서(배포하는 단계) 이 값들을 넘겨주어야한다.
  deployer.deploy(YouTubeThumbnailToken, name, symbol)
    .then(() => {
      if (YouTubeThumbnailToken._json) {
        fs.writeFile(
          'deployedABI',
          JSON.stringify(YouTubeThumbnailToken._json.abi),
          (err) => {
            if (err) throw err
            console.log("파일에 ABI 입력 성공");
          })
      }

      fs.writeFile(
        'deployedAddress',
        YouTubeThumbnailToken.address,
        (err) => {
          if (err) throw err
          console.log("파일에 주소 입력 성공");
        })
    })
}