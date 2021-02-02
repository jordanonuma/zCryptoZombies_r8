pragma solidity 0.4.25;

import "./ZB/ZBGameMode.sol";

contract ExampleGame is ZBGameMode  {

    function beforeMatchStart(bytes serializedGameState) external {
        GameState memory gameState;
        gameState.init(serializedGameState);

        ZBSerializer.SerializedGameStateChanges memory changes;
        changes.init(); //initialized changes with this line

        changes.changePlayerDefense(Player.Player1, 15);
        changes.changePlayerDefense(Player.Player2, 15);
        
        changes.changePlayerCurrentGooVials(Player.Player1, 3);
        changes.changePlayerCurrentGooVials(Player.Player2, 3);

        //Number of filled goo vials
        changes.changePlayerCurrentGoo(Player.Player1, 3):
        changes.changePlayerCurrentGoo(Player.Player2, 3):

        //Max number of vials
        changes.chanePlayerMaxGooVials(Player.Player1, 8):
        changes.chanePlayerMaxGooVials(Player.Player2, 8):
    } //end function beforeMatchStart()

} //end contract ExampleGame{}