pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol";

contract YouTubeThumbnailToken is ERC721Full {
    struct YoutTubeThumbnail {
        string author;//만든사람
        string dateCreated;
    }

    mapping (uint256 => YouTubeThumbnail) youTubeThumbnails;
    //uint 키값으로 하고 YouTubeThumbnail구조체를 value로 저장

    mapping (string => uint256) videoIdsCreated;

    constructor (string memory name, string memory symbol) ERC721Full(name, symbol) public {}
    //매개변수에 string 타입이 있으면 무조건 memory 키워드를 써야한다.
    function mintYTT(
        string memory _videoid,
        string memory _author,
        string memory _dateCreated,
        string memory _tokenURI
    )
        public
        {
            require(videoIdsCreated[_videoId] == 0, "videoId has already been created");
            //videoID 중복안되게 유효성검사!!. 뒤에"" 에러메세지 입력!
            uint256 tokenID = totalSupply().add(1);
            //토큰 발행시 몇번째 토큰인지 알아야한다!!!
            //totalSupply 함수를 호출해서 값을 리턴받고 그 값에 1을 더한 값이 tokenID이다
            //totalSupply는 ERC721Enumerable.sol에서 가지고 온다!!
            //return _allTokens.length --> 현재까지 발행된 토큰의 개수
            youTubeThumbnails[tokenId] = YouTubeThumbnail(_author, _dateCreated);
            //tokenId를 넘겼을 때 YouTubeThumbnail 구조체의 정보를 가져올 수 있다.
            //썸내일 정보를 mapping통해 구조체정보를 저장.
            videoIdsCreated[_videoId] = tokenId;
            //videoId와 tokenId를 mapping 하여 블록체인에 저장
            //videoID가 동일하지면 덮어씌여진다(그래서 유효성검사를 통해 videoID 중복 방지)
        }
}