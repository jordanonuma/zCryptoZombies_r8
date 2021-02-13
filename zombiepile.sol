pragma solidity 0.4.25;

import "./ZB/ZBGameMode.sol";

contract ZombiePile is ZBGameMode  {

    function beforeMatchStart(bytes serializedGameState) external {

        GameState memory gameState;
        gameState.init(serializedGameState);

        ZBSerializer.SerializedGameStateChanges memory changes;
        changes.init();

        CardInstance[] memory player1Cards = new CardInstance[](gameState.playerStates[0].cardsInDeck.length);
        CardInstance[] memory player2Cards = new CardInstance[](gameState.playerStates[1].cardsInDeck.length);
        uint player1cardCount = 0;
        uint player2cardCount = 0;

        // Custom game logic will go here
        for (uint i = 0; i < gameState.playerStates.length; i++) {
            
            for (uint j = 0; j < gameState.playerStates[i].cardsInDeck.length; j++) {
                if (isLegalCard(gameState.playerStates[i].cardsInDeck[j])) {
                    newCards[cardCount] = gameState.playerStates[i].cardsInDeck[j];
                    cardCount++;
                } //end if()
            } //end for()

            changes.changePlayerCardsInDeck(Player(i), newCards, cardCount);
        } //end for()

        changes.emit();

        function isLegalCard(CardInstance card) internal view returns(bool) {
            return (card.gooCost <= 2);
        } //end function isLegalCard()

    } //end function beforeMatchStart()

} //end contract ZombiePile{}